function Initialize()
	Clock = os.clock()
	json = loadfile(SKIN:GetVariable('@')..'Scripts\\Json.lua')() -- Include the JSON lib
	dofile(SKIN:GetVariable('@')..'Scripts\\Sha256.lua') -- Include the Sha256 lib

	dirSKINSPATH     	= SKIN:GetVariable('SKINSPATH')
	dirNXTOS			= dirSKINSPATH..'\\NXT-OS\\'
	dirDATA          	= SKIN:MakePathAbsolute(dirSKINSPATH.."NXT-OS Data\\")
	dirWINDATA          = SKIN:MakePathAbsolute(dirSKINSPATH.."NXT-OS Data\\WindowsAppCache\\")
	dirWINICONS			= dirWINDATA..'Icons\\'
	fileCACHE			= dirDATA..'AppsCache.json'
	fileWINCACHE		= dirWINDATA..'Cache.json'
	fileSYSAPPS			= dirNXTOS..'\\@Resources\\System\\AppList.json'

	GUI					= false
	ENABLEWINSCAN 		= false
	if SKIN:GetVariable('Scout.IndexWin','1') == '0' then ENABLEWINSCAN = true end 
	REBUILD				= false
	if SKIN:GetVariable('Rebuild','0') == '1' then REBUILD = true end 
	REBUILDINTERVAL 	= tonumber(SKIN:GetVariable('Scout.IndexInterval'))
	REBUILDTIME		 	= (tonumber(SKIN:GetVariable('Scout.IndexTime'))+tonumber(SKIN:GetVariable('Scout.IndexTimeMod')))
	if REBUILDTIME == 12 then
		REBUILDTIME = 0
	elseif REBUILDTIME == 24 then
		REBUILDTIME = 12
	end
	REBUILDNEXT		 	= tonumber(SKIN:GetVariable('Scout.NextIndex'))
	
	if (REBUILDNEXT-1800) < os.time() then -- Check if the windows index has expired and needs to be rebuilt
		print("Scout Indexer: Windows File Index expired... Rebuilding...")
		REBUILD = true
	end


	tblAppScan = json.load(fileSYSAPPS) -- Define the scan table by adding the built in NXT-OS apps. 
	if type(tblAppScan) ~= 'table' then tblAppScan = {} end -- If the table is not returned by the previous line, make a blank table

	tblAppsCache = json.load(fileCACHE)
	if type(tblAppsCache) ~= 'table' then tblAppsCache = {} end 

	tblWinAppsScan = {} -- Items from current windows scan

	tblWinAppsCache = json.load(fileWINCACHE) -- Retrive Current windows app cache
	if type(tblWinAppsCache) ~= 'table' then tblWinAppsCache = {} end 


	msrStartPath		= SKIN:GetMeasure('StartPath')
	msrStartFileCount	= SKIN:GetMeasure('StartFileCount')
	msrStartIndexName	= SKIN:GetMeasure('StartIndexName')
	msrStartIndexPath	= SKIN:GetMeasure('StartIndexPath')
	msrStartIndexIcon	= SKIN:GetMeasure('StartIndexIcon')

	tblScan 			= {}

	for item in string.gmatch(SKIN:GetVariable("Scout.IndexTargets"),"(.-)|") do
		table.insert(tblScan,item)
	end

	curScan				= 1
	curIndex 			= 1

	SKIN:Bang('[!CommandMeasure Script ExternalStart() "NXT-OS\\Settings\\ScoutStatus"]')

	widgets        = ReadInfoFile("NXT-OS\\@Resources\\System\\WidgetList.inc")
	settings       = {}
	settingscache  = ReadInfoFile("NXT-OS Data\\SettingsCache.inc")
end

function ScanSkins()
	SKIN:Bang("!Update")
	SkinsFolderCount = SKIN:GetMeasure('SkinsFolderCount') 
	SkinsIndexName = SKIN:GetMeasure('SkinsIndexName')
	Count = SkinsFolderCount:GetStringValue()
	for i=1,Count do
		SKIN:Bang("[!SetOption SkinsIndexName Index "..i.."][!Update]")
		Skin = SkinsIndexName:GetStringValue()
		FilePath = dirSKINSPATH..Skin.."\\NXTOS.inc"
		File = io.open(FilePath,"r")
		if File then
			io.close(File)
			local temp = ReadIni(FilePath)
			for k,v in pairs(temp) do
				local typev = string.lower(v.type) 
				if typev == "app" then
					if v.name == nil or v.description == nil or v.icon == nil or v.bangs == nil then
						print("NXT-OS App Indexer: Invalid information for section "..k.." in "..FilePath)
					else
						local keyname = 'Rainmeter - '..Skin..' - '..v.name
						if v.version ~= nil then
							local vstring = string.gsub(v.version,"%.","")
							if tonumber(vstring) and (tonumber(vstring) > 100) then
								local SystemVersion = string.gsub(SKIN:GetVariable("SYS.Version"),"%.","")
								local Version = string.gsub(v.version,"%.","")
								if not (SystemVersion >= Version) then
									print("NXT-OS App Indexer: The version of NXT-OS that you have installed is too old for "..v.name..". "..v.name.." requires NXT-OS version "..v.version.." or newer to be installed.")
									SKIN:Bang("!CommandMeasure", "Error", 'DisplayError({type="1",title="System Notice",desc="The version of NXT-OS that you have installed is too old for '..v.name..'. '..v.name..' requires NXT-OS version '..v.version..' or newer to be installed. You must update NXT-OS to use '..v.name..'.",lefttext="Not Now",righttext="Update",rightcommand="[!ActivateConfig NXT-OS\\\\System\\\\Updater Updater.ini]"})', "nxt-os\\system")
								else
									tblAppScan[keyname] = {itemName = v.name,itemPath = v.bangs,itemIcon = dirSKINSPATH..Skin.."\\"..v.icon,itemSource = "NXT-OS"}
								end
							else
								print("NXT-OS App Indexer: Invalid version parameter for section "..k.." in "..FilePath)
							end
						else
							tblAppScan[keyname] = {itemName = v.name,itemPath = v.bangs,itemIcon = Skin.."\\"..v.icon,itemSource = "NXT-OS"}
						end
					end
				elseif typev == "widget" then
					if v.name == nil or v.icon == nil or v.ini == nil then
						print("NXT-OS App Indexer: Invalid information for section "..k.." in "..FilePath)
					else
						local path,ini = string.match(v.ini,"^(.+)\\(.-).ini$")
						if path == nil or ini == nil then
							path = ""
							ini = string.match(v.ini,"^%s*(.+).ini$")
						end
						if ini == "" or ini == nil then 
							print("NXT-OS App Indexer: Invalid ini path for section "..k.." in "..FilePath)
						end
						table.insert(widgets,"<Name>"..v.name.."</Name><IconPath>"..dirSKINSPATH..Skin.."\\"..v.icon.."</IconPath><LaunchPath>"..Skin.."\\"..path.."</LaunchPath><Ini>"..ini..".ini</Ini>")
					end
				elseif typev == "settings" then
					if v.name == nil or v.icon == nil or v.ini == nil then
						print("NXT-OS App Indexer: Invalid information for section "..k.." in "..FilePath)
					else
						local path,ini = string.match(v.ini,"^(.+)\\(.-).ini$")
						if path == nil or ini == nil then
							path = ""
							ini = string.match(v.ini,"^%s*(.+).ini$")
						end
						if ini == "" or ini == nil then 
							print("NXT-OS App Indexer: Invalid ini path for section "..k.." in "..FilePath)
						end
						if v.version ~= nil then
							local vstring = string.gsub(v.version,"%.","")
							if tonumber(vstring) and (tonumber(vstring) > 100) then
								local SystemVersion = string.gsub(SKIN:GetVariable("SYS.Version"),"%.","")
								local Version = string.gsub(v.version,"%.","")
								if not (SystemVersion >= Version) then
									print("NXT-OS App Indexer: The version of NXT-OS that you have installed is too old for "..v.name..". "..v.name.." requires NXT-OS version "..v.version.." or newer to be installed.")
									SKIN:Bang("!CommandMeasure", "Error", 'DisplayError({type="1",title="System Notice",desc="The version of NXT-OS that you have installed is too old for '..v.name..'. '..v.name..' requires NXT-OS version '..v.version..' or newer to be installed. You must update NXT-OS to use '..v.name..'.",lefttext="Not Now",righttext="Update",rightcommand="[!ActivateConfig NXT-OS\\\\System\\\\Updater Updater.ini]"})', "nxt-os\\system")
								else
									table.insert(settings,"<Name>"..v.name.."</Name><Icon>"..dirSKINSPATH..Skin.."\\"..v.icon.."</Icon><LaunchPath>"..Skin.."\\"..path.."</LaunchPath><Ini>"..ini..".ini</Ini>")
								end
							else
								print("NXT-OS App Indexer: Invalid version parameter for section "..k.." in "..FilePath)
							end
						else
							table.insert(settings,"<Name>"..v.name.."</Name><Icon>"..dirSKINSPATH..Skin.."\\"..v.icon.."</Icon><LaunchPath>"..Skin.."\\"..path.."</LaunchPath><Ini>"..ini..".ini</Ini>")
						end					
					end
				else
					print("NXT-OS App Indexer: 'Type' is missing/invalid for section "..k.." in "..FilePath)
				end
			end
		end
	end
	CheckSettingsTable()
	write("NXT-OS Data\\WidgetListCache.inc",widgets)
	write("NXT-OS Data\\SettingsCache.inc",settings)
	if REBUILD and ENABLEWINSCAN then
		StartWinScanner()
	else
		Finish(true)
	end
end

-- Windows App Gather

function StartWinScanner()
	if #tblScan > 0 then
		SKIN:Bang('!SetOption','StartPath','FinishAction','[!CommandMeasure "Script" "ProcessAppInfo()"]')
		SKIN:Bang('[!SetOption StartPath Path "'..tblScan[curScan]..'"]')
		SKIN:Bang('[!CommandMeasure StartPath Update][!Update]')
	else
		Finish()
	end
end

function NextDirectory()
	curIndex = 1
	SKIN:Bang('[!SetOption StartPath Path "'..tblScan[curScan]..'"]')
	SKIN:Bang('[!CommandMeasure StartPath Update][!Update]')
end

function ProcessAppInfo()
	SKIN:Bang('!Update')
	local numFiles = tonumber(msrStartFileCount:GetValue())
	if (curIndex-1) < numFiles then
		local name = msrStartIndexName:GetStringValue()
		local path = msrStartIndexPath:GetStringValue()
		local icon = msrStartIndexIcon:GetStringValue()
		local pathhash = sha256(path)
		local iconpath = dirWINICONS..pathhash..'.ico'
		if string.find(string.lower(name),"uninstall") == nil then
			tblWinAppsScan[pathhash] = {itemName = name,itemPath = path,itemIcon = iconpath}
			if GUI then SKIN:Bang('[!CommandMeasure Script """Recive({itemName = "'.. name..'",numFiles = "'..numFiles..'",curIndex = "'..curIndex..'",curScan = "'..curScan..'",maxScan = "'..#tblScan..'"})""" "NXT-OS\\Settings\\ScoutStatus"]') end
			SKIN:Bang('!SetOption','StartMoveFile','Parameter','MOVE /Y "'..icon..'" "'..iconpath..'"')
			SKIN:Bang('[!Update][!CommandMeasure StartTimer "Execute 1"]')
		else
			SKIN:Bang("!Update")
			NextApp()
		end
		curIndex = curIndex + 1
	end
end

function NextApp()
	local numFiles = tonumber(msrStartFileCount:GetValue())
	if curIndex == (numFiles+1) then
		if curScan < #tblScan then
			curScan = curScan + 1
			NextDirectory()
		else
			Finish()
		end
	else
		SKIN:Bang('[!CommandMeasure "StartPath" "IndexDown"][!Update]')
	end
end

function Finish(useold) -- Execute this function after all processes are completed
	if ENABLEWINSCAN then
		if useold then
			Merge(tblWinAppsCache,tblAppScan)
		else
			Merge(tblWinAppsScan,tblAppScan)
			json.save(tblWinAppsScan,fileWINCACHE)
		end
	end
	local newapps = Merge(tblAppScan,tblAppsCache,true)
	for k,v in pairs(newapps) do
		if v.itemSource == 'NXT-OS' then
			SKIN:Bang('!CommandMeasure','Notify', "notify({name = 'System', group = 'Scout', style = '1', icon = '$SkinsPath$NXT-OS\\\\@Resources\\\\Images\\\\Icons\\\\Scout.png', title = 'Scout Index', body = '"..v.itemName.." has been installed!', clickaction = ''})",'NXT-OS\\Notify')
		end
	end
	if REBUILD then
		SKIN:Bang('!WriteKeyValue','Variables','Scout.LastIndex',os.time(),'#@#Settings.inc')
		SKIN:Bang('!WriteKeyValue','Variables','Scout.NextIndex',GenerateNextTime(),'#@#Settings.inc')
	end
	json.save(tblAppsCache,fileCACHE)
	SKIN:Bang('!WriteKeyValue','Variables','Rebuild','0')
	print(string.format("Scout Indexer completed index in: %.2f seconds", os.clock() - Clock))
	SKIN:Bang('[!CommandMeasure Script "Finish('..(os.clock() - Clock)..')" "NXT-OS\\Settings\\ScoutStatus"]')
	SKIN:Bang('[!DeactivateConfig]')
end


-- Helper Functions

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
	local FilePath = dirSKINSPATH..path
	local File = io.open(FilePath,"r")
	if File then
		for line in io.lines(FilePath) do 
			table.insert(temp,line)
		end
		io.close(File)
	end
	return temp
end

function GenerateNextTime()
	local curTime = os.time()
	local time = os.date('*t',curTime)
	local nextTime = os.time({year=time.year, month=time.month, day=time.day, hour=REBUILDTIME})+(REBUILDINTERVAL*86400)
	return nextTime
end
function Merge(from,to,clean)
	local new = {}
	if type(from) == 'table' and type(to) == 'table' then -- Ensure both parts are tables 
		for k,v in pairs(from) do-- Iterate through the from table 
			if to[k] ~= nil then -- Check if the key exists in the to table
				for k1,v1 in pairs(v) do -- Go through the keys in the current iteration and set the values in the to table under that key to match, this is so that other user settings are maintained.
					to[k][k1] = v1
				end
			else
				to[k]=v
				new[k]=v
			end
		end
		if clean then -- Remove any entrys from the to table if they are not in the from table
			for k,v in pairs(to) do
				if from[k] == nil then
					to[k] = nil
				end
			end
		end
	end
	return new
end
function ReadIni(inputfile)
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
				print('NXT-OS App Indexer: Invalid value on line '..num .. ' in '..inputfile)
			end
		end
	end
	if not section then print('NXT-OS App Indexer: No sections found in ' .. inputfile) end
	file:close()
	return tbl
end
function write(path,table)
	local FilePath = dirSKINSPATH..path
	local File = io.open(FilePath, "w+")
	if File then
		for k, v in ipairs(table) do
			File:write(v.."\n")
		end
		File:close()
	else
		print('NXT-OS App Indexer: WriteFile: unable to open file at ' .. CacheFilePath)
	end
end

-- GUI Control

function EnableGUI()
	GUI = true
end

function DisableGUI()
	GUI = false
end
