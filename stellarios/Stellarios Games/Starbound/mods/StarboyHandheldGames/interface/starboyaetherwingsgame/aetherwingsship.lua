require "/scripts/util.lua"
require "/scripts/vec2.lua"
require "/scripts/rect.lua"
require "/scripts/poly.lua"
require "/scripts/starboyutil.lua"

function CreateShip(shipConfig)

  local ship = {position = {200,150},
                velocity = {0,0},
				moveDir = {0,0},
				speed = 200,
                poly = {{15.0, -2.0}, {-4.0, 5.0}, {-13.0, 7.0}, {-6.0, 1.0}, {-9.0, -4.0}},
				color = "white",
				weapon = {type = "machinegun", level = 1, time = 0},
				hp = 3,
				invulTimer = 0,
				firedBullets = {}}
  if shipConfig then
    util.mergeTable(ship, shipConfig)
  end
  
  function ship:Update(dt)
    if self.weapon.time > 0 then self.weapon.time = self.weapon.time - dt end
	if self.invulTimer > 0 then
	  self.invulTimer = self.invulTimer - dt
	  if self.invulTimer <= 0 then
	    self.color = "white"
	  else
	    self.color = (self.invulTimer % 0.2) < 0.1 and {100,100,100} or {200,200,200}
	  end
	end
	
	
	
	
	--local accel = vec2.mul(self.moveDir, dt * 1000)
	--if accel[1] ~= 0 or accel[2] ~= 0 then
	--  self.velocity = clampMag(vec2.add(self.velocity, accel), 300)
   -- elseif self.velocity[1] ~= 0 or self.velocity[2] ~= 0 then
	--  self.velocity = vec2.mul(self.velocity, 0.7)
	--  if vec2.mag(self.velocity) < 3 then self.velocity = {0,0} end
	--end
	self.velocity = clampMag(vec2.mul(self.moveDir, self.speed), self.speed)
	
	self.position = vec2.add(self.position, vec2.mul(self.velocity, dt))
	
	
	
	self.moveDir = {0,0}
  end
  
  function ship:FireWeapon()
    if self.weapon.time <= 0 then
      if self.weapon.type == "machinegun" then
	    self:FireMachineGun()
		return true
	  end
	end
	return false
  end
  
  function ship:FireMachineGun()
  	  if self.weapon.level == 1 then
	    table.insert(self.firedBullets, {position = {self.position[1], self.position[2]}, velocity = {350,0}, destroyed = false, type = "machinegun"})
	    self.weapon.time = 0.25
	  elseif self.weapon.level == 2 then
	    table.insert(self.firedBullets, {position = {self.position[1], self.position[2] + 4}, velocity = {350,0}, destroyed = false, type = "machinegun"})
	    table.insert(self.firedBullets, {position = {self.position[1], self.position[2] - 4}, velocity = {350,0}, destroyed = false, type = "machinegun"})
	    self.weapon.time = 0.3
	  elseif self.weapon.level == 3 then
		table.insert(self.firedBullets, {position = {self.position[1], self.position[2]}, velocity = {350,0}, destroyed = false, type = "machinegun"})
		table.insert(self.firedBullets, {position = {self.position[1], self.position[2] + 2}, velocity = {323, 134}, destroyed = false, type = "machinegun"})
	    table.insert(self.firedBullets, {position = {self.position[1], self.position[2] - 2}, velocity = {323, -134}, destroyed = false, type = "machinegun"})
		self.weapon.time = 0.25
	  elseif self.weapon.level == 4 then
	    table.insert(self.firedBullets, {position = {self.position[1], self.position[2] + 4}, velocity = {350,0}, destroyed = false, type = "machinegun"})
	    table.insert(self.firedBullets, {position = {self.position[1], self.position[2] - 4}, velocity = {350,0}, destroyed = false, type = "machinegun"})
	    table.insert(self.firedBullets, {position = {self.position[1], self.position[2] + 4}, velocity = {247.5,247.5}, destroyed = false, type = "machinegun"})
	    table.insert(self.firedBullets, {position = {self.position[1], self.position[2] - 4}, velocity = {247.5,-247.5}, destroyed = false, type = "machinegun"})
	    self.weapon.time = 0.25
	  elseif self.weapon.level >= 5 then
	    table.insert(self.firedBullets, {position = {self.position[1], self.position[2]}, velocity = {350,0}, destroyed = false, type = "machinegun"})
	    table.insert(self.firedBullets, {position = {self.position[1], self.position[2] + 2}, velocity = {323, 134}, destroyed = false, type = "machinegun"})
	    table.insert(self.firedBullets, {position = {self.position[1], self.position[2] - 2}, velocity = {323, -134}, destroyed = false, type = "machinegun"})
	    table.insert(self.firedBullets, {position = {self.position[1], self.position[2] + 4}, velocity = {247.5,247.5}, destroyed = false, type = "machinegun"})
	    table.insert(self.firedBullets, {position = {self.position[1], self.position[2] - 4}, velocity = {247.5,-247.5}, destroyed = false, type = "machinegun"})
	    self.weapon.time = 0.3
	  end
  end
  
  function ship:TakeDamage()
    if self.invulTimer <= 0 then
      self.hp = self.hp - 1
	  if self.weapon.level > 1 then self.weapon.level = self.weapon.level - 1 end
	  self.invulTimer = 1
	  if self.hp <= 0 then self.destroyed = true end
	end
  end
  
  function ship:IsInvulnerable()
    return self.invulTimer > 0
  end
  
  return ship
end