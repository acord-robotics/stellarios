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
  self.enemyBaseDir = 1
  self.enemyDirectionChangeTimer = 3
  self.enemyDirectionChangeDuration = 5
  self.enemyDropTimer = 3
  self.enemyDropDuration = 1
  self.enemyMovementPhase = "drop" -- rotate, drop
  self.levelPhase = "transition" --attack, transition, upgrade
  self.levelTransitionTime = 2
  self.levelElapsedTime = 0
  self.livingEnemyCount = 0
  self.areEnemiesClose = false
  
  self.ship = { }
  --shotCount, offset, spread, deviation, cooldown,
  self.weaponMachineGun = {time = 0, cooldown = 0.6, recoil = 0.3, sound = "shoot2"}
  self.weaponShotGun = {time = 0, shotCount = 3, deviation = math.pi * 0.15 * 0, spread = math.pi * 0.05, cooldown = 1.3, recoil = 1, sound = "shotgun1", bulletConfig = {speed = {80,120}, maxLife = 0.7}}
  self.weaponBoomerang =  {time = 0, cooldown = 0.95, recoil = 0.4, sound = "boomerang1", bulletConfig = {speed = 400, gravFactor = 1800000, bulletbreaker = true}}
  self.weaponFlakCannon = {time = 0, cooldown = 0.8, recoil = 0.65, sound = "shoot2", bulletConfig = {speed = 130, maxLife = .9, expireBurst = 6, expireBurstBullet = {speed = 225, maxLife = 0.12, gravFactor = 20000000}}}
  self.weaponCollection = {self.weaponMachineGun, self.weaponShotGun, self.weaponBoomerang, self.weaponFlakCannon}
  self.selectedWeapon = 1
  self.weaponSwitchTimer = 0
  self.barrierLevel = 2
  
  self.worldOffset = {0,0}
  self.cameraOffset = {0,0}
  self.perlin = sb.makePerlinSource({seed = 1, type = "perlin"})
  self.perlin2 = sb.makePerlinSource({seed = 2, type = "perlin"})
  
  self.machineGunPoly = {{-5.1, -2.1}, {-0.4, 5.0}, {0.4, 5.0}, {5.1, -2.1}}
  self.shotgunPoly = {{-6.5, 3.0}, {-0.8, -1.9}, {0.0, 6.6}, {0.7, -1.9}, {6.6, 3.0}, {0.6, -4.4}, {-0.6, -4.4}}
  self.boomerangPoly = {{-1.1, 1.3}, {-2.4, 0.9}, {-3.8, 0.3}, {-5.6, -0.8}, {-5.2, 0.9}, {-3.2, 2.8}, {-1.1, 4.0}, {1.1, 4.0}, {3.2, 2.8}, {5.2, 0.9}, {5.6, -0.8}, {3.8, 0.3}, {2.4, 0.9}, {1.1, 1.3}}
  self.flakCannonPoly = {{-3.0, 0.9}, {-4.0, 3.9}, {-1.0, 2.9}, {-0.1, 6.7}, {1.0, 2.9}, {4.0, 3.9}, {3.0, 0.9}, {6.0, 0.0}, {3.0, -0.9}, {4.0, -3.9}, {1.0, -2.9}, {-0.1, -6.7}, {-1.0, -2.9}, {-4.0, -3.9}, {-3.0, -0.9}, {-6.0, 0.0}}
  self.weaponPolyCollection = {self.machineGunPoly, self.shotgunPoly, self.boomerangPoly, self.flakCannonPoly}
  
  self.enemies = {}
  self.bullets = {}
  self.enemyBullets = {}
  self.barriers = {}
  self.speedModifier = 1
  self.particles = {}
  self.waves = {}
  self.enemyPoly = {{0,0}, {4,2}, {2, 6}, {6,6}, {6,-6}, {2,-6}, {4,-2}}
  self.enemyBomberPoly = {{8.8, 2.8}, {3.7, 6.9}, {5.3, 1.0}, {1.5, 2.8}, {-1.5, 2.8}, {-5.3, 1.0}, {-3.7, 6.9}, {-8.8, 2.8}, {-8.8, -2.8}, {-3.7, -6.9}, {-5.3, -1.0}, {-1.5, -2.8}, {1.5, -2.8}, {5.3, -1.0}, {3.7, -6.9}, {8.8, -2.8}}
  self.enemySpawnerPoly = {{1.1, 6.3}, {4.2, 10.0}, {3.7, 4.1}, {5.7, 2.2}, {9.6, 1.2}, {9.6, -1.2}, {5.7, -2.2}, {3.7, -4.1}, {4.2, -10.0}, {1.1, -6.3}, {-1.1, -6.3}, {-4.2, -10.0}, {-3.7, -4.1}, {-5.7, -2.2}, {-9.6, -1.2}, {-9.6, 1.2}, {-5.7, 2.2}, {-3.7, 4.1}, {-4.2, 10.0}, {-1.1, 6.3}}
  self.enemyBeamPoly = {{0.0, -8.5}, {4.2, -0.5}, {18.2, -0.3}, {16.5, 1.6}, {13.4, 0.8}, {11.4, 2.5}, {8.4, 1.2}, {6.2, 3.3}, {3.5, 1.7}, {3.5, 4.0}, {0.0, 7.1}, {0.0, 7.1}, {-3.5, 4.0}, {-3.5, 1.7}, {-6.2, 3.3}, {-8.4, 1.2}, {-11.4, 2.5}, {-13.4, 0.8}, {-16.5, 1.6}, {-18.2, -0.3}, {-4.2, -0.5}, {0.0, -8.5}}
  self.enemyDrillerPoly = {{18.6, 0.1}, {9.9, 6.4}, {10.1, 2.2}, {0.2, 2.9}, {0.0, 6.2}, {4.2, 5.5}, {-0.2, 9.0}, {0.2, 9.0}, {-4.2, 5.5}, {0.0, 6.2}, {-0.2, 2.9}, {-10.1, 2.2}, {-9.9, 6.4}, {-18.6, 0.1}, {-18.6, -0.1}, {-9.9, -6.4}, {-10.1, -2.2}, {-0.2, -2.9}, {0.0, -6.2}, {-4.2, -5.5}, {0.2, -9.0}, {-0.2, -9.0}, {4.2, -5.5}, {0.0, -6.2}, {0.2, -2.9}, {10.1, -2.2}, {9.9, -6.4}, {18.6, -0.1}}
  self.barrierPoly = {{3,3}, {3,-3}, {-3,-3}, {-3, 3}}
  self.enemyFireTimer = 1;
  self.enemyPointValues = {Base = 5, Beamer = 150, Bomber = 200, Spawner = 50, Driller = 100}
  
  self.linearEnemyPaths = { {from = {-20, 350}, to = {420, 350}}, {from = {-20, 50}, to = {420, 50}}, {from = {50, -20}, to = {50, 420}}, {from = {350, -20}, to = {350, 420}}}
  
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
  local copyrightText = "Starboy, Inc\nc. 2078"
  local pos = {200, 200}
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
  local titleText = "Ruination"
  local pressKeyText = "[Press SPACE to start]"
  local pos = {200, -300}
  local pos2 = {375, 24}
  local elapsedTime = 0
  local titleScrollDuration = 2
  local t = 0
  local blinkCycle = 2
  local blinkTimer = 0
  local stars = {}
  local titleWorld = CreateWorld(120)
  
  for a = 1,100,1 do
    table.insert(stars, {pos = {math.random(0,400), math.random(0,400)}, z = math.random(0,10)})
  end
  while true do 
    self.canvas:clear()
	
	for _,press in pairs(takeKeyEvents()) do
	  local key, down = press[1], press[2]
	  if key == 5 and down then
	    if elapsedTime < titleScrollDuration then
  		  elapsedTime = titleScrollDuration * 3
		else
		  pane.playSound(self.sounds.startup)
		  self.state:set(gameplayState)
		end
	  end
	end
	
  elapsedTime = elapsedTime + script.updateDt()
	if t < 1 then
	  t = util.clamp(elapsedTime, 0, titleScrollDuration) / titleScrollDuration
	  pos[2] = util.lerp(t, -30, 200)
	end

  for k,v in pairs(stars) do
    local width = (v.z / 10) * 1.5 + 0.25
    local rgb = v.z / 10 * 190 * t
    self.canvas:drawRect({v.pos[1] - width, v.pos[2] - width, v.pos[1] + width, v.pos[2] + width} , {rgb,rgb,rgb, 255})
  end
  
  drawPolyWithTransforms(titleWorld.worldPoly, {0,t*255,0}, {350,350}, (elapsedTime* 0.04) % (math.pi * 2), 1, 3)
  
  for c = 1, #titleText, 1 do
    local cT = util.clamp((elapsedTime - c * (titleScrollDuration/#titleText)) / titleScrollDuration * 0.5,0,1)
    local charAngle = math.pi - math.pi / #titleText * (c-1) --+ elapsedTime % (math.pi * 2)
    local d = (500 + c*100) * util.clamp(1 - cT, 0,1)^6
    local charPosition = {50+d ,-40*(c-1)+360+d*0.5+ (math.sin(-elapsedTime+c*0.5) * 3)}--{math.cos(charAngle) * d + 50 + (300/#titleText) * (c-1), d + 200}
    local charScale = (1-cT)^6 * 256 + 44
    local charColor = ColorFromHSL((1-cT)*0.3 + 0.02, 0.75, 0.5)
    --if charScale < 152 then 
      self.canvas:drawText(titleText:sub(c,c), {position = vec2.add(charPosition, {3,-2}), horizontalAnchor = "mid", verticalAnchor = "mid"}, charScale, {charColor[1],charColor[2],charColor[3]+50, 120})
      self.canvas:drawText(titleText:sub(c,c), {position = charPosition, horizontalAnchor = "mid", verticalAnchor = "mid"}, charScale, charColor)
    --end
  end
  
  --self.canvas:drawText(titleText, {position = pos, horizontalAnchor = "mid", verticalAnchor = "mid"}, 44, "green")
	
	if elapsedTime >= titleScrollDuration then
	  blinkTimer = (blinkTimer + script.updateDt()) % blinkCycle
	  if blinkTimer > blinkCycle * 0.5 then
	    self.canvas:drawText(pressKeyText, {position = pos2, horizontalAnchor = "right", verticalAnchor = "mid"}, 20, "green")
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
    --sb.logInfo(util.tableToString(scores))
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

function SetupInitials()
  self.level = 1
  self.lives = 3
  self.score = 0
  self.enemyBaseDir = 1
  self.enemyDirectionChangeTimer = 3
  self.enemyDirectionChangeDuration = 5
  self.enemyDropTimer = 3
  self.enemyDropDuration = 1
  self.enemyMovementPhase = "drop" -- rotate, drop
  self.levelPhase = "transition" --attack, transition, upgrade
  self.levelTransitionTime = 2
  self.levelElapsedTime = 0
  self.livingEnemyCount = 0
  
  self.ship = { }
  self.weaponMachineGun = {time = 0, cooldown = 0.6, recoil = 0.3, sound = "shoot2"}
  self.weaponShotGun = {time = 0, shotCount = 3, deviation = math.pi * 0.15 * 0, spread = math.pi * 0.05, cooldown = 1.3, recoil = 1, sound = "shotgun1", bulletConfig = {speed = {80,120}, maxLife = 0.7}}
  self.weaponBoomerang =  {time = 0, cooldown = 0.8, recoil = 0.4, sound = "boomerang1", bulletConfig = {speed = 400, gravFactor = 1800000, bulletbreaker = true}}
  self.weaponFlakCannon = {time = 0, cooldown = 0.95, recoil = 0.65, sound = "shoot2", bulletConfig = {speed = 130, maxLife = .9, expireBurst = 6, expireBurstBullet = {speed = 225, maxLife = 0.12, gravFactor = 20000000}}}
  self.weaponCollection = {self.weaponMachineGun, self.weaponShotGun, self.weaponBoomerang, self.weaponFlakCannon}
  self.selectedWeapon = 1
  self.weaponSwitchTimer = 0
  self.barrierLevel = 2
  
  self.enemies = {}
  self.bullets = {}
  self.enemyBullets = {}
  self.barriers = {}
  self.speedModifier = 1
  self.particles = {}
  self.waves = {}
  self.enemyFireTimer = 1;
end

function gameplayState()
  SetupInitials()
   self.ship = {angularPosition = 0, 
				   pos = {200,150},
				   dir = {0,1},
           tangentDir = {0,0},
				   angle = math.pi * 0.5,
				   angularVel = 0,
				   vel = {0,0},
				   speed = 0,
				   shipPoly = { {5,-1}, {8,-1}, {8,1}, {5,1}, {4,5}, {0,5}, {0,0}, {0,-5}, {4,-5} },
				   r = 4.5,
				   acc = 0,
           weapon = self.weaponCollection[self.selectedWeapon],
				   invulTimer = 0,
           recoil = 0,
           shake = 0}
				   
   self.world = CreateWorld(20);
				   
   self.level = 1
   self.lives = 3
   self.score = 0
   
  local stars = {}
  for a = 1,100,1 do
    local newStar = {math.random(0,400), math.random(0,400)}
    if isColliding(newStar, 1, {200,200}, 20) == false then table.insert(stars, {pos = newStar, z = math.random(0,5)}) end
  end
   
   local leftHeld, rightHeld, upHeld, downHeld = false, false, false, false
   widget.setText("livesLabel", "Lives: " .. tostring(self.lives))
   widget.setText("scoreLabel", tostring(self.score))
   widget.setVisible("scoreLabel", true)
   widget.setVisible("livesLabel", true)
   widget.setVisible("levelLabel", true)
   
   GenerateWaves(1)
   
   while true do 
    local dt = script.updateDt()

  for _,press in pairs(takeKeyEvents()) do
	  local key, down = press[1], press[2]
	  --widget.setText("scoreLabel", tostring(key))
	  if key == 65 or key == 87 then
	    if down then
        if upHeld == false then
          SwitchWeapon(true)
        end
        upHeld = true
      else
        upHeld = false
      end
	  end
	  
	  if key == 61 or key == 88 then
	    if down then
        if downHeld == false then
          SwitchWeapon(false)
        end
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
	      firing = true
	    else
	      firing = false
	    end
    end
  end
   
   if self.ship.weapon.time > 0 then
     self.ship.weapon.time = self.ship.weapon.time - dt
   end
   
   if self.ship.invulTimer > 0 then
    self.ship.invulTimer = self.ship.invulTimer - dt
   end
   
   if self.ship.recoil > 0 then
     self.ship.recoil = self.ship.recoil * 0.9
   end
   
   if self.ship.shake > 0 then
     self.ship.shake = self.ship.shake * 0.9
     if self.ship.shake < 0.01 then self.ship.shake = 0 end
   end
   
   --widget.setText("scoreLabel", tostring(leftHeld))
   
   self.levelElapsedTime = self.levelElapsedTime + dt
   
   self.ship.tangentDir = {0,0} --notMoving
   if leftHeld then
     self.ship.angularPosition = self.ship.angularPosition + math.pi * dt
     self.ship.tangentDir = {math.cos(self.ship.angularPosition + math.pi * 0.5), math.sin(self.ship.angularPosition + math.pi * 0.5)}
   elseif rightHeld then
     self.ship.angularPosition = self.ship.angularPosition - math.pi * dt
     self.ship.tangentDir = {math.cos(self.ship.angularPosition - math.pi * 0.5), math.sin(self.ship.angularPosition - math.pi * 0.5)}
   end
   
    
  self.canvas:clear()
     
  for k,v in pairs(stars) do
    local width = (v.z / 10) * 1.5 + 0.25
    local rgb = v.z / 10 * 190
    self.canvas:drawRect({v.pos[1] - width, v.pos[2] - width, v.pos[1] + width, v.pos[2] + width} , {rgb,rgb,rgb, 255})
  end
  
  local prevShipPos = {self.ship.pos[1], self.ship.pos[2]}  
  UpdateShipWorldPosition()
  
  local transformedPoly = poly.rotate(self.ship.shipPoly, self.ship.angularPosition)
  transformedPoly = poly.translate(transformedPoly, self.ship.pos)
  local shipColor = "white"
  if isShipInvul(self.ship) then
    shipColor = shipInvulColor(self.ship)
  end
  
  self.canvas:drawPoly(transformedPoly, "white", 1)
  if self.ship.shake > 0 then
    local shakeOffset = {self.perlin:get(self.ship.shake * 10) * 30 * self.ship.shake, self.perlin2:get(self.ship.shake * 10) * 30 * self.ship.shake}
    self.canvas:drawPoly(poly.translate(transformedPoly, shakeOffset), "yellow", 1)
  end
  
  transformedPoly = poly.translate(self.world.worldPoly, self.world.pos);
  self.canvas:drawPoly(transformedPoly, "green",2)


  if self.levelPhase == "attack" then
    if firing and CanWeaponFire(self.ship.weapon) then
      FireWeapon(self.ship.weapon, self.ship)
    end
    UpdateWaveSpawns(dt)
    UpdateWeaponSwitcher(dt)
  elseif self.levelPhase == "transition" then
    UpdateLevelTransition(dt)
  elseif self.levelPhase == "upgrade" then
    UpdateUpgrades(dt, firing)
  end
  updateBullets(dt)
  updateEnemies(dt)
  updateEnemyBullets(dt)
  drawBarriers()
  updateParticles(dt)
  coroutine.yield()
   end
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

  local newParticle = { pos = {position[1],position[2]},
                        vel =  velocity,
                        lifeTime = 0,
                        maxLifeTime = duration,
                        alive = true,
                        polyOverride = polyOverride,
                        color = color}
  table.insert(self.particles, newParticle)
end


function spawnParticleBurst(count, position, minSpeed, maxSpeed, duration, polyOverride, color)
  for i = 1, count, 1 do
    local rAngle = math.random() * 2 * math.pi
    local rSpeed = math.random() * (maxSpeed - minSpeed) + minSpeed
    spawnParticle({position[1], position[2]}, {math.sin(rAngle) * rSpeed, math.cos(rAngle) * rSpeed}, duration, polyOverride, color)
  end
end

function updateParticles(dt)
  for _,p in pairs(self.particles) do
    if p.alive then
      p.pos = vec2.add(p.pos, vec2.mul(p.vel, dt))
      p.lifeTime = p.lifeTime+dt
      if p.lifeTime > p.maxLifeTime then
        p.alive = false
      else
        if p.poly ~= nil then
          local transformedPoly = poly.translate(p.poly, p.pos)
          self.canvas:drawPoly(transformedPoly, 1, p.color)
        else
          self.canvas:drawRect({ p.pos[1], p.pos[2], p.pos[1]-1, p.pos[2]-1 }, p.color)
        end
      end
    end
  end
end

function spawnBullet(position, angle, isEnemy, speed, gravFactor)
  if isEnemy == nil then isEnemy = false end
  
  local bulletCollection = (isEnemy) and self.enemyBullets or self.bullets

  for _,b in pairs(bulletCollection) do
    if b.alive == false then
      b.pos = position
      b.vel = vec2.withAngle(angle, speed or 320)
      b.r = 1
      b.lifeTime = 0
      b.alive = true
      b.params = {}
	  return b
    end
  end

   local newBullet = { pos = position,
       vel = vec2.withAngle(angle, speed or 320),
		   r = 1,
		   lifeTime = 0,
		   alive = true,
       params = {}}
		   
    table.insert(bulletCollection, newBullet)
    return newBullet
end

function spawnBulletWithConfig(position, angle, isEnemy, bulletConfig)
  if isEnemy == nil then isEnemy = false end
  local bulletCollection = (isEnemy) and self.enemyBullets or self.bullets
  local speed = 320
  
  if bulletConfig and bulletConfig.speed then
    if type(bulletConfig.speed) == "table" then
      speed = util.randomInRange(bulletConfig.speed)
    else
      speed = bulletConfig.speed
    end
  end
  
  for _,b in pairs(bulletCollection) do
    if b.alive == false then
      b.pos = position
      b.vel = vec2.withAngle(angle, speed or 320)
      b.r = 1
      b.lifeTime = 0
      b.alive = true
      b.params = copy(bulletConfig) or {}
      return b
    end
  end
  
  local newBullet = { pos = position,
                      vel = vec2.withAngle(angle, speed or 320),
                      r = 1,
                      lifeTime = 0,
                      alive = true,
                      params = copy(bulletConfig) or {}}
   
  table.insert(bulletCollection, newBullet)
  return newBullet
end

function drawBarriers()
  local cyclingColor = ColorFromHSL(math.abs(math.sin(self.levelElapsedTime)) * 0.1 + 0.5 ,0.5, 0.5)
  for _,bar in pairs(self.barriers) do
    if bar.alive then
      local transformedPoly = poly.rotate(self.barrierPoly, bar.angle)
      transformedPoly = poly.translate(transformedPoly, bar.pos)
      self.canvas:drawPoly(transformedPoly, cyclingColor, 1) -- {130,150,255}
    end
  end
end

function updateBullets(dt)
  for _,bullet in pairs(self.bullets) do
    if bullet.alive then
      if bullet.params.gravFactor ~= nil then
        local vecToWorld = vec2.sub(self.world.pos, bullet.pos)
        local dSqr = vecToWorld[1] * vecToWorld[1] + vecToWorld[2] * vecToWorld[2]
        local gravForce = bullet.params.gravFactor / dSqr
        bullet.vel = vec2.add(bullet.vel, vec2.mul(vec2.norm(vecToWorld), gravForce * dt))
      end
      
      if bullet.params.angularSpeed ~= nil then
        bullet.vel = vec2.rotate(bullet.vel, bullet.params.angularSpeed * dt)
      end
      
      bullet.pos = vec2.add(bullet.pos, vec2.mul(bullet.vel, dt))
      bullet.lifeTime = bullet.lifeTime+dt
      
      for k,enemy in pairs(self.enemies) do
        if bullet.alive and enemy.alive and isColliding(bullet.pos, 1, enemy.pos, enemy.r) then
          bullet.alive = false
          DestroyEnemy(enemy)
          spawnParticleBurst(5, enemy.pos, 75, 175, 0.25, nil, {200,200,100})
          IncreaseSpeedMod()
        end        
      end
      
      --for k, bar in pairs(self.barriers) do
      --  if bar.alive and isColliding(bullet.pos, 1, bar.pos, bar.r) then
      --    bullet.alive = false
      --    bar.alive = false
      --    spawnParticleBurst(3, bar.pos, 20, 80, 0.5, nil, {0,200,240, 150})
      --  end        
      --end
      
      if bullet.alive and isColliding(bullet.pos, 1, self.world.pos, self.world.radius) then
        bullet.alive = false
        spawnParticleBurst(4, bullet.pos, 20, 60, 0.55, nil, {255,255,255, 150})
        pane.playSound(self.sounds.bulletcollide,0,0.3)
      end
      
      local maxLife = bullet.params.maxLife or 15
      if bullet.lifeTime > maxLife or offScreenSquare(bullet.pos) then
        if bullet.params.expireBurst ~= nil then
          local burstCount = bullet.params.expireBurst
          local burstBulletConfig = copy(bullet.params.expireBurstBullet)
          for i = 0, bullet.params.expireBurst, 1 do
            spawnBulletWithConfig(bullet.pos, math.pi / burstCount * i * 2, false, burstBulletConfig)
          end
          pane.playSound(self.sounds.flakexplosion, 0, 0.7)
        end
        bullet.alive = false
      else
        self.canvas:drawRect({ bullet.pos[1]+1, bullet.pos[2]+1, bullet.pos[1]-1, bullet.pos[2]-1 }, "yellow")
      end
    end
  end
end

function updateEnemyBullets(dt)
  for _,bullet in pairs(self.enemyBullets) do
    if bullet.alive then
    
      if bullet.params.gravFactor ~= nil then
        local vecToWorld = vec2.sub(self.world.pos, bullet.pos)
        local dSqr = vecToWorld[1] * vecToWorld[1] + vecToWorld[2] * vecToWorld[2]
        local gravForce = bullet.params.gravFactor / dSqr
        bullet.vel = vec2.add(bullet.vel, vec2.mul(vec2.norm(vecToWorld), gravForce * dt))
      end
      
      if bullet.params.angularSpeed ~= nil then
        bullet.vel = vec2.rotate(bullet.vel, bullet.params.angularSpeed * dt)
      end
    
      bullet.pos = vec2.add(bullet.pos, vec2.mul(bullet.vel, dt))
      bullet.lifeTime = bullet.lifeTime+dt
      
      for k, pb in pairs(self.bullets) do
        if bullet.alive and pb.alive and isColliding(bullet.pos, 4, pb.pos, 3) then
          bullet.alive = false
          pane.playSound(self.sounds.bulletcollide,0,0.4)
          if pb.params.bulletbreaker ~= true then
            pb.alive = false
          end
          spawnParticleBurst(3, pb.pos, 100, 200, 0.2, nil, {255,0,0, 150})
        end        
      end
      
      for k, bar in pairs(self.barriers) do
        if bar.alive and bullet.alive and isColliding(bullet.pos, 4, bar.pos, bar.r) then
          bullet.alive = false
          bar.alive = false
          spawnParticleBurst(3, bar.pos, 20, 80, 0.5, nil, {0,200,240, 150})
          pane.playSound(self.sounds.barrierhit, 0, 0.5)
        end        
      end
      
      if bullet.alive and isColliding(bullet.pos, 2, self.ship.pos, 7) then
        bullet.alive = false
        spawnParticleBurst(3, self.ship.pos, 75, 150, 0.25, nil, {255,255,0, 150})
        HitPlayer()
      end
      
      if bullet.params.resetVel then
        bullet.vel = bullet.params.resetVel
        bullet.params.resetVel = nil
      end
      
      if bullet.alive and isColliding(bullet.pos, 2, self.world.pos, self.world.radius) then
        if bullet.params.boringSpeed ~= nil then
          bullet.params.resetVel = bullet.vel
          bullet.vel = clampMag(bullet.vel, bullet.params.boringSpeed)
          if math.random() < 0.07 then
            spawnParticleBurst(1, bullet.pos, 10, 40, 0.25, nil, {190,100,0, 255})
          end
        else
          bullet.alive = false
          pane.playSound(self.sounds.bulletcollide,0,0.3)
          spawnParticleBurst(3, bullet.pos, 20, 80, 0.25, nil, {255,0,0, 150})
        end
      end
      
      
      if offScreenSquare(bullet.pos) then
        bullet.alive = false
      else
        self.canvas:drawRect({bullet.pos[1]+2, bullet.pos[2]+2, bullet.pos[1]-2, bullet.pos[2]-2 }, "red")
        if bullet.params.boringSpeed ~= nil then
          self.canvas:drawRect({bullet.pos[1]+1, bullet.pos[2]+1, bullet.pos[1]-1, bullet.pos[2]-1 }, "yellow")
        end
      end
    end
  end
end

function DestroyAllBullets()
  for _,v in pairs(self.enemyBullets) do
    v.alive = false
  end
  
  for _,v in pairs(self.bullets) do
    v.alive = false
  end
end

function DestroyAllBarriers()
  for _, v in pairs(self.barriers) do
    v.alive = false
  end
end

function spawnEnemy(distance, angle)
  self.livingEnemyCount = self.livingEnemyCount + 1
 local position = vec2.add(vec2.withAngle(angle, distance), self.world.pos)
  for _,e in pairs(self.enemies) do
    if e.alive == false then
      e.pos = position
      e.dir = 1
      e.angularPosition = angle
      e.angularSpeed = math.pi * 0.06
      e.r = 10
      e.d = distance
      e.alive = true
      e.type = "base"
      e.params = {}
      if e.targetD ~= nil then e.targetD = nil end
      return e
    end
  end

local newEnemy = {pos = position,
       dir = 1,
       angularPosition = angle,
       angularSpeed = math.pi * 0.06,
       r = 10,
       d = distance,
       alive = true,
       type = "base"}
       
  table.insert(self.enemies, newEnemy)
  return newEnemy
end

function updateEnemyPhases(dt)
  if self.enemyMovementPhase == "rotate" then
    if self.enemyDirectionChangeTimer <= 0 then
      self.enemyDirectionChangeTimer = self.enemyDirectionChangeDuration
      self.enemyMovementPhase = "drop"
      self.enemyBaseDir = self.enemyBaseDir * -1
    else
      self.enemyDirectionChangeTimer = self.enemyDirectionChangeTimer - dt
    end
  elseif self.enemyMovementPhase == "drop" then
    if self.enemyDropTimer <= 0 then
      self.enemyDropTimer = self.enemyDropDuration
      self.enemyMovementPhase = "rotate"
    else
      self.enemyDropTimer = self.enemyDropTimer - dt
    end
  end
end

function updateEnemies(dt)
  updateEnemyPhases(dt)
  local flip = self.enemyDirectionChangeTimer <= 0
  UpdateEnemyShots(dt)
  local enemiesInCloseRange = 0
  
  for k,v in pairs(self.enemies) do
    if v.alive then
      if v.type == "base" or v.type == nil then
        updateBaseEnemy(v, dt, flip)
        if v.d < 170 then enemiesInCloseRange = enemiesInCloseRange + 1 end
      elseif v.type == "spawner" then
        updateSpawnerEnemy(v, dt)
      elseif v.type == "bomber" then
        updateBomberEnemy(v,dt)
      elseif v.type == "beamer" then
        updateBeamEnemy(v,dt)
      elseif v.type == "driller" then
        updateDrillerEnemy(v,dt)
      end
    end
  end
  
  self.areEnemiesClose = enemiesInCloseRange > 0
end

function updateBaseEnemy(enemy, dt, flip)
  if flip then enemy.dir = enemy.dir * -1 end
  
  if enemy.targetD ~= nil and enemy.d ~= enemy.targetD then
    enemy.d = approachValue(enemy.d, enemy.targetD, 30 * dt)
    if enemy.d == enemy.targetD then enemy.targetD = nil end
  else
    if self.enemyMovementPhase == "rotate" then
      enemy.angularPosition = enemy.angularPosition + enemy.angularSpeed * enemy.dir * dt * self.speedModifier
    elseif self.enemyMovementPhase == "drop" then
      local catchUpMod = (self.areEnemiesClose and 1) or 3
      enemy.d = enemy.d - 20 * dt * catchUpMod
    end
  end
  
  local scale = nil 
  if enemy.bounce ~= nil and enemy.bounce > 0 then
    enemy.bounce = enemy.bounce - dt
    scale = enemy.bounce * enemy.bounce * enemy.bounce * 0.5 + 1
  end
  
  if enemy. d < self.world.radius + 4 or isColliding(enemy.pos, enemy.r, self.ship.pos, 4) then
    DestroyEnemy(enemy)
    HitPlayer()
    spawnParticleBurst(15, enemy.pos, 10, 175, 0.35, nil, {255,200,100})
  end
  
  for _, e2 in pairs(self.enemies) do
    if e2.alive and e2.type == "base" and enemy.alive then
      local difference = enemy.d - e2.d
      if difference > -8 and difference < 8 then
        if isColliding(enemy.pos, enemy.r, e2.pos, e2.r) then
          local angDiff = angleDifference(enemy.angularPosition, e2.angularPosition)
          enemy.angularPosition = enemy.angularPosition + angDiff * dt
        end
      end
    end
  end
  
  enemy.pos = vec2.add(vec2.withAngle(enemy.angularPosition, enemy.d), self.world.pos)
  
  if enemy.d < 300 then
    local hue = (enemy.d / 500) * (enemy.d / 500)
    local enemyColor = ColorFromHSL(hue, 0.5, 0.5)
    drawPolyWithTransforms(self.enemyPoly, enemyColor, enemy.pos, enemy.angularPosition, scale)
  end
end

function updateBomberEnemy(enemy, dt)
  enemy.pos = vec2.approach(enemy.pos, enemy.targetPos, enemy.speed * dt)
  if enemy.pos == enemy.targetPos then 
    local randomPath = RandomLinearEnemyPath()
    enemy.pos = randomPath.from;
    enemy.targetPos = randomPath.to;
    enemy.angularPosition = vec2.angle(vec2.sub(enemy.targetPos, enemy.pos))
  end
  
  local scale = nil 
  if enemy.bounce ~= nil and enemy.bounce > 0 then
    enemy.bounce = enemy.bounce - dt
    scale = enemy.bounce * enemy.bounce * enemy.bounce * 0.25 + 1
  end
  
  if enemy.fireTimer <= 0 then
    for i = 0, 7, 1 do
      spawnBulletWithConfig(enemy.pos, enemy.angularPosition + math.pi / 8 * i * 2, true, {speed = 10, gravFactor = 2000000})
    end
    pane.playSound(self.sounds.bombershot,0,0.7)
    enemy.bounce = 0.8
    enemy.fireTimer = 3
  else
    enemy.fireTimer = enemy.fireTimer - dt
  end
  
  local hue = 1-(enemy.fireTimer / 3) 
  local enemyColor = ColorFromHSL(hue*hue* 0.1 + 0.05, 0.75, 0.5 + (1-hue)*(1-hue)*(1-hue) * 0.45)
  
  drawPolyWithTransforms(self.enemyBomberPoly, enemyColor, enemy.pos, enemy.angularPosition, scale)
end

function updateSpawnerEnemy(enemy, dt)
  enemy.pos = vec2.approach(enemy.pos, enemy.targetPos, enemy.speed * dt)
  local scale = nil 
  if enemy.bounce ~= nil and enemy.bounce > 0 then
    enemy.bounce = enemy.bounce - dt
    scale = enemy.bounce * enemy.bounce * enemy.bounce * 0.25 + 1
  end
  
  if enemy.pos == enemy.targetPos then 
    if enemy.fireTimer <= 0 and self.enemyMovementPhase ~= "drop" then
      local d = vec2.mag(vec2.sub(enemy.pos, self.world.pos))
      local targetD = d
      local angle = vec2.angle(vec2.sub(enemy.pos, self.world.pos) )
      local newEnemy = spawnEnemy(d, angle)
      newEnemy.targetD = targetD
      newEnemy.dir = self.enemyBaseDir
      enemy.fireTimer = 1
      enemy.bounce = 1
      enemy.params.spawnLimit = enemy.params.spawnLimit - 1
      pane.playSound(self.sounds.spawner,0,0.6)
    else
      enemy.fireTimer = enemy.fireTimer - dt
    end
  end
  
  if enemy.params.spawnLimit <= 0 then
    if enemy.pos == enemy.targetPos then
      if offScreenSquare(enemy.pos) then
        DestroyEnemy(enemy,true)
      else
        enemy.targetPos = vec2.add(vec2.mul(vec2.norm(vec2.sub(self.world.pos, enemy.pos)), -300), self.world.pos)
      end
    end
  end
  
  drawPolyWithTransforms(self.enemySpawnerPoly, {255,255*(enemy.bounce or 1),255}, enemy.pos, enemy.angularPosition, scale)
end

function updateBeamEnemy(enemy, dt)
  local cyclingColor = ColorFromHSL(math.abs(math.sin(self.levelElapsedTime * (enemy.params.phase == "on" and 4 or 1))) * 0.15 + 0.85 ,0.7, 0.5)
  if enemy.targetD ~= nil and enemy.d ~= enemy.targetD then
    enemy.d = approachValue(enemy.d, enemy.targetD, 30 * dt)
    if enemy.d == enemy.targetD then enemy.targetD = nil end
  else
    enemy.angularPosition = enemy.angularPosition + enemy.angularSpeed * enemy.dir * dt
  end
  
  local vecToWorld = vec2.norm(vec2.sub(self.world.pos,enemy.pos))
  local perpVec = vec2.rotate(vecToWorld, math.pi * 0.5)
  local dToSurface = enemy.d - self.world.radius
  local beamWidth = math.random() * 1 + 1.25

  local hitPos = {enemy.pos[1] + vecToWorld[1] * dToSurface, enemy.pos[2] + vecToWorld[2] * dToSurface}
  
  local scale = nil
  if enemy.params.phase == "on" then scale = math.sin((1-enemy.params.timer / enemy.params.beamDuration) * 25) * 0.05 + 1 end
  if enemy.params.phase == "start" then scale = math.sin((1-enemy.params.timer / enemy.params.beamDuration) * 10) * 0.05 + 1 end
  if enemy.params.particleTimer == nil then enemy.params.particleTimer = 0 end
  
  enemy.pos = vec2.add(vec2.withAngle(enemy.angularPosition, enemy.d), self.world.pos)
  drawPolyWithTransforms(self.enemyBeamPoly, cyclingColor, enemy.pos, enemy.angularPosition - math.pi * 0.5, scale)
  
  local beamPoly = {}
  if enemy.targetD == nil then
    enemy.params.timer = enemy.params.timer - dt
    if enemy.params.phase == "on" then
      table.insert(beamPoly, { enemy.pos[1] + vecToWorld[1] * enemy.r * 2 + perpVec[1] * beamWidth, enemy.pos[2] + vecToWorld[2] * enemy.r * 2 + perpVec[2] * beamWidth} )
      table.insert(beamPoly, { enemy.pos[1] + vecToWorld[1] * enemy.r, enemy.pos[2] + vecToWorld[2] * enemy.r} )
      table.insert(beamPoly, { enemy.pos[1] + vecToWorld[1] * enemy.r * 2 - perpVec[1] * beamWidth, enemy.pos[2] + vecToWorld[2] * enemy.r * 2 - perpVec[2] * beamWidth} )
      
      table.insert(beamPoly, { enemy.pos[1] + vecToWorld[1] * (dToSurface - math.random(3,5)) - perpVec[1] * beamWidth, enemy.pos[2] + vecToWorld[2] * (dToSurface - math.random(3,5)) - perpVec[2] * beamWidth} )
      table.insert(beamPoly, { enemy.pos[1] + vecToWorld[1] * (dToSurface - math.random(5,15)) - perpVec[1] * beamWidth * 3, enemy.pos[2] + vecToWorld[2] * (dToSurface - math.random(5,15)) - perpVec[2] * beamWidth * 3} )
      
      table.insert(beamPoly, { enemy.pos[1] + vecToWorld[1] * dToSurface - perpVec[1] * beamWidth, enemy.pos[2] + vecToWorld[2] * dToSurface - perpVec[2] * beamWidth} )
      table.insert(beamPoly, { enemy.pos[1] + vecToWorld[1] * dToSurface + perpVec[1] * beamWidth, enemy.pos[2] + vecToWorld[2] * dToSurface + perpVec[2] * beamWidth} )
      
      table.insert(beamPoly, { enemy.pos[1] + vecToWorld[1] * (dToSurface - math.random(5,15)) + perpVec[1] * beamWidth * 3, enemy.pos[2] + vecToWorld[2] * (dToSurface - math.random(5,15)) + perpVec[2] * beamWidth * 3} )
      table.insert(beamPoly, { enemy.pos[1] + vecToWorld[1] * (dToSurface - math.random(3,5)) + perpVec[1] * beamWidth, enemy.pos[2] + vecToWorld[2] * (dToSurface - math.random(3,5)) + perpVec[2] * beamWidth} )

      if enemy.params.timer <= 0 then
        enemy.params.timer = enemy.params.beamDuration
        enemy.params.phase = "off"
      end
      if isCollidingLineSeg(self.ship.pos, 4, enemy.pos, hitPos, beamWidth) then
        HitPlayer()
      end
      drawPolyWithTransforms(beamPoly, "red")
      if enemy.params.particleTimer <= 0 then
        local pAngle = math.random() * math.pi * 0.7 + enemy.angularPosition - math.pi * 0.35
        local pSpeed = math.random() * 25 + 25
        spawnParticle(hitPos, {math.cos(pAngle) *pSpeed, math.sin(pAngle) * pSpeed}, 0.5, _, "red")
        pane.playSound(self.sounds.beamhit1, 0, 0.4)
        enemy.params.particleTimer = 0.08
      else
        enemy.params.particleTimer = enemy.params.particleTimer - dt
      end
    elseif enemy.params.phase == "off" then
      if enemy.params.timer <= 0 then
        enemy.params.timer = enemy.params.beamDuration * 0.5
        enemy.params.phase = "start"
        pane.playSound(self.sounds.chargeup,0,0.5)
        --enemy.targetD = math.random(50,180)
      end
    elseif enemy.params.phase == "start" then
      if enemy.params.timer <= 0 then
        enemy.params.timer = enemy.params.beamDuration
        enemy.params.phase = "on"
      end
      
      table.insert(beamPoly, { enemy.pos[1] + vecToWorld[1] * enemy.r, enemy.pos[2] + vecToWorld[2] * enemy.r} )
      table.insert(beamPoly, { enemy.pos[1] + vecToWorld[1] * dToSurface, enemy.pos[2] + vecToWorld[2] * dToSurface} )
      drawPolyWithTransforms(beamPoly, {255,0,0, math.random() * 100})
    end
  end
end

function updateDrillerEnemy(enemy, dt)
  if enemy.targetD ~= nil and enemy.d ~= enemy.targetD then
    enemy.d = approachValue(enemy.d, enemy.targetD, 30 * dt)
    if enemy.d == enemy.targetD then enemy.targetD = nil end
  else
    enemy.angularPosition = enemy.angularPosition + enemy.angularSpeed * enemy.dir * dt
  end
  
  enemy.pos = vec2.add(vec2.withAngle(enemy.angularPosition, enemy.d), self.world.pos)
  
  local scale = nil 
  if enemy.bounce ~= nil and enemy.bounce > 0 then
    enemy.bounce = enemy.bounce - dt
    scale = enemy.bounce * enemy.bounce * enemy.bounce * 0.25 + 1
  end
  
  if enemy.params.flipTimer == nil or enemy.params.flipTimer <= 0 then
    enemy.params.flipTimer = math.random() * 3.5 + 1.5
    enemy.dir = enemy.dir * -1
    enemy.bounce = 0.7
    enemy.targetD = math.random(120,195)
    spawnBulletWithConfig(enemy.pos, enemy.angularPosition + math.pi, true, {speed = 75, boringSpeed = 15})
    pane.playSound(self.sounds.drillershot,0,0.5)
  else
    enemy.params.flipTimer = enemy.params.flipTimer - dt
  end
  
  local hue = (enemy.d / 500) * (enemy.d / 500) + 0.05
  local enemyColor = ColorFromHSL(hue, 0.75, 0.5)
  drawPolyWithTransforms(self.enemyDrillerPoly, enemyColor, enemy.pos, enemy.angularPosition + math.pi * 0.5, scale)
end

function RandomLinearEnemyPath() 
  local p = util.randomChoice(self.linearEnemyPaths)
  local reversed = math.random() > 0.5;
  
  if reversed then return {from = p.to, to = p.from} end
 
  return {from = p.from, to = p.to}  
end

function LinearEnemyPathInSequence(index, pathPercent)
  local p = copy(self.linearEnemyPaths[index])
  index = index or 1
  if pathPercent then
    p.to = vec2.add(vec2.mul(p.from, 1 - pathPercent), vec2.mul(p.to, pathPercent))
  end
  
  return p
end

function UpdateEnemyShots(dt)
  ---widget.setText("levelLabel", tostring(self.enemyFireTimer))
  if self.enemyFireTimer > 0 then
    self.enemyFireTimer = self.enemyFireTimer - dt
  else
    local firingEnemy = SelectRandomEnemy({alive = true, type = "base"})
    --widget.setText("livesLabel", tostring(firingEnemy.d))
    if firingEnemy ~= nil and firingEnemy.d < 250 then
      spawnBullet(firingEnemy.pos, firingEnemy.angularPosition + math.pi, true, 25)
      firingEnemy.bounce = 1
      pane.playSound(self.sounds.enemyshoot, _, 0.8)
      --spawnBulletWithConfig(firingEnemy.pos, firingEnemy.angularPosition + math.pi, true, {speed = 25, boringSpeed = 12})
    end
    self.enemyFireTimer = math.random() * 1.25 + 1
  end
end

function UpdateWaveSpawns(dt)
  local expediation = 10
  for k,wave in pairs(self.waves) do
    if wave.expeditable ~= true or self.livingEnemyCount > 0 then --if a non expeditable wave exists then no expediation happens
      expediation = 1
      break
    end
  end 
  
  for k,wave in pairs(self.waves) do
    if wave.delay then
      wave.delay = wave.delay - dt * expediation
      if wave.delay <= 0 then
        SpawnWave(wave)
        self.waves[k] = nil
      end
    end
  end
end

function SpawnWave(wave)
  local blocks = wave.blocks or 1
  local rows = wave.rows or 1
  local enemies = wave.enemies or 1
  local enemySpacing = wave.enemySpacing or math.pi * 0.05
  local rowOffset = wave.rowOffset or 0
  local blockSpacing = wave.blockSpacing or math.pi * 2 / blocks
  local initialDistance = wave.initialDistance or 250
  local initialAngle = wave.initialAngle or 0
  local distanceIncrement = wave.distanceIncrement or 16
  
  for block = 0, blocks - 1, 1 do --block
    for row = 0, rows - 1, 1 do --wave
      for e = 0, enemies - 1, 1 do --enemy
        local angle = e * enemySpacing + block * blockSpacing + row * rowOffset + initialAngle
        local spawnedEnemy = spawnEnemy(initialDistance + row * distanceIncrement, angle)
        if wave.spawnParams ~= nil then
          for k, spawnParam in pairs(wave.spawnParams) do
            if k == "pathType" then
              if spawnParam == "Random" then
                local rPath = RandomLinearEnemyPath()
                spawnedEnemy.pos = rPath.from
                local pathPercent = wave.spawnParams.pathPercent or 1
                spawnedEnemy.targetPos = vec2.add(vec2.mul(rPath.from, (1 - pathPercent)), vec2.mul(rPath.to, pathPercent))
              elseif spawnParam == "Sequence" then
                local rPath = LinearEnemyPathInSequence(wave.spawnParams.pathIndex, wave.spawnParams.pathPercent)
                spawnedEnemy.pos = rPath.from
                spawnedEnemy.targetPos = rPath.to
              elseif spawnParam == "Descend" then
                spawnedEnemy.targetD = spawnedEnemy.d - wave.spawnParams.pathD
              end
            elseif k ~= "pathPercent" and k ~= "pathIndex" and k ~= "pathD" then
              if type(spawnParam) == "table" then
                spawnedEnemy[k] = copy(spawnParam)
              else
                spawnedEnemy[k] = spawnParam
              end
            end
          end
        end
      end
    end
  end
end

function EndLevel()
  self.levelElapsedTime = 0
  self.livingEnemyCount = 0
  DestroyAllBullets()
  DestroyAllBarriers()
end

function GetRandomLevelType()
  local levelTypes = {"simple", "pillars", "staggered", "rings", "bombingrun"}
  local rType = util.randomChoice(levelTypes)
  if (rType == "rings" or rType == "bombingrun" ) and self.level <= 5 then
    return "simple"
  else
    return rType
  end
end

function GetRandomSpecialEnemyType()
  local enemyTypes = {"beamer","bomber","spawner","driller"}
  return util.randomChoice(enemyTypes)
end

function GenerateWaves(levelNumber)
  self.waves = {}
  self.levelElapsedTime = 0
  local levelType = GetRandomLevelType()
  local blockCount, rowsPerBlock, EnemiesPerRow, totalEnemies, enemiesPerBlock, rowAngleOffset, blockAngleOffset
  local baseEnemyParam = {pathType = "Descend", pathD = 100}
  self.speedModifier = util.clamp(0.5 + levelNumber * 0.1, 0.5,1)
  self.levelTransitionTime = 2
  self.levelPhase = "transition"
  
  if levelType == "simple" then
    totalEnemies = math.random(25 + levelNumber * 3, 40 + levelNumber * 3)
    blockCount = math.random(1,6)
    enemiesPerBlock = totalEnemies / blockCount
    rowsPerBlock = math.sqrt(enemiesPerBlock)
    enemiesPerRow = util.clamp(enemiesPerBlock / rowsPerBlock, 3, 100)
    local wave = {delay = 2, blocks = blockCount, rows = rowsPerBlock, enemies = enemiesPerRow, enemySpacing = math.pi*0.05, rowOffset = 0, blockSpacing = nil, initialAngle = math.random()*2*math.pi, initialDistance = 250, distanceIncrement = 16, spawnParams = baseEnemyParam}
    table.insert(self.waves, wave)
  elseif levelType == "pillars" then
    totalEnemies = math.random(22 + levelNumber * 2, 32 + levelNumber * 2)
    blockCount = math.random(3, math.floor(math.sqrt(0.25 * totalEnemies - 4)) + 3)
    rowsPerBlock = totalEnemies / blockCount
    enemiesPerRow = 1
    rowAngleOffset = 0
    if math.random() > 0.5 then
      rowAngleOffset = 0.05
    elseif math.random() > 0.33 then
      blockAngleOffset = math.random() * math.pi * 0.15 + 0.15
    else
      blockAngleOffset = nil
    end 
    
    local wave = {delay = 2, blocks = blockCount, rows = rowsPerBlock, enemies = enemiesPerRow, enemySpacing = math.pi*0.05, rowOffset = rowAngleOffset, blockSpacing = blockAngleOffset, initialAngle = math.random()*2*math.pi, initialDistance = 250, distanceIncrement = 16, spawnParams = baseEnemyParam}
    table.insert(self.waves, wave)
  elseif levelType == "staggered" then
    totalEnemies = math.random(20 + levelNumber * 2, 30 + levelNumber * 3)
    blockCount = math.random(2,4)
    enemiesPerBlock = totalEnemies / blockCount
    rowsPerBlock = util.clamp(math.sqrt(enemiesPerBlock) + math.random(-1,0),1,100)
    enemiesPerRow = enemiesPerBlock / rowsPerBlock
    local alternating = math.random() > 0.2
    local randStartingAngle = math.random() * 2 * math.pi
    rowAngleOffset = 0
    if math.random() > 0.75 then rowAngleOffset = math.pi * 0.05 end
    for i = 0, blockCount-1, 1 do
      local mergedParams = copy(baseEnemyParam)
      mergedParams.dir = ((alternating and (i%2==1) and 1) or -1)
      local wave = {delay = 2, blocks = 2, rows = rowsPerBlock, enemies = enemiesPerRow, enemySpacing = math.pi*0.05, rowOffset = rowAngleOffset, blockSpacing = nil, initialAngle = randStartingAngle + (math.pi*2)/blockCount*i, initialDistance = 250+i*16*(rowsPerBlock+1), distanceIncrement = 16, spawnParams = mergedParams}
      table.insert(self.waves, wave)
    end
  elseif levelType == "rings" then
    self.speedModifier = self.speedModifier * 0.5
    totalEnemies = math.random(20+levelNumber*2, 30+levelNumber*3)
    enemiesPerRow = maxShipsByWidth(self.world.radius, 10)
    blockCount = math.floor(totalEnemies / enemiesPerRow)
    for i = 0, blockCount-1, 1 do
      local mergedParams = copy(baseEnemyParam)
      mergedParams.dir = (((i%2==1) and 1) or -1)
      local wave = {delay = 2, blocks = 1, rows = rowsPerBlock, enemies = enemiesPerRow, enemySpacing = math.pi*2/enemiesPerRow, initialDistance = 250+i*16, distanceIncrement = 16, spawnParams = mergedParams }
      --sb.logInfo(util.tableToString(wave.spawnParams))
      table.insert(self.waves, wave)
    end
  elseif levelType == "bombingrun" then
    totalEnemies = math.random(3, math.floor(3+levelNumber / 4))
    local enemyParams = {type = "bomber", speed = 50, fireTimer = 1, pathType = "Random"}
    local delayIncrement = util.clamp(9 - (3 * levelNumber/10), 1, 9)
      for i = 1, totalEnemies, 1 do
        local extraWave = {delay = 2 + (i-1) * delayIncrement, blocks = 1, rows = 1, enemies = 1, enemySpacing = math.pi*0.15, initialDistance = 250, distanceIncrement = 16, spawnParams = enemyParams}
        table.insert(self.waves, extraWave)
      end
  end
  
  local extraWaveCount = 0
  if levelNumber > 8 then extraWaveCount = math.floor(math.sqrt(levelNumber-4)) elseif levelNumber > 2 then extraWaveCount = 1 end
  
  for ex = 0, extraWaveCount-1, 1 do
    local extraWaveType = GetRandomSpecialEnemyType()
    if extraWaveType == "bomber" and levelType == "bombingrun" then extraWaveType = "spawner" end
    
    if extraWaveType == "beamer" then
      totalEnemies = util.clamp(math.random(1, math.ceil(levelNumber * 0.3)),1,12)
      if math.random() > 0.5 then
        blockCount = GetRandomFactor(totalEnemies)
        enemiesPerRow = totalEnemies / blockCount
      else
        blockCount = totalEnemies
        enemiesPerRow = 1
      end
      local enemyParams = {type = "beamer", speed = 50, r = 14, targetD = 170, params = {phase = "off", timer = 2, beamDuration = 2}}
      local extraWave = {delay = util.clamp(math.random(20-levelNumber,20), 1, 20)+15 * ex, blocks = blockCount, rows = 1, enemies = enemiesPerRow, enemySpacing = math.pi*0.1, rowOffset = 0, blockSpacing = nil, initialAngle = math.random() * 2 * math.pi, initialDistance = 250, distanceIncrement = 16, spawnParams = enemyParams, expeditable = true}
      table.insert(self.waves, extraWave)
    elseif extraWaveType == "bomber" then
      local enemyParams = {type = "bomber", speed = 50, fireTimer = 1, pathType = "Random"}
      totalEnemies = math.random(1, math.ceil(levelNumber * 0.3))
      local delayIncrement = util.clamp(8 - (4 * levelNumber/10),2,8)
      for i = 1, totalEnemies, 1 do
        local extraWave = {delay = util.clamp(math.random(20-levelNumber,20), 1, 20)+ i * delayIncrement +15 * ex, blocks = 1, rows = 1, enemies = 1, enemySpacing = math.pi*0.15, rowOffset = 0, blockSpacing = nil, initialAngle = 0, initialDistance = 250, distanceIncrement = 16, spawnParams = enemyParams, expeditable = true}
        table.insert(self.waves, extraWave)
      end
    elseif extraWaveType == "spawner" then
      blockCount = math.random(1, math.floor(util.clamp(levelNumber / 4, 1, 4)))
      local enemyParams = {type = "spawner", speed = 50, fireTimer = 1, pathType = "Sequence", pathPercent = 0.5, params = {spawnLimit = math.random(6, levelNumber+6)}}
      for i = 1, blockCount, 1 do
        enemyParams.pathIndex = i
        local extraWave = {delay = util.clamp(math.random(20-levelNumber,20), 1, 20) + i * 2+15 * ex, blocks = 1, rows = 1, enemies = 1, enemySpacing = math.pi*0.15, rowOffset = 0, blockSpacing = nil, initialAngle = 0, initialDistance = 250, distanceIncrement = 16, spawnParams = copy(enemyParams), expeditable = true}
        table.insert(self.waves, extraWave)
      end
    elseif extraWaveType == "driller" then
      local enemyParams = {type = "driller", speed = 50, r = 15, params = {flipTimer = 2}}
      totalEnemies = math.random(1, math.ceil(levelNumber * 0.3))
      local delayIncrement = 8 - util.clamp((5 * levelNumber/10), 2, 8)
      for i = 1, totalEnemies, 1 do
        enemyParams.targetD = math.random(120,195)
        local extraWave = {delay = util.clamp(math.random(20-levelNumber,20), 1, 20) + i * delayIncrement+15 * ex, blocks = 1, rows = 1, enemies = 1, enemySpacing = math.pi*0.15, rowOffset = 0, blockSpacing = nil, initialAngle = math.random() * 2 * math.pi, initialDistance = 250, distanceIncrement = 16, spawnParams = copy(enemyParams), expeditable = true}
        table.insert(self.waves, extraWave)
      end
    end
  end
end

function SelectRandomEnemy(conditions)
  local enemyIndices = {}
  for i = 1, #self.enemies, 1 do
    if conditions == nil then
      table.insert(enemyIndices, i)
    else 
      local conditionsMet = true
      for k,v in pairs(conditions) do
        if self.enemies[i][k] ~= conditions[k] then
          conditionsMet = false
          break
        end
      end
      if conditionsMet then
        table.insert(enemyIndices, i)
      end
    end
  end
  
  if #enemyIndices == 0 then
    return nil
  else
    local rChoice = util.randomChoice(enemyIndices)
    return self.enemies[rChoice]
  end
end

function SelectRandomLivingEnemy()
  local livingIndices = {}
  for i = 1, #self.enemies, 1 do
    if self.enemies[i].alive then
      table.insert(livingIndices, i)
    end
  end
  
  if #livingIndices == 0 then
    return nil
  else
    local rChoice = util.randomChoice(livingIndices)
    return self.enemies[rChoice]
  end
end

function UpdateShipWorldPosition()
  local recoilOffset = {0,0}
  local recoilMax = 5
  
  if self.ship.recoil > 0 then
    local t = util.clamp(self.ship.recoil * self.ship.recoil * self.ship.recoil, 0, 1)
    recoilOffset = {math.cos(self.ship.angularPosition) * recoilMax * t, math.sin(self.ship.angularPosition) * recoilMax * t}
  end
  
  self.ship.pos[1] = math.cos(self.ship.angularPosition) * (self.world.radius + 3) + self.world.pos[1] - recoilOffset[1]
  self.ship.pos[2] = math.sin(self.ship.angularPosition) * (self.world.radius + 3) + self.world.pos[2] - recoilOffset[2]
end

function SpawnBarrier(position, angle)
  for _,b in pairs(self.barriers) do
    if b.alive == false then
      b.pos = position
      b.r = 3
      b.angle = angle
      b.alive = true
	  return
    end
  end

   local newBarrier = { pos = position,
		   r = 3,
       angle = angle,
		   alive = true}
		   
    table.insert(self.barriers, newBarrier)
end

function UpdateLevelTransition(dt)
  local prevTime = self.levelTransitionTime
  self.levelTransitionTime = self.levelTransitionTime - dt
  
  local t1, t2 = 1, 1;
  if self.levelTransitionTime >= 1 then
    t1 = (self.levelTransitionTime - 1)
    t1 = t1 * t1 * t1
    self.canvas:drawText("Level: ", {position = {225, 300}, horizontalAnchor = "right", verticalAnchor = "mid"}, 24 + t1 * 12, "green")  
  elseif self.levelTransitionTime <= 1 then
    t2 = util.clamp(self.levelTransitionTime,0,1)
    t2 = t2 * t2
    self.canvas:drawText("Level: ", {position = {225, 300}, horizontalAnchor = "right", verticalAnchor = "mid"}, 24, "green") 
    self.canvas:drawText(tostring(self.level), {position = {225, 300}, horizontalAnchor = "left", verticalAnchor = "mid"}, 24 + t2 * 12, "green") 
  end
  
  local barrierBlocks = 5
  local barriersPerBlock = self.barrierLevel
  for bEvent = 0, barriersPerBlock-1, 1 do
    local spawnTime = (1.8) / barriersPerBlock * bEvent + 0.2
    if prevTime > spawnTime and self.levelTransitionTime < spawnTime then
      for barrier = 0, barrierBlocks-1, 1 do
        local angle = barrier * math.pi * 2 / barrierBlocks + bEvent * math.pi * 0.05
        local pos = {math.cos(angle) * 45 + self.world.pos[1], math.sin(angle) * 45 + self.world.pos[2]}
        SpawnBarrier(pos, angle)
      end
    end
  end

  if self.levelTransitionTime < -1 then
    self.levelPhase = "attack"
    widget.setText("levelLabel", "Level: " .. tostring(self.level))
  end
  
end

function UpdateUpgrades(dt, firing)
  local upgradePolies = {self.machineGunPoly, self.shotgunPoly, self.boomerangPoly, self.flakCannonPoly, self.ship.shipPoly, self.barrierPoly}
  local angleSpacing = math.pi * 2 / #upgradePolies
  local selectedUpgrade = math.floor(wrapAngle(self.ship.angularPosition) / angleSpacing + angleSpacing * 0.5) % #upgradePolies
  local lineLength = util.clamp(self.levelElapsedTime*self.levelElapsedTime*self.levelElapsedTime,0,1) * (180 - self.world.radius - 20) + self.world.radius + 20
  
  for i = 0, #upgradePolies-1,1 do
    local angle = angleSpacing * i
    local position = { math.cos(angle) * 150 + self.world.pos[1], math.sin(angle) * 150 + self.world.pos[2] }
    local scale = (i == selectedUpgrade) and  math.sin(self.levelElapsedTime*5) * 0.5 + 1.5 or 1
    local color = (i == selectedUpgrade) and "yellow" or "white"
    
    if (i) == 5 and self.barrierLevel >= 8 then
      color = {120,120,120}
      scale = 0.8
    end
    
    if self.levelElapsedTime > 1 then
      drawPolyWithTransforms(upgradePolies[i+1], color, position, _, scale)
    end
    
    local lineVec = {math.cos(angle + angleSpacing * 0.5), math.sin(angle + angleSpacing * 0.5)}
    self.canvas:drawLine(vec2.add(vec2.mul(lineVec, self.world.radius + 20), self.world.pos), vec2.add(vec2.mul(lineVec, lineLength), self.world.pos))
    self.canvas:drawLine(vec2.add(vec2.mul(lineVec, self.world.radius + 20), self.world.pos), vec2.add(vec2.mul(lineVec, lineLength), self.world.pos))
  end
  
   self.canvas:drawText("Choose an Upgrade!", {position = {200, 5}, horizontalAnchor = "mid", verticalAnchor = "bottom"}, 36, "green")  
  if self.levelElapsedTime > 1 and firing then
    if (selectedUpgrade == 5 and self.barrierLevel >= 8) == false then
      DoAnUpgrade(selectedUpgrade)
      GenerateWaves(self.level)
    end
  end
end

function DoAnUpgrade(upgrade)
  if upgrade == 0 then --machinegun
    self.weaponMachineGun.cooldown = self.weaponMachineGun.cooldown * 0.85
  elseif upgrade ==  1 then --shotgun
    self.weaponShotGun.shotCount = self.weaponShotGun.shotCount + 1
  elseif upgrade ==  2 then --boomerang
    self.weaponBoomerang.cooldown = self.weaponBoomerang.cooldown * 0.85
  elseif upgrade ==  3 then --flak
    self.weaponFlakCannon.bulletConfig.expireBurst = self.weaponFlakCannon.bulletConfig.expireBurst + 1
    self.weaponFlakCannon.bulletConfig.expireBurstBullet.maxLife = self.weaponFlakCannon.bulletConfig.expireBurstBullet.maxLife + 0.01
  elseif upgrade == 4 then --ship
    self.lives = self.lives + 1
    widget.setText("livesLabel", "Lives: " .. tostring(self.lives))
  elseif upgrade == 5 then --barrior
    self.barrierLevel = self.barrierLevel + 1
  end
  pane.playSound(self.sounds.upgrade1)
end

function UpdateWeaponSwitcher(dt)
  if self.weaponSwitchTimer > 0 then self.weaponSwitchTimer = util.clamp(self.weaponSwitchTimer - dt, 0, 1) end
  local iconPos = self.world.pos
  local iconFireT = self.ship.weapon.time / self.ship.weapon.cooldown
  
  local iconScale = self.weaponSwitchTimer / 0.2
  iconScale = iconScale * iconScale * iconScale + 1 - iconFireT * 0.5
  
  drawPolyWithTransforms(self.weaponPolyCollection[self.selectedWeapon], {255,255,iconFireT * 155 + 100,150+25*iconFireT}, iconPos, _, iconScale)
end

function SwitchWeapon(forward)
  local indexChange = forward and 1 or -1
  
  self.selectedWeapon = self.selectedWeapon + indexChange
  if self.selectedWeapon <= 0 then self.selectedWeapon = 4 end
  if self.selectedWeapon > 4 then self.selectedWeapon = 1 end
  
  self.ship.weapon = self.weaponCollection[self.selectedWeapon]
  self.weaponSwitchTimer = 0.2
  pane.playSound(self.sounds.bweep1)
end

--shotCount, offset, spread, deviation, cooldown 
function FireWeapon(weapon, owner)
  local shotCount = weapon.shotCount or 1
  local isEnemy = (owner ~= self.ship)
  
  if weapon.sound ~= nil and self.sounds[weapon.sound] ~= nil then
    pane.playSound(self.sounds[weapon.sound])
  end
  
  for i = 1, shotCount, 1 do
    local fireAngle = self.ship.angularPosition
    if weapon.offset then
      fireAngle = fireAngle + weapon.offset
    end
    
    if weapon.spread then
      fireAngle = fireAngle + weapon.spread * i - weapon.spread * shotCount * 0.5
    end
    
    if weapon.deviation then
      fireAngle = fireAngle + math.random() * weapon.deviation * 2 - weapon.deviation
    end
    
    fireAngle = wrapAngle(fireAngle)
    spawnBulletWithConfig(owner.pos, fireAngle, isEnemy, weapon.bulletConfig)
  end
  
  if owner.recoil ~= nil and weapon.recoil ~= nil then
    owner.recoil = owner.recoil + weapon.recoil
  end
  weapon.time = weapon.cooldown or 0.35
end 

function CanWeaponFire(weapon)
  return weapon.time <= 0
end

function HitPlayer()
  if isShipInvul(self.ship) == false then
    if self.lives <= 0 then
      self.state:set(scoreScreenState)
      pane.playSound(self.sounds.defeat, 0, 0.8)
    else
      self.ship.invulTimer = 1
      self.lives = self.lives - 1
      widget.setText("livesLabel", "Lives: " .. tostring(self.lives))
      self.ship.shake = self.ship.shake + 1
      pane.playSound(self.sounds.playerhit)
    end
  end
end

function CreateWorld(radius)
  local world = {}
  world.worldPoly = {}
  world.radius = radius
  world.pos = {200,200}
  
  for i = 0, 11, 1 do
    local angle = (math.pi / 6) * i
    table.insert(world.worldPoly, {math.cos(angle) * world.radius, math.sin(angle) * world.radius} );
  end
  return world;
end 

function maxShipsByWidth(worldRadius, shipWidth)
  local c = math.pi * 2 * worldRadius
  return math.floor(c / shipWidth)
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
    return {120,120,255,200}
  else
    return {100,100,200,150}
  end
end

function DestroyEnemy(enemy, ignoreReward)
  if enemy.alive then
    self.livingEnemyCount = self.livingEnemyCount - 1
    
    if ignoreReward ~= true then
      local scoreGained = 5
      if enemy.type ~= nil then
        if self.enemyPointValues[enemy.type] ~= nil then scoreGained = self.enemyPointValues[enemy.type] end
      end
      self.score = self.score + scoreGained
      widget.setText("scoreLabel", tostring(self.score))

      if enemy.type == "base" then
        pane.playSound(self.sounds.shipdestroyed1)
      else
        pane.playSound(self.sounds.shipdestroyed2)
      end
    end
  end
  enemy.alive = false
  
  if AreAllEnemiesDead() then
    self.level = self.level + 1
    EndLevel()
    if self.level % 3 == 0 then
      self.levelPhase = "upgrade"
    else
      GenerateWaves(self.level)
    end
  end
end

function IncreaseSpeedMod()
  local speedModDelta = 0.02 + util.clamp(self.level, 1, 10) / 10 * 0.03
  self.speedModifier = util.clamp(self.speedModifier + speedModDelta, 1, 3)
end

function AreAllEnemiesDead()
  if #self.waves > 0 then
    return false
  end
  
  return self.livingEnemyCount <= 0
end

function angleDifference(angle1, angle2)
  local d = angle1 - angle2

  if d > math.pi then
    d = d - math.pi * 2
  elseif d < -math.pi then
    d = d + math.pi * 2
  end
  return d
end

function offScreenSquare(pos)
  return pos[1] < 0 or pos[1] > 400 or pos[2] < 0 or pos[2] > 400   
end

function createReward()
  local reward = {}
  local pixelRewardAmount = (self.level-1) * 10
  if self.level > 3 then pixelRewardAmount = pixelRewardAmount + math.floor(self.score / 150) end
  
  local pixelReward = {item = "money", count = pixelRewardAmount, givenOut = 0}
  table.insert(reward, pixelReward)
  
  local salvageRewardTable = {"salvagearm", "salvagebody", "salvagelegs", "salvagebooster", "salvagetier4", "salvagetier5", "salvagetier6"}
  local limit = math.min( math.floor((self.level-1)/2), #salvageRewardTable)
  
  if limit > 0 then
    for i = 1, limit, 1 do
      table.insert(reward, {item = salvageRewardTable[i], count = 1 + math.floor((self.level-1)/(3 * #salvageRewardTable) ), givenOut = 0})
    end
  end
  
  return reward
end