active = false
function call(name)
	Name = SKIN:GetMeter(name)
	Low,High = string.match(Name:GetOption("Range", "0,100"),"([^,]+),([^,]+)")
	OffsetX = (tonumber(Name:GetX())+4)
	RealW = (tonumber(Name:GetW())-8)
	Round = Name:GetOption("Round", "1")
	ReleaseBangs= Name:GetOption('OnReleaseCommands','')
	SKIN:Bang("[!SetOption Slider.Pos Disabled 0][!ShowMeter Slider.Lock][!Update]")
	active = true
end

function adjust(x,y)
	if active then
		local precent = ((x)-OffsetX)/RealW
		adjusted = 0
		if precent >= 0 and precent <= 1 then
			adjusted = ((precent*(High-Low))+Low)
		elseif precent < 0 then
			adjusted = Low
		elseif precent > 1 then
			adjusted = High
		end
		if Round == "1" then
			adjusted = math.ceil(adjusted)
		else 
			adjusted = tonumber(string.format("%.2f", adjusted))
		end
		local finishcommands = string.gsub(Name:GetOption("Commands"),"%$Slider.Output%$",adjusted)
		SKIN:Bang(finishcommands)
	end
end

function unlock()
	if ReleaseBangs ~= '' then
		local ReleaseBangs = string.gsub(ReleaseBangs,"%$Slider.Output%$",adjusted)
		SKIN:Bang(ReleaseBangs)
	end
	SKIN:Bang("[!SetOption Slider.Pos Disabled 1][!HideMeter Slider.Lock][!Update]")
	active = false
end