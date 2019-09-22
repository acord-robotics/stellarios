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
  
  pane.playSound(self.sounds.startup2, 0, 0.5)

  self.level = 1
  self.lives = 3
  self.score = 0
  self.pendingScore = 0
  self.stageCompleteTimer = 0
  
  self.particles = {}
  self.missiles = {}
  self.ships = {}
  self.explosions = {}
  self.missileWave = {}
  
  self.groundPoly = {}
  CreateRandomTerrain()
  
  self.titleTreePoly = {{-55,0}, {-58,7}, {-60, 14}, {-57,25}, {-50, 30}, {-47, 35}, {-45, 42}, {-44, 46}, {-49, 49}, {-54, 58}, {-65, 59}, {-70, 67}, {-78, 68}, {-86, 75}, {-77, 71}, {-70, 71}, {-65, 68}, {-55, 69}, {-50, 70}, {-45,70},
                        {-65, 80}, {-65, 87}, {-60, 80}, {-42, 77}, {-35, 61}, {-42, 72}, {-44, 80}, {-46, 85}, {-44, 90}, {-30, 95}, {-25, 100}, {-20, 110}, {-25, 112}, {-30, 116}, {-32, 125},  {-28,115}, {-15, 114}, {-5, 120}, {-2, 125}, {-3, 115},
						{-12, 107}, {-15,100},{-20,90},{-25,85}, {0, 65},{-12, 75}, {0, 75}, {30, 85}, {40, 88}, {50, 91}, {75, 90}, {80, 95}, {81, 105}, {83, 94}, {84, 86}, {90, 85}, {97, 89}, {90, 80}, {80, 81}, {70, 80}, {50, 70},{40, 65}, {30,55},
						{40, 65}, {50, 64}, {60, 57}, {76, 65}, {60, 52}, {50, 55}, {42, 50}, {49, 35},{56,15},{55,0}}
  
  self.titleTreeLeaves1 = {{-78, 65}, {-83, 67}, {-89, 64}, {-96, 70}, {-100, 73}, {-102, 76}, {-100, 80}, {-98, 81}, {-94, 82}, {-90, 78}, {-85, 82}, {-79, 76}, {-74, 79}, {-70, 75}, {-72, 69}}
  self.titleTreeLeaves2 = {{-58, 80}, {-63, 82}, {-69, 80}, {-76, 84}, {-80, 84}, {-82, 91}, {-80, 95}, {-78, 96}, {-74, 97}, {-70, 93}, {-65, 97}, {-59, 91}, {-54, 94}, {-50, 90}, {-52, 84}}
  self.titleTreeLeaves3 = {{-18, 120}, {-23, 122}, {-29, 120}, {-36, 120}, {-40, 123}, {-38, 132}, {-35, 133}, {-28, 132}, {-24, 130}, {-20, 133},{-17,134},{-15, 135}, {-8, 131}, {0, 134}, {8, 132}, {9,129}, {7, 124}, {2, 119},{-2,122},{-8, 122}}
  self.titleTreeLeaves4 = {{80, 96}, {75, 101}, {70, 108}, {73,111}, {85, 114}, {90,110}, {95,112}, {97, 105}, {95, 100}, {96, 95}, {104, 94}, {105, 88}, {103, 80}, {97, 82}, {95, 85}, {94, 89}, {92, 90}, {88, 95}, {84, 96}}
  self.titleTreeLeafPoly = {{0,0},{-2,0}, {2,1}}
  
  self.buildingPoly1 = {{-6,0}, {-6, 12}, {-2, 16}, {-2, 30}, {6, 30}, {6,18}, {6, 0}}
  self.buildingPoly2 = {{-7,0}, {-7, 8}, {-2, 12}, {-2, 20}, {-7, 24}, {-7, 40}, {7,35}, {7,0}}
  self.buildingPoly3 = {{-3,0}, {-3, 10}, {-7,10}, {-7, 25}, {-4, 25}, {-4, 31}, {-7,31}, {-7,40}, {7, 40}, {7,0}}
  self.buildingPoly4 = {{-6,0}, {-6, 45}, {6, 33}, {6, 28}, {2,28}, {2, 23}, {6,23}, {6,0}}
  self.rubblePoly = {{-8,0},{-4,6}, {-2,7}, {0,2}, {3,5}, {5,4}, {8,0}}
  
  self.siloPoly = {{0,8}, {4,7}, {6,5},{7.5,2},{8,0},{7.5,-2},{6,-5},{4,-7},{0,-8},{-4,-7},{-6,-5},{-7.5,-2},{-8,0},{-7.5,2},{-6,5},{-4,7}, {0,8}}
  self.siloDoorPoly = {{0,8},{-2,0}, {2,0}, {0,-8},{2,0}, {-2,0}}
  
  self.buildingPolys = {self.buildingPoly1, self.buildingPoly2,self.buildingPoly3,self.buildingPoly4}
  
  self.buildingLocations = { {60,10}, {90, 6}, {180,9}, {220, 8}, {310, 8}, {340, 10} }
  self.buildings = {math.random(1,4),math.random(1,4),math.random(1,4),math.random(1,4),math.random(1,4),math.random(1,4)}
  self.launchSites = {{pos = {30, 20}, ammoDisplayPos = {10,10}, ammo = 10, alive = true}, {pos = {200,20}, ammoDisplayPos = {240,10}, ammo=10, alive = true}, {pos={370,20}, ammoDisplayPos = {385,10}, ammo = 10, alive = true}}
  self.targetPoly = {{0,0}, {4,0}, {-4,0}, {0,0}, {0,4}, {0,-4}}
  self.cursorPos = {200,150}
  self.cursorSpeed = 300
  self.cursorPoly = {{4, 0}, {10,2}, {10,-2},  {-4,0}, {-10,2}, {-10,-2},  {0,4}, {2,10}, {-2,10},  {0,-4}, {2,-10}, {-2,-10}}
  
  self.bomberPoly = {{-7, 0}, {-5, 5}, {5,5}, {7,0}, {5, -5}, {4.5,0}, {-4.5,0}, {-5,-5} }
  self.zoomerPoly = {{0,6}, {4,5}, {6,3},{7.5,0.5},{8,0},{7.5,-0.5},{6,-3},{4,-5},{0,-6},{-4,-5},{-6,-3},{-7.5,-0.5},{-8,0},{-7.5,0.5},{-6,3},{-4,5}, {0,6}}
  self.zoomerEyePoly = {{0,6}, {-3,0}, {0,-6}, {3,0}}
  
  self.playerColor = "blue"
  self.enemyColor = "red"
  self.explosionColor = {255,255,0}
  self.explosionColorTimer = 0
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
	self.color = "blue"
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
  local copyrightText = "Starboy, Inc\nc. 2080"
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
	
    self.canvas:drawText(copyrightText, {position = pos, horizontalAnchor = "mid", verticalAnchor = "mid"}, 24, "blue")
    
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
  local titleText = "Protectorate\nDefense"
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
  local petalSpawnPositions = {{110,75}, {130,90}, {180,125}, {280, 100}, {270, 65}}

  while true do 
    self.canvas:clear()
	
	for _,press in pairs(takeKeyEvents()) do
	  local key, down = press[1], press[2]
	  if down then
	    if elapsedTime >= titleScrollDuration then
		  pane.playSound(self.sounds.startup)
		  self.level = 1
          self.lives = 3
          self.score = 0
		  self.state:set(gameState)
		end
	  end
	end
	
	if t < 1 then
	  elapsedTime = util.clamp(elapsedTime + script.updateDt(), 0, titleScrollDuration)
	  t = elapsedTime / titleScrollDuration
	  --pos[2] = util.lerp(t, 330, 220)
	end
    
	petalTimer = petalTimer + script.updateDt()
	if petalTimer >= 2 then
	  petalTimer = 0
	  local randomPetalPos = vec2.add(util.randomChoice(petalSpawnPositions), {math.random(-20,20), math.random(-7,7)})
	  spawnParticle(randomPetalPos, {-math.random(10,25),-math.random(2,10)}, 15, self.titleTreeLeafPoly)
	end
	
	explosionDelay = explosionDelay + script.updateDt()
	
	if explosionDelay >= 0.75/numOfExplosions and explosionIndex < numOfExplosions then
	  explosionDelay = 0
	  spawnExplosion(vec2.add(pos, {explosionIndex * expSpawnSpacing - 150, 20}), 40, 3, true)
	  spawnExplosion(vec2.add(pos, {explosionIndex * -expSpawnSpacing + 150, -20}), 40, 3, true)
	  explosionIndex = explosionIndex + 1
	end
	
	self.canvas:drawPoly(poly.translate(self.titleTreePoly, {200,0}), {52,25,0}, 2)
	self.canvas:drawPoly(poly.translate(self.titleTreeLeaves1, {200,0}), {255,175,175}, 2)
	self.canvas:drawPoly(poly.translate(self.titleTreeLeaves2, {200,0}), {255,175,175}, 2)
	self.canvas:drawPoly(poly.translate(self.titleTreeLeaves3, {200,0}), {255,175,175}, 2)
	self.canvas:drawPoly(poly.translate(self.titleTreeLeaves2, {340,-23}), {255,175,175}, 2)
	self.canvas:drawPoly(poly.translate(self.titleTreeLeaves4, {200,0}), {255,175,175}, 2)
	if t >= 1 then
      self.canvas:drawText(titleText, {position = pos, horizontalAnchor = "mid", verticalAnchor = "mid"}, 44, "blue")
	end
	
	updateParticles(script.updateDt())
	updateExplosions(script.updateDt())
	
	if elapsedTime >= titleScrollDuration then
	  blinkTimer = (blinkTimer + script.updateDt()) % blinkCycle
	  if blinkTimer > blinkCycle * 0.5 then
	    self.canvas:drawText(pressKeyText, {position = pos2, horizontalAnchor = "mid", verticalAnchor = "mid"}, 20, "blue")
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
  widget.setVisible("levelLabel", false)
  
  self.explosions = {}
  self.missiles = {}
  self.ships = {}
  pane.playSound(self.sounds.defeat)
  
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

	self.canvas:drawText(scoreText, {position = pos, horizontalAnchor = "mid", verticalAnchor = "top"}, 40, "blue")
    self.canvas:drawText("High Scores: ", {position = {200, 180}, horizontalAnchor = "mid", verticalAnchor = "top"}, 40,  "blue")
    colorTimer = (colorTimer + script.updateDt()) % colorCycle
	for i = 1, 3, 1 do
	  if scoreTable[i] ~= nil then
	    local t = colorTimer / colorCycle
	    local color = (i == indexOnHighscore) and ColorFromHSL(t, 0.5, 0.5) or  "blue"
		self.canvas:drawText(tostring(i) .. ". " .. scoreTable[i].name .. "  " .. tostring(scoreTable[i].score), {position = {200, 148 - i * 32}, horizontalAnchor = "mid", verticalAnchor = "mid"}, 30, color)
	  else
		self.canvas:drawText(tostring(i) .. ". ???  0", {position = {200, 148 - i * 32}, horizontalAnchor = "mid", verticalAnchor = "mid"}, 30, "blue")
	  end 
	end
	
	elapsedTime = util.clamp(elapsedTime + script.updateDt(), 0, blinkDelay)
	
	if elapsedTime >= blinkDelay and isRewardComplete(reward) then
	  blinkTimer = (blinkTimer + script.updateDt()) % blinkCycle
	  if blinkTimer > blinkCycle * 0.5 then
	    self.canvas:drawText(pressKeyText, {position = pos2, horizontalAnchor = "mid", verticalAnchor = "bottom"}, 20,  "blue")
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
   local cursorTris = getCursorTris(poly.translate(self.cursorPoly, self.cursorPos))
   
   self.particles = {}

   ResetBuildings()
   ResetSilos()
   GenerateWaveData()
   widget.setText("scoreLabel", tostring(self.score))
   widget.setText("levelLabel", "Level: "..tostring(self.level))
   widget.setVisible("scoreLabel", true)
   widget.setVisible("levelLabel", true)
   local leftHeld, rightHeld, upHeld, downHeld = false,false,false,false
   local anyKeyPressed = false
   while true do 
    anyKeyPressed = false
    for _,press in pairs(takeKeyEvents()) do
	  local key, down = press[1], press[2]
	  if down then anyKeyPressed = true end
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
	  
	  if key == 21 or key == 71 then
	    if down and self.launchSites[1].alive then
		  if self.launchSites[1].ammo > 0 then
	        spawnMissile(self.launchSites[1].pos, self.cursorPos, 200, true)
		    self.launchSites[1].ammo = self.launchSites[1].ammo - 1
		    pane.playSound(self.sounds.missilelaunch,0,0.6)
			if self.launchSites[1].ammo == 0 then pane.playSound(self.sounds.ammoempty, 3, 1) end
	      else
		    pane.playSound(self.sounds.ammoempty)
		  end
		end
	  end
	  
	  if key == 22 or key == 72  then
	    if down and self.launchSites[2].alive then
          if self.launchSites[2].ammo > 0 then
	        spawnMissile(self.launchSites[2].pos, self.cursorPos, 300, true)
		    self.launchSites[2].ammo = self.launchSites[2].ammo - 1
		    pane.playSound(self.sounds.missilelaunch,0,0.6)
			if self.launchSites[2].ammo == 0 then pane.playSound(self.sounds.ammoempty, 3, 1) end
	      else
		    pane.playSound(self.sounds.ammoempty)
		  end
		end
	  end
	  
	  if key == 23 or key == 73  then
	    if down and self.launchSites[3].alive then
		  if self.launchSites[3].ammo > 0 then
	        spawnMissile(self.launchSites[3].pos, self.cursorPos, 200, true)
		    self.launchSites[3].ammo = self.launchSites[3].ammo - 1
		    pane.playSound(self.sounds.missilelaunch,0,0.6)
			if self.launchSites[3].ammo == 0 then pane.playSound(self.sounds.ammoempty, 3, 1) end
	      else
		    pane.playSound(self.sounds.ammoempty)
		  end
		end
	  end
	  
	 -- if key == 5 and down then
	 --   self.level = self.level + 1
	--	widget.setText("levelLabel", tostring(self.level))
	 -- end
	  
	 -- if key == 24 and down then
	 --    self.state:set(scoreScreenState)
	 -- end
    end
   
     if upHeld then
	   self.cursorPos[2] = self.cursorPos[2] + self.cursorSpeed * script.updateDt() 
	 elseif downHeld then
	   self.cursorPos[2] = self.cursorPos[2] - self.cursorSpeed * script.updateDt()
	 end
   
     if leftHeld then
	   self.cursorPos[1] = self.cursorPos[1] - self.cursorSpeed * script.updateDt() 
	 elseif rightHeld then
	   self.cursorPos[1] = self.cursorPos[1] + self.cursorSpeed * script.updateDt()
	 end
     
     
     if leftHeld or rightHeld or upHeld or downHeld then
	   self.cursorPos = clampPosition(self.cursorPos)
	   cursorTris = getCursorTris(poly.translate(self.cursorPoly, self.cursorPos))
	 end
     
     self.canvas:clear()
	 
	 --widget.setText("livesLabel", tostring(areAllMissilesDestroyed()))
	 --widget.setText("scoreLabel", tostring(areAllStructuresDestroyed()))
	 --widget.setText("testLabel", tostring(shipVel[1])..","..tostring(shipVel[2]))
     --widget.setText("testLabel", tostring(shipAngle))
	  
	 self.canvas:drawTriangles(self.groundTris, {0,150,0})
	 self.canvas:drawPoly(self.groundPoly, "green", 2.0)
	 drawStructures()
	 --self.canvas:drawPoly(poly.translate(self.buildingPoly2, self.building2.pos), "white", 2)
	 --self.canvas:drawPoly(poly.translate(self.buildingPoly3, self.building3.pos), "white", 2)
	 --self.canvas:drawPoly(poly.translate(self.buildingPoly4, self.building4.pos), "white", 2)

     updateWaveSpawns(script.updateDt())
	 updateShips(script.updateDt())
	 updateMissiles(script.updateDt())
	 updateExplosions(script.updateDt())
	 
	 self.canvas:drawTriangles(cursorTris, {255,255,0,100})
	 
   if areAllMissilesDestroyed() and areAllStructuresDestroyed() == false then
     self.state:set(stageCompleteSubState)
   end
   coroutine.yield()
   end
end

function stageCompleteSubState()
   local elapsedTime = 0
   local buildingScore = structuresAlive() * 150
   local ammoScore = ammoRemaining() * 25
   local structureCount = 0
   local ammoCount = 0
   local stageScoreTotal = self.score
   local timer = 0
   local scoreElementDelay = 0.25
   local phase = 1
   local survivingStructIndices = getLivingStructIndices()

   --widget.setText("scoreLabel",testString)
   --widget.setText("livesLabel",tostring(structuresAlive()))
   while true do
     elapsedTime = elapsedTime + script.updateDt()
	 timer = timer + script.updateDt()
     self.canvas:clear()
	 
	 self.canvas:drawTriangles(self.groundTris, {0,150,0})
	 self.canvas:drawPoly(self.groundPoly, "green", 2.0)
	 drawStructures()
	 updateShips(script.updateDt())
	 updateMissiles(script.updateDt())
	 updateExplosions(script.updateDt())
	 self.canvas:drawText("Stage Complete", {position = {200,260}, horizontalAnchor = "mid", verticalAnchor = "mid"}, 20, "blue")
     --self.canvas:drawText("Missiles Destroyed: "..tostring(self.pendingScore), {position = {200,200}, horizontalAnchor = "mid", verticalAnchor = "mid"}, 20, "blue")
	 
	 if phase == 1 then
	   if elapsedTime >= 2 then phase = 2 end
	 end
	 
	 if phase >= 3 then
	   if timer >= scoreElementDelay * 0.33 and phase == 3 then
	     if ammoCount < ammoRemaining() then
		   ammoCount = ammoCount + 1
		   self.score = self.score + 20
		   pane.playSound(self.sounds.bonusscore, 0.8)
		 else phase,elapsedTime = 4, 0 end
	     timer = 0
	   end
	   
	   self.canvas:drawText("Ammo Remaining: ", {position = {200,140}, horizontalAnchor = "right", verticalAnchor = "mid"}, 20, "blue")
	   local totalHeight = math.floor((ammoRemaining()-1)/10) * 10
	   local heightBalance = totalHeight * 0.5
	   for a = 0, ammoCount-1, 1 do
	     self.canvas:drawRect({197 + 10 * (a%10), 145 + heightBalance - math.floor(a/10) * 10, 203 + 10 * (a%10), 140 + heightBalance - math.floor(a/10)*10}, "white")
	   end
	 end
	 
	 if phase >= 2 then
	   if timer >= scoreElementDelay and phase == 2 then
	     if structureCount < structuresAlive() then
		   structureCount = structureCount + 1
		   self.score = self.score + 1000
		   pane.playSound(self.sounds.bonusscore)
		 else phase = 3 end
	     timer = 0
	   end
	 
	   self.canvas:drawText("Buildings Saved: ", {position = {200,180}, horizontalAnchor = "right", verticalAnchor = "mid"}, 20, "blue")
	   local offsetBuildingPos = {185,175}
	   local buildingStyle = 1
	   for b = 1, structureCount, 1 do
	     offsetBuildingPos[1] = offsetBuildingPos[1] + 20
		 if survivingStructIndices[b] <= 3 then
	       self.canvas:drawPoly(poly.translate(self.siloPoly, vec2.add(offsetBuildingPos, {0,8})), "white", 1)
		   self.canvas:drawPoly(poly.translate(self.siloDoorPoly, vec2.add(offsetBuildingPos, {0,8})), "yellow", 1)
	     else
		   buildingStyle = self.buildings[survivingStructIndices[b]-3]
		   self.canvas:drawPoly(poly.translate(self.buildingPolys[buildingStyle], offsetBuildingPos), "white", 2)
		 end
	   end
	 end
	 
	 self.canvas:drawText("Score: ", {position = {200,100}, horizontalAnchor = "right", verticalAnchor = "mid"}, 20, "blue")
	 self.canvas:drawText(tostring(self.score), {position = {200,100}, horizontalAnchor = "left", verticalAnchor = "mid"}, 20, "blue")
	 if phase >= 4 and elapsedTime > 1.5 then
	   break
	 end
	 coroutine.yield() 
  end
  
  self.pendingScore = 0
  GenerateWaveData()
  CreateRandomTerrain()
  self.level = self.level + 1
  widget.setText("levelLabel", "Level: "..tostring(self.level))
  self.state:set(gameState)
  pane.playSound(self.sounds.startup)
end

function drawStructures()
 self.canvas:drawTriangles(self.groundTris, {0,150,0})
 self.canvas:drawPoly(self.groundPoly, "green", 2.0)
 for b = 1, 6, 1 do
   local buildingStatePoly = (self.buildings[b] > 0 and self.buildingPolys[self.buildings[b]]) or self.rubblePoly 
   local buildingColor = (self.buildings[b] > 0 and "white") or {220,220,220} 
   self.canvas:drawPoly(poly.translate(buildingStatePoly, self.buildingLocations[b]), buildingColor, 2)
 end
 
 for siloIndex = 1, 3, 1 do
   if self.launchSites[siloIndex].alive then
	 self.canvas:drawPoly(poly.translate(self.siloPoly, self.launchSites[siloIndex].pos), "white", 1)
	 self.canvas:drawPoly(poly.translate(self.siloDoorPoly, self.launchSites[siloIndex].pos), "yellow", 1)
	 self.canvas:drawText(tostring(self.launchSites[siloIndex].ammo), {position = self.launchSites[siloIndex].ammoDisplayPos, horizontalAnchor = "mid", verticalAnchor = "mid"}, 12, "white")
   else
	 self.canvas:drawPoly(poly.translate(self.rubblePoly, self.launchSites[siloIndex].pos), {220,220,220}, 1)
   end
 end
end

function spawnMissile(position, target, travelSpeed, friendly)
    for _,m in pairs(self.missiles) do
    if m.alive == false then
	  m.pos = {position[1], position[2]}
      m.targetPos = {target[1], target[2]}
	  m.startPos = {position[1], position[2]}
	  m.speed = travelSpeed
      m.r = 1
	  m.playerOwned = friendly
	  m.alive = true
	  m.clusters = nil
	  return m
    end
  end

   local newMissile = { pos = {position[1], position[2]},
           targetPos = {target[1], target[2]},
		   startPos = {position[1], position[2]},
		   speed = travelSpeed,
		   r = 1,
		   playerOwned = friendly,
		   alive = true}
    
    table.insert(self.missiles, newMissile)
	return newMissile
end

function GenerateClustersFromMissile(missile)
  local clusterCount = math.random(1,3)
  local dropHeight = math.random(200,250)
  local clusterData = {}
  local livingStructs = getLivingStructIndices()
  local randomTargets = getRandomIndicesWithoutDuplicates(livingStructs, clusterCount)
  
  for key,_ in pairs(randomTargets) do
	dropHeight = dropHeight - math.random(10, 30)
	clusterData[dropHeight] = livingStructs[key]
  end
	
  return clusterData
end

function spawnExplosion(position, finalRadius, fullDuration, friendly)
  for _,e in pairs(self.explosions) do
    if e.alive == false  then
	  e.pos = position
      e.r = 0
	  e.finalR = finalRadius
	  e.duration = fullDuration
	  e.lifeTime = 0
	  e.playerOwned = friendly
	  e.alive = true
	  pane.playSound(self.sounds.missileexplosion, 0, 0.7)
	  return
    end
  end

  local newExplosion = {pos = position,
      r = 0,
	  finalR = finalRadius,
	  duration = fullDuration,
	  lifeTime = 0,
	  playerOwned = friendly,
	  alive = true}
  pane.playSound(self.sounds.missileexplosion, 0, 0.7)
  table.insert(self.explosions, newExplosion)
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

function spawnShip(position, shipType, travelSpeed, shotCooldown, shotStartDelay)
    for _,s in pairs(self.ships) do
    if s.alive == false then
	  s.pos = {position[1], position[2]}
	  s.speed = travelSpeed
      s.r = 6
	  s.type = shipType
	  s.cooldown = shotCooldown
	  s.timer = -shotStartDelay
	  s.alive = true
	  pane.playSound(self.sounds.shiploop)
	  return s
    end
  end

   local newShip = { pos = {position[1], position[2]},
		   speed = travelSpeed,
		   r = 6,
		   type = shipType,
		   cooldown = shotCooldown,
		   timer = -shotStartDelay,
		   alive = true}
    pane.playSound(self.sounds.shiploop)
    table.insert(self.ships, newShip)
	return newShip
end

function updateMissiles(dt)
  for _,missile in pairs(self.missiles) do
     if missile.alive then
	   local mColor = missile.playerOwned and self.playerColor or self.enemyColor
	   missile.pos = vec2.approach(missile.pos, missile.targetPos, missile.speed * dt)
	   self.canvas:drawRect({ missile.pos[1]+1, missile.pos[2]+1, missile.pos[1]-1, missile.pos[2]-1 }, "yellow")
	   self.canvas:drawLine(missile.pos, missile.startPos, mColor, 1)
	   if missile.playerOwned then
	     self.canvas:drawPoly(poly.translate(self.targetPoly,missile.targetPos), "yellow", 1.0)
	   end
	   
	   if missile.clusters ~= nil then
	     local newMissile = nil
		 local noKeys = true
		 for key,value in pairs(missile.clusters) do
		   noKeys = false
		   if missile.pos[2] <= key then
		     newMissile = spawnMissile(missile.pos, getStructPosFromIndex(value), missile.speed, missile.playerOwned)
             newMissile.targetIndex = value
			 missile.clusters[key] = nil
		   end
		 end
		 --if noKeys then missile.clusters = nil end
	   end
	   
	   if missile.pos == missile.targetPos then
	     missile.alive = false
	     spawnExplosion(missile.pos, 20, 2.5, missile.playerOwned)
		 
		 if missile.playerOwned == false then
           if missile.targetIndex ~= nil then		 
		     if missile.targetIndex >= 1 and missile.targetIndex <= 3 then
			   self.launchSites[missile.targetIndex].alive = false
			   self.launchSites[missile.targetIndex].ammo = 0
			   pane.playSound(self.sounds.structuredestroyed)
			 elseif missile.targetIndex > 3 and missile.targetIndex <= 9 then
			   self.buildings[missile.targetIndex-3] = -1
			   pane.playSound(self.sounds.structuredestroyed)
			 end
			 if areAllStructuresDestroyed() then
			    self.state:set(scoreScreenState)
			 end
		   end
		 end
	   end
	end
  end
end

function updateShips(dt)
  for _,ship in pairs(self.ships) do
    if ship.alive then
	  local shouldFire = false
	  if ship.type == "bomber" then
	    ship.pos[1] = ship.pos[1] + ship.speed * dt
		if ship.pos[1] < -10 or ship.pos[1] > 410 then
		  ship.alive = false
		end
	
		ship.timer = ship.timer + dt
		if ship.timer >= ship.cooldown then
		  shouldFire = true
		  pane.playSound(self.sounds.shiploop2)
		  ship.timer = 0
		end
		self.canvas:drawPoly(poly.translate(self.bomberPoly, ship.pos), {150,0,180}, 1)
		
	  elseif ship.type == "zoomer" then
	    if ship.targetPos == nil then ship.targetPos = ship.pos end
	    if ship.timer < 0 then ship.timer = ship.timer + dt end
	    ship.pos = vec2.approach(ship.pos, ship.targetPos, ship.speed * dt)
		if ship.pos == ship.targetPos then
		  ship.targetPos = {math.random(1,19) * 20, math.random(5,14) * 20}
		  if ship.timer > 0 then
		    shouldFire = true
			pane.playSound(self.sounds.shiploop)
		  end
		end
		self.canvas:drawPoly(poly.translate(self.zoomerEyePoly, ship.pos), self.enemyColor, 1)
		self.canvas:drawPoly(poly.translate(self.zoomerPoly, ship.pos), {150,0,180}, 1)
	  end
	  
	  if shouldFire then
	    local livingTargetIndex = util.randomChoice(getLivingStructIndices()) 
        local newMissile = spawnMissile(ship.pos, getStructPosFromIndex(livingTargetIndex), math.random(5,10+self.level*2), false)
        newMissile.targetIndex = livingTargetIndex
	  end
	end
  end
end

function updateExplosions(dt)
  self.explosionColorTimer = (self.explosionColorTimer + dt) % 0.5
  self.explosionColor[1] = util.lerp(self.explosionColorTimer / 0.5, 255, 180)
  self.explosionColor[2] = util.lerp(self.explosionColorTimer / 0.5, 255, 0)

  local t = 0
  for _,explosion in pairs(self.explosions) do
     if explosion.alive then
	   if explosion.duration == 0 then explosion.duration = 0.001 end
       explosion.lifeTime = explosion.lifeTime + dt
	   if explosion.lifeTime >= explosion.duration then explosion.alive = false end
	   if explosion.lifeTime <= explosion.duration * 0.5 then
	     t = explosion.lifeTime / (explosion.duration * 0.5)
	   else
	     t = 1 - (explosion.lifeTime - explosion.duration * 0.5) / (explosion.duration * 0.5)
	   end 
	   explosion.r = t * explosion.finalR
	   self.canvas:drawTriangles(fillCircle(explosion.r, 16, explosion.pos), self.explosionColor)
	   
	   for _,missile in pairs(self.missiles) do
	     if explosion.playerOwned == true and missile.playerOwned ~= explosion.playerOwned and missile.alive then
		   if isColliding(missile.pos, missile.r, explosion.pos, explosion.r) then
		     missile.alive = false
			 spawnExplosion(missile.pos, 20, 2.5, missile.playerOwned)
			 self.score = self.score + 75
			 widget.setText("scoreLabel", tostring(self.score))
		   end
		 end
	   end
	   
	   for _,ship in pairs(self.ships) do
	     --widget.setText("levelLabel", tostring(ship.alive)..tostring(ship.r).." "..tostring(ship.pos[1])..","..tostring(ship.pos[2]))
	     if explosion.playerOwned == true and ship.alive then
		   if isColliding(ship.pos, ship.r, explosion.pos, explosion.r) then
		     ship.alive = false
			 self.score = self.score + 250
			 pane.playSound(self.sounds.meteoroidExplosion3)
			 widget.setText("scoreLabel", tostring(self.score))
		   end
		 end
	   end
	end
  end
end

function updateWaveSpawns(dt)
  for _, spawn in pairs(self.missileWave) do
    if spawn.delay > 0 then
	  spawn.delay = spawn.delay - dt
	  if spawn.delay <= 0 then
	    if spawn.specialType ~= nil then
          local randomSpeed = math.random(10 + self.level, 15 + self.level * 2)
		  if spawn.specialType == "bomber" then
		    local randomSide = math.random(0,1)
		    local randomHeight = math.random(75,250)
		    local newShip = spawnShip({randomSide*400, randomHeight}, "bomber", randomSide == 0 and randomSpeed or -randomSpeed, util.clamp(3-self.level*0.1, 1.5, 3), util.clamp(1.5 - self.level * 0.1, 0.5, 1))
		  elseif spawn.specialType == "zoomer" then
			local newShip = spawnShip({math.random(10,390), 300}, "zoomer", randomSpeed, 0, util.clamp(1.5 - self.level * 0.1, 0.5, 1))
		  end
		else
	      local randomTargetIndex = math.random(1,9)
		  local randomStartPos = {math.random(0,400), 300}
		  local randomTargetPos = getStructPosFromIndex(randomTargetIndex)
		  local newMissile = spawnMissile(randomStartPos, randomTargetPos, math.random(5,10+self.level*5), false)
          newMissile.targetIndex = randomTargetIndex
		  if math.random(1,100) < 10 + self.level then
		    newMissile.clusters = GenerateClustersFromMissile(newMissile)
          end
	    end
	  end
	end
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
	     if p.polyOverride ~= nil then
		   self.canvas:drawPoly(poly.translate(p.polyOverride, p.pos), {255,175,175}, 1)
		 else
	       self.canvas:drawRect({ p.pos[1], p.pos[2], p.pos[1]-1, p.pos[2]-1 }, "white")
         end
	   end
	end
  end
end

function CreateRandomTerrain()
  self.groundPoly = { {394,0}, {0,0}, {0,35} }
  
  local prevHeight = 35
  local rHeight
  local cosWave
  for i = 1, 19, 1 do
      cosWave = math.cos( i/19 * math.pi * 4 )
      rHeight = math.random(20, 40) + cosWave * 15
	  prevHeight = (prevHeight + rHeight) * 0.5
      table.insert(self.groundPoly, {i * 394/(19 + 1) , prevHeight})
  end
  
  table.insert(self.groundPoly, {394,35})
  
  self.groundTris = {}
  for v = 3, 3+19, 1 do
    local v1,v2,v3,v4 = self.groundPoly[v], self.groundPoly[v+1]
    v3 = {v1[1], 0}
    v4 = {v2[1], 0} 	 
    table.insert(self.groundTris, {v1, v2, v3})
	table.insert(self.groundTris, {v3, v2, v4})
  end
end

function getCursorTris(transformedCursorPoly)
  local tris = {}
  for i = 0, 3, 1 do
    table.insert(tris, {transformedCursorPoly[i*3+1], transformedCursorPoly[i*3+2],transformedCursorPoly[i*3+3]})
  end
  --table.insert(tris, {{self.cursorPos[1]-1, self.cursorPos[2]}, {self.cursorPos[1], self.cursorPos[2]+1}, {self.cursorPos[1], self.cursorPos[2]-1}})
  return tris
end

function GenerateWaveData()
  local numberOfMissiles = self.level + 8
  local waveSpawnDuration = self.level * 2 + 14
  self.missileWave = {}
  for i = 1, numberOfMissiles, 1 do
    table.insert(self.missileWave, {delay = math.random(1, waveSpawnDuration) }) 
  end
  
  if self.level % 2 == 0 then
    table.insert(self.missileWave, {delay = math.random() * waveSpawnDuration/3 + waveSpawnDuration/3, specialType = "bomber" }) 
  end
  
  if self.level > 10 and self.level % 3 > 0 then
    table.insert(self.missileWave, {delay = math.random() * waveSpawnDuration/4 + waveSpawnDuration/4, specialType = "bomber" }) 
  end
  
  if self.level % 3 == 0 then
	table.insert(self.missileWave, {delay = math.random() * waveSpawnDuration/3 + waveSpawnDuration*2/3, specialType = "zoomer" }) 
  end
  
  if self.level > 15 and self.level % 2 == 1 then
    table.insert(self.missileWave, {delay = math.random() * waveSpawnDuration/2 + waveSpawnDuration/4, specialType = "zoomer" }) 
  end
end

function areAllMissilesDestroyed()
  for _,spawn in pairs(self.missileWave) do
    if spawn.delay > 0 then return false end
  end
  
  for _,missile in pairs(self.missiles) do
    if missile.alive == true and missile.playerOwned == false then return false end
  end
  
  for _,ship in pairs(self.ships) do 
    if ship.alive then return false end
  end
  
  return true
end

function areAllStructuresDestroyed()
  for siloIndex = 1, 3, 1 do
    if self.launchSites[siloIndex].alive == true then return false end
  end
  
  for buildingIndex = 1, 6, 1 do
    if self.buildings[buildingIndex] > 0 then return false end
  end  
  
  return true
end

function ResetSilos()
    for siloIndex = 1, 3, 1 do
      self.launchSites[siloIndex].alive = true
      self.launchSites[siloIndex].ammo = 10 + math.floor(self.level / 4)
  end
end

function ResetBuildings()
  for buildingIndex = 1, 6, 1 do
    if self.buildings[buildingIndex] <= 0 then
      self.buildings[buildingIndex] = math.random(1,4)
	end
  end
end

function structuresAlive()
  local total = 0
  for siloIndex = 1, 3, 1 do
      if self.launchSites[siloIndex].alive == true then total = total + 1 end
  end
  
  for buildingIndex = 1, 6, 1 do
    if self.buildings[buildingIndex] > 0 then total = total + 1 end
  end
  
  return total
end

function ammoRemaining()
  local total = 0
  for siloIndex = 1, 3, 1 do
      total = total + self.launchSites[siloIndex].ammo
  end
  return total
end

function getLivingStructIndices()
  local indices = {}
  for i = 1, 9, 1 do
    if i <= 3 and self.launchSites[i].alive then
      table.insert(indices, i)
    elseif i > 3 and self.buildings[i-3] > 0 then 
	  table.insert(indices, i)
	end
  end
  return indices
end

function getRandomIndicesWithoutDuplicates(table, randomCount)
  local selectedIndices = {}
  local r
  local c = 0
  local tableSize = 0
  for _ in pairs(table) do tableSize = tableSize + 1 end
  
  while (c < randomCount) and (c < tableSize) do
    r = math.random(1,tableSize)
	if selectedIndices[r] == nil then
	  selectedIndices[r] = r
	  c = c + 1
    end	  
  end
  
  return selectedIndices
end

function getStructPosFromIndex(structIndex)
  if structIndex <= 3 then
    return self.launchSites[structIndex].pos
  else
    return self.buildingLocations[structIndex-3]
  end
end

function sortedPairs(table, sortingFunc)
  local keys = {}
  for k in pairs(table) do keys[#keys+1] = k end
  
  if sortingFunc then
    table.sort(keys, function(element1,element2) return sortingFunc(table, element1,element2) end)
  else
    table.sort(keys)
  end
  
  --iterator
  local i = 0
  return function()
    i = i + 1
	if keys[i] then
	  return keys[i], table[keys[i]]
	end
  end
end


function createReward()
  local reward = {}
  local pixelRewardAmount = (self.level-1) * 20
  if self.level > 2 then pixelRewardAmount = pixelRewardAmount + math.floor(self.score / 5000) end
  
  local pixelReward = {item = "money", count = pixelRewardAmount, givenOut = 0}
  table.insert(reward, pixelReward)
  
  if self.level > 5 then
    local rarityIndex = math.floor(self.level/2) % 3
    local rarity = "common"
	if rarityIndex == 1 then
	  rarity = "uncommon"
	elseif rarityIndex == 2 then
	  rarity = "rare"
	end
	
	local itemLevel = math.floor((self.level - 6) / 6) + 1
	
	local weaponTypes = {"grenadelauncher", "rocketlauncher", "assualtrifle", "shotgun"}
	local randomType = util.randomChoice(weaponTypes)
	
	table.insert(reward, {item = rarity..randomType, count = 1, givenOut = 0, params = {level = itemLevel}})
  end
  return reward
end

