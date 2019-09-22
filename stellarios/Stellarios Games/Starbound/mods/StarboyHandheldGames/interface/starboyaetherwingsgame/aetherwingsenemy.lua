require "/scripts/util.lua"
require "/scripts/vec2.lua"
require "/scripts/rect.lua"
require "/scripts/poly.lua"
require "/scripts/starboyutil.lua"

function CreateEnemyShip(shipConfig)

  local ship = {position = {300,150},
                velocity = {0,0},
				moveDir = {0,0},
                poly = {{15.0, -2.0}, {-4.0, 5.0}, {-13.0, 7.0}, {-6.0, 1.0}, {-9.0, -4.0}},
				color = "yellow",
				weapons = {{type = "machinegun", level = 1, time = math.random() * 0.75 + 0.5, cooldown = 5}},
				firedBullets = {},
				rotationType = "locked",
				rotation = 0,
				moveType = "Wave", 
				time = 0,
				hp = 1,
				radius = 18,
				destroyed = false
				}
  if shipConfig then
    util.mergeTable(ship, shipConfig)
  end
  
  function ship:Update(dt, player, scrollAmount)
    self:DefaultScroll(scrollAmount)
	if self.position[1] > 400 then return end
	
	self.time = self.time + dt
	
	if self.shieldTime and self.shieldTime > 0 then
	  self.shieldTime = self.shieldTime - dt
	end
	
	for k,v in pairs(self.weapons) do
	  if v.time > 0 then v.time = v.time - dt end
	  if v.ammo and v.ammo <= 0 and v.reloadTime then
	    if v.time <= 0 then v.ammo = v.maxAmmo or 3 end 
	  end
	  
	  if v.type == "mirrorreflector" and self.shieldTime and self.shieldTime <= 0 then
	    v.subPoly = nil
	  end
	  
	  if v.subPoly then 
	    if v.aimAtPlayer then
	      local targetAngle = vec2.angle(vec2.sub(player.position, self.position)) 
        local angle = wrapAngle(v.angle)
        local angleDiff = math.max(angle, targetAngle) - math.min(angle, targetAngle)
        if angleDiff > math.pi then
          if angle < targetAngle then angle = angle + math.pi * 2
          elseif angle > targetAngle then targetAngle = targetAngle + math.pi * 2
        end
		  end
		  local newAngle = approachValue(angle, targetAngle, math.pi * 0.5 * dt)
	      v.angle = wrapAngle(newAngle)
		end
	  end
	  
	  if v.time <= 0 and not offScreen(self.position)  then
	    if v.ammo == nil or v.ammo > 0 then
		  self:FireWeapon(player, v)
		end
	  end
	end
	
	if self.moveType == "Wave" then
	  self:MoveWave(dt)
	elseif self.moveType == "easeout" then
	    --self.moveDir = vec2.rotate( )
		self.moveDir[1] = util.lerp(dt, self.moveDir[1], -1)
		self.moveDir[2] = util.lerp(dt, self.moveDir[2], 0) 
	    self:MoveForward(dt)
	elseif self.moveType == "chase" then
	  self:ChasePlayer(player, dt)
	end

	if self.rotationType == "withMovement" then
	  self.rotation = math.atan(self.velocity[2], self.velocity[1])
	end
	
	if self.position[1] < -50 then
	  self.destroyed = true
	end
  end
  
  function ship:FireWeapon(player, weapon)
    if weapon.ammo ~= nil then
	  if weapon.ammo <= 0 then
	    return
	  else 
	    weapon.ammo = weapon.ammo - 1
	  end
    end
	
	if weapon.type == "machinegun" then
	  local vecToPlayer = vec2.norm(vec2.sub(player.position, self.position))
	  local angleToPlayer = math.atan(vecToPlayer[2], vecToPlayer[1])
	  local firePosition = vec2.add(self.position, weapon.relativePosition or {0,0})
	  local fireAngle = (weapon.subPoly) and weapon.angle or angleToPlayer
	  table.insert(self.firedBullets, {position = firePosition, velocity = {math.cos(fireAngle) * 120,math.sin(fireAngle) * 120}, destroyed = false, type = weapon.type})
	  weapon.time = weapon.cooldown
	elseif weapon.type == "stargun" then
	  local firePosition = vec2.add(self.position, weapon.relativePosition or {0,0})
	  local totalShots = weapon.bulletCount or 4
	  for i = 1, totalShots, 1 do
	    local fireAngle = i * (math.pi * 2) / totalShots  
	  	table.insert(self.firedBullets, {position = firePosition, velocity = {math.cos(fireAngle) * 100,math.sin(fireAngle) * 100}, destroyed = false, type = weapon.type})
	  end
	  weapon.time = weapon.cooldown
	elseif weapon.type == "spreadgun" then
      local firePosition = vec2.add(self.position, weapon.relativePosition or {0,0})
	  local totalShots = weapon.bulletCount or 3
	  for i = 1, totalShots, 1 do
	    local fireAngle = (i - math.floor(totalShots/2) - 1 ) * (weapon.arc or math.pi * 0.5) / totalShots + (weapon.angle or 0.01)
	  	table.insert(self.firedBullets, {position = firePosition, velocity = {math.cos(fireAngle) * 100,math.sin(fireAngle) * 100}, destroyed = false, type = weapon.type})
	  end
	  weapon.time = weapon.cooldown
	elseif weapon.type == "shotgun" then
	  local firePosition = vec2.add(self.position, weapon.relativePosition or {0,0})
	  local totalShots = weapon.bulletCount or 5
	  local arc = weapon.arc or math.pi * 0.5
	  for i = 1, totalShots, 1 do
	    local fireAngle = math.random() * arc - arc / 2 + (weapon.angle or 0.01)
		local speed = math.random(75, 150)
	  	table.insert(self.firedBullets, {position = firePosition, velocity = {math.cos(fireAngle) * speed, math.sin(fireAngle) * speed}, destroyed = false, type = weapon.type})
	  end
	  weapon.time = weapon.cooldown
	elseif weapon.type == "spawner" then
      table.insert(self.firedBullets, {type = "ship", position = vec2.add(self.position, weapon.relativePosition or {0,0}), moveDir = {math.cos(weapon.angle), math.sin(weapon.angle)}, speed = 50, moveType = "easeout", color = "yellow", poly = {{-3.7, 0.0}, {-3.7, 2.2}, {-12.3, 2.2}, {-3.7, 8.6}, {4.8, 8.6}, {9.1, 2.2}, {4.8, 2.2}, {4.8, 0.0}, {4.8, 0.0}, {4.8, -2.1}, {9.1, -2.1}, {4.8, -8.5}, {-3.7, -8.5}, {-12.3, -2.1}, {-3.7, -2.1}, {-3.7, 0.0}}})
	  weapon.time = weapon.cooldown
	elseif weapon.type == "mirrorreflector" then
	  self.shieldTime = weapon.duration or 1
	  weapon.time = weapon.cooldown
	  weapon.subPoly = self.shieldPoly
	end
	
	if weapon.ammo and weapon.ammo <= 0 and weapon.reloadTime then
	  weapon.time = weapon.reloadTime
	end
  end
  
  function ship:TakeDamage(damage)
    if self.shieldTime ~= nil then
	  if self.shieldTime > 0 then
	    local angle = math.random() * 2 * math.pi
	    table.insert(self.firedBullets, {position = {self.position[1], self.position[2]}, velocity = {math.cos(angle) * 120,math.sin(angle) * 120}, destroyed = false, type = "machinegun"})
	    return
	  end
	end
    self.hp = self.hp - damage
	if self.hp <= 0 then self.destroyed = true end
  end
  
  function ship:MoveForward(dt)
  	self.velocity = clampMag(vec2.mul(self.moveDir, self.speed or 300), self.speed or 300)
	self.position = vec2.add(self.position, vec2.mul(self.velocity, dt))
  end
  
  function ship:MoveWave(dt)
    if self.centerPosition == nil then self.centerPosition = {self.position[1], self.position[2]} end
	self.centerPosition = vec2.add(self.centerPosition, vec2.mul(self.velocity, dt))
	
	local offset = math.sin(self.time * (self.wavePeriod or 1)) * (self.waveAmplitude or 30) 
	self.position = vec2.add(self.centerPosition, {0, offset})
  end
    
  function ship:ChasePlayer(player,dt)
    local targetAngle = vec2.angle(vec2.sub(player.position, self.position)) 
    local angle = math.atan(self.moveDir[2], self.moveDir[1])
    local angleDiff = math.max(angle, targetAngle) - math.min(angle, targetAngle)
    if angleDiff > math.pi then
	  if angle < targetAngle then angle = angle + math.pi * 2
	  elseif angle > targetAngle then targetAngle = targetAngle + math.pi * 2 end
    end
	local turnSpeed = self.turnSpeed or math.pi * 0.5
    local newAngle = approachValue(angle, targetAngle, turnSpeed * dt)
    self.moveDir = {math.cos(newAngle), math.sin(newAngle)}
	self:MoveForward(dt)
  end
  
  function ship:DefaultScroll(scrollAmount)
    self.position = vec2.add(self.position, {scrollAmount, 0})
	if self.centerPosition ~= nil then self.centerPosition = vec2.add(self.centerPosition, {scrollAmount, 0}) end
  end
	
  return ship
end