require "/scripts/util.lua"
require "/scripts/vec2.lua"
require "/scripts/rect.lua"

function createPet(petConfig)

  local pet = {sprite = nil,
               form = "baby",
			   lastTimeOpened = 0,
               position = {200,0},
			   facing = -1,
			   stats = defaultStats(),
			   maxStats = defaultStatMaxes(),
			   preferences = randomPreferences(),
			   activity = nil,
			   objectsToSpawn = {},
			   activityCooldowns = {miniGamemusic = 0, miniGamerace = 0, beingPet = 0, evolve = 0, scamper = 0, singing = 0}}
	
	function pet:update(dt, objects)
	  if canEvolve == nil then canEvolve = false end
	  if self.activity == nil then self:StartActivity() end
	  self.sprite.stateTime = (self.sprite.stateTime + dt) % self.sprite[self.sprite.currentState].duration;
	  
	  self:UpdateStats(dt)
	  self:UpdateActivityCooldowns(dt)
	  self:UpdateCurrectActivity(dt, objects)
	end
	
	function pet:UpdateStats(dt)
	  self.stats.hunger = util.clamp(self.stats.hunger + 0.33 * dt, 0, self.maxStats.hunger)
	  self.stats.energy = util.clamp(self.stats.energy - self:GetEnergyChange() * dt, 0, self.maxStats.energy)
	  self.stats.age = util.clamp(self.stats.age + 1 * dt, 0, self.maxStats.age)
	  
	  local changeInHealth = 0
	  if self.stats.hunger > 50 then changeInHealth = -0.2 end
	  if self.stats.hunger < 20 then changeInHealth = 0.3 end
	  if self.stats.energy < 20 then changeInHealth = changeInHealth - 0.2 end
      self.stats.health = util.clamp(self.stats.health + changeInHealth * dt, 0, self.maxStats.health)
	  
	  if self.stats.energy < 15 or self.stats.hunger > 80 or self.stats.health < 15 then
	    self.stats.happiness = util.clamp(self.stats.happiness - 2 * dt, 0, self.maxStats.happiness)
	  else
	    self.stats.happiness = util.clamp(self.stats.happiness - 0.01 * dt, 0, self.maxStats.happiness)
	  end
	end
	
	function pet:UpdateActivityCooldowns(dt)
	  for k,v in pairs(self.activityCooldowns) do
	    if self.activityCooldowns[k] > 0 then self.activityCooldowns[k] = self.activityCooldowns[k] - dt end 
	  end
	end
	
	function pet:UpdateCurrectActivity(dt, objects)
	  if self.activity then
	      self.activity.time = self.activity.time + dt
		  if self.activity.type == "moveToPosition" then
			--self.position = vec2.add(self.position, {100 * dt * self.facing, 0})
			self.position = vec2.approach(self.position, self.activity.targetPosition, self:GetSpeed() * dt)
			if self.position == self.activity.targetPosition then
			  self:StartActivity(self.activity.nextActivity)
			end
		  end
		  
		  if self.activity.type == "investigate" then
			if self.activity.target == nil or self.activity.target.destroyed then
			  self:Express("surprised", 1)
			  return
			end
		  
			local dToTarget = vec2.mag(vec2.sub(self.position,self.activity.target.position))
			self.activity.d = dToTarget
			self:FacePoint(self.activity.target.position)
			--Check if pet is near the target
			if dToTarget > self.sprite.width * 0.25 * 4 then --sprite doesnt consider for the default upscaling of 4
			  self.sprite.currentState = "walk"
			  self.position = vec2.approach(self.position, {self.activity.target.position[1], 0}, self:GetSpeed() * dt)
			  if self.activity.time > 6 then
			    self:Express("sad", 2)
				self.stats.happiness = self.stats.happiness - 5
			  end
			else
			  --otherwise determine how to interact
			  self.sprite.currentState = "curious"
			  self.activity.investigateTime = self.activity.investigateTime + dt
			  if self.activity.investigateTime > 1.5 then
			    if self.preferences[self.activity.target.type] < 0 then
				  self.activity.target.ignored = true
				  self:StartRandomActivity(objects)
				  return
				elseif self.activity.target.type == "toy" then
				  self:StartActivity({type = "playFetch", target = self.activity.target, animation = "idle", energyCost = 1})
				  return
				end
			  
				if self.activity.target.foodAmount then
				  if math.random() * 100 <= self.stats.hunger then
				    if self.stats.happiness < 10 and self.activity.target.held then
					  local foodTarget = self.activity.target
					  self:Express("mad", 0.1)
					  self.activity.nextActivity = {type = "attack", target = foodTarget, animation = "strike", attackPoint = 0.125, duration = 0.5}
					else
				      self:StartActivity({type = "eating", target = self.activity.target, animation = "eat", eatTime = 0, energyCost = 0})
				    end
				  end
				end
			  end
			end
		  end
		  
		  if self.activity.type == "eating" then
			if self.activity.target == nil or self.activity.target.destroyed then
			  self:Express("confused", 1)
			  return
			end
		  
			local dToTarget = vec2.mag(vec2.sub(self.position, self.activity.target.position))
			self.activity.d = dToTarget
			self:FacePoint(self.activity.target.position)
			--Check if pet is near the target
			if dToTarget > self.sprite.width * 0.25 * 4 then
			  self.sprite.currentState = "walk"
			  self.position = vec2.approach(self.position, {self.activity.target.position[1], 0}, self:GetSpeed() * dt)
			  if self.activity.time > 6 then
			    self:Express("sad", 2)
				self.stats.happiness = self.stats.happiness - 5
			  end
			else
			  --otherwise determine how to interact
			  self.sprite.currentState = "eat"
			  self.activity.eatTime = self.activity.eatTime + dt
			  if self.activity.eatTime > self.sprite.eat.duration then
				self.activity.eatTime = 0
				if self.activity.target.foodCount > 0 then
				  local eatCount = (self.form == "snack") and 3 or 1

				  self.stats.hunger = self.stats.hunger - self.activity.target.foodAmount * eatCount
				  self.activity.target.foodCount = self.activity.target.foodCount - eatCount

				  --self.activity.target.sprite.currentState = "stage"..tostring(4-self.activity.target.foodCount)

				  local happinessMultiplier = self.activity.target.held and 1 or 0.25
				  self.stats.happiness = self.stats.happiness + (self.activity.target.tasteAmount or 0.1) * happinessMultiplier* eatCount
				  self.stats.fullness = self.stats.fullness + ((self.activity.target.tasteAmount or 5) + (self.activity.target.foodAmount or 6) / 3) * eatCount
				  if self.activity.target.type == "fruit" then self.stats.health = self.stats.health + eatCount end
				  
				  if self.activity.target.type == "meat" or self.activity.target.type == "fruit" or self.activity.target.type == "bread" or self.activity.target.type == "sweet" then 
				    self.stats[self.activity.target.type] = self.stats[self.activity.target.type] + eatCount
				  end
				  
				  if self.activity.target.foodCount <= 0 then
				    self.activity.target.destroyed = true
					if self.preferences[self.activity.target.type] >= 65 then
					  self:Express("happy", 2)
					elseif self.preferences[self.activity.target.type] >= 40 then
					  self:Express("content", 2)
					elseif self.preferences[self.activity.target.type] >= 15 then
					  self:Express("disappointed", 2)
					else
					  self:Express("mad", 2)
					end
				  end
				end
			  end
			end
		  end
		  
		  if self.activity.type == "sleeping" then
		    self.activity.sleepTime = self.activity.sleepTime + dt
		    if (self.activity.sleepDuration and self.activity.sleepTime >= self.activity.sleepDuration) or (self.stats.energy >= 100) then
		      self:StartActivity()
		    end
		  end
		  
		  if self.activity.type == "expressing" then
		    if (self.activity.duration and self.activity.time >= self.activity.duration) or (self.activity.duration == nil) then
		      self:StartActivity(self.activity.nextActivity)
		    end
		  end
		  
		  if self.activity.type == "pooping" then
		    if (self.activity.duration and self.activity.time >= self.activity.duration) or (self.activity.duration == nil) then
		      self.stats.fullness = util.clamp(self.stats.fullness - 50, 0, 100)
			  
			  if self.form == "skully" then
			    table.insert(self.objectsToSpawn, "bone")
			  elseif self.form == "molder" then
			    table.insert(self.objectsToSpawn, "shroom")
			  else
			    table.insert(self.objectsToSpawn, "poop")
			  end
			  
			  if self.activity.nextActivity then
			    self:StartActivity(self.activity.nextActivity)
			  else
			    self:BeginMovingToLocation({math.random(30,370), 0})
			  end
		    end
		  end
		  
		  if self.activity.type == "attack" then
		    if self.activity.attackPoint and self.activity.target then
			  if self.activity.attackPoint > 0 then
			    self.activity.attackPoint = self.activity.attackPoint - dt
				if self.activity.attackPoint <= 0 then
				  self.activity.target.held = nil
				  if self.activity.target.durability then self.activity.target.durability = self.activity.target.durability - 1 end
				  if self.activity.randomDirection then
				    self.activity.target.velocity = {math.random(-400,400), math.random(50,400)}
				  else
				   self.activity.target.velocity = {self.facing * math.random(50,400), math.random(50,400)}
				  end
				end
			  end
			end
			
		    if (self.activity.duration and self.activity.time >= self.activity.duration) or (self.activity.duration == nil) then
		      self:StartActivity(self.activity.nextActivity)
		    end
			
			if self.activity.target and self.activity.target.destroyed and self.activity.target.durability > 0 then
			  self:Express("confused",1)
			end
		  end
		  	
		  if self.activity.type == "playFetch" then
			if self.activity.target == nil then
			  self:Express("confused", 1)
			  return
			elseif  self.activity.target.destroyed  then
			  if self.activity.target.durability and self.activity.target.durability <= 0 then
			    self:Express("content", 2)
				self.stats.toy = self.stats.toy + 1
			  else
			    self:Express("surprised",1)
			  end
			  return
			end
		  
		    local dToTarget = vec2.mag(vec2.sub(self.position,self.activity.target.position))
			self.activity.d = dToTarget
			self:FacePoint(self.activity.target.position)
			--Check if pet is near the target
			if dToTarget > self.sprite.width * 0.25 * 4 then --sprite doesnt consider for the default upscaling of 4
			  self.sprite.currentState = "walk"
			  self.position = vec2.approach(self.position, {self.activity.target.position[1], 0}, self:GetSpeed() * dt)
			elseif self.activity.time > 0.1 then
			  local hitBall = self.activity.target
			  self:StartActivity({type = "attack", target = hitBall, animation = "strike", attackPoint = 0.125, duration = 0.5, randomDirection = true, energyCost = 5}) 
			  self.stats.happiness = util.clamp(self.stats.happiness + 3 * self.preferences.toy / 100, 0, 100)
			  self.stats.fitness = util.clamp(self.stats.fitness + 0.5, 0, 100)
			  local isBored = self.stats.energy < 10
			  if not isBored then
			    self.activity.nextActivity = {type = "expressing", animation = "happy",  duration = 1, nextActivity = {type = "playFetch", target = hitBall, energyCost = 1}}
			  else
			    self:StartActivity()
			  end
			end
		  end
		  
		  if self.activity.type == "miniGamemusic" then
		    if self.activity.miniGame.status == "failed" then
			  self:Express("disappointed", 1)
			elseif self.activity.miniGame.status == "completed" then
			  self:CompleteGame("music")
			else
		      if self.activity.miniGame.phase == "output" and self.activity.miniGame.delay <= 0 then
			    if self.activity.miniGame.time - math.floor(self.activity.miniGame.time) < 0.6 then
			      self.sprite.currentState = "surprised"
			    else
			      self.sprite.currentState = "content"
			    end
			  else
			    if self.activity.miniGame.happyFeedbackTime and self.activity.miniGame.happyFeedbackTime > 0 then
				  self.sprite.currentState = "content"
				else
                  self.sprite.currentState = "idle"
			    end
				if self.activity.miniGame.time > 10 then
				  self:Express("confused", 2)
				end
			  end
			end
		  end
		  
		  if self.activity.type == "miniGamerace" then
		    if self.activity.miniGame.status == "failed" or (self.stats.energy == 0 and self.activity.miniGame.jumping == false) then
			  self:Express("disappointed", 1)
			  self.position[2] = 0
			elseif self.activity.miniGame.status == "completed" then
			  self:CompleteGame("race")
			  self.position[2] = 0
			else
		      if self.activity.miniGame.status == "startup" then
			    local screenCenter = {200,0}
			    local dToTarget = vec2.mag(vec2.sub(self.position, screenCenter))
			    self.activity.d = dToTarget
			    self:FacePoint(screenCenter)
			    --Check if pet is near the target
			    if self.position[1] ~= screenCenter[1] then
			      self.position = vec2.approach(self.position, screenCenter, self:GetSpeed() * dt)
				else
				  self.activity.miniGame.status = "playing"
				  self:FacePoint({400,0})
				end
			  else
			    if self.activity.miniGame.jumping then
				  self.position[2] = self.activity.miniGame.jumpOffset[2]
				else
				  self.position[2] = 0
				end
			  end
			end
		  end
		  
		  if self.activity.type == "evolving" then
		    if self.activity.time >= self.activity.duration then
			  self:ChangeForm(self.activity.newForm, true)
			  self:Express("confused", 1)
			end
		  end
		  
		  if self.activity.type == "beingPet" then
		    if self.activity.pettingStopped or self.activity.time >= self.activity.duration then
			    self:Express("happy", 1)
				self.activityCooldowns.beingPet = 5
				if self.preferences.music > 60 then table.insert(self.objectsToSpawn, "note" .. tostring(math.random(1,4))) end
			else
			  self.stats.happiness = util.clamp(self.stats.happiness + dt * 2, 0, self.maxStats.happiness) 
			  self.position[1] = self.position[1] + math.sin(self.activity.time * math.pi) * dt * 5
			  if self.stats.energy < 50 and self.activity.time > 2 then
			    if math.random(1,100) < 10 then
				  self:GoToSleep()
				  self.activityCooldowns.beingPet = 5
				end
			  end
			  
			  if self.stats.energy > 60 and self.activity.time > 2 and self.preferences.race > 50 and math.random(1,100) < self.preferences.race then
				  self:Scamper(math.random(2,4))
				  self.activityCooldowns.beingPet = 5
		      end
			end
		  end
		  
		  if self.activity.type == "scamper" then
		    self.position[1] = self.position[1] + self:GetSpeed() * dt * 2.5 * self.facing
			if self.position[1] < 0 then 
			  self.facing = 1
			  self.position[1] = 0
			elseif self.position[1] > 400 then
			  self.facing = -1
			  self.position[1] = 400
			end
			if self.activity.time > self.activity.duration then
			  self.activityCooldowns.scamper = 5
			  if self.stats.happiness > 60 then
			    self:Express("happy", 1)
			  else
				self:Express("content", 1)
			  end
			else
			  if self.stats.energy < 25 then
			    if math.random(1,100) > self.stats.energy * 4 then
				  self:GoToSleep()
				end
			  end
			end
		  end
		  
		  if self.activity.type == "singing" then
		    if self.activity.time > self.activity.duration then
			  self:StartActivity()
			  self.activityCooldowns.singing = 5
			else
			  self.activity.noteSpawnTimer = self.activity.noteSpawnTimer + dt
			  if self.activity.noteSpawnTimer >= self.activity.noteSpawnRate then
			    table.insert(self.objectsToSpawn, "note" .. tostring(math.random(1,4)))
				self.activity.noteSpawnTimer = 0
			  end
			end			
		  end
		  
          if self.activity.type == nil then
			if self.activity.time > (self.activity.changeTime or 3) then
			  self:StartRandomActivity(objects)
			end
		  end
		end
	end
	
	function pet:StartActivity(newActivity)
	  self.activity = newActivity or {}
	  self.activity.time = 0
	  self.activity.changeTime = math.random() * 3 + 1.5
	  
	  self.sprite.currentState = self.activity.animation or "idle"
	  self.sprite.stateTime = 0
	  sb.logInfo("starting activity:" .. tostring(self.activity.type or "none"))
	end
	
	function pet:BeginMovingToLocation(targetPosition)
	  self:StartActivity({type = "moveToPosition", targetPosition = targetPosition, animation = "walk", energyCost = 2})
      self:FacePoint(targetPosition)
	end
	
	function pet:InvestigateObject(object)
	  self:StartActivity({type = "investigate", target = object, investigateTime = 0})
	end
		
	function pet:GoToSleep(duration)
	  self:StartActivity({type = "sleeping", animation = "sleep", duration = duration, sleepTime = 0, energyCost = -4})
	end
	
	function pet:Express(emotion, duration)
	  self:StartActivity({type = "expressing", animation = emotion, duration = duration})
	end
	
	function pet:Poop()
	  self:StartActivity({type = "pooping", animation = "disappointed", duration = 2})
	end
	
	function pet:Scamper(duration)
	  self:StartActivity({type = "scamper", animation = "walk", duration = duration, energyCost = 1.5})
	end
	
	function pet:Sing(duration, noteSpawnRate)
	  self:StartActivity({type = "singing", animation = "content", duration = duration, energyCost = 0.75, noteSpawnTimer = noteSpawnRate or 1, noteSpawnRate = noteSpawnRate or 1})
	end
	
	function pet:ChangeForm(formName, resetAge)
	  local formSpriteChanges = config.getParameter(formName.."AnimationOverrides")
	  for k,v in pairs(formSpriteChanges) do
	    self.sprite[k] = v
	  end
	  
	  self.sprite.stateTime = 0
	  if formName then
	    self.form = formName
	  end
	  
	  if resetAge then
	    self.stats.age = 0

	    local changes = config.getParameter(formName.."Changes")
		local nextForms = config.getParameter(formName.."PotentialEvolutions")
	    self.nextForms = nextForms
		if changes == nil then return end
		  
		if changes.statChanges then
		  for k,v in pairs(changes.statChanges) do
		    if v.set then
		 	  self.stats[k] = v.value
			elseif v.add then
			  self.stats[k] = self.stats[k] + v.value
			elseif v.multiply then
			  self.stats[k] = self.stats[k] * v.value
			end
		  end
		end
		  
		if changes.statMaxChanges then
		  for k,v in pairs(changes.statMaxChanges) do
		    if v.set then
		 	  self.maxStats[k] = v.value
			elseif v.add then
			  self.maxStats[k] = self.maxStats[k] + v.value
			elseif v.multiply then
			  self.maxStats[k] = self.maxStats[k] * v.value
		    end
		  end
		end
		  
		if changes.preferenceChanges then
		  for k,v in pairs(changes.preferenceChanges) do
		    if v.set then
		 	  self.preferences[k] = v.value
			elseif v.add then
			  self.preferences[k] = self.preferences[k] + v.value
			elseif v.multiply then
			  self.preferences[k] = self.preferences[k] * v.value
			end
		  end
		end
	  end
	end

	
	function pet:AttemptToPlayGame(miniGame)
	  if miniGame == nil then return false end
	  
      sb.logInfo("trying minigame:" .. tostring(miniGame.type)) 
	  
	  if self.activityCooldowns["miniGame"..miniGame.type] > 0 then return end
	  local interest = self.stats.energy * 3 * self.preferences[miniGame.type] / 100
	  if self.activity.type ~= nil then
	    interest = interest - 10
		if self.activity.type == "eating" or self.activity.type == "playFetch" then interest = interest - 20 end
		if self.activity.type == "sleeping" or self.activity.type == "miniGamemusic" or self.activity.type == "miniGamerace" then interest = 0 end
	  end
	  
	  if math.random(1,100) < interest then
	    if miniGame.type == "music" then
	      self:StartMusicGame(miniGame)
		elseif miniGame.type == "race" then
		  self:StartRaceGame(miniGame)
		 end
		 
		return true
	  else
	    if self.activity.type == nil then
		  self:Express("disappointed", 0.5)
		end
	  end
	  
	  self.activityCooldowns["miniGame"..miniGame.type] = 3
	  return false
	end
	
	function pet:StartMusicGame(miniGame)
	  self:StartActivity({type = "miniGamemusic", animation = "idle", miniGame = miniGame, energyCost = 1})
	end

	function pet:StartRaceGame(miniGame)
	  self:StartActivity({type = "miniGamerace", animation = "walk", miniGame = miniGame, energyCost = 1})
	  self.activity.miniGame.maxHurdles = util.clamp(math.random() * 5  + math.random() * self.preferences.race / 10, 3, 10)
	end
	
	function pet:BeginEvolution(newForm)
	  self:StartActivity({type = "evolving", animation = "surprised", energyCost = 0, newForm = newForm, duration = 3})
	end
	
	function pet:StartBeingPetted()
	  if self.activity.type ~= nil then return false end
	  if self.activityCooldowns.beingPet > 0 then return false end
	  
	  local rand = math.random(1,100)
	  if rand > self.stats.hunger - self.stats.happiness / 2 then
        self:StartActivity({type = "beingPet", animation = "content", duration = math.random() * 3 + 3, pettingStopped = false})
	    return true
	  else
	    self:StartRandomActivity()
	    return false
	  end
	end
	
	function pet:FacePoint(point)
	  if self.position[1] < point[1] then
	    self.facing = 1
	  else
	    self.facing = -1
	  end
	end

    function pet:GetEnergyChange()
      local defaultEnergyCost = 0.5
      if self.activity then
        if self.activity.energyCost ~= nil then return self.activity.energyCost end
      end

      return defaultEnergyCost
    end
	
	function pet:GetSpeed()
	  return 100 + self.stats.fitness
	end
	
	function pet:StartRandomActivity(objects)	
	  local weightedActivities = {}
	  table.insert(weightedActivities, {15, "moveRandomly"})
	
	  if self.activityCooldowns.evolve <= 0 then
	    local validEvolutions = self:CheckForValidEvolutions()
	    if #validEvolutions > 0 then
	      for k,v in pairs(validEvolutions) do
		    table.insert(weightedActivities, {35, {"evolve", v}})
		  end
	    end
      end
	  
	  if self.stats.energy < 75 then
	    table.insert(weightedActivities, {75-self.stats.energy,"sleep"})
	  end
	  
	  if self.stats.hunger > 50 then
	    table.insert(weightedActivities, {self.stats.hunger / 2 - 10,"sad"})
	  end
	  
	  if self.stats.fullness > 40 then
	    table.insert(weightedActivities, {self.stats.fullness - 30, "poop"})
	  end
	  
	  if self.stats.happiness > 50 and self.stats.hunger < 70 and self.stats.energy > 30 then
		table.insert(weightedActivities, {self.stats.happiness/4 - 10, "content"})
		if self.stats.happiness > 75 then
		   table.insert(weightedActivities, {self.stats.happiness/3 - 20, "happy"})
		end
	  end
	  
	  if self.stats.energy > 65 and self.preferences.race > 50 and self.activityCooldowns.scamper <= 0 then
	    table.insert(weightedActivities, {self.stats.energy / 4 + self.preferences.race / 4 - 15, "scamper"})
	  end
	  
	  if self.preferences.music > 50 and self.activityCooldowns.singing <= 0 then
	    table.insert(weightedActivities, {self.stats.happiness / 8 + self.preferences.music / 4 - 15, "sing"})
	  end
	  
	  local poopCount = 0
	  if objects then
	    for k,v in pairs(objects) do
		  if v.type == "poop" then poopCount = poopCount + 1 end
		  if not v.ignored and v.position[2] < 40 then
		    local interest = v.held and 25 or 1
		    if v.type == "fruit" or v.type == "meat" or v.type == "bread" or v.type == "sweet" then
			  interest = interest + (self.stats.hunger * 2) * (self.preferences[v.type] / 100)
			  table.insert(weightedActivities, {interest, {"investigate", v}})
			elseif v.type == "toy" then
			  interest = interest + (self.stats.energy * 2 - self.stats.hunger) * (self.preferences[v.type] / 100)
			  table.insert(weightedActivities, {interest, {"investigate", v}})
			end
		  end
		end 
	  end
	  
	  if poopCount >= 4 and self.activityCooldowns.evolve <= 0 then
	    table.insert(weightedActivities, {poopCount * 8, {"evolve", "molder"}})
	  end
	  
	  local randomWeightsString = "Random Choices:\n"
	  for k,v in pairs(weightedActivities) do
	    if type(v[2]) == "table" then
		  randomWeightsString = randomWeightsString .. tostring(v[2][1]) .. tostring(v[2][2].type) .. ":" .. tostring(v[1]) .. "\n"
		else
	      randomWeightsString = randomWeightsString .. tostring(v[2]) .. ":" .. tostring(v[1]) .. "\n"
	    end
	  end
	  sb.logInfo(randomWeightsString)
	  
	  local choice = util.weightedRandom(weightedActivities)
	  
	  if choice == "moveRandomly" then
	    self:BeginMovingToLocation({math.random(30,370), 0})
	  elseif choice == "sleep" then
	    self:GoToSleep()
	  elseif choice == "sad" then
	    self:Express("sad", 4)
	  elseif choice == "happy" then
	    self:Express("happy", 2)
	  elseif choice == "content" then
	    self:Express("content", 2)
	  elseif choice == "poop" then
	    self:Poop()
      elseif choice == "sing" then
	    self:Sing(math.random(5,7), math.random() * 2 + 1)
	  elseif choice == "scamper" then
	    self:Scamper(math.random(2,4))
	  elseif choice[1] == "investigate" then
	    self:InvestigateObject(choice[2])
	  elseif choice[1] == "evolve" then
	    self:BeginEvolution(choice[2])
	  end
	end
	
	function pet:CheckForValidEvolutions()
	  local formsWithReqsMet = {}
	  local potentialForms = config.getParameter(self.form.."PotentialEvolutions")
	  
	  if potentialForms == nil then return formsWithReqsMet end
	  
	  for _,potentialForm in ipairs(potentialForms) do
	    local reqs = config.getParameter(potentialForm.."Requirements")
	    if reqs ~= nil then
	      if self:AreAllRequirementsMet(reqs) then table.insert(formsWithReqsMet, potentialForm) end
		end
	  end
	  
	  return formsWithReqsMet
	end
	
	function pet:AreAllRequirementsMet(reqs)
	if reqs.statRequirements then
	  for k,v in pairs(reqs.statRequirements) do
	    if v.over and self.stats[k] < v.value then return false end
		
		if v.under and self.stats[k] > v.value then return false end
	    
		if v.equal and self.stats[k] ~= v.value then return false end
	  end
	else
	  return false
	end
	
	return true
	end
	
	function pet:GetSaveData()
	  local data = {}
	  --data.sprite = self.sprite
	  data.stats = self.stats
	  data.form = self.form
	  data.maxStats = self.maxStats
	  data.preferences = self.preferences
	  data.lastTimeOpened = os.clock()
	  return data
	end
	
	function pet:GetObjectSpawns()
	  local objects = self.objectsToSpawn
	  self.objectsToSpawn = {}
	  return objects
	end
	
	function pet:GameTaskSuccess()
	  if self.activity.type == nil then return end
	  local happinessGained = 0
	  if self.activity.type == "miniGamemusic" then
	    happinessGained = util.clamp( #self.activity.miniGame.musicSequence * self.preferences.music / 100 * 2.5, 1, 10)
		self.stats.happiness = util.clamp(self.stats.happiness + happinessGained, 0, 100)
	  elseif self.activity.type == "miniGamerace" then
	    happinessGained = util.clamp( self.activity.miniGame.totalHurdlesSpawned * self.preferences.race / 100 * 0.75, 1, 10)
		self.stats.happiness = util.clamp(self.stats.happiness + happinessGained, 0, 100)
		self.stats.fitness = util.clamp(self.stats.fitness + 1, 0, 100)
	  end
	
	end
	
	function pet:CompleteGame(gameName)
	  if self.activity.type == ("miniGame".. gameName) then
	    self.stats[gameName] = self.stats[gameName] + 1
	    if self.preferences[gameName] > 65 then
		  self:Express("happy", 2)
		elseif self.preferences[gameName] > 40 then
		  self:Express("content", 2)
		else
		  self:Express("disappointed", 2)
	    end
	  end
	end
	
	function pet:debugStatString()
	  local statString = ""
	  for k,v in pairs (self.stats) do
	    --if k ~= "meat" and k ~= "fruit" and k ~= "bread" and k ~= "sweet" and k ~= "vegetable" then
	      statString = statString .. tostring(k) .. ":" .. tostring(v) .. "\n"
		--end
	  end
	  
	 -- for k2,v2 in pairs(self.activityCooldowns) do
	 --   statString = statString .. tostring(k2) .. ":" .. tostring(v2) .. "\n"
	  --end
	  return statString
	end
	
	function pet:debugActivityString()
	  local activityString = "activity:".. tostring(self.activity).."\n"
	  
	  if self.activity then
	    for k,v in pairs(self.activity) do
	      activityString = activityString .. tostring(k) .. ":" .. tostring(v) .. "\n"
	    end
	  end
	  return activityString
	end
    
	function pet:debugSaveString()
	  local saveString = "--save data--\n"
	  for k,v in pairs (self:GetSaveData()) do
	    saveString = saveString .. tostring(k) .. ":" .. tostring(v) .. "\n"
	  end
	  return saveString
	end
	
	function pet:debugPreferencesString()
	  local preFString = ""
	  for k,v in pairs (self.preferences) do
	    preFString = preFString .. tostring(k) .. ":" .. tostring(v) .. "\n"
	  end
	  return preFString
	end
	
  return pet
end

function defaultStats()
  return {hunger = 50, happiness = 50, energy = 59, fitness = 0, age = 0, meat = 0, fruit = 0, bread = 0, sweet = 0, toy = 0, race = 0, music = 0, fullness = 0, health = 80}
end

function defaultStatMaxes()
  return {hunger = 100, happiness = 100, energy = 100, fitness = 100, age = 9000, meat = 100, fruit = 100, bread = 100, sweet = 100, toy = 100, race = 100, music = 100, fullness = 100, health = 100}
end

function defaultPreferences() --all object types and game types
  return {fruit = 0, meat = 0, bread = 0, sweet = 0, poop = -1, toy = 0, race = 0, music = 0}
end

function randomPreferences()
  local prefs = defaultPreferences()
  local foodPrefTotal = 100
  local playPrefTotal = 75
  
  prefs.fruit = math.random(0,50)
  prefs.meat = math.random(0,50)
  prefs.bread = math.random(0,50)
  prefs.sweet = math.random(0,70)
  prefs.toy = math.random(0,50)
  prefs.race = math.random(0,50)
  prefs.music = math.random(0,50)
  
  while foodPrefTotal > 0 do
    local randomFood = util.randomChoice({"fruit","meat","bread","sweet"})
	if prefs[randomFood] and prefs[randomFood] < 100 then 
	  prefs[randomFood] = prefs[randomFood] + 1
	  foodPrefTotal = foodPrefTotal - 1
	end
  end

  while playPrefTotal > 0 do
    local randomPlay = util.randomChoice({"toy","race","music"})
	if prefs[randomPlay] and prefs[randomPlay] < 100 then 
	  prefs[randomPlay] = prefs[randomPlay] + 1
	  playPrefTotal = playPrefTotal - 1
	end
  end
  return prefs
end

