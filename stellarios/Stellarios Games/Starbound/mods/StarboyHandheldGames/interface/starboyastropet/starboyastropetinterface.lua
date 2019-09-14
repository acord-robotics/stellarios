require "/scripts/util.lua"
require "/scripts/vec2.lua"
require "/scripts/rect.lua"
require "/scripts/poly.lua"
require "/scripts/drawingutil.lua"
require "/scripts/starboyutil.lua"
require "/interface/starboyastropet/astropet.lua"
-- engine callbacks
function init()
  --View:init()
  self.canvas = widget.bindCanvas("consoleScreenCanvas")
  self.clickEvents = {}
  self.keyEvents = {}

  self.state = FSM:new()
  self.state:set(splashScreenState)

  self.sounds = config.getParameter("sounds")
  
  self.mpos = {0,0}
  pane.playSound(self.sounds.startup2, 0, 0.5)

  self.particles = {}

  self.imageString = "/interface/starboyastropet/pet1.png"
  self.appleImage = "/interface/starboyastropet/apple.png"
  self.petAnimation = { idle = {startFrame = 1, endFrame = 2, duration = 2},
						walk = {startFrame = 3, endFrame = 6, duration = 0.5},
						happy = {startFrame = 7, endFrame = 8, duration = 1},
						eat = {startFrame = 9, endFrame = 10, duration = 2},
						sad = {startFrame = 11, endFrame = 12, duration = 2},
						sleep = {startFrame = 13, endFrame = 14, duration = 4},
						curious = {startFrame = 15, endFrame = 16, duration = 2},
						surprised = {startFrame = 17, endFrame = 18, duration = 2},
						content = {startFrame = 19, endFrame = 20, duration = 2},
						mad = {startFrame = 21, endFrame = 22, duration = 2},
						strike = {startFrame = 23, endFrame = 26, duration = 0.5},
						jump = {startFrame = 23, endFrame = 26, duration = 2},
						confused = {startFrame = 27, endFrame = 28, duration = 2},
						disappointed = {startFrame = 29, endFrame = 30, duration = 2},
						stateTime = 0,
						width = 48,
						height = 24,
						currentState = "idle",
						sheet = "/interface/starboyastropet/pet1.png"}
						
  self.formAnimationOverrides = {baby = {sheet = "/interface/starboyastropet/petbaby.png", width = 30, height = 24},
								 tadpoll = {sheet = "/interface/starboyastropet/pet1.png", width = 48, height = 24},
								 bitey = {sheet = "/interface/starboyastropet/pet2.png", width = 40, height = 24},
								 skully = {sheet = "/interface/starboyastropet/pet3.png", width = 48, height = 24}}

  self.eggSprite = {stage1 = {startFrame = 1},
				      stage2 = {startFrame = 2},
					  stage3 = {startFrame = 3},
					  stage4 = {startFrame = 4},
					  idle = {startFrame = 1, endFrame = 4, duration = 2},
					  stateTime = 0,
					  width = 8,
					  height = 11,
					  currentState = "idle",
					  sheet = "/interface/starboyastropet/egg.png"}

  self.eggPatternSprite = {p1 = {startFrame = 1},
					  stateTime = 0,
					  width = 8,
					  height = 11,
                      currentState = "p1",
					  sheet = "/interface/starboyastropet/eggpatterns.png"}
  self.eggPatternSprite.p1.startFrame = math.random(1,16)
  
  --self.eggPatternColor = {math.random(0,255),math.random(0,255),math.random(0,255)}
						
  self.appleSprite = {stage1 = {startFrame = 1},
				      stage2 = {startFrame = 2},
					  stage3 = {startFrame = 3},
					  stateTime = 0,
					  width = 11,
					  height = 14,
					  currentState = "stage1",
					  sheet = "/interface/starboyastropet/apple.png"}
					  
    self.meatSprite = {stage1 = {startFrame = 1},
				      stage2 = {startFrame = 2},
					  stage3 = {startFrame = 3},
					  stateTime = 0,
					  width = 16,
					  height = 15,
					  currentState = "stage1",
					  sheet = "/interface/starboyastropet/meat.png"}  

	self.breadSprite = {stage1 = {startFrame = 1},
				      stage2 = {startFrame = 2},
					  stage3 = {startFrame = 3},
					  stateTime = 0,
					  width = 15,
					  height = 10,
					  currentState = "stage1",
					  sheet = "/interface/starboyastropet/bread.png"}

    self.dessertSprite = {stage1 = {startFrame = 1},
				      stage2 = {startFrame = 2},
					  stage3 = {startFrame = 3},
					  stateTime = 0,
					  width = 16,
					  height = 9,
					  currentState = "stage1",
					  sheet = "/interface/starboyastropet/dessert.png"}
						
	self.poopSprite = {idle = {startFrame = 1, endFrame = 2, duration = 2},
					  stateTime = 0,
					  width = 16,
					  height = 9,
					  currentState = "idle",
					  sheet = "/interface/starboyastropet/poop.png"}
					  
	self.shroomSprite = {idle = {startFrame = 1, endFrame = 2, duration = 3},
					  stateTime = 0,
					  width = 16,
					  height = 9,
					  currentState = "idle",
					  sheet = "/interface/starboyastropet/shroom.png"}
					
    self.ballSprite = {idle = {startFrame = 1},
					  stateTime = 0,
					  width = 7,
					  height = 7,
					  currentState = "idle",
					  sheet = "/interface/starboyastropet/ball.png"}    
					  
	self.boneSprite = {idle = {startFrame = 1},
					  stateTime = 0,
					  width = 14,
					  height = 5,
					  currentState = "idle",
					  sheet = "/interface/starboyastropet/bone.png"}
					  
	self.musicNoteSprite = {note0 = {startFrame = 1},
				      note1 = {startFrame = 2},
					  note2 = {startFrame = 3},
					  note3 = {startFrame = 4},
					  note4 = {startFrame = 5},
					  stateTime = 0,
					  width = 20,
					  height = 20,
					  currentState = "note0",
					  sheet = "/interface/starboyastropet/musicnote.png"}
					  
	self.musicNoteSmallSprite = {note0 = {startFrame = 1},
				      note1 = {startFrame = 2},
					  note2 = {startFrame = 3},
					  note3 = {startFrame = 4},
					  note4 = {startFrame = 5},
					  stateTime = 0,
					  width = 10,
					  height = 10,
					  currentState = "note0",
					  sheet = "/interface/starboyastropet/musicnoteSmall.png"}
					  
	self.hurdleSprite = {idle = {startFrame = 1},
					  stateTime = 0,
					  width = 20,
					  height = 20,
					  currentState = "idle",
					  sheet = "/interface/starboyastropet/hurdle.png"}

    self.flushSprite = {idle = {startFrame = 1, endFrame = 2, duration = 1},
					  stateTime = 0,
					  width = 25,
					  height = 25,
					  currentState = "idle",
					  sheet = "/interface/starboyastropet/flush.png"}				

    self.happinessMeterSprite = {low = {startFrame = 1},
								 medium = {startFrame = 2},
								 high = {startFrame = 3},
								 stateTime = 0,
								 width = 10,
								 height = 40,
								 currentState = "low",
								 sheet = "/interface/starboyastropet/happinessmeter.png"}
	
    self.hungerMeterSprite = {low = {startFrame = 1},
								 medium = {startFrame = 2},
								 high = {startFrame = 3},
								 stateTime = 0,
								 width = 10,
								 height = 40,
								 currentState = "low",
								 sheet = "/interface/starboyastropet/hungermeter.png"}
								 
    self.energyMeterSprite = {low = {startFrame = 1},
								 medium = {startFrame = 2},
								 high = {startFrame = 3},
								 stateTime = 0,
								 width = 10,
								 height = 40,
								 currentState = "low",
								 sheet = "/interface/starboyastropet/energymeter.png"}								 
  self.notePositions = {{210,170},{165,125},{255,125},{210,80}}
  self.miniGame = {}	
  self.flush = {active = false, x = 400, width = 30}  
					  
  self.pet = createPet()
  self.pet.sprite = self.petAnimation
  self.objects = {}
  self.catchUpTime = 0
  self.heldObject = nil
  self.isPetting = false
  self.loaded = false
  self.loadPromise = nil
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
  --widget.setVisible("scoreLabel", true)
  --widget.setText("scoreLabel", "time: "..tostring(self.catchUpTime))
  
  if not world.sendEntityMessage(player.id(), "holdingGame"):result() then
    pane.dismiss()
  end
  
  if self.loaded then
    self.canvasFocused = widget.hasFocus("consoleScreenCanvas")
    self.state:update(dt)
    
  else
    if self.loadPromise == nil then
	   self.loadPromise = world.sendEntityMessage(player.id(), "load")
    else
	  if self.loadPromise:finished() then
	    self.loaded = true
		local loadedPet = self.loadPromise:result()
		self.loadedPet = loadedPet
		if loadedPet then
		  --self.loadedPet = loadedPet
		  --self.pet.sprite = loadedPet.sprite
  		  --self.pet.position = loadedPet.position
		  --self.pet.speed = loadedPet.speed
		  self.pet.stats =  util.mergeTable(self.pet.stats, loadedPet.stats)
		  self.pet.maxStats = util.mergeTable(self.pet.maxStats , loadedPet.maxStats)
		  self.pet.preferences = util.mergeTable(self.pet.preferences, loadedPet.preferences)
		  self.pet.form = loadedPet.form
		  self.pet:ChangeForm(self.pet.form)
		  if loadedPet.lastTimeOpened then
		    self.catchUpTime = util.clamp((os.clock() - loadedPet.lastTimeOpened) * 0.1, 0, 100) --time passes at 1/10th the rate when closed
		  else
		    self.catchUpTime = 0
		  end
		  self.pet.activityCooldowns.evolve = self.catchUpTime + 1
		end
	  end
	end
  end
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

function eggScreenState()
     --self.eggSprite.stateTime = (self.eggSprite.stateTime + dt) % self.eggSprite[self.eggSprite.currentState].duration;
  local eggStage = 1
  self.eggPatternColor = {self.pet.preferences.toy * 2.55, self.pet.preferences.race * 2.55, self.pet.preferences.music * 2.55}
  while true do
    for _,click in pairs(takeInputEvents()) do
      local pos, button, down = click[1], click[2], click[3]
  
      if down and button == 0 then
	--self.pet:BeginMovingToLocation({pos[1],0})
	    if pos[1] > 184 and pos[1] < 216 and pos[2] < 44 then
	      eggStage = eggStage + 1
		  if eggStage > 4 then
		    self.pet:ChangeForm("baby")
		    self.state:set(petState)
			return
		  else
		    self.eggSprite.currentState = "stage" .. tostring(eggStage)
		  end 
	    end
      end
    end
    
    self.canvas:clear()
    drawSprite(self.eggPatternSprite, {200,0}, self.eggPatternColor)
    drawSprite(self.eggSprite, {200,0})
	coroutine.yield()
  end
end

function petState()
  self.particles = {}

  --widget.setText("livesLabel", "Lives: " .. tostring(self.lives))
  --widget.setText("scoreLabel", tostring(self.score))
  --widget.setVisible("scoreLabel", true)
  --widget.setVisible("livesLabel", true)
  --widget.setVisible("levelLabel", true)

  showPrimaryMenus()

  while true do 
    local dt = script.updateDt()
	if self.catchUpTime > 0 then
	  dt = 1/10
	  sb.logInfo(tostring(self.catchUpTime).."  dt:"..tostring(dt).."  h:"..tostring(self.pet.stats.hunger))
	end
	
	
	mpos = self.canvas:mousePosition()
    --for _,press in pairs(takeKeyEvents()) do
	  --local key, down = press[1], press[2]
	  --widget.setText("levelLabel", tostring(key))
	  --if down then frame = (frame) % 8 + 1 end
	  --if down and key == 61 then self.pet.sprite.currentState = "idle" end
	  --if down and key == 65 then self.pet.sprite.currentState = "sleep" end
	  --if down and key == 43 then self.pet.sprite.currentState = "eat" end
	  --if down and key == 46 then self.pet.sprite.currentState = "happy" end
	  --if down and key == 47 then self.pet.sprite.currentState = "sad" end

	  --if down and key == 21 then self.appleSprite.currentState = "stage1" end
	  --if down and key == 22 then self.appleSprite.currentState = "stage2" end
	  --if down and key == 23 then self.appleSprite.currentState = "stage3" end
    --end
    
	for _,click in pairs(takeInputEvents()) do
	  local pos, button, down = click[1], click[2], click[3]
	  
	  if not down and button == 0 then
	    --self.pet:BeginMovingToLocation({pos[1],0})
		if self.heldObject then self.heldObject.held = nil end
	    self.heldObject = nil
		self.isPetting = false
	  end
	 
	 if down and button == 0 then
	   self.isPetting = tryPetting()
	 end
    end
	
     self.canvas:clear()
     
	 if self.isPetting then
	   self.isPetting = tryPetting()
	 end
	 
	 if self.pet.activity and self.pet.activity.type == "beingPet" and self.isPetting == false then
	   self.pet.activity.pettingStopped = true
	 end
	 
	 self.pet:update(dt, self.objects)
	 drawSprite(self.pet.sprite, self.pet.position, _, self.pet.facing > 0)
	 DrawMeters()
	 
	 self.pet.position = wrapPosition(self.pet.position)
	 
	 --local loadString = "--load data:" .. tostring(self.loadedPet) 
	 --for k,v in pairs(self.loadedPet) do
	 --  loadString = loadstring .. tostring(k) .. ":" .. tostring(v) .. "\n"
	 --end
	 
	 --local minigameString = "minigame data:\n"
	 --if self.miniGame.type ~= nil then
	 --  for k,v in pairs(self.miniGame) do
	 --    if k == "musicSequence" then
	--	   minigameString = minigameString .. tostring(k) .. ":"
	--	   for k2,v2 in pairs(v) do minigameString = minigameString .. tostring(v2) .. "," end
	--	   minigameString = minigameString .. "\n"
	--	 else
	 --      minigameString = minigameString .. tostring(k) .. ":" .. tostring(v) .. "\n"
	  --   end
	   --end
	 --end
	 
	 --local pettingString = "is petting: " .. tostring(self.isPetting)
	 --widget.setText("livesLabel", self.pet:debugActivityString().."\n"..self.pet:debugStatString() .. "\n" .. self.pet:debugPreferencesString() .. "\n" .. pettingString )
	 
	 if self.flush.active then
	   self.flushSprite.stateTime = (self.flushSprite.stateTime + dt) % self.flushSprite[self.flushSprite.currentState].duration;
	   self.flush.x = self.flush.x - 200 * dt
	   if self.flush.x <= 0 then
	     self.flush.active = false
		 self.flush.x = 400
	   else
	     for i = 0, 400 / self.flushSprite.height * 4, 1 do
		   drawSprite(self.flushSprite, {self.flush.x, i * self.flushSprite.height * 4})
		 end
	   end
	 end
	 
	 for k,v in pairs(self.pet:GetObjectSpawns()) do
	   spawnObjectByName(v, self.pet.position)
	 end
	 

	 updateObjects(dt)
	 updateParticles(dt)
	 if self.miniGame.type == "music" then
	   updateMusicGame(dt)
	 elseif self.miniGame.type == "race" then
	   updateRaceGame(dt)
	 end
	 
	 local saveData = self.pet:GetSaveData()
     world.sendEntityMessage(player.id(), "save", saveData)
	 
	 if self.catchUpTime <= 0 then
	   coroutine.yield()
     else
	   self.catchUpTime = self.catchUpTime - dt
	 end
  end
end

function DrawMeters()
  if self.pet.stats.happiness > 60 then
    self.happinessMeterSprite.currentState = "high"
  elseif self.pet.stats.happiness > 35 then
    self.happinessMeterSprite.currentState = "medium"
  else
    self.happinessMeterSprite.currentState = "low"
  end
  
  drawSprite(self.happinessMeterSprite, {10, 215}, _, _, 2)
  
  if self.pet.stats.hunger < 35 then
    self.hungerMeterSprite.currentState = "high"
  elseif self.pet.stats.hunger < 60 then
    self.hungerMeterSprite.currentState = "medium"
  else
    self.hungerMeterSprite.currentState = "low"
  end
  
  drawSprite(self.hungerMeterSprite, {30, 215}, _, _, 2)
  
  if self.pet.stats.energy > 60 then
    self.energyMeterSprite.currentState = "high"
  elseif self.pet.stats.energy > 35 then
    self.energyMeterSprite.currentState = "medium"
  else
    self.energyMeterSprite.currentState = "low"
  end
  
  drawSprite(self.energyMeterSprite, {50, 215}, _, _, 2)
end

function wrapPosition(pos)
  if pos[1] > 400 then pos[1] = pos[1] - 400 end
  if pos[1] < 0 then pos[1] = pos[1] + 400 end
  if pos[2] > 300 then pos[2] = pos[2] - 300 end
  if pos[2] < 0 then pos[2] = pos[2] + 300 end
  return pos
end

function clampPosition(pos)
  pos[1] = util.clamp(pos[1], 0, 400)
  pos[2] = util.clamp(pos[2], 0, 300)
  return pos
end

function clampMag(vec, maxMag)
  local mag = vec2.mag(vec)
  if mag > maxMag then
    vec = vec2.mul(vec2.norm(vec), maxMag)
  end
  
  return vec
end

function wrapAngle(angle)
  while angle > math.pi * 2 do
    angle = angle - math.pi * 2
  end

  while angle < 0 do
    angle = angle + math.pi * 2
  end
  
  return angle
end

function isColliding(pos1, r1, pos2, r2)
  local dSq = magSq(vec2.sub(pos1, pos2))
  local rSq = (r1 + r2) * (r1 + r2)
  return dSq < rSq 
end

function magSq(vector)
  return vector[1] * vector[1] + vector[2] * vector[2]
end

function updateObjects(dt)
 for k,v in pairs(self.objects) do
	 if v ~= self.heldObject then
	   if v.duration ~= nil then 
         if v.time then
		   v.time = v.time + dt
		   if v.time > v.duration then v.destroyed = true end
		 else
		   v.time = dt
		 end
	   end
	 
	   if v.type ~= "musicNote" then
	   	 v.velocity = vec2.add(v.velocity, {0,-600 * dt})
	     v.position = vec2.add(v.position, vec2.mul(v.velocity, dt))
	     local elasticity = v.elasticity or 0.6
	     if v.position[1] < 0 or v.position[1] > 400 then v.velocity = {v.velocity[1] * -elasticity, v.velocity[2] * elasticity} end
	     if v.position[2] < 0 or v.position[2] > 300 then v.velocity = {v.velocity[1] * elasticity, v.velocity[2] * -elasticity} end
	     v.position = clampPosition(v.position)
	     if v.position[2] == 0 and vec2.mag(v.velocity) <= 10 then v.velocity = {0,0} end
	   else
	     v.position[1] = v.position[1] + math.sin(v.time * 3) * 20 * dt
		 v.position[2] = v.position[2] + 50 * dt
	   end
	 else
	   if not v.held then
		 self.heldObject = nil
	   else
		 local prevPos = {v.position[1],v.position[2]}
		 v.position = {mpos[1], mpos[2] - self.heldObject.sprite.height * 0.5 * 4}
		 v.velocity = vec2.div(vec2.sub(v.position, prevPos), dt)
	   end
	 end
 
 if v.durability ~= nil and v.durability <= 0 then v.destroyed = true end
 if self.flush.active and v.position[1] > self.flush.x then v.destroyed = true end
 
 if v.destroyed then
	 self.objects[k] = nil
   else
	 if v.foodCount then
	   v.sprite.currentState = "stage"..tostring(4-v.foodCount)
	 elseif v.type == "musicNote" then
	   v.sprite.currentState = v.note
	 end
	 
	 if v.type == "poop" then
	   v.sprite.stateTime = (v.sprite.stateTime + dt) % v.sprite[v.sprite.currentState].duration;
	   self.pet.stats.health = util.clamp(self.pet.stats.health - 0.05 * dt, 0, 100)
	 end
	 drawSprite(v.sprite, v.position)
   end
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

function tryPetting()
  local xMin = self.pet.position[1] - self.pet.sprite.width * 2
  local xMax = self.pet.position[1] + self.pet.sprite.width * 2
  local yMin = 0
  local yMax = self.pet.sprite.height * 4
  
  if mpos[1] > xMin and mpos[1] < xMax and mpos[2] > yMin and mpos[2] < yMax then
    if self.isPetting then 
	  return true
	else
      return self.pet:StartBeingPetted()
    end  
  end
  return false
end

function startMusicGame()
  self.miniGame = {type = "music", phase = "output", musicSequence = {math.random(1,4)}, playerNote = 1, time = 0, delay = 1, status = "playing"}
  if not self.pet:AttemptToPlayGame(self.miniGame) then
    self.miniGame = {}
  end
end

function updateMusicGame(dt)
  if self.miniGame.type ~= "music" then return end
  
  if self.miniGame.status == "completed" or self.miniGame.status == "failed" or (self.pet.activity.type == nil or self.pet.activity.type ~= "miniGamemusic") then
	if self.miniGame.status == "failed" then
	  pane.playSound(self.sounds.meteoroidExplosion3)
	else
	  pane.playSound(self.sounds.startup)
	  self.pet:CompleteGame("music")
	end
	
	self.miniGame = {}
	setMusicNoteButtonVisibilities(false)
	return
  end
  
  if self.miniGame.delay > 0 then
    self.miniGame.delay = self.miniGame.delay - dt
    if self.miniGame.delay <= 0 then pane.playSound(self.sounds["note"..tostring(self.miniGame.musicSequence[1])]) end
  end
  
  if self.miniGame.phase == "input" then
    self.miniGame.time = self.miniGame.time + dt
  end
  
  if self.miniGame.happyFeedbackTime and self.miniGame.happyFeedbackTime > 0 then
    self.miniGame.happyFeedbackTime = self.miniGame.happyFeedbackTime - dt
  end
  --self.miniGame.time = self.miniGame.time + dt
  if self.miniGame.phase == "output" and self.miniGame.delay <= 0 then
    local prevNote = math.floor(self.miniGame.time) + 1
	self.miniGame.time = self.miniGame.time + dt
	local currentNote = math.floor(self.miniGame.time) + 1
	self.miniGame.c = currentNote
	
	if currentNote ~= prevNote then
	  if currentNote > #self.miniGame.musicSequence then
	    self.miniGame.phase = "input"
		self.miniGame.time = 0
		self.miniGame.playerNote = 1
		setMusicNoteButtonVisibilities(true)
		return
	  else
	    pane.playSound(self.sounds["note"..tostring(self.miniGame.musicSequence[currentNote])])
	  end
	end
	
	if self.miniGame.time + 1 - currentNote < 0.75 then
	  self.musicNoteSprite.currentState = "note"..tostring(self.miniGame.musicSequence[currentNote])
	  drawSprite(self.musicNoteSprite, self.notePositions[self.miniGame.musicSequence[currentNote]], _, _, 2)
    end
  end
end

function startRaceGame()
  self.miniGame = {type = "race", speed = 150, hurdles = {}, totalHurdlesSpawned = 0, jumping = false, jumpOffset = {0,0}, jumpTimer = 0, spawnDelay = 2, delay = 1, despawnedHurdles = 0, totalHurdlesSpawned = 0, status = "startup"}
  if not self.pet:AttemptToPlayGame(self.miniGame) then
    self.miniGame = {}
  end
end

function updateRaceGame(dt)
  if self.miniGame.type ~= "race" then return end
  
  if self.miniGame.status == "completed" or self.miniGame.status == "failed" or (self.pet.activity.type == nil or self.pet.activity.type ~= "miniGamerace") then
	if self.miniGame.status == "failed" then
	  pane.playSound(self.sounds.meteoroidExplosion3)
	else
	  pane.playSound(self.sounds.startup)
	  self.pet:CompleteGame("race")
	end
	widget.setVisible("jumpButton", false)
	self.miniGame.jumpOffset = {0,0}
	self.miniGame = {}
	return
  end
  
  if self.miniGame.delay > 0 then
    self.miniGame.delay = self.miniGame.delay - dt
  elseif self.miniGame.status == "playing" then
    if not widget.active("jumpButton") then widget.setVisible("jumpButton", true) end
    if self.miniGame.spawnDelay > 0 then
	  self.miniGame.spawnDelay = self.miniGame.spawnDelay - dt
	elseif self.miniGame.totalHurdlesSpawned < self.miniGame.maxHurdles then
	  self.miniGame.spawnDelay = math.random() * 1.2 + 1.8
	  table.insert(self.miniGame.hurdles, {400,0})
	  self.miniGame.totalHurdlesSpawned = self.miniGame.totalHurdlesSpawned + 1	  
	end
	
	if self.miniGame.jumping then
	  local jumpHeight = 49
	  self.miniGame.jumpTimer = self.miniGame.jumpTimer + dt
	  self.miniGame.jumpOffset = {0, util.clamp(-jumpHeight * (self.miniGame.jumpTimer - 1) * (self.miniGame.jumpTimer - 1) + jumpHeight, 0, jumpHeight)}
	  if self.miniGame.jumpTimer >= 2 then
	    self.miniGame.jumping = false
		self.miniGame.jumpTimer = 0
		self.miniGame.jumpOffset = {0,0}
		self.pet.sprite.currentState = "walk"
	  end
	end
	
	for k,v in pairs(self.miniGame.hurdles) do
	  v[1] = v[1] - self.miniGame.speed * dt
	  if v[1] >  self.pet.position[1] - self.pet.sprite.width  and v[1] < self.pet.position[1] + self.pet.sprite.width and self.miniGame.jumping == false then
	    self.miniGame.status = "failed"
	  end 
	  drawSprite(self.hurdleSprite, v)
	  if v[1] < 0 then
	    self.miniGame.hurdles[k] = nil
		self.miniGame.despawnedHurdles = self.miniGame.despawnedHurdles + 1
		self.pet:GameTaskSuccess()
	  end
	end
	
	if self.miniGame.despawnedHurdles >= self.miniGame.totalHurdlesSpawned and self.miniGame.totalHurdlesSpawned >= self.miniGame.maxHurdles then
	  self.miniGame.status = "completed"
	end
  end
end

function splashScreenState()
  local titleText = "AstroPet"
  local copyrightText = "Starboy, Inc\nc. 2096"
  local pos = {200, 160}
  local pos2 = {200, 90}
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
		if self.loadedPet then
		  self.state:set(petState)
		else
		  self.state:set(eggScreenState)
		end
	end

    self.canvas:drawText(titleText, {position = pos, horizontalAnchor = "mid", verticalAnchor = "mid"}, 50, "red")
	self.canvas:drawText(copyrightText, {position = pos2, horizontalAnchor = "mid", verticalAnchor = "mid"}, 24, "red")
		
    for _,press in pairs(takeKeyEvents()) do
	  local key, down = press[1], press[2]
	  if key == 5 and down then
	    if self.loadedPet then
		  self.state:set(petState)
		else
		  self.state:set(eggScreenState)
		end
		--pane.stopAllSounds(self.sounds.startup)
	  end
	end
	
	coroutine.yield()
  end
end

function titleScreenState()
  local titleText = "AstroPet"
  local pressKeyText = "[Press SPACE to start]"
  local pos = {200, -300}
  local pos2 = {200, 100}
  local elapsedTime = 0
  local titleScrollDuration = 2
  local t = 0
  local blinkCycle = 2
  local blinkTimer = 0
  
  while true do 
    self.canvas:clear()
	
	for _,press in pairs(takeKeyEvents()) do
	  local key, down = press[1], press[2]
	  if key == 5 and down then
	    if elapsedTime < titleScrollDuration then
  		  elapsedTime = titleScrollDuration
		else
		  pane.playSound(self.sounds.startup)
		  self.state:set(petState)
		end
	  end
	end
	
	if t < 1 then
	  elapsedTime = util.clamp(elapsedTime + script.updateDt(), 0, titleScrollDuration)
	  t = elapsedTime / titleScrollDuration
	  pos[2] = util.lerp(t, -30, 150)
	end

    self.canvas:drawText(titleText, {position = pos, horizontalAnchor = "mid", verticalAnchor = "mid"}, 44, "red")
	
	if elapsedTime >= titleScrollDuration then
	  blinkTimer = (blinkTimer + script.updateDt()) % blinkCycle
	  if blinkTimer > blinkCycle * 0.5 then
	    self.canvas:drawText(pressKeyText, {position = pos2, horizontalAnchor = "mid", verticalAnchor = "mid"}, 20, "red")
	  end
	end  

    coroutine.yield()
  end
end

function spawnObjectByName(name, position, velocity)
  local newObject = nil
  if name == "poop" then
    newObject = {position = {position[1], position[2]}, velocity = velocity or {0,0}, sprite = self.poopSprite, type = "poop"}
    table.insert(self.objects, newObject)
  elseif name == "bone" then
    newObject = {position = {position[1], position[2]}, velocity = velocity or {0,0}, sprite = self.boneSprite, type = "toy", durability = 2}
    table.insert(self.objects, newObject)
  elseif name == "shroom" then
    newObject = {position = {position[1], position[2]}, velocity = velocity or {0,0}, sprite = self.shroomSprite, type = "poop"}
    table.insert(self.objects, newObject)
  elseif name == "note1" or name == "note2" or name == "note3" or name == "note4" then
    newObject = {position = {position[1], self.pet.sprite.height * 3}, velocity = velocity or {0,0}, sprite = self.musicNoteSmallSprite, type = "musicNote", ignored = true, duration = 5}
	newObject.note = name
	table.insert(self.objects, newObject)
  end
end

--UI Functions
function showPrimaryMenus()
  widget.setVisible("openFoodMenu", true)
  widget.setVisible("openPlayMenu", true)
  widget.setVisible("clean", true)
  widget.setVisible("reset", true)
end

function hidePrimaryMenus()
  widget.setVisible("openFoodMenu", false)
  widget.setVisible("openPlayMenu", false)
  widget.setVisible("clean", false)
  widget.setVisible("reset", false)
  closeSecondaryMenus()
end

function closeSecondaryMenus()
  widget.setVisible("feedApple", false)
  widget.setVisible("feedMeat", false)
  widget.setVisible("feedBread", false)
  widget.setVisible("feedDessert", false)
  
  widget.setVisible("playFetch", false)
  widget.setVisible("playRace", false)
  widget.setVisible("playMusic", false)
  
  setMusicNoteButtonVisibilities(false)
  widget.setVisible("jumpButton", false)
  
  widget.setVisible("resetConfirm", false)
  widget.setVisible("resetCancel", false)
end

function setMusicNoteButtonVisibilities(visibility)
  widget.setVisible("musicNoteButton1", visibility)
  widget.setVisible("musicNoteButton2", visibility)
  widget.setVisible("musicNoteButton3", visibility)
  widget.setVisible("musicNoteButton4", visibility)
end
--open the food selection menu
function openFoodMenu()
  if isMiniGameActive() then return end
  local toggle = not widget.active("feedApple")
  widget.setVisible("feedApple", toggle)
  widget.setVisible("feedMeat", toggle)
  widget.setVisible("feedBread", toggle)
  widget.setVisible("feedDessert", toggle)
  
  widget.setVisible("playFetch", false)
  widget.setVisible("playRace", false)
  widget.setVisible("playMusic", false)
end

function openPlayMenu()
  if isMiniGameActive() then return end
  local toggle = not widget.active("playFetch")
  widget.setVisible("feedApple", false)
  widget.setVisible("feedMeat", false)
  widget.setVisible("feedBread", false)
  widget.setVisible("feedDessert", false)
  
  widget.setVisible("playFetch", toggle)
  widget.setVisible("playRace", toggle)
  widget.setVisible("playMusic", toggle)
end

function clean()
  if isMiniGameActive() then return end
  if self.flush.active == false then
    self.flush.active = true
    closeSecondaryMenus()
  end
end

function feedApple()
  if isMiniGameActive() then return end
  closeSecondaryMenus()
  local newApple = {position = {mpos[1],mpos[2]}, velocity = {0,0}, sprite = self.appleSprite, foodAmount = 8, foodCount = 3, tasteAmount = 2, type = "fruit"}
  table.insert(self.objects, newApple)
  self.heldObject = newApple
  newApple.held = true
end

function feedMeat()
  if isMiniGameActive() then return end
  closeSecondaryMenus()
  local newMeat = {position = {mpos[1],mpos[2]}, velocity = {0,0}, sprite = self.meatSprite, foodAmount = 12, foodCount = 3, tasteAmount = 1, type = "meat"}
  table.insert(self.objects, newMeat)
  self.heldObject = newMeat
  newMeat.held = true
end

function feedBread()
  if isMiniGameActive() then return end
  closeSecondaryMenus()
  local newBread = {position = {mpos[1],mpos[2]}, velocity = {0,0}, sprite = self.breadSprite, foodAmount = 10, foodCount = 3, tasteAmount = 1.5, type = "bread"}
  table.insert(self.objects, newBread)
  self.heldObject = newBread
  newBread.held = true
end

function feedDessert()
  if isMiniGameActive() then return end
  closeSecondaryMenus()
  local newDessert = {position = {mpos[1],mpos[2]}, velocity = {0,0}, sprite = self.dessertSprite, foodAmount = 4, foodCount = 3, tasteAmount = 8, type = "sweet"}
  table.insert(self.objects, newDessert)
  self.heldObject = newDessert
  newDessert.held = true
end

function playFetch()
  if isMiniGameActive() then return end

  closeSecondaryMenus()
   local newBall = {position = {self.mpos[1],self.mpos[2]}, velocity = {0,0}, sprite = self.ballSprite, elasticity = 0.85, durability = math.random(4,10), type = "toy"}
  table.insert(self.objects, newBall)
  self.heldObject = newBall
  newBall.held = true
end

function playRace()
  closeSecondaryMenus()
  startRaceGame()
  end

function playMusic()
  closeSecondaryMenus()
  startMusicGame()
end

function isMiniGameActive()
  return self.miniGame.type ~= nil
end

function evaluateMusicNote(note)
 if self.miniGame ~= nil and self.miniGame.type == "music" then
    if self.miniGame.phase == "input" then
	  if self.miniGame.musicSequence[self.miniGame.playerNote] == note then
	    self.miniGame.playerNote = self.miniGame.playerNote + 1
		self.miniGame.time = 0
		pane.playSound(self.sounds["note"..tostring(note)])
		self.miniGame.happyFeedbackTime = 0.5
		if self.miniGame.playerNote > #self.miniGame.musicSequence then
		  setMusicNoteButtonVisibilities(false)
		  self.pet:GameTaskSuccess()
		  self.miniGame.phase = "output"
		  local interest = self.pet.stats.energy * 3 * self.pet.preferences.music / 100
		  if (math.random(1,100) < interest or #self.miniGame.musicSequence < 3) and #self.miniGame.musicSequence <= 10 then
		    table.insert(self.miniGame.musicSequence, math.random(1,4))
		    self.miniGame.delay = 1
		  else
		    self.miniGame.status = "completed"
		  end
		end
	  else
	    self.miniGame.status = "failed"
	  end
	end
  end
end

function musicNoteButton1()
  evaluateMusicNote(1)
end

function musicNoteButton2()
  evaluateMusicNote(2)
end

function musicNoteButton3()
  evaluateMusicNote(3)
end

function musicNoteButton4()
  evaluateMusicNote(4)
end

function jumpButton()
  if self.miniGame ~= nil and self.miniGame.type == "race" then
    if self.miniGame.jumping == false and self.miniGame.status == "playing" then
	  self.miniGame.jumping = true
	  self.pet.sprite.currentState = "jump"
	  self.pet.stats.energy = util.clamp(self.pet.stats.energy - (4 - self.pet.stats.fitness/33), 0, 100)
	end
  end
end

function reset()
  widget.setVisible("resetConfirm", true)
  widget.setVisible("resetCancel", true)
end

function resetConfirm()
  widget.setVisible("resetConfirm", false)
  widget.setVisible("resetCancel", false)
  
  self.pet = createPet()
  self.pet.sprite = self.petAnimation
  self.objects = {}
  self.catchUpTime = 0
  self.heldObject = nil
  self.isPetting = false
  
  self.state:set(eggScreenState)
  hidePrimaryMenus()
end

function resetCancel()
  widget.setVisible("resetConfirm", false)
  widget.setVisible("resetCancel", false)
end




  --pane.playSound(self.sounds.dispatch, -1)
  --pane.stopAllSounds(self.sounds.dispatch)
  --widget.setFontColor("connectingLabel", config.getParameter("errorColor"))

