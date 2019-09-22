require "/scripts/util.lua"
require "/scripts/vec2.lua"
require "/scripts/rect.lua"
require "/scripts/poly.lua"
require "/scripts/drawingutil.lua"
require "/scripts/starboyutil.lua"
require "/interface/starboyaetherwingsgame/aetherwingsship.lua"
require "/interface/starboyaetherwingsgame/aetherwingsenemy.lua"
-- engine callbacks
function init()
  --View:init()
  self.canvas = widget.bindCanvas("consoleScreenCanvas")
  self.clickEvents = {}
  self.keyEvents = {}

  self.openedFromHand = config.getParameter("openedFromHand")
  
  self.state = FSM:new()
  self.state:set(splashScreenState)

  self.sounds = config.getParameter("sounds")
  self.color = "white"
  self.fontColor = {75,50,210}
  
  pane.playSound(self.sounds.startup2, 0, 0.5)

  self.level = 1
  self.lives = 3
  self.score = 0
  
  self.particles = {}
  self.bullets = {}
  self.enemyBullets = {}
  self.missiles = {}
  self.ships = {}
  self.enemies = {}
  self.explosions = {}
  self.missileWave = {}

  self.groundTerrain = {}
  self.ceilingTerrain = {}
  
  self.obstacles = {}
  self.scrollSpeed = 45
  self.levelLength = 0
  self.distanceTraversed = 0
  self.vertsPerScreen = 10
  
  self.playerShip = CreateShip()
  
  self.playerShipPoly = {{15.0, -2.0}, {-4.0, 5.0}, {-13.0, 7.0}, {-6.0, 1.0}, {-9.0, -4.0}}
  self.machinegunBulletPoly = {{2,0}, {0,2}, {-2,0}, {0,-2}}
  self.turretPoly = {{15.3, 0.0}, {13.6, 5.2}, {9.8, 9.6}, {5.2, 11.7}, {0.0, 12.0}, {0.0, 12.0}, {-5.2, 11.7}, {-9.8, 9.6}, {-13.6, 5.2}, {-15.3, 0.0}}
  self.shootingStarPoly = {{0, 7}, {2,2}, {7,0}, {2,-2}, {0,-7}, {-2,-2}, {-7,0}, {-2,2}}
  self.destroyerPoly = {{-42, 10}, {-62, 20}, {-52, 30}, {-52, 40}, {-22, 40}, {-02, 30}, {28, 30}, {38, 40}, {68, 40}, {101, 20}, {101, -20}, {68, -40}, {38, -40}, {28, -30}, {-2, -30}, {-22, -40}, {-52, -40}, {-52, -30}, {-62, -20}, {-42, -10}}
  self.spawnerPoly = {{-19.4, -0.1}, {-22.2, 8.4}, {-11.1, 16.9}, {-8.3, 16.9}, {-11.2, 8.4}, {11.2, 8.4}, {8.3, 16.9}, {11.1, 16.9}, {22.2, 8.4}, {19.5, -0.1}}
  self.spreadPoly = {{-19.2, 0.1}, {-3.4, 3.2}, {-2.5, 5.3}, {-7.2, 8.3}, {-1.4, 7.2}, {0.3, 8.6}, {5.1, 9.0}, {1.1, 5.2}, {1.0, 3.3}, {2.3, 1.5}, {2.3, -1.5}, {1.0, -3.3}, {1.1, -5.2}, {5.1, -9.0}, {0.3, -8.6}, {-1.4, -7.2}, {-7.2, -8.3}, {-2.5, -5.3}, {-3.4, -3.2}, {-19.2, -0.1}}
  self.mirrorPoly = {{-7.4, 0.6}, {-1.6, 7.0}, {3.1, 7.3}, {8.3, 0.6}, {8.3, -0.6}, {3.1, -7.3}, {-1.6, -7.0}, {-7.4, -0.6}, {7.4, -0.6}, {1.6, -7.0}, {-3.1, -7.3}, {-8.3, -0.6}, {-8.3, 0.6}, {-3.1, 7.3}, {1.6, 7.0}, {7.4, 0.6}}
  self.shieldPoly = {{-4.0, 11.0}, {4.0, 11.0}, {11.0, 4.0}, {11.0, -4.0}, {4.0, -11.0}, {-4.0, -11.0}, {-11.0, -4.0}, {-11.0, 4.0}}
  self.floatingTurretPoly = {{0.2, 15.9}, {11.3, 11.5}, {15.7, -0.1}, {10.8, -11.5}, {0.0, -15.7}, {0.0, -15.7}, {-11.7, -11.0}, {-15.7, -0.1}, {-11.7, 10.7}, {-0.2, 15.9}}
  self.seekerPoly = {{7.4, 0.3}, {9.2, 2.0}, {12.4, 0.7}, {9.4, 3.8}, {5.5, 2.4}, {3.9, 3.5}, {2.0, 1.0}, {0.7, 0.1}, {0.7, -0.1}, {2.0, -1.0}, {3.9, -3.4}, {5.5, -2.4}, {9.4, -3.8}, {12.4, -0.7}, {9.2, -2.0}, {7.4, -0.3}}
  self.cruiserPoly = {{-28.1, 0.0}, {-28.1, 23.9}, {-18.5, 33.5}, {17.6, 33.5}, {8.0, 25.5}, {-10.4, 19.3}, {-4.2, 6.6}, {36.5, 7.9}, {54.9, 0.0}, {35.8, -8.0}, {-4.2, -6.6}, {-10.4, -19.4}, {8.0, -25.6}, {17.6, -33.6}, {-18.5, -33.6}, {-28.1, -24.0}, {-28.1, 0.0}}
  self.speedupPoly = {{-9.6, -6.3}, {-9.6, 10.5}, {9.6, 10.5}, {9.6, -6.3}, {1.9, -6.3}, {1.9, -1.3}, {6.5, -1.3}, {0.0, 9.3}, {-6.5, -1.3}, {-1.9, -1.3}, {-1.9, -6.3}}
  self.powerupPoly = {{0.0, 8.2}, {2.5, 3.0}, {8.7, 2.2}, {4.0, -1.8}, {5.1, -7.7}, {0.0, -3.6}, {0.0, -3.6}, {-5.1, -7.7}, {-4.0, -1.8}, {-8.7, 2.2}, {-2.5, 3.0}, {0.0, 8.2}, {9.6, 8.2}, {9.6, -8.5}, {-9.6, -8.5}, {-9.6, 8.2}}
 
  --self.turretPoly = {{16.0, 0.0}, {14.0, 3.0}, {10.0, 7.0}, {6.0, 9.0}, {0.0, 9.0}, {-7.0, 9.0}, {-11.0, 7.0}, {-15.0, 3.0}, {-17.0, 0.0}, {-7.0, -2.0}, {4.0, -2.0}}
  
  self.explosionColor = {255,255,0}
  self.explosionColorTimer = 0

  --table.insert(self.enemies, CreateEnemyShip({position = {1025,150},time = 0.5, velocity = {-30, 0},wavePeriod = -2,waveAmplitude = 15,poly = {{-3.7, 0.0}, {-3.7, 2.2}, {-12.3, 2.2}, {-3.7, 8.6}, {4.8, 8.6}, {9.1, 2.2}, {4.8, 2.2}, {4.8, 0.0}, {4.8, 0.0}, {4.8, -2.1}, {9.1, -2.1}, {4.8, -8.5}, {-3.7, -8.5}, {-12.3, -2.1}, {-3.7, -2.1}, {-3.7, 0.0}}}))
  --table.insert(self.enemies, CreateEnemyShip({position = {1075,150},time = 1, velocity = {-30, 0},wavePeriod = -2,waveAmplitude = 15,poly = {{-3.7, 0.0}, {-3.7, 2.2}, {-12.3, 2.2}, {-3.7, 8.6}, {4.8, 8.6}, {9.1, 2.2}, {4.8, 2.2}, {4.8, 0.0}, {4.8, 0.0}, {4.8, -2.1}, {9.1, -2.1}, {4.8, -8.5}, {-3.7, -8.5}, {-12.3, -2.1}, {-3.7, -2.1}, {-3.7, 0.0}}}))
  --table.insert(self.enemies, CreateEnemyShip({position = {1125,150},time = 1.5, velocity = {-30, 0},wavePeriod = -2,waveAmplitude = 15,poly = {{-3.7, 0.0}, {-3.7, 2.2}, {-12.3, 2.2}, {-3.7, 8.6}, {4.8, 8.6}, {9.1, 2.2}, {4.8, 2.2}, {4.8, 0.0}, {4.8, 0.0}, {4.8, -2.1}, {9.1, -2.1}, {4.8, -8.5}, {-3.7, -8.5}, {-12.3, -2.1}, {-3.7, -2.1}, {-3.7, 0.0}}}))
  --table.insert(self.enemies, CreateEnemyShip({position = {1175,150},time = 2, velocity = {-30, 0},wavePeriod = -2,waveAmplitude = 15,poly = {{-3.7, 0.0}, {-3.7, 2.2}, {-12.3, 2.2}, {-3.7, 8.6}, {4.8, 8.6}, {9.1, 2.2}, {4.8, 2.2}, {4.8, 0.0}, {4.8, 0.0}, {4.8, -2.1}, {9.1, -2.1}, {4.8, -8.5}, {-3.7, -8.5}, {-12.3, -2.1}, {-3.7, -2.1}, {-3.7, 0.0}}}))
  --table.insert(self.enemies, CreateEnemyShip({position = {1225,150},time = 2.5, velocity = {-30, 0},wavePeriod = -2,waveAmplitude = 15,poly = {{-3.7, 0.0}, {-3.7, 2.2}, {-12.3, 2.2}, {-3.7, 8.6}, {4.8, 8.6}, {9.1, 2.2}, {4.8, 2.2}, {4.8, 0.0}, {4.8, 0.0}, {4.8, -2.1}, {9.1, -2.1}, {4.8, -8.5}, {-3.7, -8.5}, {-12.3, -2.1}, {-3.7, -2.1}, {-3.7, 0.0}}}))
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
  --self.canvasFocused = widget.hasFocus("consoleScreenCanvas")
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
  local copyrightText = "Starboy, Inc\nc. 2085"
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
	
    self.canvas:drawText(copyrightText, {position = pos, horizontalAnchor = "mid", verticalAnchor = "mid"}, 24, {75,50,210})
    
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
  local titleText = "Aether\nWings"
  local pressKeyText = "[Press ANY KEY to start]"
  local pos = {-15, 150}
  local pos2 = {415, 150}
  local elapsedTime = 0
  local t = 0
  local flybyDuration = 2
  local trailColor = {self.fontColor[1], self.fontColor[2], self.fontColor[3]}
  local blinkCycle = 2
  local blinkTimer = 0

  pane.playSound(self.sounds.shipflyby)
  while true do 
    self.canvas:clear()
	
	for _,press in pairs(takeKeyEvents()) do
	  local key, down = press[1], press[2]
	  if down and elapsedTime > flybyDuration then
	    --if elapsedTime >= titleScrollDuration then
		  pane.playSound(self.sounds.startup)
		  self.state:set(gameState)
		--end
	  end
	end
	
	if t < 1.25 then
	  elapsedTime = elapsedTime + script.updateDt()
	  t = elapsedTime / flybyDuration
	  --pos[2] = util.lerp(t, 330, 220)
	  local shipPos = {util.lerp(t * 3, pos[1], pos2[1]), pos[2]}
	  local trailWidth = t*t*t*t*t*150
	  local trailFade = 1
	  if t > 1 then trailFade = 1 - (t - 1) / 0.25 end
	  self.canvas:drawRect({0,151+trailWidth, shipPos[1], 149-trailWidth}, {trailColor[1], trailColor[2], trailColor[3], trailFade * 255})
	  self.canvas:drawPoly(poly.translate(self.playerShip.poly, shipPos), self.playerShip.color, 1)
	end

	

	if t >= 0.99 then
      self.canvas:drawText(titleText, {position = {200,150}, horizontalAnchor = "mid", verticalAnchor = "mid"}, 44, self.fontColor)
	end
	
	if elapsedTime >= flybyDuration then
	  blinkTimer = (blinkTimer + script.updateDt()) % blinkCycle
	  if blinkTimer > blinkCycle * 0.5 then
	    self.canvas:drawText(pressKeyText, {position = {200,25}, horizontalAnchor = "mid", verticalAnchor = "mid"}, 20, self.fontColor)
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

function gameState()
   self.particles = {}


   widget.setVisible("scoreLabel", true)
   widget.setVisible("livesLabel", true)
   widget.setVisible("levelLabel", true)
   --CreateRandomTerrain2()
   --GenerateRandomObstacles()
   --GenerateEnemies()
   self.level = 1
   self.lives = 3
   self.score = 0
   
  widget.setText("scoreLabel", tostring(self.score))
   widget.setText("livesLabel", "Lives: " .. tostring(self.lives))
   widget.setText("levelLabel", "Level: "..tostring(self.level))
   
   self.playerShip = CreateShip()
   self.bullets = {}
   self.enemyBullets = {}
   GenerateTerrain()
   populateLevel()
   
   local leftHeld, rightHeld, upHeld, downHeld, fireHeld = false,false,false,false,false
   while true do 
    local dt = script.updateDt()
    anyKeyPressed = false
    for _,press in pairs(takeKeyEvents()) do
	  local key, down = press[1], press[2]
	  if key == 65 or key == 87 then
	    if down then
		  upHeld = true
		else
		  upHeld = false
		end
	  end
	  
	  if key == 61 or key == 88 then
	    if down then
          downHeld = true
		else
		  downHeld = false
		end
      end
	  
	  if key == 43 or key == 90 then
	    if down then
		  leftHeld = true
		else
		  leftHeld = false
		end
      end
	  
	  if key == 46 or key == 89 then
	    if down then
		  rightHeld = true
		else
		  rightHeld = false
		end
      end
	  
	  if key == 5 then
	    if down then
	      fireHeld = true
	    else
	      fireHeld = false
	    end
	  end
	  
	  --if key == 21 and down then
	    --self.playerShip.weapon.level = self.playerShip.weapon.level + 1
	    --self.level = self.level + 1
		--widget.setText("levelLabel", tostring(self.level))
	  --end
	  --widget.setText("scoreLabel", tostring(key))
    end
     
	local moveDir = {0,0}
	if leftHeld then moveDir[1] = moveDir[1] - 1 end
	if rightHeld then moveDir[1] = moveDir[1] + 1 end
	if upHeld then moveDir[2] = moveDir[2] + 1 end
	if downHeld then moveDir[2] = moveDir[2] - 1 end
     
    self.canvas:clear()
	 
	self.playerShip.moveDir = moveDir
	self.playerShip:Update(dt)
	self.playerShip.position = clampPosition(self.playerShip.position)
    if fireHeld then 
	  if self.playerShip:FireWeapon() then
	    pane.playSound(self.sounds.shoot)
	  end
	end
	
	if #self.playerShip.firedBullets > 0 then
	  for k,v in pairs(self.playerShip.firedBullets) do
	    table.insert(self.bullets, v)
	  end
	  self.playerShip.firedBullets = {}
	end

   self.distanceTraversed = self.distanceTraversed + self.scrollSpeed * dt
   if self.distanceTraversed >= self.levelLength then
     local allEnemiesDead = true
	 for k,v in pairs(self.enemies) do
	   if v.destroyed == false then 
	     allEnemiesDead = false
		 break
	   end
	 end
	 
	 if allEnemiesDead then
       self.level = self.level + 1
	   widget.setText("levelLabel", "Level: " .. tostring(self.level))
       GenerateTerrain()
       populateLevel()
	 end
   end
   UpdateEnemies(dt)
   UpdateObstacles(dt)
   updateBullets(dt)
   updateParticles(dt)
  
   self.canvas:drawPoly(poly.translate(self.playerShip.poly, self.playerShip.position), self.playerShip.color, 1)
   
   if self.playerShip.hp <= 0 then
     self.state:set(scoreScreenState)
   end
   
   coroutine.yield()
   end
end

function UpdateEnemies(dt)
  for k,v in pairs(self.enemies) do
    if not v.destroyed then
      v:Update(dt, self.playerShip, -self.scrollSpeed * dt)
	  local transformedPoly = poly.translate(poly.rotate(v.poly, v.rotation), v.position)   
      self.canvas:drawPoly(transformedPoly, v.color, 1)
      for _,weapon in pairs(v.weapons) do
	    if weapon.subPoly then
		  transformedPoly =  poly.translate(poly.rotate(weapon.subPoly,weapon.angle or 0.01), vec2.add(v.position, weapon.relativePosition or {0,0}))
		  self.canvas:drawPoly(transformedPoly, weapon.color or v.color or "white", 1)
		end
	  end
	  
	  local collidingWithPlayer = false
	  if self.playerShip:IsInvulnerable() == false then
	    if v.collisionRect ~= nil then
	      collidingWithPlayer = rect.contains(rect.translate(v.collisionRect, v.position), self.playerShip.position)
	    else
          collidingWithPlayer = isColliding(v.position, v.radius, self.playerShip.position, 1)
	    end
	  end
	  
	  if collidingWithPlayer then
	    v:TakeDamage(1)
		loseLife()
		spawnParticleBurst(math.random(5,8), v.position, 50, 75,  0.5)
	  end
	  
  	  if #v.firedBullets > 0 then
	    for _,b in pairs(v.firedBullets) do
		  if b.type == "ship" then
	        table.insert(self.enemies, CreateEnemyShip(b))
		  else
		    table.insert(self.enemyBullets, b)
	      end
		end
	    v.firedBullets = {}
		pane.playSound(self.sounds.enemyshoot)
	  end
	else
	  --sb.logInfo("enemy destroyed " .. tostring(v.powerupDropType))
      if v.powerupDropType == "power" then
	    table.insert(self.obstacles, {position = {v.position[1], v.position[2]}, type = "poly", radius = 15, ignoreBullets = true, color = "green", extents = poly.boundBox(self.powerupPoly), poly = self.powerupPoly, powerupType = "power"})
	  elseif v.powerupDropType == "speed" then
	    table.insert(self.obstacles, {position = {v.position[1], v.position[2]}, type = "poly", radius = 15, ignoreBullets = true, color = "green", extents = poly.boundBox(self.speedupPoly), poly = self.speedupPoly, powerupType = "speed"})
	  end
	  self.enemies[k] = nil
	end
  end
end

function updateBullets(dt)
  for k,v in pairs(self.bullets) do
    v.position = vec2.add(v.position, vec2.mul(v.velocity, dt))
	if offScreen(v.position) then v.destroyed = true end
	
	if not v.destroyed then
	  for _,obstacle in pairs(self.obstacles) do
	    if obstacle.extents[1] < 400 and obstacle.extents[3] > 0 and not obstacle.ignoreBullets then
	      if obstacle.type == "rect" and not obstacle.destroyed then
			if rect.contains(obstacle.extents, v.position) then
			  v.destroyed = true
			  damageObstacle(obstacle, 1)
			  spawnParticleBurst(math.random(1,3), v.position, 50, 150, 0.5)
			  pane.playSound(self.sounds.bullethit)
			  break
			end
		  elseif obstacle.type == "poly" then
		    if isColliding(obstacle.position, obstacle.radius, v.position, 1) then
			  v.destroyed = true
			  damageObstacle(obstacle, 1)
			  spawnParticleBurst(math.random(1,3), v.position, 50, 150,  0.5)
			  pane.playSound(self.sounds.bullethit)
			  break
			end
		  elseif obstacle.type == "terrain" then
		    if isCollidingWithTerrain(obstacle, v.position) then
			  v.destroyed = true
			  spawnParticleBurst(math.random(1,3), v.position, 50, 75,  0.5)
			  pane.playSound(self.sounds.bullethit)
			  break
			end
		  end
	    end
	  end
	  
	  for _,enemy in pairs(self.enemies) do
	    if enemy.position[1] < 420 then
	      if not v.destroyed and not enemy.destroyed then
		    local collision
			if enemy.collisionRect ~= nil then
			  collision = rect.contains(rect.translate(enemy.collisionRect, enemy.position), v.position)
			else
			  collision = isColliding(enemy.position, enemy.radius, v.position, 1)
		    end
			
			if collision then
			  v.destroyed = true
		      enemy:TakeDamage(1)
		      if enemy.destroyed then
			    gainScore(enemy.score or 10)
				local randomShipDestroyedSound = "shipdestroyed"..tostring(math.random(1,2))
				pane.playSound(self.sounds[randomShipDestroyedSound])
				if enemy.collisionRect == nil then
				  spawnParticleBurstInRegion(math.random(5,8), {type = "circle", radius = enemy.radius or 1, center = enemy.position}, 50, 75, 0.5, nil, "yellow") 
	            else
				  spawnParticleBurstInRegion(math.random(15,30), {type = "rect", rect = rect.translate(enemy.collisionRect, enemy.position) or {0,0,0,0}}, 50, 75, 0.5, nil, "yellow")
				end
			  else
			    pane.playSound(self.sounds.bullethit)
		        spawnParticleBurst(math.random(1,3), v.position, 50, 75,  0.5)
		      end
			end
		  end
	    end
	  end
	end
	
	if v.destroyed then
	  self.bullets[k] = nil
	else
	  self.canvas:drawPoly(poly.translate(self.machinegunBulletPoly, v.position), "white", 1)
	end
  end
  
  for k2,v2 in pairs(self.enemyBullets) do
    v2.position = vec2.add(v2.position, vec2.mul(v2.velocity, dt))
	if offScreen(v2.position) then v2.destroyed = true end
	
	if not v2.destroyed then
	  if isColliding(v2.position, 5, self.playerShip.position, 1) then
	    v2.destroyed = true
		loseLife()
		spawnParticleBurst(math.random(5,10), v2.position, 90, 200,  0.75)
	  end
	end
	
	if v2.destroyed then
	  self.enemyBullets[k2] = nil
	else
	  self.canvas:drawPoly(poly.translate(self.machinegunBulletPoly, v2.position), "red", 1)
	end
  end
end

function UpdateObstacles(dt)
  local collided = false
  for k,v in pairs(self.obstacles) do
    if v.destroyed then
	  self.obstacles[k] = nil
    else
      if v.type == "rect" then
	    v.extents = rect.translate(v.extents, {dt * -self.scrollSpeed, 0})
	
	    if v.extents[1] < 400 and v.extents[3] > 0 then
	      self.canvas:drawRect(v.extents, v.color or "white")
		  if rect.contains(v.extents, self.playerShip.position) then
		    if v.powerupType == nil then
		      collided = true
		    else
			  v.destroyed = true
			  if v.powerupType == "speed" then
			    self.playerShip.speed = util.clamp(self.playerShip.speed + 25, 100, 450)
				pane.playSound(self.sounds.powerup)
			  elseif v.powerupType == "power" then
			    self.playerShip.weapon.level = self.playerShip.weapon.level + 1
			    pane.playSound(self.sounds.powerup)
			  end
			end
		  end
	    end
	  elseif v.type == "poly" then
	    v.position[1] = v.position[1] - dt * self.scrollSpeed
        if v.extents[1] < 400 and v.extents[3] > 0 then
          self.canvas:drawPoly(poly.translate(v.poly, v.position), v.color or "white")
		  if isColliding(v.position, v.radius, self.playerShip.position, 1) then
		    if v.powerupType == nil then
		      collided = true
			else
			  v.destroyed = true
			  if v.powerupType == "speed" then
			    self.playerShip.speed = util.clamp(self.playerShip.speed + 25, 100, 450)
				pane.playSound(self.sounds.powerup)
			  elseif v.powerupType == "power" then
			    self.playerShip.weapon.level = self.playerShip.weapon.level + 1
				pane.playSound(self.sounds.powerup)
			  end
			end
		  end
        end
      elseif v.type == "terrain" then
	    v.position[1] = v.position[1] - dt * self.scrollSpeed
        if v.extents[1] < 400 and v.extents[3] > 0 then
          self.canvas:drawPoly(poly.translate(v.poly, v.position), v.color or "white")
  		  if isCollidingWithTerrain(v, self.playerShip.position) then
		    collided = true
		  end
        end
	  end
	end
	--sb.logInfo( tostring(dt) .. ":dt  " .. tostring(self.scrollSpeed) .. ":s  " .. tostring(v.extents[1]) .. ", " .. tostring(v.extents[2]) .. " - " .. tostring(v.extents[3]) .. ", " .. tostring(v.extents[4]))
  end
  
  if collided == true then
   loseLife()
  end
   --debugTerrainRay()
end

function spawnParticle(position, velocity, duration, polyOverride, color)
  for _,p in pairs(self.particles) do
    if p.alive == false  then
	  p.pos = position
      p.vel =  velocity
	  p.lifeTime = 0
	  p.maxLifeTime = duration
	  p.alive = true
	  p.poly = polyOverride
	  p.color = color or "white"
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

function spawnParticleBurst(count, position, minSpeed, maxSpeed, duration, polyOverride, color)
  for i = 1, count, 1 do
    local rAngle = math.random() * 2 * math.pi
	local rSpeed = math.random() * (maxSpeed - minSpeed) + minSpeed
	spawnParticle({position[1], position[2]}, {math.sin(rAngle) * rSpeed, math.cos(rAngle) * rSpeed}, duration, polyOverride, color)
  end
end

function spawnParticleBurstInRegion(count, region, minSpeed, maxSpeed, duration, polyOverride,color)
  for i = 1, count, 1 do
    local rAngle = math.random() * 2 * math.pi
	local rSpeed = math.random() * (maxSpeed - minSpeed) + minSpeed
	local position = {0,0}
	if region.type == "rect" then
	  position[1] = math.random() * (region.rect[3] - region.rect[1]) + region.rect[1]
	  position[2] = math.random() * (region.rect[4] - region.rect[2]) + region.rect[2]
	else
	  local r = math.random() * 2 * math.pi
	  local rD = math.random() * region.radius
	  position[1] = math.cos(r) * rD + region.center[1]
	  position[2] = math.sin(r) * rD + region.center[2]
	end
	
	spawnParticle({position[1], position[2]}, {math.sin(rAngle) * rSpeed, math.cos(rAngle) * rSpeed}, duration, polyOverride, color)
  end  
end
function updateParticles(dt)
    for _,p in pairs(self.particles) do
     if p.alive then
	   p.pos = vec2.add(p.pos, vec2.mul(p.vel, dt))
	   p.pos[1] = p.pos[1] - self.scrollSpeed * dt
	   p.lifeTime = p.lifeTime+dt
	   if p.lifeTime > p.maxLifeTime then
	     p.alive = false
	   else
	     if p.polyOverride ~= nil then
		   self.canvas:drawPoly(poly.translate(p.polyOverride, p.pos), {255,175,175}, 1, p.color or "white")
		 else
	       self.canvas:drawRect({ p.pos[1], p.pos[2], p.pos[1]-1, p.pos[2]-1 }, p.color or "white")
         end
	   end
	end
  end
end

function GenerateRandomObstacles()
  self.levelLength = 400 * 12 
  local numberOfObstacles = 25--math.random(3, 12)
  
  local terrainPoly = {{0,0}}
  local ceilingPoly = {{0,0}}
  for t = 1, 30, 1 do
    if t ~= 30 then
      table.insert(terrainPoly, {(self.levelLength - 800) / 30 * t, math.random(15,40)})
      table.insert(ceilingPoly, {(self.levelLength - 800) / 30 * t, math.random(-40,-15)})
    else
	  table.insert(terrainPoly, {(self.levelLength - 800) / 30 * t, 0})
	  table.insert(ceilingPoly, {(self.levelLength - 800) / 30 * t, 0})
	end
  end

  self.groundTerrain = {type = "terrain", poly = terrainPoly, position = {800,0}, extents = poly.boundBox(terrainPoly), solidSide = "below"}
  self.ceilingTerrain = {type = "terrain", poly = ceilingPoly, position = {800,300}, extents = poly.boundBox(terrainPoly), solidSide = "above"}
  
  table.insert(self.obstacles, self.groundTerrain)
  table.insert(self.obstacles, self.ceilingTerrain)
  
  for i = 1, numberOfObstacles, 1 do
    local x2 = math.random(20, 50)
    local x1 = math.random(400, self.levelLength - x2)
	x2 = x2 + x1
	
	local y2 = math.random(30, 150)
	local terrainAnchor
    if math.random(0,1) == 0 then terrainAnchor = self.groundTerrain else terrainAnchor = self.ceilingTerrain	end	
	local y1 = math.random(0, 300 - y2)
    
	if terrainAnchor then
	   local tHeight = getTerrainHeight(terrainAnchor, x1)
	   if terrainAnchor.solidSide == "above" then
	     y1 = math.random() * (300 - tHeight) + tHeight - y2
	   else
	     y1 = math.random() * tHeight
	   end
	end
	y2 = y2 + y1
	
	table.insert(self.obstacles, {type = "rect", hp = 5, color = {255,255,255}, extents = {x1,y1,x2,y2}})
  end
  
  for i = 1, numberOfObstacles, 1 do
    local pos = {math.random(400, self.levelLength), math.random(0,300)}
	
	local lowerRange, upperRange = getOpenRangeBetweenTerrain(pos[1])
	pos[2] = math.random(math.floor(lowerRange), math.floor(upperRange))
	
	local rPoly = {}
	local numOfVerts = math.random(4, 10)
	local maxR = 0
	for v = 1, numOfVerts, 1 do
	  local randomRadius = math.random() * 20 + 10 
	  if randomRadius > maxR then maxR = randomRadius end
	  local angle = math.pi * 2 / numOfVerts * v + math.random() * 0.5 - 0.25
	  table.insert(rPoly, {math.cos(angle) * randomRadius, math.sin(angle) * randomRadius})
	end
	
	table.insert(self.obstacles, {type = "poly", hp = 5, poly = rPoly, position = pos, color = {255,255,255}, radius = maxR, extents = poly.boundBox(rPoly)})
  end
end

function GenerateEnemies()
  local numberOfEnemies = 35
  for i = 1, numberOfEnemies, 1 do
    local pos = {math.random(400, self.levelLength), math.random(0,300)}
	local lowerRange, upperRange = getOpenRangeBetweenTerrain(pos[1])
	if lowerRange < 25 then lowerRange = 25 end
	if upperRange > 275 then upperRange = 275 end
	
	if math.random(0,1) == 0 then
	  pos[2] = math.random(math.floor(lowerRange), math.floor(upperRange)+1)
	  table.insert(self.enemies, CreateEnemyShip({position = pos, velocity = {-90, 0},wavePeriod = -2,waveAmplitude = 15,color = "yellow",poly = {{-3.7, 0.0}, {-3.7, 2.2}, {-12.3, 2.2}, {-3.7, 8.6}, {4.8, 8.6}, {9.1, 2.2}, {4.8, 2.2}, {4.8, 0.0}, {4.8, 0.0}, {4.8, -2.1}, {9.1, -2.1}, {4.8, -8.5}, {-3.7, -8.5}, {-12.3, -2.1}, {-3.7, -2.1}, {-3.7, 0.0}}}))
	else
	  local terrain 
	  if math.random(0,1) == 0 then terrain = self.groundTerrain else terrain = self.ceilingTerrain	end
	  if terrain then
	    pos[2] = getTerrainHeight(terrain, pos[1])		
		if pos[2] ~= 0 then
		  table.insert(self.enemies, CreateEnemyShip({position = pos, rotation = getTerrainNormalAngle(terrain, pos[1]), moveType = "none", weapons = {{type = "machinegun", level = 1, time = 0, cooldown = 5, relativePos = {0,0}, angle = 0, aimAtPlayer = true, subPoly = {{14,-2}, {25,-2}, {25,2} , {14,2}} }}, poly = self.turretPoly}))
        end
	  end
	end
  end
end

function GenerateTerrain()
  self.levelLength = 400 * 12 
  self.obstacles = {}
  self.enemies = {}
  self.distanceTraversed = 0
  
  local terrainPoly = {{0,0}}
  local ceilingPoly = {{0,0}}
  for t = 1, 30, 1 do
    if t ~= 30 then
      table.insert(terrainPoly, {(self.levelLength - 800) / 30 * t, math.random(15,40)})
      table.insert(ceilingPoly, {(self.levelLength - 800) / 30 * t, math.random(-40,-15)})
    else
	  table.insert(terrainPoly, {(self.levelLength - 800) / 30 * t, 0})
	  table.insert(ceilingPoly, {(self.levelLength - 800) / 30 * t, 0})
	end
  end

  self.groundTerrain = {type = "terrain", poly = terrainPoly, position = {800,0}, extents = poly.boundBox(terrainPoly), solidSide = "below"}
  self.ceilingTerrain = {type = "terrain", poly = ceilingPoly, position = {800,300}, extents = poly.boundBox(terrainPoly), solidSide = "above"}
  
  table.insert(self.obstacles, self.groundTerrain)
  table.insert(self.obstacles, self.ceilingTerrain)
end

function populateLevel()
  local terrainStart = nil
  if self.groundTerrain then
    terrainStart = self.groundTerrain.position[1]
  elseif self.ceilingTerrain then
    terrainStart = self.ceilingTerrain.position[1]
  end
  
  local blockX = 450
  local spawnBlocks = {}
  if terrainStart then
    table.insert(spawnBlocks, {startX = blockX, endX = terrainStart, type = GetRandomOpenSpaceBlock() })
    blockX = terrainStart
  end
  
  while blockX < self.levelLength do
    local blockWidth = 200 + math.random() * (400 - util.clamp(self.level * 25,0,200))
	local blockType
	if terrainStart then
	  blockType = GetRandomEnclosedSpaceBlock()
	else
	  blockType = GetRandomOpenSpaceBlock()
	end
    table.insert(spawnBlocks, {startX = blockX, endX = blockX + blockWidth, type = blockType })
	blockX = blockX + blockWidth
  end
  
  for k,v in pairs(spawnBlocks) do
    --sb.logInfo(v.type .. " : " .. tostring(v.startX) .. " -> " .. tostring(v.endX))
    SpawnFromBlock(v)
  end
  
  local powerupCount = math.random(1,2)
  while powerupCount > 0 do
    local randomPowerupEnemy = math.random(1,#self.enemies)
    if self.enemies[randomPowerupEnemy].powerupDropType == nil then
	  local rPowerupType = (math.random(0,1) == 1) and "power" or "speed"
	  self.enemies[randomPowerupEnemy].powerupDropType = rPowerupType
	  self.enemies[randomPowerupEnemy].color = "red"
	  self.enemies[randomPowerupEnemy].hp = self.enemies[randomPowerupEnemy].hp + 2
	  powerupCount = powerupCount - 1
	end
  end
end

function SpawnFromBlock(block)
--{{1, "empty"}, {1,"asteroidfield"}, {1,"swarm"}, {1,"wave"}, {1, "turrets"}, {1,"random"}, {1,"gap"}, {1,"pillars"}}
  local obstacleCount = 0
  local enemyCount = 0
  local spawnPosition = {0,0}
  local terrainRangeLower, terrainRangeUpper = 0,300
  if block.type == "asteroidfield" then
    obstacleCount = GetRandomAsteroidWaveSize()
	for i = 1, obstacleCount, 1 do
      spawnPosition[1] = math.random() * (block.endX - block.startX) + block.startX
	  terrainRangeLower, terrainRangeUpper = getOpenRangeBetweenTerrain(spawnPosition[1])
	  spawnPosition[2] = math.random() * (terrainRangeUpper - terrainRangeLower) + terrainRangeLower
      table.insert(self.obstacles, CreateAsteroid(spawnPosition, GetAsteroidScalingHp()))
    end
	if block.isSubBlock == nil and math.random() < 0.06 * self.level then
      block.type = GetRandomSubSpaceBlock()
	  block.isSubBlock = true
	  SpawnFromBlock(block)
    end	
  elseif block.type == "swarm" then
	enemyCount = block.enemyCount or GetRandomSwarmSize()
	for i = 1, enemyCount, 1 do
      spawnPosition[1] = math.random() * (block.endX - block.startX) + block.startX
	  terrainRangeLower, terrainRangeUpper = getOpenRangeBetweenTerrain(spawnPosition[1])
	  spawnPosition[2] = math.random() * (terrainRangeUpper - terrainRangeLower) + terrainRangeLower
      table.insert(self.enemies, CreateEnemyShip({position = {spawnPosition[1], spawnPosition[2]}, velocity = {-90, 0}, hp = GetWeakEnemyScalingHp(),wavePeriod = -2,waveAmplitude = 15, score = 15,color = "yellow",poly = {{-3.7, 0.0}, {-3.7, 2.2}, {-12.3, 2.2}, {-3.7, 8.6}, {4.8, 8.6}, {9.1, 2.2}, {4.8, 2.2}, {4.8, 0.0}, {4.8, 0.0}, {4.8, -2.1}, {9.1, -2.1}, {4.8, -8.5}, {-3.7, -8.5}, {-12.3, -2.1}, {-3.7, -2.1}, {-3.7, 0.0}}}))
    end
  elseif block.type == "wave" then
    enemyCount = block.enemyCount or GetRandomSwarmSize()
	local blockCenter = {(block.startX + block.endX) / 2, 150}
    local r = math.random()
	local angle = math.random() * math.pi - math.pi * 0.5--(0.5 - r * r) * math.pi * 2
	local moveVector = {math.cos(angle), math.sin(angle)}
    local d = math.random(150,200)
	local mirrored = math.abs(angle) > math.pi * 0.2
	local d2 = math.random(25, 100)
	local xOffset = math.random(0, 100) + 25
	for i = 1, enemyCount, 1 do
	  spawnPosition = vec2.add(vec2.mul(moveVector, d), blockCenter)
	  table.insert(self.enemies, CreateEnemyShip({position = {spawnPosition[1] + xOffset, spawnPosition[2]}, velocity = vec2.mul(moveVector, -70), hp = GetWeakEnemyScalingHp(), wavePeriod = -2,waveAmplitude = 15,color = "yellow",poly = {{-3.7, 0.0}, {-3.7, 2.2}, {-12.3, 2.2}, {-3.7, 8.6}, {4.8, 8.6}, {9.1, 2.2}, {4.8, 2.2}, {4.8, 0.0}, {4.8, 0.0}, {4.8, -2.1}, {9.1, -2.1}, {4.8, -8.5}, {-3.7, -8.5}, {-12.3, -2.1}, {-3.7, -2.1}, {-3.7, 0.0}}}))
	  if mirrored then
	    spawnPosition = vec2.add(vec2.mul({moveVector[1], -moveVector[2]}, d2 + d), blockCenter)
	    table.insert(self.enemies, CreateEnemyShip({position = {spawnPosition[1] + xOffset * 2, spawnPosition[2]}, velocity = vec2.mul({moveVector[1], -moveVector[2]}, -70), hp = GetWeakEnemyScalingHp(), wavePeriod = -2, waveAmplitude = 15, score = 15,color = "yellow",poly = {{-3.7, 0.0}, {-3.7, 2.2}, {-12.3, 2.2}, {-3.7, 8.6}, {4.8, 8.6}, {9.1, 2.2}, {4.8, 2.2}, {4.8, 0.0}, {4.8, 0.0}, {4.8, -2.1}, {9.1, -2.1}, {4.8, -8.5}, {-3.7, -8.5}, {-12.3, -2.1}, {-3.7, -2.1}, {-3.7, 0.0}}}))
	  end
	  d = d + 25
	end
  elseif block.type == "turrets" then
    enemyCount = block.enemyCount or GetRandomTurretWaveSize()
	local mirrored = math.random() < 0.2
	local mirroredOffset = math.random() * (block.endX - block.startX) * 0.2
	if block.mainTerrain == nil then
	  if math.random(1,2) == 1 then block.mainTerrain = "ground" else block.mainTerrain = "ceiling" end
	end
	
	for i = 1, enemyCount, 1 do
	  spawnPosition[1] = block.startX + i * 60
	  if block.mainTerrain == "ground" then 
        spawnPosition[2] = getTerrainHeight(self.groundTerrain, spawnPosition[1])
		table.insert(self.enemies, CreateEnemyShip({position = {spawnPosition[1],spawnPosition[2]}, rotation = getTerrainNormalAngle(self.groundTerrain, spawnPosition[1]), hp = GetMediumEnemyScalingHp(), moveType = "none", score = 25, weapons = {{type = "machinegun", level = 1, time = math.random() + 1, cooldown = 0.2, ammo = 3, reloadTime = 3.5, relativePosition = {0,0}, angle = math.pi * 0.5, aimAtPlayer = true, subPoly = {{14,-2}, {25,-2}, {25,2} , {14,2}} }}, poly = self.turretPoly}))
	  else
	    spawnPosition[2] = getTerrainHeight(self.ceilingTerrain, spawnPosition[1])
		table.insert(self.enemies, CreateEnemyShip({position = {spawnPosition[1],spawnPosition[2]}, rotation = getTerrainNormalAngle(self.ceilingTerrain, spawnPosition[1]), hp = GetMediumEnemyScalingHp(), moveType = "none", score = 25, weapons = {{type = "machinegun", level = 1, time = math.random() + 1, cooldown = 0.2, ammo = 3, reloadTime = 3.5, relativePosition = {0,0}, angle = math.pi * 1.5, aimAtPlayer = true, subPoly = {{14,-2}, {25,-2}, {25,2} , {14,2}} }}, poly = self.turretPoly}))
	  end

	end
	if mirrored and block.cannotMirror == nil then
	  if block.mainTerrain == "ground" then block.mainTerrain = "ceiling" else block.mainTerrain ="ground" end
      block.startX = block.startX + mirroredOffset
	  block.endX = block.endX + mirroredOffset
	  block.cannotMirror = true
	  SpawnFromBlock(block)
	end
	if block.isSubBlock == nil and math.random() < 0.05 * self.level then
      block.type = GetRandomSubSpaceBlock()
	  block.isSubBlock = true
	  SpawnFromBlock(block)
    end	
  elseif block.type == "random" then
    enemyCount = math.floor(GetRandomAsteroidWaveSize() / 2)
	obstacleCount = math.floor(GetRandomSwarmSize() / 2)
	local terrainRangeLower, terrainRangeUpper = 0,300
    for obs = 1, obstacleCount, 1 do
      spawnPosition[1] = math.random() * (block.endX - block.startX) + block.startX
	  terrainRangeLower, terrainRangeUpper = getOpenRangeBetweenTerrain(spawnPosition[1])
	  spawnPosition[2] = math.random() * (terrainRangeUpper - terrainRangeLower) + terrainRangeLower
      table.insert(self.obstacles, CreateAsteroid(spawnPosition, GetAsteroidScalingHp()))
	end
    for i = 1, enemyCount, 1 do
      spawnPosition[1] = math.random() * (block.endX - block.startX) + block.startX
	  terrainRangeLower, terrainRangeUpper = getOpenRangeBetweenTerrain(spawnPosition[1])
	  spawnPosition[2] = math.random() * (terrainRangeUpper - terrainRangeLower) + terrainRangeLower
      table.insert(self.enemies, CreateEnemyShip({position = {spawnPosition[1], spawnPosition[2]}, velocity = {-90, 0}, hp = GetWeakEnemyScalingHp(), wavePeriod = -2,waveAmplitude = 15, score = 15,color = "yellow",poly = {{-3.7, 0.0}, {-3.7, 2.2}, {-12.3, 2.2}, {-3.7, 8.6}, {4.8, 8.6}, {9.1, 2.2}, {4.8, 2.2}, {4.8, 0.0}, {4.8, 0.0}, {4.8, -2.1}, {9.1, -2.1}, {4.8, -8.5}, {-3.7, -8.5}, {-12.3, -2.1}, {-3.7, -2.1}, {-3.7, 0.0}}}))
    end
  elseif block.type == "gap" then
	local spawnX = (block.startX + 25)
	while spawnX < block.endX do
      local width = math.random(30,60)
	  local terrainRangeLower, terrainRangeUpper = getOpenRangeBetweenTerrain(spawnX)
	  local gapY = math.random() * (terrainRangeUpper - terrainRangeLower - 40) + terrainRangeLower + 20
	  local h1 = gapY - 10 - terrainRangeLower
	  local h2 = terrainRangeUpper - gapY - 10
	  table.insert(self.obstacles, CreatePillar(spawnX, h1, width, self.groundTerrain, GetPillarScalingHp()))
	  table.insert(self.obstacles, CreatePillar(spawnX, h2, width, self.ceilingTerrain, GetPillarScalingHp()))
	  spawnX = spawnX + width + math.random() * (block.endX - block.startX)
	end
	if block.isSubBlock == nil and math.random() < 0.04 * self.level then
      block.type = GetRandomSubSpaceBlock()
	  block.isSubBlock = true
	  SpawnFromBlock(block)
    end	
  elseif block.type == "pillars" then
    local x = block.startX
	while x < block.endX do
	  local newPillar = CreatePillar(x, _, _, _, GetPillarScalingHp())
	  x = x + newPillar.extents[3] - newPillar.extents[1] + math.random(10, 100)
	  table.insert(self.obstacles, newPillar)
	end
	if block.isSubBlock == nil and math.random() < 0.07 * self.level then
      block.type = GetRandomSubSpaceBlock()
	  block.isSubBlock = true
	  SpawnFromBlock(block)
    end	
  elseif block.type == "starswarm" then
	enemyCount = block.enemyCount or GetRandomStarWaveSize()
	for i = 1, enemyCount, 1 do
      spawnPosition[1] = math.random() * (block.endX - block.startX) + block.startX
	  terrainRangeLower, terrainRangeUpper = getOpenRangeBetweenTerrain(spawnPosition[1])
	  spawnPosition[2] = math.random() * (terrainRangeUpper - terrainRangeLower) + terrainRangeLower
      table.insert(self.enemies, CreateEnemyShip({position = {spawnPosition[1], spawnPosition[2]}, velocity = {-30, 0},wavePeriod = -2,waveAmplitude = 30, score = 50,color = "yellow", hp = GetMediumEnemyScalingHp(), weapons = {{type = "stargun", level = 1, time = math.random() * 1, cooldown = 5, relativePos = {0,0}, bulletCount = 8}},poly = self.shootingStarPoly}))
    end
	if block.isSubBlock == nil and math.random() < 0.03 * self.level then
      block.type = GetRandomSubSpaceBlock()
	  block.isSubBlock = true
	  SpawnFromBlock(block)
    end	
  elseif block.type == "squadron" then
    enemyCount = block.enemyCount or math.random(3,5)
	local blockCenter = {block.startX + block.endX / 2, 150}
    local r = math.random()
	local terrainRangeLower, terrainRangeUpper = getOpenRangeBetweenTerrain(blockCenter[1])
    local squadCount = math.random(2,5)
	local spacing = (terrainRangeUpper - terrainRangeLower) / (squadCount + 1)
	local xOffset = math.random(75, 150)
	local squadOrders = {}
	local squadIndices = {}
	for s = 1, squadCount, 1 do
	  table.insert(squadIndices, s)
	end
	for s2 = 1, squadCount, 1 do
	  table.insert(squadOrders, table.remove(squadIndices, math.random(1,#squadIndices)))
	end
	
	for squad = 1, squadCount, 1 do 
	  for i = 1, enemyCount, 1 do
	    spawnPosition = {block.startX + xOffset * squad + i * 30, terrainRangeLower + spacing * squadOrders[squad]}
	    table.insert(self.enemies, CreateEnemyShip({position = {spawnPosition[1], spawnPosition[2]}, velocity = {-100,0}, hp = GetWeakEnemyScalingHp(), waveAmplitude = 5, wavePeriod = -3, score = 15,color = "yellow",poly = {{-3.7, 0.0}, {-3.7, 2.2}, {-12.3, 2.2}, {-3.7, 8.6}, {4.8, 8.6}, {9.1, 2.2}, {4.8, 2.2}, {4.8, 0.0}, {4.8, 0.0}, {4.8, -2.1}, {9.1, -2.1}, {4.8, -8.5}, {-3.7, -8.5}, {-12.3, -2.1}, {-3.7, -2.1}, {-3.7, 0.0}}}))
	  end
	end
  elseif block.type == "spawner" then

	local mirrored = math.random() < 0.2
	if block.mainTerrain == nil then
	  if math.random(1,2) == 1 then block.mainTerrain = "ground" else block.mainTerrain = "ceiling" end
	end
	
	spawnPosition[1] = math.random() * (block.endX - block.startX) + block.startX
	local terrainNormal
	if block.mainTerrain == "ground" then 
      spawnPosition[2] = getTerrainHeight(self.groundTerrain, spawnPosition[1])
	  terrainNormal = getTerrainNormalAngle(self.groundTerrain, spawnPosition[1])
      table.insert(self.enemies, CreateEnemyShip({position = {spawnPosition[1],spawnPosition[2]}, rotation = terrainNormal, moveType = "none", hp = GetStrongEnemyScalingHp(), score = 75, weapons = {{type = "spawner", level = 1,ammo = 3, time = math.random() * 1+1, cooldown = 1, relativePosition = {0,0}, angle = terrainNormal + math.pi * 0.5}}, poly = self.spawnerPoly}))
	else
	  spawnPosition[2] = getTerrainHeight(self.ceilingTerrain, spawnPosition[1])
      terrainNormal = getTerrainNormalAngle(self.ceilingTerrain, spawnPosition[1])
      table.insert(self.enemies, CreateEnemyShip({position = {spawnPosition[1],spawnPosition[2]}, rotation = terrainNormal, moveType = "none", hp = GetStrongEnemyScalingHp(), score = 75, weapons = {{type = "spawner", level = 1,ammo = 3, time = math.random() * 1+1, cooldown = 1, relativePosition = {0,0}, angle = terrainNormal + math.pi * 0.5}}, poly = self.spawnerPoly}))
	end

	if mirrored and block.cannotMirror == nil then
	  if block.mainTerrain == "ground" then block.mainTerrain = "ceiling" else block.mainTerrain ="ground" end
	  block.cannotMirror = true
	  SpawnFromBlock(block)
	end
	if block.isSubBlock == nil and math.random() < 0.05 * self.level then
      block.type = GetRandomSubSpaceBlock()
	  block.isSubBlock = true
	  SpawnFromBlock(block)
    end	
  elseif block.type == "destroyer" then
    spawnPosition = {(block.startX + block.endX) * 0.5, 150}
    table.insert(self.enemies, CreateEnemyShip({position = {spawnPosition[1], spawnPosition[2]}, speed = 25, moveDir = {1,0}, moveType = "forward",color = "yellow", hp = GetDestroyerScalingHp(), score = 250,
	                                            weapons = {{type = "machinegun", level = 1, time = math.random() * 1, aimAtPlayer = false, angle = math.pi, cooldown = 1, relativePosition = {-45,22}, subPoly = {{0,4}, {0,-4}, {10, 0}}},
												{type = "machinegun", level = 1, time = math.random() * 1, aimAtPlayer = false, angle = math.pi, cooldown = 1, relativePosition = {-45,-22}, subPoly = {{0,4}, {0,-4}, {10, 0}}},
												{type = "spawner", level = 1, time = 0, cooldown = 2, relativePosition = {15,25}, angle = math.pi * 0.5},
												{type = "spawner", level = 1, time = 1, cooldown = 2, relativePosition = {15,-25}, angle = math.pi * 1.5}},
												poly = self.destroyerPoly, collisionRect = poly.boundBox(self.destroyerPoly)}))
  
  elseif block.type == "cruiser" then
    spawnPosition = {(block.startX + block.endX) * 0.5, 150}
    table.insert(self.enemies, CreateEnemyShip({position = {spawnPosition[1], spawnPosition[2]}, speed = 25, moveDir = {1,0}, moveType = "forward",color = "yellow", hp = GetDestroyerScalingHp()-10, score = 200,
	                                            weapons = {{type = "shotgun", level = 1, time = math.random() * 1, aimAtPlayer = true, angle = math.pi, arc = math.pi * 0.15, bulletCount = 3, cooldown = 2, relativePosition = {-26,27}, subPoly = {{0,4}, {0,-4}, {10, 0}}},
												{type = "shotgun", level = 1, time = math.random() * 1, aimAtPlayer = true, angle = math.pi, arc = math.pi * 0.15, bulletCount = 3, cooldown = 2, relativePosition = {-26,-27}, subPoly = {{0,4}, {0,-4}, {10, 0}}}},
												poly = self.cruiserPoly, collisionRect = poly.boundBox(self.cruiserPoly)}))
  
  elseif block.type == "spreadswarm" then
	enemyCount = block.enemyCount or GetRandomSpreadWaveSize()
	for i = 1, enemyCount, 1 do
      spawnPosition[1] = math.random() * (block.endX - block.startX) + block.startX
	  terrainRangeLower, terrainRangeUpper = getOpenRangeBetweenTerrain(spawnPosition[1])
	  spawnPosition[2] = math.random() * (terrainRangeUpper - terrainRangeLower) + terrainRangeLower
      table.insert(self.enemies, CreateEnemyShip({position = {spawnPosition[1], spawnPosition[2]}, moveType = "forward", moveDir = {-1,0}, speed = 10, score = 30, color = "yellow", hp = GetMediumEnemyScalingHp(), weapons = {{type = "spreadgun", level = 1, time = math.random() * 1, cooldown = 2, relativePos = {0,0}, bulletCount = 3, angle = math.pi, arc = math.pi * 0.5}},poly = self.spreadPoly}))
    end
	if block.isSubBlock == nil and math.random() < 0.03 * self.level then
      block.type = GetRandomSubSpaceBlock()
	  block.isSubBlock = true
	  SpawnFromBlock(block)
    end	
  elseif block.type == "mirrorswarm" then
	enemyCount = block.enemyCount or GetRandomMirrorWaveSize()
	for i = 1, enemyCount, 1 do
      spawnPosition[1] = math.random() * (block.endX - block.startX) + block.startX
	  terrainRangeLower, terrainRangeUpper = getOpenRangeBetweenTerrain(spawnPosition[1])
	  spawnPosition[2] = math.random() * (terrainRangeUpper - terrainRangeLower) + terrainRangeLower
      table.insert(self.enemies, CreateEnemyShip({position = {spawnPosition[1], spawnPosition[2]}, moveType = "forward", moveDir = {-1,0}, speed = 10, score = 50, color = "yellow", hp = GetMirrorEnemyScalingHp(), weapons = {{type = "mirrorreflector", level = 1, time = math.random() * 1, cooldown = 2.2, duration = 1.5, relativePos = {0,0}, angle = math.pi, arc = math.pi * 0.5, subPoly = nil, color = {255,130,0}}},poly = self.mirrorPoly, shieldPoly = self.shieldPoly}))
    end
	if block.isSubBlock == nil and math.random() < 0.05 * self.level then
      block.type = GetRandomSubSpaceBlock()
	  block.isSubBlock = true
	  SpawnFromBlock(block)
    end
  elseif block.type == "floatingturrets" then
    enemyCount = block.enemyCount or GetRandomStarWaveSize()
	for i = 1, enemyCount, 1 do
      spawnPosition[1] = math.random() * (block.endX - block.startX) + block.startX
	  terrainRangeLower, terrainRangeUpper = getOpenRangeBetweenTerrain(spawnPosition[1])
	  spawnPosition[2] = math.random() * (terrainRangeUpper - terrainRangeLower) + terrainRangeLower
      table.insert(self.enemies, CreateEnemyShip({position = {spawnPosition[1], spawnPosition[2]}, moveType = "none", score = 65, color = "yellow", hp = GetMediumEnemyScalingHp(), weapons = {{type = "shotgun", level = 1, time = math.random() * 1, cooldown = 3, relativePos = {0,0}, angle = math.random() * 2 * math.pi, bulletCount = 5, arc = math.pi * 0.25, aimAtPlayer = true, subPoly = {{0,-7}, {16,-7}, {0,0}, {16,7}, {0,7}} }},poly = self.floatingTurretPoly}))
    end
	if block.isSubBlock == nil and math.random() < 0.02 * self.level then
      block.type = GetRandomSubSpaceBlock()
	  block.isSubBlock = true
	  SpawnFromBlock(block)
    end	
  elseif block.type == "seeker" then
	enemyCount = block.enemyCount or GetRandomSeekerSwarmSize()
	for i = 1, enemyCount, 1 do
      spawnPosition[1] = math.random() * (block.endX - block.startX) + block.startX
	  terrainRangeLower, terrainRangeUpper = getOpenRangeBetweenTerrain(spawnPosition[1])
	  spawnPosition[2] = math.random() * (600) - 150
      table.insert(self.enemies, CreateEnemyShip({position = {spawnPosition[1], spawnPosition[2]}, speed = 120, rotationType = "withMovement", moveDir = {-1,0}, radius = 10, hp = GetWeakEnemyScalingHp(), score = 15, moveType = "chase",color = "yellow", weapons = {{type = "none"}}, poly = self.seekerPoly}))
    end
  end
end

function CreateAsteroid(position, hp)
  local rPoly = {}
  local numOfVerts = math.random(4, 10)
  local maxR = 0
  for v = 1, numOfVerts, 1 do
    local randomRadius = math.random() * 20 + 10 
    if randomRadius > maxR then maxR = randomRadius end
    local angle = math.pi * 2 / numOfVerts * v + math.random() * 0.5 - 0.25
    table.insert(rPoly, {math.cos(angle) * randomRadius, math.sin(angle) * randomRadius})
  end
  return {type = "poly", hp = hp, maxhp = hp, poly = rPoly, position = {position[1],position[2]}, color = {255,255,255}, radius = maxR, extents = poly.boundBox(rPoly)}
end

function CreatePillar(Xposition, height, width, terrainAnchor, hp)
  if height == nil then height = math.random(30,150) end
  if width == nil then width = math.random(20,50) end
  
  local x2 = width
  local x1 = Xposition - width * 0.5
  x2 = x2 + x1
	
  local y2 = height
  if terrainAnchor == nil then
    if math.random(0,1) == 0 then terrainAnchor = self.groundTerrain else terrainAnchor = self.ceilingTerrain	end	
  end
  local y1 = math.random() * (300 - y2)
    
  if terrainAnchor then
    local tHeight = getTerrainHeight(terrainAnchor, x1)
	if terrainAnchor.solidSide == "above" then
	  y1 = math.random() * (300 - tHeight) + tHeight - y2
	else
	  y1 = math.random() * tHeight
	end
  end
  y2 = y2 + y1
	
  return {type = "rect", hp = hp, maxhp = hp, color = {255,255,255}, extents = {x1,y1,x2,y2}}
end

function GetAsteroidScalingHp()
  return 5 + math.floor(self.level / 5)
end

function GetPillarScalingHp()
  return 10 + math.floor(self.level / 2)
end

function GetWeakEnemyScalingHp()
  return 1 + math.floor(self.level / 5)
end

function GetMediumEnemyScalingHp()
  return 3 + math.floor(self.level / 3)
end

function GetStrongEnemyScalingHp()
  return 5 + math.floor(self.level / 2)
end

function GetMirrorEnemyScalingHp()
  return 4 + math.floor(self.level / 5)
end

function GetDestroyerScalingHp()
  return 30 + self.level * 5
end

function GetRandomAsteroidWaveSize()
  return util.clamp(math.random(3 + math.floor(self.level / 2), 6 + self.level), 3, 18)
end 

function GetRandomSwarmSize()
  return util.clamp(math.random(3 + math.floor(self.level / 2), 6 + self.level), 3, 15)
end

function GetRandomTurretWaveSize()
  return util.clamp(math.random(1 + math.floor(self.level / 4), 3 + math.floor(self.level / 3)), 1, 6)
end

function GetRandomStarWaveSize()
  return util.clamp(math.random(1 + math.floor(self.level / 3), 3 + math.floor(self.level / 2)), 1, 8)
end

function GetRandomSpreadWaveSize()
  return util.clamp(math.random(2 + math.floor(self.level / 4), 4 + math.floor(self.level / 2)), 1, 10)
end

function GetRandomMirrorWaveSize()
  return util.clamp(math.random(1 + math.floor(self.level / 5), 2 + math.floor(self.level / 3)), 1, 6)
end

function GetRandomSeekerSwarmSize()
  return util.clamp(math.random(3 + math.floor(self.level / 2), 5 + self.level), 1, 6)
end

function isCollidingWithTerrain(terrain, pos)
  if terrain == 0 then return false end
  if pos[1] > terrain.extents[1] + terrain.position[1] and pos[1] < terrain.extents[3] + terrain.position[1] then
	local tWidth = terrain.extents[3] - terrain.extents[1]
	local xDiff = pos[1] - terrain.position[1]
	local vIndex = 30 * (xDiff/tWidth) + 1
	local offset = vIndex - math.floor(vIndex)
	vIndex = math.floor(vIndex)
	    --sb.logInfo("sPos: " .. tostring(self.playerShip.position[1]) .. " tPos: " .. tostring(terrain.position[1]) .. " xD: "..tostring(xDiff) .. " offset: " .. tostring(offset) .. " vIndex: " .. tostring(vIndex)) 
	if terrain.poly[vIndex + 1] ~= nil then
	  local y1 = terrain.poly[vIndex][2] + terrain.position[2]
	  local y2 = terrain.poly[vIndex+1][2] + terrain.position[2]
	  local y = util.lerp(offset,y1,y2)
      if (terrain.solidSide == "above" and pos[2] > y) or (terrain.solidSide == "below" and pos[2] < y) then
	    return true
	  end
	end
  end
  return false
end

function getTerrainHeight(terrain, xPosition)
  if terrain == nil then return 0 end
  if xPosition > terrain.extents[1] + terrain.position[1] and xPosition < terrain.extents[3] + terrain.position[1] then
	local tWidth = terrain.extents[3] - terrain.extents[1]
	local xDiff = xPosition - terrain.position[1]
	local vIndex = 30 * (xDiff/tWidth) + 1
	local offset = vIndex - math.floor(vIndex)
	vIndex = math.floor(vIndex)
	    --sb.logInfo("sPos: " .. tostring(self.playerShip.position[1]) .. " tPos: " .. tostring(terrain.position[1]) .. " xD: "..tostring(xDiff) .. " offset: " .. tostring(offset) .. " vIndex: " .. tostring(vIndex)) 
	if terrain.poly[vIndex + 1] ~= nil then
	  local y1 = terrain.poly[vIndex][2] + terrain.position[2]
	  local y2 = terrain.poly[vIndex+1][2] + terrain.position[2]
	  local y = util.lerp(offset,y1,y2)
      return y
	end
  end
	return 0
end

function getOpenRangeBetweenTerrain(xPosition)
  local upperbounds = (self.ceilingTerrain == nil) and 300 or getTerrainHeight(self.ceilingTerrain, xPosition)
  if (upperbounds == 0) then upperbounds = 300 end
  local lowerbounds = (self.groundTerrain == nil) and 0 or getTerrainHeight(self.groundTerrain, xPosition)
  return lowerbounds, upperbounds
end

function getTerrainNormalAngle(terrain, xPosition)
  if terrain == nil then return 0 end
  if xPosition > terrain.extents[1] + terrain.position[1] and xPosition < terrain.extents[3] + terrain.position[1] then
	local tWidth = terrain.extents[3] - terrain.extents[1]
	local xDiff = xPosition - terrain.position[1]
	local vIndex = 30 * (xDiff/tWidth) + 1
	local offset = vIndex - math.floor(vIndex)
	vIndex = math.floor(vIndex)
	    --sb.logInfo("sPos: " .. tostring(self.playerShip.position[1]) .. " tPos: " .. tostring(terrain.position[1]) .. " xD: "..tostring(xDiff) .. " offset: " .. tostring(offset) .. " vIndex: " .. tostring(vIndex)) 
	if terrain.poly[vIndex + 1] ~= nil then
	  local v1 = terrain.poly[vIndex]
	  local v2 = terrain.poly[vIndex+1]
      local angle = vec2.angle(vec2.sub(v2,v1))
      return (terrain.solidSide == "above") and angle - math.pi or angle 
	end
  end
	return 0
end

function loseLife()
  if self.playerShip:IsInvulnerable() == false then
    self.playerShip:TakeDamage()
	if self.playerShip.hp > 0 then
      pane.playSound(self.sounds.playerhit)
	else
	  pane.playSound(self.sounds.defeat)
	end
    widget.setText("livesLabel", "Lives: " .. tostring(self.playerShip.hp))
  end
end

function damageObstacle(obstacle, damage)
  if obstacle.hp ~= nil then
    obstacle.hp = obstacle.hp - damage
	local max = obstacle.maxhp or (obstacle.hp+2)
	obstacle.color = {255 * (obstacle.hp / max), 255 * (obstacle.hp / max), 255 * (obstacle.hp / max)} 
	if obstacle.hp <= 0 then obstacle.destroyed = true end
  end
end

function gainScore(amount)
  local s = self.score % 10000
  local s2
  self.score = self.score + (amount)
  s2 = self.score % 10000
  if s2 < s then
    self.playerShip.hp = self.playerShip.hp + 1
	pane.playSound(self.sounds.powerup)
	widget.setText("livesLabel", "Lives: " .. tostring(self.playerShip.hp))
  end
  widget.setText("scoreLabel", tostring(self.score))
end

function GetRandomOpenSpaceBlock()
  local options = {{2,"asteroidfield"}, {2,"swarm"}, {1,"wave"}, {1,"seeker"}}
  return util.weightedRandom(options)
end

function GetRandomEnclosedSpaceBlock()
  local destroyerWeight = 1
  local cruiserWeight = 1
  if self.level == 1 then
    destroyerWeight = 0
	cruiserWeight = 0
  end
  local options = {{3,"asteroidfield"}, {3,"swarm"}, {4,"wave"}, {3, "turrets"}, {4,"random"}, {2,"gap"}, {3,"pillars"}, {3,"starswarm"}, {3, "squadron"}, {2,"spawner"}, {destroyerWeight,"destroyer"}, {3,"spreadswarm"}, {2,"mirrorswarm"}, {2, "floatingturrets"}, {2, "seeker"}, {cruiserWeight,"cruiser"}}
  return util.weightedRandom(options)
end

function GetRandomSubSpaceBlock()
 local options = {{2,"swarm"}, {2,"wave"}, {2, "starswarm"}, {2,"spreadswarm"}, {1, "floatingturrets"}}
 return util.weightedRandom(options)
end

function debugTerrainRay()
  local drawn = false
  local terrains = {self.ceilingTerrain, self.groundTerrain}

  for tIndex = 1, 2, 1 do
    if terrains[tIndex] ~= nil then
      local terrain = self.obstacles[tIndex]
      if self.playerShip.position[1] > terrain.extents[1] + terrain.position[1] and self.playerShip.position[1] < terrain.extents[3] + terrain.position[1] then
	    local tWidth = terrain.extents[3] - terrain.extents[1]
	    local xDiff = self.playerShip.position[1] - terrain.position[1]
	    local vIndex = 30 * (xDiff/tWidth) + 1
	    local offset = vIndex - math.floor(vIndex)
	    vIndex = math.floor(vIndex)
	    --sb.logInfo("sPos: " .. tostring(self.playerShip.position[1]) .. " tPos: " .. tostring(terrain.position[1]) .. " xD: "..tostring(xDiff) .. " offset: " .. tostring(offset) .. " vIndex: " .. tostring(vIndex)) 
	    if terrain.poly[vIndex + 1] ~= nil then
		  local y1 = terrain.poly[vIndex][2] + terrain.position[2]
		  local y2 = terrain.poly[vIndex+1][2] + terrain.position[2]
		  local y = util.lerp(offset,y1,y2)
		  self.canvas:drawLine(self.playerShip.position, {self.playerShip.position[1], y}, "blue")
		  self.canvas:drawLine(vec2.add(terrain.poly[vIndex], terrain.position), vec2.add(terrain.poly[vIndex], {terrain.position[1], terrain.position[2] + 12}), "green")
		  self.canvas:drawLine(vec2.add(terrain.poly[vIndex+1], terrain.position), vec2.add(terrain.poly[vIndex+1], {terrain.position[1],terrain.position[2] + 12}), "green")
		  drawn = true
	    end
	  end
    end
  
    if not drawn then
      self.canvas:drawLine(self.playerShip.position, {self.playerShip.position[1], 0}, "red")
    end
  end
end


function createReward()
  local reward = {}
  local pixelRewardAmount = (self.level-1) * 18
  if self.level > 3 then pixelRewardAmount = pixelRewardAmount + math.floor(self.score / 500) end
  
  local pixelReward = {item = "money", count = pixelRewardAmount, givenOut = 0}
  table.insert(reward, pixelReward)
  
  if self.level > 5 then
    local rarityIndex = self.level % 3
    local rarity = "common"
	if rarityIndex == 1 then
	  rarity = "uncommon"
	elseif rarityIndex == 2 then
	  rarity = "rare"
	end
	
	local itemLevel = math.floor((self.level - 6) / 3) + 1
	
	
	local weaponTypes = {"pistol", "machinepistol", "assualtrifle", "sniperrifle", "shotgun"}
	local randomType = util.randomChoice(weaponTypes)
	
	table.insert(reward, {item = rarity..randomType, count = 1, givenOut = 0, params = {level = itemLevel}})
  end
  return reward
end
