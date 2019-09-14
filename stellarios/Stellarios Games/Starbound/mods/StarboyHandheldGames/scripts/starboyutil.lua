require "/scripts/util.lua"
require "/scripts/vec2.lua"
require "/scripts/rect.lua"
require "/scripts/poly.lua"

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

function offScreen(pos)
  return pos[1] < 0 or pos[1] > 400 or pos[2] < 0 or pos[2] > 300 
end

function drawSprite(sprite, position, color, flipX, scale)
	scale = scale or 4
	color = color or "white"
	
	local frame
	if sprite[sprite.currentState].startFrame == sprite[sprite.currentState].endFrame or sprite[sprite.currentState].endFrame == nil then
	frame = sprite[sprite.currentState].startFrame
	else
	--frame = (self.petAnimation.stateTime / self.petAnimation[anim].duration) * (self.petAnimation[anim].endFrame - self.petAnimation[anim].startFrame) + self.petAnimation[anim].startFrame
	frame = (sprite.stateTime /sprite[sprite.currentState].duration) * (sprite[sprite.currentState].endFrame - sprite[sprite.currentState].startFrame + 1) + sprite[sprite.currentState].startFrame
	--frame = util.round(frame)
	frame = math.floor(frame)
	end

	local srcRec = {(frame-1)*sprite.width,0, frame * sprite.width, sprite.height}
	local tarRec = {position[1] - sprite.width * 0.5 * scale, position[2], position[1] + sprite.width * 0.5 * scale, position[2] + sprite.height * scale}
	if flipX then
	  tarRec[1],tarRec[3] = tarRec[3],tarRec[1]
	end
	self.canvas:drawImageRect(sprite.sheet, srcRec, tarRec, color)
	--widget.setText("scoreLabel", tostring(frame))
end

function drawPolyWithTransforms(basePoly, color, pos, rot, scale, lineWidth)
  local transformedPoly = basePoly
  if scale ~= nil then
    transformedPoly = poly.scale(transformedPoly, scale)
  end
  
  if rot ~= nil then
    transformedPoly = poly.rotate(transformedPoly, rot)
  end
  
  if pos ~= nil then 
    transformedPoly = poly.translate(transformedPoly, pos)
  end
  
  self.canvas:drawPoly(transformedPoly, color or "white", lineWidth or 1)
end

function approachValue(initial, target, rate)
  local maxChange = math.abs(initial - target)
  if maxChange <= rate then return target end
  
  local fractionalRate = rate / maxChange
  return initial + fractionalRate * (target - initial)
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

function GetFactorsOfNumber(n)
  local factors = {}
  local f = 2
  
  if n < 0 then
    table.insert(factors, -1)
    n = n * -1
  end
  
  while f < n / 2 do
    if n % f == 0 then
      table.insert(factors, f)
      n = n / f
      f = 2
    else
      f = f + 1
    end
  end

  table.insert(factors, n)

  return factors
end

function GetRandomFactor(n)
  return util.randomChoice(GetFactorsOfNumber(n))
end

function isColliding(pos1, r1, pos2, r2)
  local dSq = magSq(vec2.sub(pos1, pos2))
  local rSq = (r1 + r2) * (r1 + r2)
  return dSq < rSq 
end

function isCollidingLineSeg(pos, r, segP1, segP2, lineWidth)
  local lineVec = vec2.sub(segP2, segP1)
  local lenSq = lineVec[1] * lineVec[1] + lineVec[2] * lineVec[2]
  if lenSq == 0 then
    return isColliding(pos,r,segP1,lineWidth)
  end
  
  local t = math.max(0, math.min(1, vec2.dot( vec2.sub(pos, segP1), lineVec) / lenSq))
  local proj = vec2.add(segP1, vec2.mul(lineVec, t))
  
  return isColliding(pos, r, proj, lineWidth)
end

function magSq(vector)
  return vector[1] * vector[1] + vector[2] * vector[2]
end

function ColorFromHSL(hue, sat, lum) --values from 0 to 1, returns a color
  local values
  local r,g,b
  r = lum
  g = lum
  b = lum
  if lum <= 0.5 then
    v = lum * (1 + sat)
  else
    v = lum + sat - lum * sat
  end
  
  if v > 0 then
    local m, sv
	local sextant
	local fract, vsf, mid1, mid2
	
	m = lum + lum - v
	sv = (v - m) / v
	hue = hue * 6
	sextant = math.floor(hue)
	fract = hue - sextant
	vsf = v * sv * fract
	mid1 = m + vsf
	mid2 = v - vsf
	
	if sextant == 0 then
	  r = v
	  g = mid1
	  b = m
	elseif sextant == 1 then
	  r = mid2
	  g = v
	  b = m
	elseif sextant == 2 then
	  r = m
	  g = v
	  b = mid1
	elseif sextant == 3 then
	  r = m
	  g = mid2
	  b = v
	elseif sextant == 4 then
	  r = mid1
	  g = m
	  b = v
	elseif sextant == 5 then
	  r = v
	  g = m
	  b = mid2
	end
  end
  
  return {r*255,g*255,b*255}
end

function SaveScores(scoreTable, openedFromHand)
  if openedFromHand then
    world.sendEntityMessage(player.id(), "saveScores", scoreTable)
  else
    world.sendEntityMessage(pane.sourceEntity(), "saveScores", scoreTable)
  end
end

function LoadScores(openedFromHand)
  local promise
  if openedFromHand then
    promise = world.sendEntityMessage(player.id(), "loadScores")
	
	sb.logInfo("promise finished: " .. tostring(promise:finished()))
    return promise:result()
  else
    promise = world.sendEntityMessage(pane.sourceEntity(), "loadScores")
	sb.logInfo("promise finished: " .. tostring(promise:finished()))
    while promise:finished() == false do
	
	end
	return promise:result()
  end
 end
 
function RequestLoadScores(openedFromHand)
  if openedFromHand then
    return world.sendEntityMessage(player.id(), "loadScores")
  else
    return world.sendEntityMessage(pane.sourceEntity(), "loadScores")
  end
 end
 
function isRewardComplete(reward)
  for k,v in pairs(reward) do
    if v.givenOut < v.count then return false end
  end
  return true
end