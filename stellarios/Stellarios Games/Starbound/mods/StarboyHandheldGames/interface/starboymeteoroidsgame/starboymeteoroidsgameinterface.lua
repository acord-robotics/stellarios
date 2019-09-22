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

  self.system = celestial.currentSystem()

  self.sounds = config.getParameter("sounds")
  self.color = "white"
  
  self.mpos = {0,0}
  pane.playSound(self.sounds.startup2, 0, 0.5)

  self.level = 1
  self.lives = 3
  self.score = 0
  
  self.ship = { }
  
  self.asteroids = {}
  self.bullets = {}
  self.particles = {}
  
  self.openedFromHand = config.getParameter("openedFromHand")
  self.key = world.sendEntityMessage(player.id(), "getKey"):result()
  
  self.asteroidPolyMedium = { {15, 0},  {10, 5}, {3, 12}, {-5, 15}, {-10, 6}, {-11, 0}, {-15, -4}, {-9,-9}, {-1, -13}, {5, -9}, {10, -3}}
  self.asteroidPolySmall = { {7, 0},  {4, 4}, {1, 5}, {-2, 7.5}, {-3, 6}, {-5, 0}, {-6, -1}, {-5,-2}, {-1, -6}, {3, -5}, {5, -1}}
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

  --if self.openedFromHand and not world.sendEntityMessage(player.id(), "holdingGame"):result() then
  --  pane.dismiss()
  --end

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
  local titleText = "Meteoroids"
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
		  self.state:set(asteroidsState)
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

function asteroidsState()
   local firing = false
   local fireCooldown = 0
   
   self.bullets = {}
   self.particles = {}
   
   self.ship = {pos = {200,150},
				   dir = {0,1},
				   angle = math.pi * 0.5,
				   angularVel = 0,
				   vel = {0,0},
				   speed = 0,
				   shipPoly = { {6,0}, {-6,3}, {-3,0}, {-6,-3} },
				   r = 4.5,
				   acc = 0,
				   invulTimer = 0}

   self.level = 1
   self.lives = 3
   self.score = 0
   startLevel(self.level)
   widget.setText("livesLabel", "Lives: " .. tostring(self.lives))
   widget.setText("scoreLabel", tostring(self.score))
   widget.setVisible("scoreLabel", true)
   widget.setVisible("livesLabel", true)
   widget.setVisible("levelLabel", true)
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
   
     self.canvas:clear()
	 self.ship.angle  =  wrapAngle(self.ship.angle + self.ship.angularVel * script.updateDt())
	 self.ship.dir = {math.cos(self.ship.angle), math.sin(self.ship.angle)}
	 if self.ship.acc ~= 0 then
	   self.ship.vel = vec2.add(self.ship.vel, vec2.mul(self.ship.dir, self.ship.acc * script.updateDt()))
	   self.ship.vel = clampMag(self.ship.vel, 200)
	 end
	 self.ship.pos = vec2.add(self.ship.pos, vec2.mul(self.ship.vel, script.updateDt()))
	 self.ship.pos = wrapPosition(self.ship.pos)
	 
	 if fireCooldown <= 0 then
	   if firing and isShipInvul(self.ship) == false then
	     fireCooldown = 0.25
         spawnBullet(self.ship.pos, {math.cos(self.ship.angle), math.sin(self.ship.angle)})	 
		 pane.playSound(self.sounds.shoot)
	   end
	 else
	   fireCooldown = fireCooldown - script.updateDt()
	 end
	 
	 
	 --widget.setText("testLabel", tostring(#self.bullets))
	 --widget.setText("testLabel", tostring(shipPos[1])..","..tostring(shipPos[2]))
	 --widget.setText("testLabel", tostring(shipVel[1])..","..tostring(shipVel[2]))
     --widget.setText("testLabel", tostring(shipAngle))
	 
     --local r = {shipPos[1] - 5, shipPos[2]-5, shipPos[1] + 5, shipPos[2]+5}
     --self.canvas:drawRect(r, self.color)
	 local transformedPoly = poly.rotate(self.ship.shipPoly, self.ship.angle)
     transformedPoly = poly.translate(transformedPoly, self.ship.pos)	 
     
	 local shipColor
	 if isShipInvul(self.ship) then
	   shipColor = shipInvulColor(self.ship)
	   self.ship.invulTimer = self.ship.invulTimer - script.updateDt()
	 else
	   shipColor = self.color
	 end
	 
     self.canvas:drawPoly(transformedPoly, shipColor, 1.0)
	 --self.canvas:drawPoly(poly.translate(asteroidPolyMedium, asteroid.pos), "white", 1.0)
	 updateBullets(script.updateDt())
	 updateAsteroids(script.updateDt())
	 updateParticles(script.updateDt())
	 if allAsteroidsDead() then
	   self.level = self.level + 1
	   startLevel(self.level)
	 end
	 
	 coroutine.yield()
   end
end

function generateRandomAsteroid()
  local randPos
  local horizontal = math.random(0,1) == 0
  if horizontal then
    randPos = {math.random(0,400), math.random(-30,30)}
  else
    randPos = {math.random(-30,30), math.random(0,300)}
  end
  
  return { pos = randPos,
           vel = {util.randomInRange({-15, 15}),util.randomInRange({-15, 15})},
		   angle = util.randomInRange({0, math.pi * 2}),
		   angularVel = util.randomInRange({-0.5, 0.5}),
		   r = 15,
		   alive = true,
		   size = 2}
end

function spawnAsteroid(position, speed, startingSize)
  local newAsteroid = { pos = position,
           vel = {util.randomInRange({-speed, speed}),util.randomInRange({-speed, speed})},
		   angle = util.randomInRange({0, math.pi * 2}),
		   angularVel = util.randomInRange({-0.5, 0.5}),
		   r = startingSize * 7.5,
		   alive = true,
		   size = startingSize}
   table.insert(self.asteroids, newAsteroid)
end

function spawnBullet(position, direction)
  for _,b in pairs(self.bullets) do
    if b.alive == false then
	  b.pos = position
      b.vel = vec2.mul(direction, 320)
      b.r = 1
      b.lifeTime = 0
	  b.alive = true
	  return
    end
  end

   local newBullet = { pos = position,
           vel = vec2.mul(direction, 320),
		   r = 1,
		   lifeTime = 0,
		   alive = true}
		   
    table.insert(self.bullets, newBullet)
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

function startLevel(levelNumber)
  self.asteroids = {}
  for i = 0, levelNumber * 2 + 8, 1 do
    table.insert(self.asteroids, generateRandomAsteroid())
  end
  widget.setText("levelLabel", "Level: " .. tostring(self.level))
end

function updateBullets(dt)
  for _,bullet in pairs(self.bullets) do
     if bullet.alive then
	   bullet.pos = wrapPosition(vec2.add(bullet.pos, vec2.mul(bullet.vel, dt)))
	   bullet.lifeTime = bullet.lifeTime+dt
	   if bullet.lifeTime > 1 then
	     bullet.alive = false
	   else
	     self.canvas:drawRect({ bullet.pos[1]+1, bullet.pos[2]+1, bullet.pos[1]-1, bullet.pos[2]-1 }, "yellow")
       end
	end
  end
end

function updateAsteroids(dt)
  local playerCollision = false
  for _,asteroid in pairs(self.asteroids) do
    if asteroid.alive then
      asteroid.pos = wrapPosition(vec2.add(asteroid.pos, vec2.mul(asteroid.vel, dt)))
      asteroid.angle = wrapAngle(asteroid.angle + asteroid.angularVel * dt)
      
      local transformedPoly = GetAsteroidPolyBySize(asteroid.size)
	  transformedPoly = poly.rotate(transformedPoly, asteroid.angle)
      transformedPoly = poly.translate(transformedPoly, asteroid.pos)
  
      self.canvas:drawPoly(transformedPoly, "white", 1.0)
      
	  if playerCollision == false and isShipInvul(self.ship) == false then
	    if isColliding(self.ship.pos, self.ship.r, asteroid.pos, asteroid.r) then
	      self.color = "red"
	      playerCollision = true
		  asteroid.alive = false
		  PlayAsteroidExplosion(asteroid)
		  for i = 0, 10, 1 do
			  spawnParticle(asteroid.pos)
			end
		  self.lives = self.lives - 1
		  self.ship.invulTimer = 2
		  self.ship.vel = vec2.mul(self.ship.vel, 0.5)
		  widget.setText("livesLabel", "Lives: " .. tostring(self.lives))
		  pane.playSound(self.sounds.shiphit)
		  if self.lives < 0 then
		     self.state:set(scoreScreenState)
			 pane.playSound(self.sounds.shipexplosion)
		  end
	    end
	  end
	  
	  for _,bullet in pairs(self.bullets) do
	    if bullet.alive then
	      if isColliding(asteroid.pos, asteroid.r, bullet.pos, bullet.r) then
		    asteroid.alive = false
		    bullet.alive = false
            PlayAsteroidExplosion(asteroid)
            self.score = self.score + asteroid.size * 50
			widget.setText("scoreLabel", tostring(self.score))
			for i = 0, 5, 1 do
			  spawnParticle(asteroid.pos)
			end
			
			if asteroid.size > 1 then
			  local randSpeed = vec2.mag(asteroid.vel)
			  spawnAsteroid(asteroid.pos, util.randomInRange({randSpeed * 1.5, randSpeed * (3 + 0.5 * self.level)})+10, asteroid.size - 1)
			  if math.random(1,100) < 15 + self.level then
			    spawnAsteroid(asteroid.pos, util.randomInRange({randSpeed * 2, randSpeed * (4 + 0.5 * self.level)})+20, asteroid.size - 1)
			  end
			end
		    break
		  end
		end
	  end
	end
  end
  if playerCollision == false and self.lives >= 0 then self.color = "blue" end
end

function GetAsteroidPolyBySize(size)
  if size >= 2 then
    return self.asteroidPolyMedium
  else
    return self.asteroidPolySmall
  end
end

function PlayAsteroidExplosion(asteroid)
  if asteroid.size > 1 then
    pane.playSound(self.sounds.meteoroidExplosion1)
  else
    pane.playSound(self.sounds.meteoroidExplosion1,0, 0.78)
  end
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

function allAsteroidsDead()
  for _,asteroid in pairs(self.asteroids) do
    if asteroid.alive then return false end
  end
  return true
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


  --pane.playSound(self.sounds.dispatch, -1)
  --pane.stopAllSounds(self.sounds.dispatch)
  --widget.setFontColor("connectingLabel", config.getParameter("errorColor"))

