function Initialize()
	json = loadfile(SKIN:GetVariable('@')..'Scripts\\Json.lua')() -- Include the JSON lib

	SKIN:Bang('[!Update][!SetVariable StartY ((#Monitor.MainH#-[CalcHeight])/2)]') -- Set the StartY var in the rainmeter env. Used for scroll animations.

	dirSKINSPATH     	= SKIN:GetVariable('SKINSPATH')
	dirDATA          	= SKIN:MakePathAbsolute(dirSKINSPATH.."NXT-OS Data\\")
	fileCACHE			= dirDATA..'AppsCache.json'

	tblCache = json.load(fileCACHE) -- Get the Scout Cache
	if type(tblCache) ~= 'table' then tblCache = {} end -- If the Scout Cahce returns nothing make an empty table. 

	tblDraw 			= {} -- Initalize the Draw table 
	tblGroups			= {} -- Find the groups and make the groups table

	maxMax				= 0 -- The higest number of pages that the skin has seen
	curMax				= 0 -- The current number of pages
	curIndex			= 0 -- The current page you are on
	
	if CheckForHits() then defaultGroup = "__HIT__" else defaultGroup = "__ALL__" SwitchGroup("__ALL__") end -- The default selected group
	curGroup			= defaultGroup -- The current selected group

	editMode			= false -- Bol for edit mode

	Filter() -- Make the Draw Table
	GetGroups() -- Make the Groups Table
	DrawGroups() -- Draw the Gorups
	Draw() -- Draw the icons
end

-- Group Functions

function GetGroups() -- Find the existing groups in the table that is passed to the fucntion
	tblGroups = {}
	for k,v in pairs(tblCache) do
		if type(v.group) == 'table' then
			for k1,v1 in pairs(v.group) do
				if not GroupExists(v1) then
					table.insert(tblGroups,v1)
				end
			end
		end
	end
	table.sort(tblGroups)
end

function GroupExists(name) -- Check if the group with the specified name exists in the groups table 
	for k,v in pairs(tblGroups) do
		if v == name then
			return true
		end
	end
	return false
end

function SwitchGroup(group) -- Switch the displayed group to the group by the name that is passed to the fucntion 
	curGroup = group
	curIndex = 0
	SKIN:Bang('[!SetOptionGroup MenuBG Shape ""][!SetOptionGroup MenuText FontColor "255,255,255"]')
	if group == "__ALL__" then
		SKIN:Bang('[!SetOption MenuBGALL Shape "#MenuShape#255,255,255,255"][!SetOption MenuALL FontColor 0,0,0][!SetOption DeleteGroup FontColor 3,154,255,80][!SetOption CreateNewGroup LeftMouseUpAction ""][!UpdateMeterGroup MenuBG][!UpdateMeterGroup MenuText][!Redraw]')
	elseif group == "__NXT__" then
		SKIN:Bang('[!SetOption MenuBGNXT Shape "#MenuShape#255,255,255,255"][!SetOption MenuNXT FontColor 0,0,0][!SetOption DeleteGroup FontColor 3,154,255,80][!SetOption CreateNewGroup LeftMouseUpAction ""][!UpdateMeterGroup MenuBG][!UpdateMeterGroup MenuText][!Redraw]')
	elseif group == "__HIT__" then
		SKIN:Bang('[!SetOption MenuBGHIT Shape "#MenuShape#255,255,255,255"][!SetOption MenuHIT FontColor 0,0,0][!SetOption DeleteGroup FontColor 3,154,255,80][!SetOption CreateNewGroup LeftMouseUpAction ""][!UpdateMeterGroup MenuBG][!UpdateMeterGroup MenuText][!Redraw]')
	else
		local i = 1
		for k,v in pairs(tblGroups) do
			if v == group then
				SKIN:Bang('[!SetOption MenuBG'..i..' Shape "#MenuShape#255,255,255,255"][!SetOption Menu'..i..' FontColor 0,0,0][!SetOption DeleteGroup FontColor 3,154,255][!SetOption DeleteGroup LeftMouseUpAction """[!CommandMeasure Script DeleteGroup()]"""][!UpdateMeterGroup MenuBG][!UpdateMeterGroup MenuText][!Redraw]')	
			end
			i = i + 1
		end
	end
	Filter()
	Draw()
end

function NewGroup() -- Create a new group based with the name that is created by the input measure on the edit screen
	local name = SKIN:GetVariable('Input')
	for k,v in pairs(tblCache) do
		if v.editSelect then
			if type(v.group) == "table" then
				table.insert(tblCache[k]['group'],name)
			else
				tblCache[k]['group'] = {name}
			end
			tblCache[k]['editSelect'] = nil
		end
	end
	if not GroupExists(name) then
		table.insert(tblGroups,name)
	end
	json.save(tblCache,fileCACHE)
	SKIN:Bang('[!SetVariable "Input" ""]')
	DrawGroups()
	Draw()
	SwitchGroup(name)
end

function DeleteGroup()
	for k,v in pairs(tblCache) do
		if type(v.group) == 'table' then
			for k1,v1 in pairs(v.group) do
				if v1 == curGroup then
					tblCache[k]['group'][k1] = nil
				end
			end
		end
	end
	json.save(tblCache,fileCACHE)
	GetGroups()
	DrawGroups()
	Draw()
	SwitchGroup(defaultGroup)
end

function AnySelected() -- Check if one of the user added groups is selected
	if editMode then
		for k,v in pairs(tblDraw) do
			if v.editSelect then
				return true
			end
		end
		return false
	else 
		return false
	end
end

-- Sorting

function Filter() -- Create the draw table based on which group is selected
	tblDraw = {}
	for k,v in pairs(tblCache) do
		if curGroup == "__ALL__" then
			table.insert(tblDraw,v)
		elseif curGroup == "__NXT__" then
			if v.itemSource == "NXT-OS System" or v.itemSource == "NXT-OS" then
				table.insert(tblDraw,v)
			end
		elseif curGroup == "__HIT__" then
			if v.scoutHits ~= nil then
				table.insert(tblDraw,v)
			end
		elseif v.group ~= nil then
			for k1,v1 in pairs(v.group) do 
				if v1 == curGroup then
					table.insert(tblDraw,v)
				end
			end
		end
	end
	if curGroup =="__HIT__" then
		table.sort(tblDraw,SortPopularity)
	else
		table.sort(tblDraw,SortAlphabetically)
	end
	curMax = ((math.ceil(#tblDraw/25))-1)
	if curMax > maxMax then maxMax = curMax end
end

function SortAlphabetically(First, Second)
	local First = string.lower(string.gsub(First["itemName"],"^%s*", ""))
	local Second = string.lower(string.gsub(Second["itemName"],"^%s*", ""))
	if First < Second then
		return true
	else
		return false
	end
end

function SortPopularity(First, Second)
	local FirstHits = First['scoutHits'] or 0
	local SecondHits = Second['scoutHits'] or 0
	if FirstHits ~= SecondHits then
		if FirstHits > SecondHits then
			return true
		else
			return false
		end
	end
	if First["itemName"] < Second["itemName"] then
		return true
	else
		return false
	end
end

function CheckForHits()
	for k,v in pairs(tblCache) do
		if v.scoutHits ~= nil then
			return true
		end
	end
	return false
end

-- Interaction

function Edit(state) -- Change the skin into what ever edit state is specified. If one is not specified toggle to the opposit of the current. 
	if state == nil then
		if editMode then
			editMode = false
			for k,v in pairs(tblCache) do
				if v.editSelect then
					tblCache[k]['editSelect'] = nil
				end
			end		
		else
			editMode = true
		end
	elseif state == true then
		editMode = true
	elseif state == false then
		editMode = false
		for k,v in pairs(tblCache) do
			if v.editSelect then
				tblCache[k]['editSelect'] = nil
			end
		end
	end

	if editMode then
		SKIN:Bang('[!SetOption EditButton Text "Done"][!ShowMeterGroup EditControl]')
		SKIN:Bang('[!SetOption SideLines Shape4 "Rectangle 210,0,672,[CalcHeight] | StrokeWidth 0 | Fill Color 0,0,0,0"][!UpdateMeter SideLines]')
	else
		SKIN:Bang('[!SetOption EditButton Text "Edit"][!HideMeterGroup EditControl]')
		SKIN:Bang('[!SetOption SideLines Shape4 ""][!UpdateMeter SideLines]')
	end
	Draw()
end

function Click(num) -- the action when an icon is clicked 
	if editMode then -- check if the skin is in edit mode
		if tblDraw[num]['editSelect'] then
			tblDraw[num]['editSelect'] = nil
		else
			tblDraw[num]['editSelect'] = true
		end
		Draw()
	else
		local hits = tblDraw[num]['scoutHits'] or 0
		tblDraw[num]['scoutHits'] = hits + 1
		json.save(tblCache,fileCACHE)
		Run(tblDraw[num]['itemPath'])
	end
end

function Run(command) -- A helpter function that checks to see if the command parameter is bang or a normal path
	if string.match(command,"[%[]*[%]]") then
		SKIN:Bang(command)
		SKIN:Bang('[!DeactivateConfigGroup NXTOverlay]')
	else
		SKIN:Bang('"'..command..'"')
		SKIN:Bang('[!DeactivateConfigGroup NXTOverlay]')
	end
end

function ClickIndicator(pos)
	curIndex = (math.ceil(pos/18)-1)
	Draw()
end

-- Scroll functions 

function Scroll(num) -- This function is called after an a scroll animation is finished
	curIndex = curIndex + (num)
	Draw()
end

function ScrollDown() -- Check if you can scroll down
	if curIndex < curMax then
		SKIN:Bang('[!CommandMeasure Timer "Execute 1"]')
	end
end

function ScrollUp() -- Check if you can scroll up
	if curIndex > 0 then
		SKIN:Bang('[!CommandMeasure Timer "Execute 2"]')
	end
end

-- Draw Functions

function DrawBefore() -- Draw the page before the current page. Used when scrolling up.
	for i = 1,25 do
		local index = (i + (25*(curIndex-1)))
		SKIN:Bang('[!SetOption AnimateIconBG'..i..' MeterStyle "IconBGStyle"][!SetOption AnimateIcon'..i..' ImageName "'..tblDraw[index]['itemIcon']..'"][!SetOption AnimateIconText'..i..' Text "'..tblDraw[index]['itemName']..'"]')
		if editMode then
			if tblDraw[index]['editSelect'] then
				SKIN:Bang('[!SetOption AnimateIconBG'..i..' Shape3 "#Shape#3,154,255"]')
			else
				SKIN:Bang('[!SetOption AnimateIconBG'..i..' Shape3 "#Shape#255,255,255,20"]')
			end
		else
			SKIN:Bang('[!SetOption AnimateIconBG'..i..' Shape3 "#Shape#0,0,0,0"]')
		end
	end
	SKIN:Bang('[!Update]')
end

function DrawAfter() -- Draw the page after the current page. Used when scrolling down. 
	for i = 1,25 do
		local index = (i + (25*(curIndex+1)))
		if tblDraw[index] ~= nil then
			SKIN:Bang('[!SetOption AnimateIconBG'..i..' MeterStyle "IconBGStyle"][!SetOption AnimateIcon'..i..' ImageName "'..tblDraw[index]['itemIcon']..'"][!SetOption AnimateIconText'..i..' Text "'..tblDraw[index]['itemName']..'"]')
			if editMode then
				if tblDraw[index]['editSelect'] then
					SKIN:Bang('[!SetOption AnimateIconBG'..i..' Shape3 "#Shape#3,154,255"]')
				else
					SKIN:Bang('[!SetOption AnimateIconBG'..i..' Shape3 "#Shape#255,255,255,20"]')
				end
			else
				SKIN:Bang('[!SetOption AnimateIconBG'..i..' Shape3 "#Shape#0,0,0,0"]')
			end
		else
			SKIN:Bang('[!SetOption AnimateIconBG'..i..' MeterStyle "IconBGStyleInactive"][!SetOption AnimateIcon'..i..' ImageName ""][!SetOption AnimateIconText'..i..' Text ""]')
		end
	end
	SKIN:Bang('[!Update]')
end

function DrawGroups() -- Draw the groups in tblGroups onto the menu elements
	for i=1,15 do
		if tblGroups[i] ~= nil then
			SKIN:Bang('[!ShowMeter Menu'..i..'][!ShowMeter MenuBG'..i..'][!SetOption MenuBG'..i..' LeftMouseUpAction """[!CommandMeasure "Script" "SwitchGroup('.."'"..tblGroups[i].."'"..')"]"""][!SetOption Menu'..i..' Text "'..tblGroups[i]..'"]')
		else
			SKIN:Bang('[!HideMeter Menu'..i..'][!HideMeter MenuBG'..i..']')
		end
	end
end

function Draw() -- The main draw function used to set up the standard set of elements
	if curMax > 0 then -- Draw Page Indicators
		SKIN:Bang('[!ShowMeter PageIndicators]')
		for i = 1,(maxMax-1) do 
			SKIN:Bang('[!SetOption PageIndicators Shape'..(i+1)..' ""]')
		end
		for i = 0,curMax do
			if i == 0 and i == curIndex then
				SKIN:Bang('[!SetOption PageIndicators Shape "Ellipse 6,6,5 | StrokeWidth 1 | Stroke Color 255,255,255,255  | Fill Color 255,255,255,255"]')
			elseif i == 0 then
				SKIN:Bang('[!SetOption PageIndicators Shape "Ellipse 6,6,5 | StrokeWidth 1 | Stroke Color 255,255,255,100  | Fill Color 0,0,0,0"]')
			elseif i == curIndex then
				SKIN:Bang('[!SetOption PageIndicators Shape'..(i+1)..' "Ellipse 6,'..(6+(i*18))..',5 | StrokeWidth 1 | Stroke Color 255,255,255,255  | Fill Color 255,255,255,255"]')
			else
				SKIN:Bang('[!SetOption PageIndicators Shape'..(i+1)..' "Ellipse 6,'..(6+(i*18))..',5 | StrokeWidth 1 | Stroke Color 255,255,255,100  | Fill Color 0,0,0,0"]')
			end
		end
	else -- If there is only 1 page.
		SKIN:Bang('[!HideMeter PageIndicators]')
	end

	for i = 1,25 do -- Draw Icons
		local index = (i + (25*curIndex))
		if tblDraw[index] ~= nil then
			SKIN:Bang('[!SetOption IconBG'..i..' MeterStyle "IconBGStyle"][!SetOption IconBG'..i..' LeftMouseUpAction """[!CommandMeasure Script Click('..index..')]"""][!SetOption Icon'..i..' ImageName "'..tblDraw[index]['itemIcon']..'"][!SetOption IconText'..i..' Text "'..tblDraw[index]['itemName']..'"]')
			if editMode then
				if tblDraw[index]['editSelect'] then
					SKIN:Bang('[!SetOption IconBG'..i..' Shape3 "#Shape#3,154,255"]')
				else
					SKIN:Bang('[!SetOption IconBG'..i..' Shape3 "#Shape#255,255,255,20"]')
				end
			else
				SKIN:Bang('[!SetOption IconBG'..i..' Shape3 "#Shape#0,0,0,0"]')
			end
		else
			SKIN:Bang('[!SetOption IconBG'..i..' MeterStyle "IconBGStyleInactive"][!SetOption Icon'..i..' ImageName ""][!SetOption IconText'..i..' Text ""]')
		end
	end
	if AnySelected() then SKIN:Bang('[!SetOption CreateNewGroup FontColor 3,154,255][!SetOption CreateNewGroup LeftMouseUpAction """[!ShowMeterGroup NameEdit][!Update]"""]') else SKIN:Bang('[!SetOption CreateNewGroup FontColor 3,154,255,80][!SetOption CreateNewGroup LeftMouseUpAction ""]') end 
	SKIN:Bang('[!SetOption PageIndicators Y ((#Monitor.MainH#-'..(((curMax+1)*18)-6)..')/2)][!Update]')
end