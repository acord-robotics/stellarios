function Initialize()
	LASTCHANGE = 0 --The number of the last slot that changed, make sure to not call SetOption more than needed. 
	REFERENCE  = {
		PLACEHOLDER={name="",bangs="",icon=""},
		add={name="Add Widget",bangs='[!ActivateConfig NXT-OS\\Top\\WidgetCenter]',icon="Plus"},
		command={name="Command",bangs='[!ActivateConfig "NXT-OS\\Command" "Command.ini"]',icon="Command"},
		dash={name="Dashboard",bangs='[!CommandMeasure "DashScript" "activate()" NXT-OS\\system]',icon="Dash"},
		drawer={name="Drawer",bangs='[!CommandMeasure Animate "Execute 1" NXT-OS\\Drawer]',icon="Drawer"},
		lock={name="Lock PC",bangs='[!EnableMeasure LockCheck][!UpdateMeasure "LockCheck"]',icon="Lock"},
		power={name="Power Menu",menu="Power",icon="Power"},
		volume={name="Volume",menu="Volume",icon="Volume"},
		visualizer={name="Visualizer",bangs='[!EnableMeasure TestVisualizer "NXT-OS\\System"][!Update "NXT-OS\\System"][!SetOption "Label.Text" "Text" "[VisualizerName]"][!UpdateMeterGroup Label][!Update]',icon="Visualizer0"},
		rainmeter={name="Manage Rainmeter",bangs="[!Manage]",icon="Rainmeter"}
	}
	METERREFERENCE    = {} --Table containing the meter reference for the icon meters.
	METERREFERENCEPOS = {} --Table containing the meter postions for the icon meters, made by the setoptions function.
	INACTIVE          = {} --Table containing the inactive icons, is the reference table - order table
	ORDER             = {} --Table containing the order of the icons as they are stored in the user settings.
	GetMeters()
	local list = SKIN:GetVariable("Top.Quick.Order") --Get the current order stored in the settings.inc
	for item in string.gmatch(list,"(.-)|") do
		table.insert(ORDER,item)
	end
	SetOptions()
	FindInactive()
	SetOptionExtra()
end

function GetMeters() --Store the meter reference for each one of the icon meters.
	for i=1,14 do
		table.insert(METERREFERENCE,SKIN:GetMeter("Icon"..i))
	end
end

function SetOptionExtra() --Sets the options of the extra icons section
	local max = math.min(table.getn(INACTIVE),14)
	for i = 1,14 do
		SKIN:Bang('[!SetOption Extra'..i..' ImageName ""][!SetOption ExtraTitle'..i..' Text ""][!SetOption Extra'..i..' LeftMouseDownAction ""]')
	end
	for i = 1,max do
		params = FindParams(INACTIVE[i])
		if params ~= nil then
			if params["icon"] ~= "" then 
				SKIN:Bang("!SetOption","Extra"..i,"ImageName","#SKINSPATH#\\NXT-OS\\Top\\Resources\\Images\\Icons\\"..params["icon"]..".png")
				SKIN:Bang("!SetOption","Extra"..i,"LeftMouseDownAction","[!CommandMeasure Script call('Extra"..i.."','"..INACTIVE[i].."')]")
				SKIN:Bang("!SetOption","ExtraTitle"..i,"Text",params["name"])
			end
		end
	end
	SKIN:Bang("!Update")
end

function SetOptions() --Sets the options of the icons based of the reference table.
	ORDERSIZE = table.getn(ORDER)
	for i = 1,14 do
		SKIN:Bang('[!SetOption Icon'..i..' ImageName ""][!SetOption Icon'..i..' LeftMouseDownAction ""]')
	end
	local max = math.min(table.getn(ORDER),14)
	for i = 1,max do
		params = FindParams(ORDER[i])
		if params ~= nil then
			if params["icon"] ~= "" then 
				SKIN:Bang("!SetOption","Icon"..i,"ImageName","#SKINSPATH#\\NXT-OS\\Top\\Resources\\Images\\Icons\\"..params["icon"]..".png")
				SKIN:Bang("!SetOption","Icon"..i,"LeftMouseDownAction","[!CommandMeasure Script call('Icon"..i.."','"..ORDER[i].."')]")
			end
		end
	end
	local size = ((max*24)+((max-1)*10))
	SKIN:Bang("!SetOption","Icon1","X","((#Window.Width#-"..size..")/2)")
	SKIN:Bang("!Update")
	for i=1,ORDERSIZE do
		METERREFERENCEPOS[i] = {METERREFERENCE[i]:GetX(),METERREFERENCE[i]:GetY()}
	end
end

function FindParams(name) -- Get the parameters of the icon from the reference table.
	local entry = REFERENCE[name] 
	if entry ~= nil then
		return entry
	else
		return nil
	end
end

function FindInactive() --Finds the icons that dont exist in the order table from the reference table.
	INACTIVE = {}
	for k,_ in pairs(REFERENCE) do
		if k ~= "PLACEHOLDER" then
			if table.getn(ORDER) > 0 then
				for _,v in pairs(ORDER) do
					exists = false
					if k == v then 
						exists = true
						break
					end
				end
			else 
				exists = false
			end
			if not exists then
				print(k,exists)
				table.insert(INACTIVE,k)
			end
		end
	end
	table.sort(INACTIVE)
end

function IsActive(name) --Pass name and check if it exists in the ORDER table.
	for _,v in pairs(ORDER) do
		if v == name then
			return true
		end
	end
	return false
end

function Save() --Called to save the order information in the users settings file. 
	local line = ""
	for _,v in ipairs(ORDER) do
		line = line..v.."|"
	end
	SKIN:Bang("!WriteKeyValue","Variables","Top.Quick.Order",line,"#@#Settings.inc")
	SKIN:Bang("!Refresh","NXT-OS\\Top")
end

-- Drag Control

function call(name,call) --Called when the user clicks on an icon, passes the meter name and the reference name from the table.
	Meter           = SKIN:GetMeter(name)
	BoundsMeter     = SKIN:GetMeter(SELF:GetOption("Bounds"))
	REFERENCE_METER = SKIN:GetMeter("Icon1")
	RELATIVEX       = REFERENCE_METER:GetX()
	RELATIVEY       = REFERENCE_METER:GetY()
	RELATIVEW       = REFERENCE_METER:GetW()
	RELATIVEH       = REFERENCE_METER:GetH()
	METER_CALL      = call
	METER_NAME      = name
	METER_WIDTH     = tonumber(Meter:GetW())
	METER_HEIGHT    = tonumber(Meter:GetH())
	METER_IMAGE     = Meter:GetOption("ImageName")
	BOUNDS_LOW_X    = tonumber(BoundsMeter:GetX())
	BOUNDS_LOW_Y    = tonumber(BoundsMeter:GetY())
	BOUNDS_HIGH_X   = ((tonumber(BoundsMeter:GetX()))+(tonumber(BoundsMeter:GetW())))
	BOUNDS_HIGH_Y   = ((tonumber(BoundsMeter:GetY()))+(tonumber(BoundsMeter:GetH())))
	SKIN:Bang('[!SetOption MoveMeter ImageName "'..METER_IMAGE..'"][!SetOption MoveMeter W "'..METER_WIDTH..'"][!SetOption MoveMeter H "'..METER_HEIGHT..'"][!Update]')
	SKIN:Bang("[!SetOption Drag.Pos Disabled 0][!ShowMeter Drag.Lock]")
	SKIN:Bang("[!ShowMeter MoveMeter]")
	switch(call,"PLACEHOLDER")
	SetOptions()
	active = true
end

function adjust(x,y) --Called when the mouse moves, keeps object within bounds meter.
	if active then
		x = (x-(METER_WIDTH/2))
		if x >= BOUNDS_LOW_X and x <= (BOUNDS_HIGH_X - METER_WIDTH) then 
 			x = x
 		elseif x > (BOUNDS_HIGH_X - METER_WIDTH) then
 			x = (BOUNDS_HIGH_X - METER_WIDTH)
 		elseif x < BOUNDS_LOW_X then
 			x = BOUNDS_LOW_X
		end
		y = (y-(METER_HEIGHT/2))
		if y >= BOUNDS_LOW_Y and y <= (BOUNDS_HIGH_Y - METER_HEIGHT) then 
 			y = y
 		elseif y > (BOUNDS_HIGH_Y - METER_HEIGHT) then
 			y = (BOUNDS_HIGH_Y - METER_HEIGHT)
 		elseif y < BOUNDS_LOW_Y then
 			y = BOUNDS_LOW_Y
		end
		SKIN:Bang("!MoveMeter", x, y,"MoveMeter")
		SKIN:Bang("!Update")
		CheckPosition(x,y)
	end
end

function CheckPosition(x,y) --Checks where the mouse is in relation to the other icons. 
	if y > 190 then
		SKIN:Bang('[!SetOption MoveMeter ImageTint 80,80,80,220][!Update]')
	else
		SKIN:Bang('[!SetOption MoveMeter ImageTint 240,240,240,220][!Update]')
	end
	if y >= (RELATIVEY-RELATIVEH) and y <= (RELATIVEY+RELATIVEH) then
		if ORDERSIZE > 0 then 
			for i = 1,ORDERSIZE do
				if (x-(RELATIVEW/2)) < METERREFERENCEPOS[i][1] then 
					moveitem("PLACEHOLDER",i)
					return
				end
			end
			if (x-(RELATIVEW/2)) > METERREFERENCEPOS[ORDERSIZE][1] then
				moveitem("PLACEHOLDER",ORDERSIZE)
				return
			end
		else
			moveitem("PLACEHOLDER",1)
		end
	elseif y < (RELATIVEY-RELATIVEH) then
		LASTCHANGE=0
		if IsActive("PLACEHOLDER") then
			switch("PLACEHOLDER")
			SetOptions()
		end
	elseif y > (RELATIVEY+RELATIVEH) then
		LASTCHANGE=0
		if IsActive("PLACEHOLDER") then
			switch("PLACEHOLDER")
			SetOptions()
		end
	end
end

function unlock() --Called when the user releases the mouse. 
	switch("PLACEHOLDER",METER_CALL)
	SKIN:Bang("[!SetOption Drag.Pos Disabled 1][!HideMeter Drag.Lock][!HideMeter MoveMeter]")
	FindInactive()
	SetOptionExtra()
	SetOptions()
	active = false
	Save()
end

function switch(val1,val2) --Swaps two values in the ORDER table, or removes the item if val2 is left out.
	for k,v in pairs(ORDER) do
		if v == val1 then 
			if val2 ~= nil then
				ORDER[k] = val2
				return
			else
				table.remove(ORDER,k)
				return
			end
		end
	end
end

function moveitem(item,pos) --Moves a specified item in the ORDER table to a position that is specified. 
	if pos ~= LASTCHANGE then
		for k,v in pairs(ORDER) do
			if v == item then
				table.remove(ORDER,k)
				table.insert(ORDER,pos,item)
				SetOptions()
				LASTCHANGE=pos
				return
			end
		end
		table.insert(ORDER,pos,item)
		SetOptions()
		LASTCHANGE=pos
		FindInactive()
	end
end