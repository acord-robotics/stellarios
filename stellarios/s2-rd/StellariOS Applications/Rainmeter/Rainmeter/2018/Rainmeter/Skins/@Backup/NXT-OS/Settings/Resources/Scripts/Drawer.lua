function Initialize()
-- Grab information and set table.
	SkinsPath = SKIN:GetVariable('SKINSPATH')
	FilePath = SKIN:MakePathAbsolute(SkinsPath.."NXT-OS Data\\AppListCache.inc")
	showing={}
	hidden={}
	position=1
	for line in io.lines(FilePath) do 
		local name, desc, icon, launch, active = string.match(line, "<Name>(.-)</Name><Description>(.-)</Description><Icon>(.-)</Icon><Launch>(.-)</Launch><Active>(.-)</Active>")
		if active == "true" then
			table.insert(showing, line)
		elseif active == "false" then
			table.insert(hidden, line)
		end
	end
	switch('showing')
end

function SetOptions()
	max = (table.getn(activetable)-7)
	if table.getn(activetable) <= 8 then
		SKIN:Bang('!HideMeterGroup Scroll')
	else
		SKIN:Bang('!ShowMeterGroup Scroll')
	end
	if position > max then
		if (max+7) > 8 then
			position = (position-1)
		end
	end
	if table.getn(activetable) <= 8 then
		position = 1
	end
	SKIN:Bang('!HideMeterGroup All')
	SKIN:Bang('!SetVariable', 'Scroll.Total', table.getn(activetable))
	SKIN:Bang('!SetVariable','Scroll.Position', position)
	if (position % 2 == 0) then
		SKIN:Bang('[!SetOptionGroup Even SolidColor 255,255,255][!SetOptionGroup Odd SolidColor 240,240,240]')
	else
		SKIN:Bang('[!SetOptionGroup Odd SolidColor 255,255,255][!SetOptionGroup Even SolidColor 240,240,240]')
	end
	for i=1,math.min(table.getn(activetable),8) do
		SKIN:Bang('!ShowMeterGroup Section'..i)
		index = (i+position-1)
		local name, desc, icon, launch, active = string.match(activetable[index], "<Name>(.-)</Name><Description>(.-)</Description><Icon>(.-)</Icon><Launch>(.-)</Launch><Active>(.-)</Active>")
		if i == 1 and position == 1 then
			SKIN:Bang('!HideMeter','Up1')
			SKIN:Bang('!ShowMeter','Down1')
		elseif i == 1 then
			SKIN:Bang('!ShowMeter','Up1')
			SKIN:Bang('!ShowMeter','Down1')
		elseif i > 1 then
			SKIN:Bang('!ShowMeter','Up'..i)
			SKIN:Bang('!ShowMeter','Down'..i)
		end
		if index == (max+7) then 
			SKIN:Bang('!HideMeter','Down'..i)
		end
		SKIN:Bang('!SetOption','Item'..i,'Text',name..'#CRLF#'..desc)
		SKIN:Bang('!SetOption','Image'..i,'ImageName','#SKINSPATH#'..icon)

		SKIN:Bang('!SetOption','Vis'..i,'LeftMouseUpAction','[!CommandMeasure Drawer Toggle('..(i+position-1)..')]')
		SKIN:Bang('!SetOption','Up'..i,'LeftMouseUpAction','[!CommandMeasure Drawer MoveUp('..(i+position-1)..')]')
		SKIN:Bang('!SetOption','Down'..i,'LeftMouseUpAction','[!CommandMeasure Drawer MoveDown('..(i+position-1)..')]')

	end
	SKIN:Bang("!Update")
end

function Toggle(number)
	local name, desc, icon, launch, active = string.match(activetable[number], "<Name>(.-)</Name><Description>(.-)</Description><Icon>(.-)</Icon><Launch>(.-)</Launch><Active>(.-)</Active>")
	if active == "true" then 
		table.insert(hidden , "<Name>"..name.."</Name><Description>"..desc.."</Description><Icon>"..icon.."</Icon><Launch>"..launch.."</Launch><Active>false</Active>")
		table.remove(activetable,number)
	elseif active == "false" then 
		table.insert(showing, "<Name>"..name.."</Name><Description>"..desc.."</Description><Icon>"..icon.."</Icon><Launch>"..launch.."</Launch><Active>true</Active>")
		table.remove(activetable,number)
	end
	SetOptions()
	write()
	SKIN:Bang("!CommandMeasure","Script","Initialize()","NXT-OS\\Drawer")	
end

function MoveUp(number)
	if number ~= nil then
		table.insert(activetable,(number-1),activetable[number])
		table.remove(activetable,(number+1))
		SetOptions()
		write()
		SKIN:Bang("!CommandMeasure","Script","Initialize()","NXT-OS\\Drawer")
	end
end

function MoveDown(number)
	if number ~= nil then
		table.insert(activetable,(number+2),activetable[number])
		table.remove(activetable,number)
		SetOptions()
		write()
		SKIN:Bang("!CommandMeasure","Script","Initialize()","NXT-OS\\Drawer")
	end
end

--Move Functions

function ForwardShift()
	if (position) ~= max then
		if (max+4) >= 6 then
			position = position+1
			SetOptions()
		end
	end
end

function BackwardShift()
	if (position) ~= 1 then
		if (max+4) >= 6 then
			position = position-1
			SetOptions()
		end
	end
end

function ShiftTo(num)
	position = num+1
	SetOptions()
end

function switch(mytable)
	if mytable == "showing" then
		activetable = showing
		SKIN:Bang('[!SetOptionGroup "Tabs" "MeterStyle" "Window.Element.Tab.inActive"][!SetOption "TabShowing" "MeterStyle" "Window.Element.Tab.Active"]')
	elseif mytable == "hidden" then
		activetable = hidden
		SKIN:Bang('[!SetOptionGroup "Tabs" "MeterStyle" "Window.Element.Tab.inActive"][!SetOption "TabHidden" "MeterStyle" "Window.Element.Tab.Active"]')
	end
	position = 1
	SetOptions()
end

function write()
	File = io.open(FilePath, "w+")

	if File then
		for k,v in pairs(showing) do
			File:write(v.."\n")
		end
		for k,v in pairs(hidden) do
			File:write(v.."\n")
		end
	else
		print('WriteFile: unable to open file at ' .. FilePath)
		return
	end
	File:close()
end

