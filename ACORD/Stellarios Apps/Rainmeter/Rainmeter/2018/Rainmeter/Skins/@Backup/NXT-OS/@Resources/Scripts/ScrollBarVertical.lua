active = false
function call(name,y)
	SKIN:Bang("[!SetOption Scroll.Pos Disabled 0][!Update]")
	SKIN:Bang(SELF:GetOption('OnActiveCommands'))
	Name       = SKIN:GetMeter(name)
	OffsetY    = (tonumber(Name:GetY()))
	ScrollH    = SKIN:ParseFormula(SELF:GetOption('BarSize'))
	StepSize   = SKIN:ParseFormula(SELF:GetOption('StepSize'))
	Steps      = SKIN:ParseFormula(SELF:GetOption('Steps'))
	CurrentPos = SKIN:ParseFormula(SELF:GetOption('Position'))
	Offset     = (CurrentPos*StepSize)
	active     = true
	Point      = 0
	if y < Offset then 
		Point = ScrollH-10
	elseif y > ((Offset+ScrollH)) then
		Point = 10
	else 
		Point = (ScrollH-(y-Offset))
	end 
end

function adjust(num)
	if active then
		local step = math.ceil(((num-(ScrollH-Point))-OffsetY)/(StepSize))
		if step < 0 then
			step = 0
		elseif step > Steps then
			step = Steps
		end
		if step ~= CurrentPos then
			CurrentPos = step
			local finishcommands = string.gsub(SELF:GetOption("Commands"),"%$Scroll.Output%$",step)
			SKIN:Bang(finishcommands)
		end
	end
end

function unlock()
	SKIN:Bang("[!SetOption Scroll.Pos Disabled 1][!Update]")
	SKIN:Bang(SELF:GetOption('OnDeactiveCommands'))
	active = false
end