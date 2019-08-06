function Initialize()
	SkinsPath      = SKIN:GetVariable('SKINSPATH')
	widgets        = ReadInfoFile("NXT-OS\\@Resources\\System\\WidgetList.inc")
	apps           = ReadInfoFile("NXT-OS\\@Resources\\System\\AppList.inc")
	appscache      = ReadInfoFile("NXT-OS Data\\AppListCache.inc")
	finalapps      = {}
	settings       = {}
	settingscache  = ReadInfoFile("NXT-OS Data\\SettingsCache.inc")
end

function scan()
	SKIN:Bang("!Update")
	SkinsFolderCount = SKIN:GetMeasure('SkinsFolderCount') 
	SkinsIndexName = SKIN:GetMeasure('SkinsIndexName')
	Count = SkinsFolderCount:GetStringValue()
	for i=1,Count do
		SKIN:Bang("[!Setoption SkinsIndexName Index "..i.."][!Update]")
		Skin = SkinsIndexName:GetStringValue()
		FilePath = SkinsPath..Skin.."\\NXTOS.inc"
		File = io.open(FilePath,"r")
		if File then
			io.close(File)
			local temp = ReadIni(FilePath)
			for k,v in pairs(temp) do
				local typev = string.lower(v.type) 
				if typev == "app" then
					if v.name == nil or v.description == nil or v.icon == nil or v.bangs == nil then
						print("NXT-OS System: Invalid information for section "..k.." in "..FilePath)
					else
						local string = "<Name>"..v.name.."</Name><Description>"..v.description.."</Description><Icon>"..Skin.."\\"..v.icon.."</Icon><Launch>"..v.bangs.."</Launch><Active>true</Active>"
						if v.version ~= nil then
							local vstring = string.gsub(v.version,"%.","")
							if tonumber(vstring) and (tonumber(vstring) > 100) then
								local SystemVersion = string.gsub(SKIN:GetVariable("SYS.Version"),"%.","")
								local Version = string.gsub(v.version,"%.","")
								if not (SystemVersion >= Version) then
									print("NXT-OS System: The version of NXT-OS that you have installed is too old for "..v.name..". "..v.name.." requires NXT-OS version "..v.version.." or newer to be installed.")
									SKIN:Bang("!CommandMeasure", "Error", 'DisplayError({type="1",title="System Notice",desc="The version of NXT-OS that you have installed is too old for '..v.name..'. '..v.name..' requires NXT-OS version '..v.version..' or newer to be installed. You must update NXT-OS to use '..v.name..'.",lefttext="Not Now",righttext="Update",rightcommand="[!ActivateConfig NXT-OS\\\\System\\\\Updater Updater.ini]"})', "nxt-os\\system")
								else
									table.insert(apps,string)
								end
							else
								print("NXT-OS System: Invalid version parameter for section "..k.." in "..FilePath)
							end
						else
							table.insert(apps,string)
						end
					end
				elseif typev == "widget" then
					if v.name == nil or v.icon == nil or v.ini == nil then
						print("NXT-OS System: Invalid information for section "..k.." in "..FilePath)
					else
						local path,ini = string.match(v.ini,"^(.+)\\(.-).ini$")
						if path == nil or ini == nil then
							path = ""
							ini = string.match(v.ini,"^%s*(.+).ini$")
						end
						if ini == "" or ini == nil then 
							print("NXT-OS System: Invalid ini path for section "..k.." in "..FilePath)
						end
						table.insert(widgets,"<Name>"..v.name.."</Name><IconPath>"..SkinsPath..Skin.."\\"..v.icon.."</IconPath><LaunchPath>"..Skin.."\\"..path.."</LaunchPath><Ini>"..ini..".ini</Ini>")
					end
				elseif typev == "settings" then
					if v.name == nil or v.icon == nil or v.ini == nil then
						print("NXT-OS System: Invalid information for section "..k.." in "..FilePath)
					else
						local path,ini = string.match(v.ini,"^(.+)\\(.-).ini$")
						if path == nil or ini == nil then
							path = ""
							ini = string.match(v.ini,"^%s*(.+).ini$")
						end
						if ini == "" or ini == nil then 
							print("NXT-OS System: Invalid ini path for section "..k.." in "..FilePath)
						end
						if v.version ~= nil then
							local vstring = string.gsub(v.version,"%.","")
							if tonumber(vstring) and (tonumber(vstring) > 100) then
								local SystemVersion = string.gsub(SKIN:GetVariable("SYS.Version"),"%.","")
								local Version = string.gsub(v.version,"%.","")
								if not (SystemVersion >= Version) then
									print("NXT-OS System: The version of NXT-OS that you have installed is too old for "..v.name..". "..v.name.." requires NXT-OS version "..v.version.." or newer to be installed.")
									SKIN:Bang("!CommandMeasure", "Error", 'DisplayError({type="1",title="System Notice",desc="The version of NXT-OS that you have installed is too old for '..v.name..'. '..v.name..' requires NXT-OS version '..v.version..' or newer to be installed. You must update NXT-OS to use '..v.name..'.",lefttext="Not Now",righttext="Update",rightcommand="[!ActivateConfig NXT-OS\\\\System\\\\Updater Updater.ini]"})', "nxt-os\\system")
								else
									table.insert(settings,"<Name>"..v.name.."</Name><Icon>"..SkinsPath..Skin.."\\"..v.icon.."</Icon><LaunchPath>"..Skin.."\\"..path.."</LaunchPath><Ini>"..ini..".ini</Ini>")
								end
							else
								print("NXT-OS System: Invalid version parameter for section "..k.." in "..FilePath)
							end
						else
							table.insert(settings,"<Name>"..v.name.."</Name><Icon>"..SkinsPath..Skin.."\\"..v.icon.."</Icon><LaunchPath>"..Skin.."\\"..path.."</LaunchPath><Ini>"..ini..".ini</Ini>")
						end					
					end
				else
					print("NXT-OS System: 'Type' is missing/invalid for section "..k.." in "..FilePath)
				end
			end
		end
	end
	CheckAppsTable()
	CheckSettingsTable()
	write("NXT-OS Data\\AppListCache.inc",finalapps)
	write("NXT-OS Data\\WidgetListCache.inc",widgets)
	write("NXT-OS Data\\SettingsCache.inc",settings)
	SKIN:Bang("!CommandMeasure","Script","Initialize()","NXT-OS\\Drawer")
end

function CheckAppsTable()
	-- Maintain order of the first table but remove any entries that are not in the second table and insert into the third table.
	for cachek,cachev in ipairs(appscache) do
		local cachename, cachedescription, cacheicon, cachelaunch = string.match(cachev, "<Name>(.-)</Name><Description>(.-)</Description><Icon>(.-)</Icon><Launch>(.-)</Launch>")
		for scank,scanv in ipairs(apps) do
			local scanname, scandescription, scanicon, scanlaunch = string.match(scanv, "<Name>(.-)</Name><Description>(.-)</Description><Icon>(.-)</Icon><Launch>(.-)</Launch>")
			if cachename == scanname and cachedescription == scandescription and cacheicon == scanicon and cachelaunch == scanlaunch then
				table.insert(finalapps,cachev)
				table.remove(apps,scank)
			end
		end
	end
	for scank,scanv in ipairs(apps) do
		local scanname, scandescription, scanicon, scanlaunch = string.match(scanv, "<Name>(.-)</Name><Description>(.-)</Description><Icon>(.-)</Icon><Launch>(.-)</Launch>")
		SKIN:Bang('!CommandMeasure','Notify', "notify({name = 'System', group = 'Drawer', style = '2', icon = '$SkinsPath$NXT-OS\\\\@Resources\\\\Images\\\\Icons\\\\Drawer.png', title = 'Drawer', body = '"..scanname.." has been added to your drawer.', clickaction = '[!CommandMeasure animate "..'"execute 1"'.." nxt-os\\\\drawer]'})",'NXT-OS\\Notify')
		table.insert(finalapps,scanv)
	end
end

function CheckSettingsTable()
	for k,v in ipairs(settings) do
		local name, icon, launchpath, ini = string.match(v, "<Name>(.-)</Name><Icon>(.-)</Icon><LaunchPath>(.-)</LaunchPath><Ini>(.-)</Ini>")
		local found = false
		for scank,scanv in ipairs(settingscache) do 
			local scanname, scanicon, scanlaunchpath, scanini = string.match(scanv, "<Name>(.-)</Name><Icon>(.-)</Icon><LaunchPath>(.-)</LaunchPath><Ini>(.-)</Ini>")
			if name == scanname and launchpath == scanlaunchpath then
				found = true
				break
			end
		end
		if not found then
			SKIN:Bang('!CommandMeasure','Notify', "notify({name = 'System', group = 'Settings', style = '2', icon = '$SkinsPath$NXT-OS\\\\@Resources\\\\Images\\\\Icons\\\\Settings.png', title = 'Settings', body = '"..name.." has been added to your settings menu.', clickaction = '[!ActivateConfig NXT-OS\\\\Settings Settings.ini]'})",'NXT-OS\\Notify')
		end
	end
end

function ReadInfoFile(path)
	local temp = {}
	local FilePath = SkinsPath..path
	local File = io.open(FilePath,"r")
	if File then
		for line in io.lines(FilePath) do 
			table.insert(temp,line)
		end
		io.close(File)
	end
	return temp
end

function ReadIni(inputfile)
	--print(inputfile)
	local file = assert(io.open(inputfile, 'r'), 'Unable to open ' .. inputfile)
	local tbl, section = {}
	local num = 0
	for line in file:lines() do
		num = num + 1
		if not line:match('^%s-;') then
			local key, command = line:match('^([^=]+)=(.+)')
			if line:match('^%s-%[.+') then
				section = line:match('^%s-%[([^%]]+)'):lower()
				if not tbl[section] then tbl[section] = {} end
			elseif key and command and section then
				tbl[section][key:lower():match('^s*(%S*)%s*$')] = command:match('^s*(.-)%s*$')
			elseif #line > 0 and section and not key or command then
				print('NXT-OS System: Invalid value on line '..num .. ' in '..inputfile)
			end
		end
	end
	if not section then print('No sections found in ' .. inputfile) end
	file:close()
	return tbl
end

function write(path,table)
	local FilePath = SkinsPath..path
	local File = io.open(FilePath, "w+")
	if File then
		for k, v in ipairs(table) do
			File:write(v.."\n")
		end
		File:close()
	else
		print('WriteFile: unable to open file at ' .. CacheFilePath)
	end
end