-- @author Malody Hoe / GitHub: undefinist / Twitter: undefinist

function Initialize()
	NumOfItems = SKIN:ParseFormula(SKIN:GetVariable("NumOfItems"))
	Radius = SKIN:ParseFormula(SKIN:GetVariable("Radius"))
	RadiusY = SKIN:ParseFormula(SKIN:GetVariable("RadiusY"))
	ExtrudeMax = SKIN:ParseFormula(SKIN:GetVariable("ExtrudeMax"))
	ExtrudeMin = SKIN:ParseFormula(SKIN:GetVariable("ExtrudeMin"))
	Inward = SKIN:ParseFormula(SKIN:GetVariable("Inward"))
	AngleStart = SKIN:ParseFormula(SKIN:GetVariable("AngleStart"))
	AngleTotal = SKIN:ParseFormula(SKIN:GetVariable("AngleTotal"))
	ClockWise = SKIN:ParseFormula(SKIN:GetVariable("ClockWise")) == 1
	Smoothing = SKIN:ParseFormula(SKIN:GetVariable("Smoothing"))
	Multi = SELF:GetOption("Multi") == "1"
	PI = math.pi
	PIx2 = math.pi * 2
end

function Update()
	if Multi then process("R") end
	process()
end

function process(prefix)
	if prefix == nil then prefix = "" end

	local shapes = {}
	local nLines = NumOfItems - 1
	if AngleTotal < PIx2 then
		nLines = nLines + 1
	end

	for i = 0, nLines do
		local mband0 = SKIN:GetMeasure("mBand" .. prefix .. i):GetValue()
		local mbandNext = SKIN:GetMeasure("mBand" .. prefix .. ((i + 1) % (nLines + 1))):GetValue()
		local mbandPrev = SKIN:GetMeasure("mBand" .. prefix .. ((i + nLines) % (nLines + 1))):GetValue()

		local a = i
		if ClockWise then
			a = nLines - i
		end

		if Smoothing > 0 then
			if i == 0 then
				mband0 = (mband0 + mbandNext) / 2
			elseif i == nLines then
				mband0 = (mband0 + mbandPrev) / 2
			else
				mband0 = (mband0 + mbandNext + mbandPrev) / 3
			end
		end

		local x0 = (Radius + ExtrudeMin + mband0 * (-Inward * 2 + 1) * (ExtrudeMax-ExtrudeMin)) *
			math.cos((AngleTotal - AngleTotal / NumOfItems * a + AngleStart) % PIx2) + Radius + ExtrudeMax
		local y0 = (RadiusY + ExtrudeMin + mband0 * (-Inward * 2 + 1) * (ExtrudeMax-ExtrudeMin)) *
			math.sin((AngleTotal - AngleTotal / NumOfItems * a + AngleStart) % PIx2) + Radius + ExtrudeMax

		table.insert(shapes, { x = x0, y = y0 })
	end

	for i = 0, NumOfItems-1 do
		-- lua tables start from index 1
		local x0 = shapes[i + 1]["x"]
		local y0 = shapes[i + 1]["y"]
		local x1 = shapes[(i + 1) % #shapes + 1]["x"]
		local y1 = shapes[(i + 1) % #shapes + 1]["y"]

		angle = math.atan2(y1 - y0, x1 - x0)
		length = math.sqrt(math.pow(x1 - x0, 2) + math.pow(y1 - y0, 2))
		SKIN:Bang("!SetOption", prefix .. i, "StartAngle", angle)
		SKIN:Bang("!SetOption", prefix .. i, "LineLength", length)
		SKIN:Bang("!SetOption", prefix .. i, "X", x0)
		SKIN:Bang("!SetOption", prefix .. i, "Y", y0)
	end
end
