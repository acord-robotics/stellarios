require "/scripts/util.lua"
require "/scripts/vec2.lua"
require "/scripts/rect.lua"
require "/scripts/poly.lua"
require "/scripts/drawingutil.lua"
require "/scripts/starboyutil.lua"
-- engine callbacks
function init()
  --View:init()
  self.canvas = widget.bindCanvas("consoleScreenCanvas")
  self.clickEvents = {}
  self.keyEvents = {}

  self.state = FSM:new()
  self.state:set(splashScreenState)
  self.openedFromHand = config.getParameter("openedFromHand")
   
  self.sounds = config.getParameter("sounds")
  self.color = "white"
  self.fontColor = {220,220,220}--{244, 114, 0}
  
  pane.playSound(self.sounds.startup2, 0, 0.5)

  self.level = 1
  self.lives = 3
  self.score = 0
  
  self.particles = {}
  self.QTEs = {}
  self.QTETimer = 0
  self.QTEDuration = 5
  self.QTECooldown = 0.5
  self.QTEState = "preQTE" --preQTE, QTE, inbetween, end
  self.QTEWordWeights = {{0,1}, {0,2}, {1,3}, {0,4}, {0,5}, {0,6}} --{weight, word length}
  
  self.playerHealth = 1
  self.playerHealthMax = 20
  self.enemyHealth = 1
  self.enemyMaxHealth = 40
  self.loser = "enemy"
  
  self.overlay = {rect = {0,0,400,300}, color = {255,255,255,0}, time = 0, fadeDuration = 3, visible = false}
  self.playerPosition = {150,0}
  self.enemyPosition = {250,0}
  self.position1 = {175,0}
  self.position2 = {225,0}
  
  self.slicePosition1 = {250,0}
  self.slicePosition2 = {150,0}
  
  self.titleTreeLeafPoly = {{0,0},{-2,0}, {2,1}}
  self.playerSpriteState = "idle6"
  self.playerAttackIndex = 6
  self.enemySpriteState = "idle6"
  self.placeholderSprite = { idle1 = {startFrame = 1, endFrame = 1, duration = 1},
						idle2 = {startFrame = 2, endFrame = 2, duration = 1},
						idle3 = {startFrame = 3, endFrame = 3, duration = 1},
						idle4 = {startFrame = 4, endFrame = 4, duration = 1},
						idle5 = {startFrame = 5, endFrame = 5, duration = 1},
						idle6 = {startFrame = 6, endFrame = 6, duration = 1},
						downed = {startFrame = 7, endFrame = 7, duration = 1},
						downed2 = {startFrame = 8, endFrame = 8, duration = 1},
						stateTime = 0,
						width = 128,
						height = 128,
						currentState = "idle1",
						sheet = "/interface/starboyroninrumblegame/samurai.png"}
		
self.enemySprite = { idle1 = {startFrame = 1, endFrame = 1, duration = 1},
						idle2 = {startFrame = 2, endFrame = 2, duration = 1},
						idle3 = {startFrame = 3, endFrame = 3, duration = 1},
						idle4 = {startFrame = 4, endFrame = 4, duration = 1},
						idle5 = {startFrame = 5, endFrame = 5, duration = 1},
						idle6 = {startFrame = 6, endFrame = 6, duration = 1},
						downed = {startFrame = 7, endFrame = 7, duration = 1},
						downed2 = {startFrame = 8, endFrame = 8, duration = 1},
						stateTime = 0,
						width = 128,
						height = 128,
						currentState = "idle1",
						sheet = "/interface/starboyroninrumblegame/enemysamurai1.png"}		
end

function dismissed()
  for soundName,sound in pairs(self.sounds) do
    if soundName ~= "success" then
      pane.stopAllSounds(sound)
    end
  end
  world.sendEntityMessage(player.id(), "closed")
end

function update(dt)
  self.canvasFocused = widget.hasFocus("consoleScreenCanvas")

  if self.openedFromHand and not world.sendEntityMessage(player.id(), "holdingGame"):result() then
    pane.dismiss()
  end

  self.state:update(dt)
end

function canvasClickEvent(position, button, isButtonDown)
  if self.canvasFocused then
    table.insert(self.clickEvents, {position, button, isButtonDown})
  end
end

function canvasKeyEvent(key, keyDown)
  --if keyDown then
  --self.color = "red"
  table.insert(self.keyEvents, {key, keyDown})
  --end
end

function takeInputEvents()
  local clicks = self.clickEvents
  self.clickEvents = {}
  return clicks
end

function takeKeyEvents()
  local keyPresses = self.keyEvents
  self.keyEvents = {}
  return keyPresses
end

function splashScreenState()
  local copyrightText = "Starboy, Inc\nc. 2093"
  local pos = {200, 150}
  local elapsedTime = 0
  local titleScrollDuration = 2
  local t = 0
  widget.focus("consoleScreenCanvas")

  --pane.playSound(self.sounds.startup)
  --pane.playSound(self.sounds.typing)
  while true do 
    self.canvas:clear()
	if elapsedTime < titleScrollDuration then
	  elapsedTime = util.clamp(elapsedTime + script.updateDt(), 0, titleScrollDuration)
    else
	    self.state:set(titleScreenState)
	end
	
    self.canvas:drawText(copyrightText, {position = pos, horizontalAnchor = "mid", verticalAnchor = "mid"}, 24, self.fontColor)
    
    for _,press in pairs(takeKeyEvents()) do
	  local key, down = press[1], press[2]
	  if key == 5 and down then
		self.state:set(titleScreenState)
		--pane.stopAllSounds(self.sounds.startup)
	  end
	end
	
	coroutine.yield()
  end
end

function titleScreenState()
  local titleText = "Ronin\nRumble"
  local pressKeyText = "[Press ANY KEY to start]"
  local pos = {200, 220}
  local pos2 = {200, 25}
  local elapsedTime = 0
  local titleScrollDuration = 2.5
  local t = 0
  local blinkCycle = 2
  local blinkTimer = 0
  local explosionDelay = 0
  local numOfExplosions = 10  
  local expSpawnSpacing = 325 / numOfExplosions
  local explosionIndex = 0
  local petalTimer = 0

  while true do 
    self.canvas:clear()
	
	for _,press in pairs(takeKeyEvents()) do
	  local key, down = press[1], press[2]
	  if down then
	    --if elapsedTime >= titleScrollDuration then
		  pane.playSound(self.sounds.startup)
		  self.level = 1
          self.lives = 3
          self.score = 0
		  self.state:set(gameState)
		--end
	  end
	end
	
	if t < 1 then
	  elapsedTime = util.clamp(elapsedTime + script.updateDt(), 0, titleScrollDuration)
	  t = elapsedTime / titleScrollDuration
	  --pos[2] = util.lerp(t, 330, 220)
	end
    
	petalTimer = petalTimer + script.updateDt()
	if petalTimer >= 1.5 then
	  petalTimer = 0
	  local randomPetalPos = {0, math.random(100,450)}
	  spawnParticle(randomPetalPos, {math.random(10,25),-math.random(2,10)}, 25, self.titleTreeLeafPoly)
	end
	
	--if t >= 1 then
      self.canvas:drawText(titleText, {position = pos, horizontalAnchor = "mid", verticalAnchor = "mid"}, 44, self.fontColor)
	--end
	
	updateParticles(script.updateDt())
	
	if elapsedTime >= titleScrollDuration then
	  blinkTimer = (blinkTimer + script.updateDt()) % blinkCycle
	  if blinkTimer > blinkCycle * 0.5 then
	    self.canvas:drawText(pressKeyText, {position = pos2, horizontalAnchor = "mid", verticalAnchor = "mid"}, 20, self.fontColor)
	  end
	end  

    coroutine.yield()
  end
  
end
--old
function scoreScreenState()
  local loadPromise = RequestLoadScores(self.openedFromHand)
  local scores -- = LoadScores(self.openedFromHand)-- = world.sendEntityMessage(player.id(), "loadScores"):result()
  local scoreText = "FINAL SCORE:\n" .. tostring(self.score)
  local pressKeyText = "[Press ANY KEY to start over]"
  local pos = {200, 295}
  local pos2 = {200, 5}
  local elapsedTime = 0
  local blinkDelay = 1.5
  local colorTimer = 0
  local colorCycle = 0.78
  local blinkTimer = 0
  local blinkCycle = 1
  widget.focus("consoleScreenCanvas")
  widget.setVisible("scoreLabel", false)
  widget.setVisible("livesLabel", false)
  widget.setVisible("levelLabel", false)
  
  local scoreTable = {}
  local currentScore = self.score
  local indexOnHighscore = -1
  
  while true do
    if loadPromise:finished() then
	  scores = loadPromise:result()
	  break
	end
    coroutine.yield()
  end
  
  if scores ~= nil then
    sb.logInfo(util.tableToString(scores))
    local i = 1
    while i <= 3 do
	  if scores[i] ~= nil then
	    if currentScore ~= nil and currentScore > scores[i].score then
		  table.insert(scoreTable, i, {score = currentScore, name = world.entityName(player.id())})
		  currentScore = nil
		  indexOnHighscore = i
		  i = i - 1
		else 
		  table.insert(scoreTable, scores[i])
		end
	  elseif currentScore ~= nil then
	    table.insert(scoreTable,{score = currentScore, name = world.entityName(player.id())})
		currentScore = nil
		indexOnHighscore = i
	  end
	  i = i + 1
    end
  else
    table.insert(scoreTable, {score = currentScore, name = world.entityName(player.id())})
	indexOnHighscore = 1
  end
  
  SaveScores(scoreTable, self.openedFromHand)
  local reward = createReward()
  
  while true do 
    self.canvas:clear()
	self.canvas:drawText(scoreText, {position = pos, horizontalAnchor = "mid", verticalAnchor = "top"}, 40, self.fontColor)
    self.canvas:drawText("High Scores: ", {position = {200, 180}, horizontalAnchor = "mid", verticalAnchor = "top"}, 40,  self.fontColor)
    colorTimer = (colorTimer + script.updateDt()) % colorCycle
	for i = 1, 3, 1 do
	  if scoreTable[i] ~= nil then
	    local t = colorTimer / colorCycle
	    local color = (i == indexOnHighscore) and ColorFromHSL(t, 0.5, 0.5) or  self.fontColor
		self.canvas:drawText(tostring(i) .. ". " .. scoreTable[i].name .. "  " .. tostring(scoreTable[i].score), {position = {200, 148 - i * 32}, horizontalAnchor = "mid", verticalAnchor = "mid"}, 30, color)
	  else
		self.canvas:drawText(tostring(i) .. ". ???  0", {position = {200, 148 - i * 32}, horizontalAnchor = "mid", verticalAnchor = "mid"}, 30,  self.fontColor)
	  end 
	end
	
	elapsedTime = util.clamp(elapsedTime + script.updateDt(), 0, blinkDelay)
	
	if elapsedTime >= blinkDelay and isRewardComplete(reward) then
	  blinkTimer = (blinkTimer + script.updateDt()) % blinkCycle
	  if blinkTimer > blinkCycle * 0.5 then
	    self.canvas:drawText(pressKeyText, {position = pos2, horizontalAnchor = "mid", verticalAnchor = "bottom"}, 20,  self.fontColor)
	  end
	
      for _,press in pairs(takeKeyEvents()) do
	    local key, down = press[1], press[2]
	    if down then
		  self.state:set(titleScreenState)
	    end
	  end
	else
	  takeKeyEvents()
	  for k,v in pairs(reward) do
	    local payoutProgress = elapsedTime / blinkDelay
	    local payoutTarget = math.floor(v.count * payoutProgress)
	    local amountToPayout = payoutTarget - v.givenOut
	  
	    if amountToPayout >= 1 then
          world.spawnItem(v.item, world.entityPosition(player.id()), amountToPayout, v.params, {math.random(-3,3), math.random(5,20)}, 0.5)
	      v.givenOut = payoutTarget
	    end
	  end
	end
	
	coroutine.yield()
  end
end
--


function gameState()
   widget.setText("scoreLabel", "Score: " .. tostring(self.score))
   widget.setText("levelLabel", "Level: "..tostring(self.level))
   widget.setVisible("scoreLabel", true)
   widget.setVisible("levelLabel", true)
   
  self.level = 1
  self.lives = 3
  self.score = 0
  
  self.particles = {}
  self.QTEs = {}
  self.QTETimer = 0
  self.QTEDuration = 5
  self.QTECooldown = 0.5
  self.QTEState = "preQTE" --preQTE, QTE, inbetween, end
  self.QTEWordLengthMin = 3
  self.QTEWordLengthMax = 3
  
  self.playerHealth = 20
  self.playerHealthMax = 20
  self.enemyHealth = 1
  self.enemyMaxHealth = 40
  self.loser = "enemy"
   
  self.playerSpriteState = "idle6"
  self.playerAttackIndex = 6
  self.enemySpriteState = "idle6"
  self.QTEWordWeights = {{0,1}, {0,2}, {1,3}, {0,4}, {0,5}, {0,6}} 
  startLevel()
   
   local petalTimer = 0
   local downedTimer = 0
   local leftHeld, rightHeld, upHeld, downHeld = false,false,false,false
   local previousKeysDown = {}
   local currentKeysDown = {}
   local anyKeyPressed = false
   while true do 
    anyKeyPressed = false
	currentKeysDown = {}
	local dt = script.updateDt()
    for _,press in pairs(takeKeyEvents()) do
	  local key, down = press[1], press[2]
	  
	  if down then anyKeyPressed = true end
	  
	  if key == 65 or key == 87 then
	    if down then
		  upHeld = true
		  currentKeysDown["up"] = true
		else
		  upHeld = false
		end
	  end
	  
	  if key == 61 or key == 88 then
	    if down then
          downHeld = true
		  currentKeysDown["down"] = true
		else
		  downHeld = false
		end
      end
	  
	  if key == 43 or key == 90 then
	    if down then
		  currentKeysDown["left"] = true
		  leftHeld = true
		else
		  leftHeld = false
		end
      end
	  
	  if key == 46 or key == 89 then
	    if down then
		  currentKeysDown["right"] = true
		  rightHeld = true
		else
		  rightHeld = false
		end
      end
	  
	  if key == 5 and down then
	    currentKeysDown["space"] = true
	  end
	  
	  if down then --43 to 68 a-z
	    currentKeysDown[key] = true
		--if key == 21 then
		--  self.level = self.level + 1
		--  widget.setText("levelLabel", tostring(self.level))
		--end
		
		if key >= 43 and key <= 68 then
		  if KeyDown(key, currentKeysDown, previousKeysDown) then
		    tryInputQTE(key)
		  end
		end
      end
	end
     
    self.canvas:clear()
	--widget.setText("scoreLabel", self.QTEState)
	
	petalTimer = petalTimer + script.updateDt()
	if petalTimer >= 1.0 then
	  petalTimer = 0
	  local randomPetalPos = {0, math.random(100,450)}
	  spawnParticle(randomPetalPos, {math.random(10,35),-math.random(2,10)}, 25, self.titleTreeLeafPoly)
	end
	
	updateParticles(dt, self.QTEState == "end")
	if self.QTEState ~= "end" then
	  updateQTEs(dt)
	else
	  if self.downedTimer < 1 and self.overlay.visible == false then
	    self.downedTimer = self.downedTimer + dt
	    if self.downedTimer >= 1 then
		  if self.loser == "enemy" or self.loser == "both" then
		    self.enemySpriteState = "downed2"
		  end
		  if self.loser == "player" or self.loser == "both" then
		    self.playerSpriteState = "downed2"
		  end
	    end
	  elseif self.overlay.visible == false then
	    local pressKeyText = "Press SPACE to Continue"
	    self.canvas:drawText(pressKeyText, {position = {200,200}, horizontalAnchor = "mid", verticalAnchor = "mid"}, 20, self.fontColor)
	  end
	end
	updateQTETimer(dt)

	if KeyDown("space", currentKeysDown, previousKeysDown) and (self.QTEState == "end") and self.overlay.visible == false or self.QTEState == "preQTE" then
	  if self.playerHealth <= 0 then
	    self.state:set(scoreScreenState)
      else
	    local rLength = util.weightedRandom(self.QTEWordWeights)--math.random(self.QTEWordLengthMin, self.QTEWordLengthMax)
	    createQTEFromString(getRandomWordOfSize(rLength))
	    self.QTEState = "input"
		self.enemyMaxHealth = 40 + (self.level - 1) * 5
	    self.enemyHealth = self.enemyMaxHealth
	    self.playerSpriteState = "idle6"
        self.playerAttackIndex = 6
	    self.enemySpriteState = "idle6"
		self.enemySprite.sheet = "/interface/starboyroninrumblegame/enemysamurai" .. tostring((self.level-1)%3+1) .. ".png"
	    self.downedTimer = 0
	    widget.setText("levelLabel", "Level: " .. tostring(self.level))
	  end
	end
	self.placeholderSprite.currentState = self.playerSpriteState
	drawSprite(self.placeholderSprite, self.playerPosition, "white", false, 1)
	
	self.enemySprite.currentState = self.enemySpriteState
	drawSprite(self.enemySprite, self.enemyPosition, "white", true, 1)
	updateOverlay(dt)
	--self.canvas:drawImage(self.placeholderSprite.sheet, {200,0})
	
    previousKeysDown = currentKeysDown
    coroutine.yield()
  end
end

function createQTEs(count)
  startLevel()
  self.QTEs = {}
  self.QTETimer = self.QTEDuration
  local inputDisplayWidth = 30
  local spacing = 10
  local fullWidth = inputDisplayWidth * count + spacing * (count - 1) 
  local xStart = 200 - fullWidth * 0.5
  for i = 1, count, 1 do
    local keycode = getRandomKeyCode()
    local qte = {rect = {xStart, 240, xStart + inputDisplayWidth, 240 + inputDisplayWidth}, keycode = keycode, key = keycodeToChar(keycode), state = "waiting"}
	--sb.logInfo(tostring(xStart))
    xStart = xStart + inputDisplayWidth + spacing
	table.insert(self.QTEs, qte)
  end
end

function createQTEFromString(QTEString)
  startLevel()
  self.QTEs = {}
  self.QTETimer = self.QTEDuration
  local inputDisplayWidth = 35
  local spacing = 10
  local fullWidth = inputDisplayWidth * #QTEString + spacing * (#QTEString - 1) 
  local xStart = 200 - fullWidth * 0.5
  for i = 1, #QTEString, 1 do
    local keycode = string.byte(string.sub(QTEString, i, i)) - 54
    local qte = {rect = {xStart, 240, xStart + inputDisplayWidth, 240 + inputDisplayWidth}, keycode = keycode, key = string.upper(string.sub(QTEString, i, i)), state = "waiting"}
	--sb.logInfo(tostring(xStart))
    xStart = xStart + inputDisplayWidth + spacing
	table.insert(self.QTEs, qte)
  end
end

function tryInputQTE(keyPressed)
  if self.QTEState ~= "input" then return end

  local eventConsumed = false
  local allComplete = true
  for k,v in ipairs(self.QTEs) do
    if v.state == "waiting" then
	  if eventConsumed == false then
	    --sb.logInfo(tostring(keyPressed) .. " expected:" .. tostring(v.keycode))
	    --widget.setText("scoreLabel", tostring(keyPressed) .. " expected:" .. tostring(v.keycode))
	    if v.keycode == keyPressed then
	      v.state = "success"
	    else
	      v.state = "fail"
	    end
	    eventConsumed = true
	  else
	    allComplete = false
	  end
	end
  end
  
  if allComplete then
    self.QTEState = "inbetween"
	self.QTECooldown = 0.15
  end
  
end

function completeWord()
  local scoreTotal = 0
  local damageTotal = 0
  local allSuccess = true
  local allFail = true
  for i = 1, #self.QTEs, 1 do
	if self.QTEs[i].state ~= "success" then allSuccess = false else scoreTotal = scoreTotal + 1 end
	if self.QTEs[i].state ~= "fail" then allFail = false else damageTotal = damageTotal + 1 end
  end
  if allSuccess then scoreTotal = scoreTotal + 5 end
  self.score = self.score + scoreTotal
  
  if allFail then damageTotal = damageTotal + 3 end
  self.playerHealth = self.playerHealth - damageTotal
	
  widget.setText("scoreLabel", "Score: " .. tostring(self.score))
    
  self.enemyHealth = self.enemyHealth-scoreTotal
  if self.enemyHealth > 0 and self.playerHealth > 0 then
    local rLength = util.weightedRandom(self.QTEWordWeights) --math.random(self.QTEWordLengthMin, self.QTEWordLengthMax)
	createQTEFromString(getRandomWordOfSize(rLength))
	local rChoices = {}
	for i = 1, 4, 1 do
	  if i ~= self.playerAttackIndex then
	    table.insert(rChoices, i)
	  end
	end
	
	local r = util.randomChoice(rChoices)
	self.playerSpriteState = "idle"..tostring(r)
	self.playerAttackIndex = r
	
	local r2
	if r == 1 then r2 = math.random(1,2) end
	if r == 2 then r2 = 1 end
	if r == 3 then r2 = 4 end
	if r == 4 then r2 = 3 end
	if r == 5 then r2 = 3 end

	--r2 = math.random(1,4)
	self.enemySpriteState = "idle"..tostring(r2)
	--endLevel()
    local randomSound = math.random(1,5)
	--pane.playSound(self.sounds["swordtink"..tostring(randomSound)])
	pane.playSound(self.sounds["swordparry"], 0, 0.5)
  else
    endLevel()
  end
	
end
 
function getRandomKey()
  local options = {"up", "down", "left", "right", "space"}
  return util.randomChoice(options)
end

function getRandomWordOfSize(size)
  local wordList = config.getParameter("words"..tostring(size))
  if wordList ~= nil then
    return util.randomChoice(wordList)
  end
  return "NIL"
end

function getRandomKeyCode()
  return math.random(43, 68)
end 

function updateQTEs(dt)
  for k,v in pairs(self.QTEs) do
    local boxColor = {70,70,70}
	if v.state == "success" then boxColor = {0,200,0} elseif v.state == "fail" then boxColor = {200,0,0} end
    
	--self.canvas:drawRect(v.rect, boxColor)
    self.canvas:drawRect({v.rect[1]-4, v.rect[2]-2, v.rect[3]+2, v.rect[2]}, boxColor)
    self.canvas:drawRect({v.rect[1]-4, v.rect[2]-2, v.rect[1]-2, v.rect[4]+2}, boxColor)
    self.canvas:drawRect({v.rect[1]-4, v.rect[4]+2, v.rect[3]+2, v.rect[4]+4}, boxColor)
    self.canvas:drawRect({v.rect[3], v.rect[2]-2, v.rect[3]+2, v.rect[4]+2}, boxColor)
	
	self.canvas:drawText(v.key, {position = rect.center(v.rect), horizontalAnchor = "mid", verticalAnchor = "mid"}, 40, {0, 153, 255} )--{0,50,250}
  end
  
  if self.QTEState == "inbetween" then
    self.QTECooldown = self.QTECooldown - dt
	if self.QTECooldown <= 0 then
	  self.QTEState = "input"
	  completeWord()
	end
  end
end

function updateQTETimer(dt)
  if self.QTETimer > 0 then
    self.QTETimer = self.QTETimer - dt
	if self.QTETimer <= 0 and self.QTEState == "input" then
	  for k,v in pairs(self.QTEs) do
	    v.state = "fail"
	  end
	  self.QTEState = "inbetween"
	  self.QTECooldown = 0.25
	end
  end
  local t = util.clamp(self.QTETimer / self.QTEDuration, 0, 1)
  local width = 200 * t
  local green = 255 * t
  local blue = 255 * t*t*t*t*t*t*t
  self.canvas:drawRect({200 - width * 0.5, 210, 200 + width * 0.5, 220}, {255,green,blue}) --{150,150,150}
  
  if self.QTEState ~= "end" then drawHealthBars() end
end

function keycodeToChar(keycode)
  if keycode >= 43 and keycode <= 68 then
    return string.char(keycode+54)
  end
  return " "
end

function drawHealthBars()
  local t = util.clamp(self.playerHealth / self.playerHealthMax, 0, 1)
  self.canvas:drawRect({7, 100, 14, 100 + 100 * t}, "green")
  self.canvas:drawRect({4, 97, 17, 98}, {100,100,100})
  self.canvas:drawRect({4, 202, 17, 203}, {100,100,100})
  self.canvas:drawRect({4,97,5,203}, {100,100,100})
  self.canvas:drawRect({16,97,17,203}, {100,100,100})
  
  t = util.clamp(self.enemyHealth / self.enemyMaxHealth, 0,1)
  self.canvas:drawRect({387, 100, 380, 100 + 100 * t}, "red")
  self.canvas:drawRect({390, 97, 377, 98}, {100,100,100})
  self.canvas:drawRect({390, 202, 377, 203}, {100,100,100})
  self.canvas:drawRect({390,97,389,203}, {100,100,100})
  self.canvas:drawRect({378,97,377,203}, {100,100,100})
end

function spawnParticle(position, velocity, duration, polyOverride)
  for _,p in pairs(self.particles) do
    if p.alive == false  then
	  p.pos = position
      p.vel =  velocity
	  p.lifeTime = 0
	  p.maxLifeTime = duration
	  p.alive = true
	  p.poly = polyOverride
	  return
    end
  end

  local newParticle = {pos = {position[1],position[2]},
          vel =  velocity,
		  lifeTime = 0,
		  maxLifeTime = duration,
		  alive = true,
		  polyOverride = polyOverride}
  table.insert(self.particles, newParticle)
end

function updateParticles(dt, draw)
    if draw == nil then draw = true end
    for _,p in pairs(self.particles) do
     if p.alive then
	   p.pos = vec2.add(p.pos, vec2.mul(p.vel, dt))
	   p.lifeTime = p.lifeTime+dt
	   if p.lifeTime > p.maxLifeTime then
	     p.alive = false
	   elseif draw then
	     if p.polyOverride ~= nil then
		   self.canvas:drawPoly(poly.translate(p.polyOverride, p.pos), {255,175,175}, 1)
		 else
	       self.canvas:drawRect({ p.pos[1], p.pos[2], p.pos[1]-1, p.pos[2]-1 }, "white")
         end
	   end
	end
  end
end

function startLevel()
  self.playerPosition = {self.position1[1], self.position1[2]}
  self.enemyPosition = {self.position2[1], self.position2[2]}
  --self.score = 0
end

function endLevel()
  if self.playerHealth > 0 then 
    self.loser = "enemy"
    self.playerSpriteState = "idle1"
    self.enemySpriteState = "idle5"
  else
    if self.enemyHealth > 0 then
      self.loser = "player"
	else
	  self.loser = "both"
	end
    self.playerSpriteState = "idle5"
    self.enemySpriteState = "idle1"
  end
  
  self.QTEState = "end"
  self.overlay.time = self.overlay.fadeDuration
  self.overlay.visible = true
  self.notes = {}
  self.QTETimer = 0
  
  self.level = self.level + 1
  self.QTEDuration = util.clamp(5 - 0.1 * (self.level - 1), 2, 5)
  
  if self.level == 2 or self.level == 4 then
    self.QTEWordWeights[4][1] = self.QTEWordWeights[4][1] + 1
  end

  if self.level == 5 or self.level == 7 or self.level == 9 or self.level == 13 or self.level == 16 then
    self.QTEWordWeights[5][1] = self.QTEWordWeights[5][1] + 1
  end
  
  if self.level == 6 or self.level == 8 or self.level == 12 or self.level == 15 or self.level == 17 or self.level == 19 or self.level == 20 or self.level == 21 then
    self.QTEWordWeights[6][1] = self.QTEWordWeights[6][1] + 1 
  end
  
end

function updateOverlay(dt)
  if self.overlay.time > 0 then
    self.overlay.time = self.overlay.time - dt
    local t = util.clamp(self.overlay.time / self.overlay.fadeDuration,0,1)
	
	self.overlay.color[4] = util.clamp(t * 300,0,255)
	self.playerPosition[1] = util.lerp(1-(t*t*t*t*t*t*t), self.position1[1], self.slicePosition1[1])
	self.enemyPosition[1] = util.lerp(1-(t*t*t*t*t*t*t), self.position2[1], self.slicePosition2[1])
	
	if self.overlay.time <= 0 then
	  self.overlay.visible = false
	  if self.loser == "enemy" or self.loser == "both" then
	    self.enemySpriteState = "downed"
	  else
	    self.playerSpriteState = "downed"
	  end 
	end
  end
  
  if self.overlay.visible then
    self.canvas:drawRect(self.overlay.rect, self.overlay.color)
  end  
end

function KeyDown(key, currentKeyState, previousKeyState)
  local keyDownCurrent = currentKeyState[key] == true
  local keyDownPrevious = previousKeyState[key] == true
  return keyDownPrevious == false and keyDownCurrent == true
end

function createReward()
  local reward = {}
  local pixelRewardAmount = (self.level-2) * 5
  if self.level > 4 then pixelRewardAmount = pixelRewardAmount + math.floor(self.score / 100) end
  
  local pixelReward = {item = "money", count = pixelRewardAmount, givenOut = 0}
  table.insert(reward, pixelReward)
  
  if self.level > 11 then
    local rarityIndex = math.floor(self.level/2) % 3
    local rarity = "common"
	if rarityIndex == 1 then
	  rarity = "uncommon"
	elseif rarityIndex == 2 then
	  rarity = "rare"
	end
	
	local itemLevel = math.floor((self.level - 12) / 6) + 1
	
	local weaponTypes = {"dagger", "axe", "broadsword", "hammer", "shortsword", "spear"}
	local randomType = util.randomChoice(weaponTypes)
	
	table.insert(reward, {item = rarity..randomType, count = 1, givenOut = 0, params = {level = itemLevel}})
  end
  return reward
end
