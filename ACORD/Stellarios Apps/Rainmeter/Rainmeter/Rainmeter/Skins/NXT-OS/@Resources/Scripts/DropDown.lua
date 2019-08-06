StoredName = nil
Showing = false

function call(name)
	if name ~= StoredName then
		StoredName = name
		Meter = SKIN:GetMeter(name)
		BoxWidth =Meter:GetW()
		BoxHeight = Meter:GetH()
		BoxX = Meter:GetX()
		BoxY = Meter:GetY()
		BgHeight = 0

		Strings, Numberofitems = explode("|",Meter:GetOption("DropDownList"),25)
		Bangs, Numberofbangs = explode("|",Meter:GetOption("DropDownBangs"),25)
		SKIN:Bang('[!HideMeterGroup Window.DropDown.Items.Group][!HideMeterGroup Window.DropDown.Group]')
		for i=1,Numberofitems do
			if Strings[i] == "" then
				BgHeight = (BgHeight + 1)
				SKIN:Bang('[!SetOption Window.DropDown.Item.'..i..' MeterStyle "Window.Element.Dropdown.Separator"][!SetOption Window.DropDown.Item.'..i..' Text ""][!ShowMeter Window.DropDown.Item.'..i..']')
			else
				BgHeight = (BgHeight + 32)
				SKIN:Bang('[!SetOption Window.DropDown.Item.'..i..' MeterStyle "Window.Element.Dropdown.Item"][!SetOption Window.DropDown.Item.'..i..' Text "'..Strings[i]..'"][!ShowMeter Window.DropDown.Item.'..i..']')
				if Bangs[i] ~= nil then
					SKIN:Bang('!SetOption', 'Window.DropDown.Item.'..i, 'LeftMouseUpAction', Bangs[i].."[!CommandMeasure Window.DropDown.Script call('"..name.."')]")
				else
					SKIN:Bang('!SetOption', 'Window.DropDown.Item.'..i, 'LeftMouseUpAction', "[!CommandMeasure Window.DropDown.Script call('"..name.."')]")
				end
			end
		end

		Showing = true
		Background = SKIN:GetMeter("Window.DropDown.BG")
		Background:SetW(BoxWidth)
		Background:SetH((BgHeight+2))
		Background:SetY((BoxY+BoxHeight-1))
		Background:SetX(BoxX)
		SKIN:Bang('!SetOptionGroup', 'Window.DropDown.Items.Group', 'W', (BoxWidth-12))
		SKIN:Bang('[!ShowMeterGroup Window.DropDown.Group][!Update]')
	elseif name == StoredName then
		if Showing then
			Showing = false
			SKIN:Bang('[!HideMeterGroup Window.DropDown.Items.Group][!HideMeterGroup Window.DropDown.Group][!Update]')
		else
			Showing = true
			for i=1,Numberofitems do
				SKIN:Bang('[!ShowMeter Window.DropDown.Item.'..i..']')
			end
			SKIN:Bang('[!ShowMeterGroup Window.DropDown.Group][!Update]')
		end
	end
end

function explode(sep, str, limit)
	if not sep or sep == "" then return false end
	if not str then return false end
	if limit == 0 or limit == 1 then return {str},1 end

	local r = {}
	local n, init = 0, 1

	while true do
		local s,e = string.find(str, sep, init, true)
		if not s then break end
		r[#r+1] = string.sub(str, init, s - 1)
		init = e + 1
		n = n + 1
		if n == limit - 1 then break end
	end

	if init <= string.len(str) then
		r[#r+1] = string.sub(str, init)
	else
		r[#r+1] = ""
	end
	n = n + 1

	if limit < 0 then
		for i=n, n + limit + 1, -1 do r[i] = nil end
		n = n + limit
	end

	return r, n
end