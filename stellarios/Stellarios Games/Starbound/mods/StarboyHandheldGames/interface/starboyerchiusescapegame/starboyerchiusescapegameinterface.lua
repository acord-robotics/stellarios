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

  self.sounds = config.getParameter("sounds")
  self.color = "white"
  
  self.mpos = {0,0}
  pane.playSound(self.sounds.startup2, 0, 0.5)

  self.level = 1
  self.lives = 3
  self.score = 0
  
  self.ship = { }
  self.worldOffset = {0,0}
  self.cameraOffset = {0,0}
  
  self.asteroids = {}
  self.bullets = {}
  self.particles = {}
  
  self.terrain = nil
  
  self.openedFromHand = config.getParameter("openedFromHand")
  self.key = world.sendEntityMessage(player.id(), "getKey"):result()
  
end

function dismissed()
  for soundName,sound in pairs(self.sounds) do
    if soundName ~= "success" then
      pane.stopAllSounds(sound)
    end
  end
  
  if self.openedFromHand then
    world.sendEntityMessage(player.id(), "closed")
  end
end
  
function update(dt)
  self.canvasFocused = widget.hasFocus("consoleScreenCanvas")

  if self.openedFromHand and not world.sendEntityMessage(player.id(), "holdingCorrectGame", {key = self.key}):result() then
    pane.dismiss()
  end
  
  self.state:update(dt)
end

function canvasClickEvent(position, button, isButtonDown)
  if self.canvasFocused then
    table.insert(self.clickEvents, {position, button, isButtonDown})
	--self.color = "blue"
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
  local copyrightText = "Starboy, Inc\nc. 2079"
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
	
    self.canvas:drawText(copyrightText, {position = pos, horizontalAnchor = "mid", verticalAnchor = "mid"}, 24, "green")
    
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
  local titleText = "Erchius Escape"
  local pressKeyText = "[Press SPACE to start]"
  local pos = {200, -300}
  local pos2 = {200, 100}
  local elapsedTime = 0
  local titleScrollDuration = 2
  local t = 0
  local blinkCycle = 2
  local blinkTimer = 0
  pane.playSound(self.sounds.titlescroll)
  while true do 
    self.canvas:clear()
	
	for _,press in pairs(takeKeyEvents()) do
	  local key, down = press[1], press[2]
	  if key == 5 and down then
	    if elapsedTime < titleScrollDuration then
  		  elapsedTime = titleScrollDuration
		else
		  pane.playSound(self.sounds.startup)
		  self.state:set(gameplayState)
		end
	  end
	end
	
	if t < 1 then
	  elapsedTime = util.clamp(elapsedTime + script.updateDt(), 0, titleScrollDuration)
	  t = elapsedTime / titleScrollDuration
	  pos[2] = util.lerp(t, -30, 150)
	end

    self.canvas:drawText(titleText, {position = pos, horizontalAnchor = "mid", verticalAnchor = "mid"}, 44, "green")
	
	if elapsedTime >= titleScrollDuration then
	  blinkTimer = (blinkTimer + script.updateDt()) % blinkCycle
	  if blinkTimer > blinkCycle * 0.5 then
	    self.canvas:drawText(pressKeyText, {position = pos2, horizontalAnchor = "mid", verticalAnchor = "mid"}, 20, "green")
	  end
	end  

    coroutine.yield()
  end
  
end

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

	self.canvas:drawText(scoreText, {position = pos, horizontalAnchor = "mid", verticalAnchor = "top"}, 40, "green")
    self.canvas:drawText("High Scores: ", {position = {200, 180}, horizontalAnchor = "mid", verticalAnchor = "top"}, 40, "green")
    colorTimer = (colorTimer + script.updateDt()) % colorCycle
	for i = 1, 3, 1 do
	  if scoreTable[i] ~= nil then
	    local t = colorTimer / colorCycle
	    local color = (i == indexOnHighscore) and ColorFromHSL(t, 0.5, 0.5) or "green"
		self.canvas:drawText(tostring(i) .. ". " .. scoreTable[i].name .. "  " .. tostring(scoreTable[i].score), {position = {200, 148 - i * 32}, horizontalAnchor = "mid", verticalAnchor = "mid"}, 30, color)
	  else
		self.canvas:drawText(tostring(i) .. ". ???  0", {position = {200, 148 - i * 32}, horizontalAnchor = "mid", verticalAnchor = "mid"}, 30, "green")
	  end 
	end
	
	elapsedTime = util.clamp(elapsedTime + script.updateDt(), 0, blinkDelay)
	
	if elapsedTime >= blinkDelay and isRewardComplete(reward) then
	  blinkTimer = (blinkTimer + script.updateDt()) % blinkCycle
	  if blinkTimer > blinkCycle * 0.5 then
	    self.canvas:drawText(pressKeyText, {position = pos2, horizontalAnchor = "mid", verticalAnchor = "bottom"}, 20, "green")
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
          world.spawnItem(v.item, world.entityPosition(player.id()), amountToPayout,_, {math.random(-3,3), math.random(5,20)}, 0.5)
	      v.givenOut = payoutTarget
	    end
	  end
	end
	
	coroutine.yield()
  end
end

function gameplayState()
   self.ship = {pos = {200,150},
				   dir = {0,1},
				   angle = math.pi * 0.5,
				   angularVel = 0,
				   vel = {0,0},
				   speed = 0,
				   shipPoly = { {6,0}, {-6,3}, {-6,0}, {-6,-3} },
				   r = 4.5,
				   acc = 0,
				   invulTimer = 0}

   self.terrain = generateTerrain(5, 100, 0.5)
   self.terrain2 = generateTerrain(5, 100, 0.5)
				   
   self.level = 1
   self.lives = 3
   self.score = 0
   widget.setText("livesLabel", "Lives: " .. tostring(self.lives))
   widget.setText("scoreLabel", tostring(self.score))
   widget.setVisible("scoreLabel", true)
   widget.setVisible("livesLabel", true)
   widget.setVisible("levelLabel", true)
   
   local firing = false
   local fireCooldown = 0
   
   while true do 
    for _,press in pairs(takeKeyEvents()) do
	  local key, down = press[1], press[2]
	  --widget.setText("connectingLabel", tostring(key))
	  if key == 65 or key == 87 then
	    if down then
		  self.ship.acc = 100
		else
		  self.ship.acc = 0
		end
	  end
	  
	  if key == 61 or key == 88 then
	    if down then
		  self.ship.acc = -100
		else
		  self.ship.acc = 0
		end
      end
	  
	  if key == 43 or key == 90 then
	    if down then
		  self.ship.angularVel = math.pi * 2
		else
		  self.ship.angularVel = 0
		end
      end
	  
	  if key == 46 or key == 89 then
	    if down then
		  self.ship.angularVel = -math.pi * 2
		else
		  self.ship.angularVel = 0
		end
      end
	  
	  if key == 5 then
	    if down then
	      firing = true
	    else
	      firing = false
		  fireCooldown = 0.05
	    end
	  end
    end
   
    fireCooldown = fireCooldown - script.updateDt()
   
    if firing and fireCooldown <= 0 then
	  fireCooldown = 0.35
	  self.terrain = generateTerrain(7, 150, 0.7, 0.9)
	  self.terrain2 = generateTerrain(7, 150, 0.7, 0.9)
	end
    
     self.canvas:clear()
	 
	 local rotatedTerrain = poly.rotate(self.terrain, math.pi * 0.5)
	 rotatedTerrain = poly.translate(rotatedTerrain, vec2.add({485, 0}, self.cameraOffset))
	 self.canvas:drawPoly(rotatedTerrain, "white", 1.0)
	 
	 rotatedTerrain = poly.rotate(self.terrain2, math.pi * -0.5)
	 rotatedTerrain = poly.translate(rotatedTerrain, vec2.add({-100, 300}, self.cameraOffset))
	 self.canvas:drawPoly(rotatedTerrain, "white", 1.0)
	 
	 for v = 2, #self.terrain-1,1 do
	   self.canvas:drawLine(self.terrain[v], {self.terrain[v][1], self.terrain[v][2]+10}, {0,255,0,100}, 1)
	 end
	 
	 self.ship.angle  =  wrapAngle(self.ship.angle + self.ship.angularVel * script.updateDt())
	 self.ship.dir = {math.cos(self.ship.angle), math.sin(self.ship.angle)}
	 if self.ship.acc ~= 0 then
	   self.ship.vel = vec2.add(self.ship.vel, vec2.mul(self.ship.dir, self.ship.acc * script.updateDt()))
	   self.ship.vel = clampMag(self.ship.vel, 200)
	 end
	 --self.ship.pos = vec2.add(self.ship.pos, vec2.mul(self.ship.vel, script.updateDt()))
	 --self.ship.pos = wrapPosition(self.ship.pos)
     self.worldOffset = vec2.add(self.worldOffset, vec2.mul(self.ship.vel, -script.updateDt()))
     --self.cameraOffset = vec2.approach(self.cameraOffset, self.worldOffset, 100 * script.updateDt())
	 self.cameraOffset = 
	 
	 local shipScreenPos = vec2.add({200,150}, vec2.sub(self.cameraOffset, self.worldOffset))
	 
	 local transformedPoly = poly.rotate(self.ship.shipPoly, self.ship.angle)
     --transformedPoly = poly.translate(transformedPoly, self.ship.pos)	 
     transformedPoly = poly.translate(transformedPoly, shipScreenPos)	 
     
	 local shipColor
	 if isShipInvul(self.ship) then
	   shipColor = shipInvulColor(self.ship)
	   self.ship.invulTimer = self.ship.invulTimer - script.updateDt()
	 else
	   shipColor = self.color
	 end
	 
     self.canvas:drawPoly(transformedPoly, shipColor, 1.0)
     
	 
	 coroutine.yield()
   end
end

function spawnParticle(position)
  local direction = {math.random(-1,1), math.random(-1,1)}
  if direction[1] == 0 and direction[2] == 0 then direction[1] = 1 end
  
  for _,p in pairs(self.particles) do
    if p.alive == false  then
	  p.pos = position
      p.vel = vec2.mul(direction, math.random(20,100))
	  p.lifeTime = 0
	  p.alive = true
	  return
    end
  end

  local newParticle = {pos = position,
          vel = vec2.mul(direction, math.random(20,100)),
		  lifeTime = 0,
		  alive = true}
  table.insert(self.particles, newParticle)
end

function updateParticles(dt)
    for _,p in pairs(self.particles) do
     if p.alive then
	   p.pos = vec2.add(p.pos, vec2.mul(p.vel, dt))
	   p.lifeTime = p.lifeTime+dt
	   if p.lifeTime > 0.33 then
	     p.alive = false
	   else
	     self.canvas:drawRect({ p.pos[1], p.pos[2], p.pos[1]-1, p.pos[2]-1 }, "white")
       end
	end
  end
end

function generateTerrain(generations, intialdisplacementRange, displacementDecay, cullPercent)
  local cullPercent = cullPercent or 0
  local heightMap = {}
  table.insert(heightMap, {0,150})
  table.insert(heightMap, {393,150})
  local vertCount = 2
  local displacementRange = intialdisplacementRange
  
  for g = 1, generations + 1, 1 do
    for v = vertCount, 2, -1 do
	  local displacement = (math.random() - 0.5) * displacementRange
	  local midpointX = (heightMap[v][1] + heightMap[v-1][1]) / 2
	  local midpointY = (heightMap[v][2] + heightMap[v-1][2]) / 2 + displacement
	  table.insert(heightMap, v, {midpointX, midpointY})
	end
	displacementRange = displacementRange * displacementDecay
	vertCount = #heightMap
  end
  
  --for c = 1, math.floor((vertCount + 1) / 2), 1 do
  for c = 1, math.floor(vertCount * cullPercent), 1 do
    local randomCull = math.random(2,#heightMap-1)
	table.remove(heightMap, randomCull)
  end
  
  table.insert(heightMap, 1, {0,0})
  table.insert(heightMap, {393,0})
  return heightMap
end

function isShipInvul(ship)
  if ship == nil then return false end
  
  return ship.invulTimer > 0
end

function shipInvulColor(ship)
  if ship == nil then return "white" end
  local blinkCycle = 0.3
  local t = ship.invulTimer % blinkCycle
  if t < blinkCycle * 0.5 then
    return {120,120,255,100}
  else
    return {100,100,200,50}
  end
end

function createReward()
  local reward = {}
  local pixelRewardAmount = (self.level-1) * 10
  if self.level > 3 then pixelRewardAmount = pixelRewardAmount + math.floor(self.score / 800) end
  
  local pixelReward = {item = "money", count = pixelRewardAmount, givenOut = 0}
  table.insert(reward, pixelReward)
  
  local oreRewardTable = {"copperore", "ironore", "silverore", "goldore", "tungstenore", "titaniumore", "durasteelore", "aegisaltore", "feroziumore", "violiumore", "solariumore"}
  local limit = math.min( math.floor((self.level-1)/3), #oreRewardTable)
  
  if limit > 0 then
    for i = 1, limit, 1 do
      table.insert(reward, {item = oreRewardTable[i], count = 1 + math.floor((self.level-1)/(3 * #oreRewardTable) ), givenOut = 0})
    end
  end
  
  return reward
end