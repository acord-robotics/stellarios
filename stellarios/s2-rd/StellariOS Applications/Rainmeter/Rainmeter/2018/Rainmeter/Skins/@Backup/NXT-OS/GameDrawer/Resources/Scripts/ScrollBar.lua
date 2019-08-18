active = false
function call(name)
	SKIN:Bang("[!SetOption Scroll.Pos Disabled 0][!Update]")
	SKIN:Bang(SELF:GetOption('OnActiveCommands'))
	Name       = SKIN:GetMeter(name)
	OffsetX    = (tonumber(Name:GetX()))
	ScrollW    = SKIN:ParseFormula(SELF:GetOption('BarSize'))
	StepSize   = SKIN:ParseFormula(SELF:GetOption('StepSize'))
	Steps      = SKIN:ParseFormula(SELF:GetOption('Steps'))
	CurrentPos = SELF:GetOption('Position')
	active     = true
end

function adjust(num)
	if active then
		local step = (math.ceil(((num-(ScrollW/2))-OffsetX)/(StepSize))+1)
		if step < 1 then
			step = 1
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