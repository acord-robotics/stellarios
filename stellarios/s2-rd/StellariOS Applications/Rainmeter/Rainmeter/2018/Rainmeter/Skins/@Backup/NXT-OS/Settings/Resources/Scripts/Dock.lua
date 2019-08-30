function Initialize()
-- Grab information and set table.
	SkinsPath = SKIN:GetVariable('SKINSPATH')
	FilePath = SKIN:MakePathAbsolute(SkinsPath.."NXT-OS Data\\Dock.inc")
	info={}
	for line in io.lines(FilePath) do 
		table.insert(info, line)
	end
	lines = table.getn(info)
	max = (table.getn(info)-4)
	position = tonumber(SKIN:GetVariable('Scroll.Position'))
	CURRENTEDIT = nil
	LASTCHANGE  = 0
	AUTO_SCROLL = false
-- Get Information for the drag system
	BoundsMeter     = SKIN:GetMeter('SectionBG')
	BOUNDS_LOW_Y    = tonumber(BoundsMeter:GetY())
	BOUNDS_HIGH_Y   = ((tonumber(BoundsMeter:GetY()))+(tonumber(BoundsMeter:GetH())))
	REFERENCE_METER = SKIN:GetMeter('SectionMove')
	METER_HEIGHT    = 84
	REFERENCE_Y     = SKIN:GetMeter("Section1"):GetY()
-- Check to show help
	if table.getn(info) < 1 then
		SKIN:Bang('!ShowMeter DockHelpBubble')
	end 
-- Check to show scroll bar
	SKIN:Bang('!SetVariable', 'Scroll.Total', table.getn(info))
	if table.getn(info) <= 5 then
		SKIN:Bang('!HideMeterGroup Scroll')
	end
-- Make sure that position is not above the max possible
	if position > max then
		position = 1
		SKIN:Bang('!SetVariable','Scroll.Position',position)
	end
	setvar()
end

function Delete(number)
	table.remove(info, number)
	write()
	if table.getn(info) < 1 then
		SKIN:Bang('!ShowMeter DockHelpBubble')
	end 
	setvar()
	SKIN:Bang("!Refresh NXT-OS\\Dock")
end

-- Sets variables for icons as the dock scrolls.
function setvar()
	max = (table.getn(info)-4)
	if table.getn(info) <= 5 then
		SKIN:Bang('!HideMeterGroup Scroll')
	end
	if position > max then
		if (max+4) > 5 then
			position = (position-1)
		end
	end
	if table.getn(info) <= 5 then
		position = 1
	end
	if (position % 2 == 0) then
		SKIN:Bang('[!SetOptionGroup Even SolidColor 230,230,230][!SetOptionGroup Odd SolidColor 240,240,240]')
	else
		SKIN:Bang('[!SetOptionGroup Odd SolidColor 230,230,230][!SetOptionGroup Even SolidColor 240,240,240]')
	end
	SKIN:Bang('!SetVariable', 'Scroll.Total', table.getn(info))
	for i=1,math.min(lines,5) do 
		local index = i+(position-1)
		if info[index] ~= nil and info[index] ~= "PLACEHOLDER" then
			local icon, path, text, format = string.match(info[index], "<Icon>(.-)</Icon><Path>(.-)</Path><Text>(.-)</Text><Format>(.-)</Format>")
			local formatl,sort,ascending = string.match(format, "(.-)<Sort>(.-)</Sort><Ascending>(.-)</Ascending>")
			if formatl ~= nil and sort ~= nil and ascending ~= nil then formatt = 'Dock Folder' end
			if format == "1" then formatt = "File/Program" elseif format == "2" then formatt = "Folder" elseif format == "3" then formatt = "Dock Folder" elseif format == "4" then formatt = "Website" end
			SKIN:Bang('!ShowMeterGroup','Section'..i)
			SKIN:Bang('!SetOption', 'Icon'.. (i), 'ImageName', icon)
			SKIN:Bang('!SetOption', 'Text'.. (i), 'Text', 'Name:   '..text..'#CRLF#Type:     '..formatt..'#CRLF#Path:     '..path)
			SKIN:Bang('!SetOption', 'Section'.. (i), 'LeftMouseUpAction', '[!CommandMeasure Dock Invoke('..(i+position-1)..')]')
			SKIN:Bang('!SetOption', 'Delete'..(i),'LeftMouseUpAction','[play #@#Sounds\\Information.wav][!ShowMeterGroup Dialogue][!SetVariable ToDelete '..(i+position-1)..'][!SetVariable ToDeleteName "'..text..'"][!Update]')
			SKIN:Bang('!SetOption', 'Drag'..(i),'LeftMouseDownAction','[!CommandMeasure Dock call('..(i+position-1)..')]')
		else
			SKIN:Bang('!HideMeterGroup','Section'..i)
		end
	end
	SKIN:Bang('!SetVariable','Scroll.Position',position)
	SKIN:Bang('!Update')
end

--Move Functions

function ForwardShift()
	if (position) ~= max then
		if (max+4) >= 6 then
			position = position+1
			setvar()
		end
	end
	if AUTO_SCROLL then
		CURRENTDRAGPOS = ((position-1)+5)
		LASTCHANGE = CURRENTDRAGPOS
		moveitem("PLACEHOLDER",CURRENTDRAGPOS)
		SKIN:Bang('[!CommandMeasure "Timer" "Execute 3"]')
	end
end

function BackwardShift()
	if (position) ~= 1 then
		if (max+4) >= 6 then
			position = position-1
			setvar()
		end
	end
	if AUTO_SCROLL then
		CURRENTDRAGPOS = position
		LASTCHANGE = CURRENTDRAGPOS
		moveitem("PLACEHOLDER",CURRENTDRAGPOS)
		SKIN:Bang('[!CommandMeasure "Timer" "Execute 4"]')
	end
end

function ShiftTo(num)
	position = (num+1)
	setvar()
end

--Insert to table

function Invoke(number)
	if number ~= nil then
		local icon, path, text, format = string.match(info[number], "<Icon>(.-)</Icon><Path>(.-)</Path><Text>(.-)</Text><Format>(.-)</Format>")
		local formatl,sort,ascending = string.match(format, "(.-)<Sort>(.-)</Sort><Ascending>(.-)</Ascending>")
		SKIN:Bang('!SetVariable','TempIcon',icon)
		SKIN:Bang('!SetVariable','TempIconName',text)
		SKIN:Bang('!SetVariable','TempPath',path)
		SKIN:Bang('!SetOption','EditOKButton','LeftMouseUpAction','[!CommandMeasure Dock Edit('..number..')]')
		if formatl == "3" and sort ~= nil and ascending ~= nil then 
			SKIN:Bang('!SetVariable','NewType','3')
			SKIN:Bang('!SetVariable','TempSortMode','<Sort>'..sort..'</Sort><Ascending>'..ascending..'</Ascending>')
			SKIN:Bang('!SetVariable','FileBrowser.Type2','0')
			SKIN:Bang('!SetOption','EditPathTitle','Y','5R')
			SKIN:Bang('!SetOption','EditBackground','H','253')
			SKIN:Bang('!SetOption EditPathTitle Text "Folder Path"')
			SKIN:Bang('!ShowMeterGroup SortDropDown')
		elseif format == "1" then
			SKIN:Bang('!SetVariable','NewType','1')
			SKIN:Bang('!SetVariable','FileBrowser.Type2','1')
			SKIN:Bang('!SetOption EditPathTitle Text "File Path"')
			SKIN:Bang('!SetOption','EditPathTitle','Y','173')
			SKIN:Bang('!SetOption','EditBackground','H','202')
		elseif format == "2" then
			SKIN:Bang('!SetVariable','NewType','2')
			SKIN:Bang('!SetVariable','FileBrowser.Type2','0')
			SKIN:Bang('!SetOption EditPathTitle Text "Folder Path"')
			SKIN:Bang('!SetOption','EditPathTitle','Y','173')
			SKIN:Bang('!SetOption','EditBackground','H','202')
		elseif format == "3" then
			SKIN:Bang('!SetVariable','NewType','3')
			SKIN:Bang('!SetVariable','TempSortMode','<Sort>Name</Sort><Ascending>1</Ascending>')
			SKIN:Bang('!SetVariable','FileBrowser.Type2','0')
			SKIN:Bang('!SetOption','EditPathTitle','Y','5R')
			SKIN:Bang('!SetOption','EditBackground','H','253')
			SKIN:Bang('!SetOption EditPathTitle Text "Folder Path"')
			SKIN:Bang('!ShowMeterGroup SortDropDown')
		elseif format == "4" then
			SKIN:Bang('!SetVariable','NewType','4')
			SKIN:Bang('!SetOption EditPathTitle Text "Website"')
			SKIN:Bang('!SetOption','EditPathTitle','Y','173') 
			SKIN:Bang('!SetOption','EditBackground','H','202')
			SKIN:Bang('!SetOption EditPathBox MeterStyle Window.Element.Input.Background.Active')
		end
	else
		SKIN:Bang('!SetVariable','TempIcon','#@#DockIcons\\Plus.png')
		SKIN:Bang('!SetVariable','TempIconName','Name')
		SKIN:Bang('!SetVariable','TempPath','')
		SKIN:Bang('!SetVariable','NewType','1')
		SKIN:Bang('!SetVariable','FileBrowser.Type2','1')
		SKIN:Bang('!SetOption EditPathTitle Text "File Path"')
		SKIN:Bang('!SetOption','EditPathTitle','Y','173')
		SKIN:Bang('!SetOption','EditBackground','H','202')
		SKIN:Bang('!SetOption','EditOKButton','LeftMouseUpAction','[!CommandMeasure Dock Edit()]')
	end
	SKIN:Bang('[!ShowMeterGroup SetIcon][!Update]')
end

function Edit(number)
	TempIcon = SKIN:GetVariable('TempIcon')
	TempPath = SKIN:GetVariable('TempPath')
	TempIconName = SKIN:GetVariable('TempIconName')
	TempSortMode = SKIN:GetVariable('TempSortMode')
	NewType = SKIN:GetVariable('NewType')
	if NewType == "3" then
		NewType = NewType..TempSortMode
	end
	if info[number] ~= nil then
		info[number]="<Icon>"..TempIcon.."</Icon><Path>"..TempPath.."</Path><Text>"..TempIconName.."</Text><Format>"..NewType.."</Format>"
	else
		table.insert(info,"<Icon>"..TempIcon.."</Icon><Path>"..TempPath.."</Path><Text>"..TempIconName.."</Text><Format>"..NewType.."</Format>")
	end
	write()
	SKIN:Bang("!Refresh NXT-OS\\Dock")
	SKIN:Bang("!Refresh")
end

function Drop()
	local measure = SKIN:GetMeasure("DragAndDrop")
	local path = measure:GetOption("TempPath")
	local name = measure:GetOption("TempName")
	local format = measure:GetOption("TempType")

	SKIN:Bang('!SetVariable','TempIconName',name)
	SKIN:Bang('!SetVariable','TempPath',path)
	if format == "folder" then
		SKIN:Bang('!SetVariable','NewType','2')
		SKIN:Bang('!SetVariable','FileBrowser.Type2','0')
		SKIN:Bang('!SetOption EditPathTitle Text "Folder Path"')
		SKIN:Bang('!SetVariable','TempIcon','#@#DockIcons\\Folder.png')
	else
		SKIN:Bang('!SetVariable','NewType','1')
		SKIN:Bang('!SetVariable','FileBrowser.Type2','1')
		SKIN:Bang('!SetOption EditPathTitle Text "File Path"')
		SKIN:Bang('!SetVariable','TempIcon','#@#DockIcons\\Plus.png')
	end
	SKIN:Bang('!HideMeterGroup','SortDropDown')
	SKIN:Bang('!SetOption','EditPathTitle','Y','173')
	SKIN:Bang('!SetOption','EditBackground','H','202')
	SKIN:Bang('!SetOption','EditOKButton','LeftMouseUpAction','[!CommandMeasure Dock Edit()]')
	SKIN:Bang('[!ShowMeterGroup SetIcon][!Update]')
end

--Write File

function write()
	File = io.open(FilePath, "w+")

	if not File then
		print('WriteFile: unable to open file at ' .. FilePath)
		return
	end

	for k, v in pairs(info) do
		File:write(v.."\n")
	end

	File:close()
end

-- Drag Control


function call(call) --Called when the user clicks on an icon, passes the meter name and the reference name from the table.
	CURRENTEDIT = info[call]
	info[call] = 'PLACEHOLDER'
	local icon, path, text, format = string.match(CURRENTEDIT, "<Icon>(.-)</Icon><Path>(.-)</Path><Text>(.-)</Text><Format>(.-)</Format>")
	if format == "1" then formatt = "File/Program" elseif format == "2" then formatt = "Folder" elseif format == "3" then formatt = "Dock Folder" elseif format == "4" then formatt = "Website" end
	SKIN:Bang('!SetOption', 'IconMove', 'ImageName', icon)
	SKIN:Bang('!SetOption', 'TextMove', 'Text', 'Name:   '..text..'#CRLF#Type:     '..formatt..'#CRLF#Path:     '..path)
	SKIN:Bang("[!SetOption Drag.Pos Disabled 0][!ShowMeterGroup MoveSection][!ShowMeter Scroll.Lock]")
	setvar()
	active = true
end

function adjust(x,y) --Called when the mouse moves, keeps object within bounds meter.
	if active then
		y = (y-(METER_HEIGHT/2))
		if y >= BOUNDS_LOW_Y and y <= (BOUNDS_HIGH_Y - METER_HEIGHT) then 
 			y = y
 		elseif y > (BOUNDS_HIGH_Y - METER_HEIGHT) then
 			y = (BOUNDS_HIGH_Y - METER_HEIGHT)
 		elseif y < BOUNDS_LOW_Y then
 			y = BOUNDS_LOW_Y
		end
		REFERENCE_METER:SetY(y)
		SKIN:Bang("!Update")
		CheckPosition(x,y)
	end
end

function CheckPosition(x,y) --Checks where the mouse is in relation to the other icons. 
	CURRENTDRAGPOS = (position+(math.floor(((y-REFERENCE_Y)/(METER_HEIGHT+1))+0.5)))
	if CURRENTDRAGPOS > table.getn(info) then CURRENTDRAGPOS = table.getn(info) end
	if CURRENTDRAGPOS ~= LASTCHANGE then
		if CURRENTDRAGPOS == ((position-1)+5) then
			SKIN:Bang('[!CommandMeasure "Timer" "Execute 1"]')
		elseif CURRENTDRAGPOS == (position) then
			SKIN:Bang('[!CommandMeasure "Timer" "Execute 2"]')
		else
			AUTO_SCROLL = false
			SKIN:Bang('[!CommandMeasure "Timer" "Stop 1"][!CommandMeasure "Timer" "Stop 2"][!CommandMeasure "Timer" "Stop 3"][!CommandMeasure "Timer" "Stop 4"]')
		end
		LASTCHANGE = CURRENTDRAGPOS
		moveitem("PLACEHOLDER",CURRENTDRAGPOS)
	end
end

function unlock() --Called when the user releases the mouse. 
	info[CURRENTDRAGPOS] = CURRENTEDIT
	AUTO_SCROLL = false
	checkforhold()
	write()
	setvar()
	SKIN:Bang('[!CommandMeasure "Timer" "Stop 1"][!CommandMeasure "Timer" "Stop 2"][!SetOption Drag.Pos Disabled 1][!HideMeterGroup MoveSection][!CommandMeasure Timer "Execute 5"][!Update]')
	SKIN:Bang("!Refresh NXT-OS\\Dock")
	active = false
end

function moveitem(item,pos) --Moves a specified item in the ORDER table to a position that is specified.
	-- If the item PLACEHOLDER exists more than once then delete the duplicate
	local count = 0 
	if item == "PLACEHOLDER" then
		for k,v in pairs(info) do
			if v == "PLACEHOLDER" then
				count = count + 1
			end
		end
	end
	for k,v in pairs(info) do
		if v == item then
			if count > 1 then 
				table.remove(info,k)
				count = count - 1
			else
				table.remove(info,k)
				table.insert(info,pos,item)
				setvar()
				return
			end
		end
	end
	table.insert(info,pos,item)
	setvar()
end

function checkforhold() --Make sure that the place holder does not exist, if it does then remove it
	for k,v in pairs(info) do
		if v == "PLACEHOLDER" then
			table.remove(info,k)
		end
	end
end