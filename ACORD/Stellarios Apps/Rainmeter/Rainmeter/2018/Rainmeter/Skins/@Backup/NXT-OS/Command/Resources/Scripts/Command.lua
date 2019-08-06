function Initialize()
	SkinsPath = SKIN:GetVariable('SKINSPATH')
	FilePath = SKIN:MakePathAbsolute(SkinsPath.."NXT-OS Data\\Commands.inc")
	State=false
	builtindata={
		'<Command>google</Command><Action>https://www.google.com/search?q=#Action#</Action>',
		'<Command>info</Command><Action>[!ActivateConfig NXT-OS\\info info.ini]</Action>',
		'<Command>help</Command><Action>[!ActivateConfig "NXT-OS\\System\\Help" "Help.ini"][!CommandMeasure "Script" """GoTo("Command")""" "NXT-OS\\System\\Help"]</Action>',
		'<Command>settings</Command><Action>[!ActivateConfig NXT-OS\\settings settings.ini]</Action>',
		'<Command>eeeh</Command><Action>["Play #@#Sounds\\Notice2.wav"]</Action>'
	}
	info={}
	for line in io.lines(FilePath) do 
		table.insert(info, line)
	end
	for k,v in ipairs(builtindata) do
		table.insert(info, v)
	end
end

function Command()
	rawinput = SELF:GetOption("Input")
	local input = tostring(rawinput)
	local commandinput = string.match(input, "(%a+)")
	local actioninput = string.match(input, "%s(.+)")
	if string.match(rawinput, "%a+") == nil then
		if string.match(rawinput, "([0-9]+)") ~= nil then
			SKIN:Bang("!SetOption","Result","Text","Result: "..SKIN:ParseFormula('('..rawinput..')'))
			SKIN:Bang('[!Update][!CommandMeasure "Animate" "Execute 3"]')
			ToggleResult(true)
		else
			SKIN:Bang('[!CommandMeasure "Animate" "Execute 2"]')
		end
	elseif commandinput == "day" or commandinput == "date" or commandinput == "today" or commandinput == "now" then
		local date = tonumber(os.date('%d'))
		local postfix = nil
		if date == 1 or date == 21 or date == 31 then
			postfix = "st"
		elseif date == 2 or date == 22 then
			postfix = "nd"
		elseif date == 3 or date == 23 then
			postfix = "rd"
		else
			postfix = "th"
		end
		SKIN:Bang("!SetOption","Result","Text",os.date("Today is %A, %B %d"..postfix..", %Y. The time is %I:%M %p."))
		SKIN:Bang('[!Update][!CommandMeasure "Animate" "Execute 3"]')
		ToggleResult(true)
	elseif commandinput == "time" then
		SKIN:Bang("!SetOption","Result","Text",os.date("The time is %I:%M %p."))
		SKIN:Bang('[!Update][!CommandMeasure "Animate" "Execute 3"]')
		ToggleResult(true)
	else
		if commandinput ~= nil then 
			for k, v in pairs(info) do
				local command, execute = string.match(info[k], "<Command>(.-)</Command><Action>(.-)</Action>")
				if string.lower(commandinput) == string.lower(command) then
					SKIN:Bang("!SetVariable", "Action", actioninput)
					if string.match(execute,"[%[]*[%]]") then
						SKIN:Bang(execute)
						print(execute)
						SKIN:Bang('[!DeactivateConfig]')
					else
						SKIN:Bang('"'..execute..'"')
						SKIN:Bang('[!DeactivateConfig]')
					end
					return
				end
			end
			ToggleResult(false)
			SKIN:Bang('[!CommandMeasure "Animate" "Execute 2"]')
		else
			ToggleResult(false)
			SKIN:Bang('[!CommandMeasure "Animate" "Execute 2"]')
		end
	end
end

function ToggleResult(bool)
	if SKIN:GetVariable('Animate2.State') == "0" then state = false else state = true end
	if state ~= bool then 
		SKIN:Bang('[!CommandMeasure "Animate" "Execute 4"]')
		if state then SKIN:Bang('!HideMeterGroup Result') else SKIN:Bang('!ShowMeterGroup Result') end
	end
end