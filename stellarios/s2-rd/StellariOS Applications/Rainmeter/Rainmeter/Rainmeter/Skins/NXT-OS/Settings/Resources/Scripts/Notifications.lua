function Initialize()
	-- Grab information and set table.
	SkinsPath = SKIN:GetVariable('SKINSPATH')
	FilePath = SKIN:MakePathAbsolute(SkinsPath.."NXT-OS Data\\Notifications.inc")
	info={}
	-- Insert infomation about hud
	info[1]={}
	info[1]['Hud']={{'Caps Lock',MakeBool(SKIN:GetVariable('Notification.CapsLock'))},{'Microphone',MakeBool(SKIN:GetVariable('Notification.MicCheck'))},{'Num Lock',MakeBool(SKIN:GetVariable('Notification.NumLock'))},{'Sound Mute',MakeBool(SKIN:GetVariable('Notification.Speakers'))}}

	currentright = 0

	local previoussection = nil 
	local index = 1
	for line in io.lines(FilePath) do 
		local name, group, allow = string.match(line, "<Name>(.-)</Name><Group>(.-)</Group><Allow>(.-)</Allow>")
		if name ~= previoussection then
			index = index + 1
			previoussection = name
			info[index]={}
			info[index][name]={}
			info[index][name][1]={group,MakeBool(allow)}
		else
			table.insert(info[index][name],{group,MakeBool(allow)})
		end
	end
	SetOptions()
	SetOptionsSettings(1)
end

function SetOptions()
	local l = 0
	for k,v in pairs(info) do
		for k1,v1 in pairs(v) do
			l = l + 1
			SKIN:Bang('!SetOption','Left'..l,'Text',k1)
			SKIN:Bang('!SetOption','Left'..l,'LeftMouseUpAction','[!CommandMeasure Notifications SetOptionsSettings('..l..')]')
		end 
	end
	SKIN:Bang("!SetOption","LeftSepSection","H",(25*l))
end

function SetOptionsSettings(num)
	currentright = num
	SKIN:Bang('[!SetOptionGroup Switches ImageName "#@#Images\\Blank.png"][!SetOptionGroup Switches LeftMouseUpAction ""][!SetOptionGroup RightList Text ""][!SetOptionGroup LeftList MeterStyle LeftListStyle][!SetOption Left'..num..' MeterStyle LeftListStyle|LeftListStyleActive]')
	local r = 0
	for k,v in pairs(info[num]) do
		for k1,v1 in pairs(v) do
			r = r + 1
			SKIN:Bang('!SetOption','Right'..r,'Text',v1[1])
			SKIN:Bang('!SetOption','RightS'..r,'LeftMouseUpAction','[!CommandMeasure Notifications """Toggle('..num..',"'..k..'",'..k1..')"""]')
			if v1[2] then
				SKIN:Bang('!SetOption','RightS'..r,'ImageName','#@#Images\\Switch_0.png')
			else
				SKIN:Bang('!SetOption','RightS'..r,'ImageName','#@#Images\\Switch_1.png')
			end
		end
	end 
	SKIN:Bang("!SetOption","RightSepSection","H",(50*r))
	SKIN:Bang('!Update')
end

function Toggle(index,key,key1)
	if info[index][key][key1][2] == true then
		info[index][key][key1][2] = false
	elseif info[index][key][key1][2] == false then
		info[index][key][key1][2] = true
	end
	write()
	SetOptionsSettings(currentright)
end

--Helper Functions

function MakeBool(bool)
	if type(bool) == "string" and not tonumber(bool) then 
		if bool == "true" then
			return true
		else
			return false
		end
	elseif type(bool) == "string" and tonumber(bool) then 
		-- bool values are reversed beacuse of the way rainmeters Disabled system works. 
		if tonumber(bool) == 1 then
			return false
		else
			return true
		end
	elseif type(bool) == "boolean" then
		-- bool values are reversed beacuse of the way rainmeters Disabled system works. 
		if bool then
			return 0
		else
			return 1
		end
	end 
end

function write()
	File = io.open(FilePath, "w+")

	if File then
		for k,v in pairs(info) do
			-- Skip the first entery, which is reserved for the HUD
			if k ~= 1 then
				for k1,v1 in pairs(v) do
					for k2,v2 in pairs(v1) do
						File:write("<Name>"..k1.."</Name><Group>"..v2[1].."</Group><Allow>"..tostring(v2[2]).."</Allow>\n")
					end
				end
			end
		end 
	else
		print('WriteFile: unable to open file at ' .. FilePath)
		return
	end
	File:close()

	SKIN:Bang('!WriteKeyValue','Variables',"Notification.CapsLock", MakeBool(info[1]['Hud'][1][2]),'#@#Settings.inc')
	SKIN:Bang('!WriteKeyValue','Variables',"Notification.MicCheck", MakeBool(info[1]['Hud'][2][2]),'#@#Settings.inc')
	SKIN:Bang('!WriteKeyValue','Variables',"Notification.NumLock", MakeBool(info[1]['Hud'][3][2]),'#@#Settings.inc')
	SKIN:Bang('!WriteKeyValue','Variables',"Notification.Speakers", MakeBool(info[1]['Hud'][4][2]),'#@#Settings.inc')
	SKIN:Bang('!Refresh NXT-OS\\System\\Listeners\\NotificationsAndHud')
	SKIN:Bang('!Refresh NXT-OS\\Notify')
end