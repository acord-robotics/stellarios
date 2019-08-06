-- Stock Maps for quick use

function Ease(time,duration,s,v)
	return CubicBezier(time,duration,s,v,0.25,0.1,0.25,1)
end

function EaseIn(time,duration,s,v)
	return CubicBezier(time,duration,s,v,0.42,0,1,1)
end

function EaseInBack(time,duration,s,v)
	return CubicBezier(time,duration,s,v,0.6,-0.28,0.735,0.045)
end

function EaseOut(time,duration,s,v)
	return CubicBezier(time,duration,s,v,0,0,0.58,1)
end

function EaseOutBack(time,duration,s,v)
	return CubicBezier(time,duration,s,v,0.175,0.885,0.32,1.275)
end

function EaseInOut(time,duration,s,v)
	return CubicBezier(time,duration,s,v,0.42,0,0.58,1)
end

function EaseInOutBack(time,duration,s,v)
	return CubicBezier(time,duration,s,v,0.68,-0.55,0.265,1.55)
end

--[[
 The CubicBezier function in this script is based on Mozilla's Implementation for CSS 3

 This Source Code Form is subject to the terms of the Mozilla Public
 License, v. 2.0. If a copy of the MPL was not distributed with this
 file, You can obtain one at http://mozilla.org/MPL/2.0/

 GitHub: https://github.com/servo/servo/blob/master/components/style/bezier.rs
]]

function CubicBezier(time,duration,s,v,x1,y1,x2,y2)
	local time = time / duration
	local epsilon = (1 / (200*duration))

	local cx = 3 * x1 
	local bx = 3 * (x2 - x1) - cx

	local cy = 3 * y1
	local by = 3 * (y2 - y1) - cy

	local ax = 1 - cx - bx
	local ay = 1 - cy - by

	local function sample_curve_x(t)
		return ((ax * t + bx) * t + cx) * t 
	end 

	local function sample_curve_y(t)
		return ((ay * t + by) * t + cy) * t
	end

	local function sample_curve_derivative_x(t)
		return (3 * ax * t + 2 * bx) * t + cx
	end

	local function ApproxEq(main,value,epsilon)
		if math.abs(main - value) < epsilon then
			return true
		else
			return false
		end
	end

	local function solve_curve_x(x,epsilon)
		local t = x
		local x2 = 0
		local dx = 0
		for i = 0,8,1 do
			x2 = sample_curve_x(t)
			if ApproxEq(x2,x,epsilon) then 
				return t
			end
			dx = sample_curve_derivative_x(t)
			if ApproxEq(dx,0,0.000001) then
				break
			end
			t = t - ((x2 - x) / dx)
		end
		
		local lo = 0
		local hi = 1

		if t < lo then
			return lo
		end
		if t > hi then 
			return hi
		end

		while lo < hi do 
			local x2 = sample_curve_x(t)
			if ApproxEq(x2,x,epsilon) then
				return t
			end
			if x > x2 then 
				lo = t
			else
				hi = t
			end
			t = (hi - lo) / 2 + lo
		end

		return t
	end

	local function solve(x, epsilon)
		return sample_curve_y(solve_curve_x(x,epsilon))
	end

	local solution = solve(time,epsilon)

	if s > v then
		return s - (solution * (s-v))
	else
		return s + (solution * (v-s))
	end
end