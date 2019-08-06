function Initialize()
	S_PATH_STEAM = SKIN:GetVariable('GameDrawer.SteamPath', nil)
	if S_PATH_STEAM ~= nil then
		if S_PATH_STEAM ~= '' and EndsWith(S_PATH_STEAM, '\\') == false then
			S_PATH_STEAM = S_PATH_STEAM .. '\\'
		end
		S_PATH_STEAM = Trim(S_PATH_STEAM)
	end

	S_VDF_KEY_USER_LOCAL_CONFIG_STORE = 'userlocalconfigstore'
	S_VDF_KEY_FRIENDS = 'friends'
	S_VDF_KEY_NAME = 'name'
	S_VDF_KEY_AVATAR = 'avatar'
	local state = getstate('NXT-OS\\GameDrawer') 
	if state and SKIN:GetVariable('GameDrawer.DrawerMode') == "0" then
		SKIN:Bang('!WriteKeyValue','Variables','GameDrawer.DrawerMode','1','#@#Settings.inc')
		SKIN:Bang('!Refresh')
	elseif not state and SKIN:GetVariable('GameDrawer.DrawerMode') == "1" then
		SKIN:Bang('!WriteKeyValue','Variables','GameDrawer.DrawerMode','0','#@#Settings.inc')
		SKIN:Bang('!Refresh')
	end
end

function EndsWith(asString, asSuffix)
	if asString == nil or asSuffix == nil then
		return false
	end
	return asString:match('^(.-' .. asSuffix .. ')$') ~= nil
end

function Trim(asString)
	return asString:match('^%s*(.-)%s*$')
end

function Call()
	Total = SKIN:GetMeasure('UserDataCount')
	TotalCount = Total:GetStringValue()
	local n = 1
	for i=1,tostring(TotalCount) do 
		if i >= 6 then
			break
		else
			local Path = SKIN:GetMeasure('Folder' .. i)
			local S_STEAM_USER_DATA_ID = Path:GetStringValue()

			local tFriendsProfile = ParseVDFFile(S_PATH_STEAM .. 'userdata\\' .. S_STEAM_USER_DATA_ID ..'\\config\\localconfig.vdf')
			if tFriendsProfile ~= nil then
				SetVars(S_STEAM_USER_DATA_ID, n)
				n = n+1
			else
				print("not found")
			end
		end
	end
	n = n - 1
	SKIN:Bang('[!EnableMeasureGroup Pics][!SetVariable Show '.. n ..']')
	SKIN:Bang('!Update')
end

function SetVars(S_STEAM_USER_DATA_ID, number)
	local tFriendsProfile = ParseVDFFile(S_PATH_STEAM .. 'userdata\\' .. S_STEAM_USER_DATA_ID ..'\\config\\localconfig.vdf')
	if tFriendsProfile ~= nil then
		tFriendsProfile = tFriendsProfile[S_VDF_KEY_USER_LOCAL_CONFIG_STORE]
		if tFriendsProfile ~= nil then
			tFriendsProfile = tFriendsProfile[S_VDF_KEY_FRIENDS]
			if tFriendsProfile ~= nil then
				tFriendsProfile = tFriendsProfile[S_STEAM_USER_DATA_ID]
				if tFriendsProfile ~= nil then
					local sUsername = tFriendsProfile[S_VDF_KEY_NAME]
					local sAvatarHash = tFriendsProfile[S_VDF_KEY_AVATAR]
					if sUsername ~= nil and sAvatarHash ~= nil then
						SKIN:Bang('[!SetVariable "UsernameVariable'.. number ..'" "' .. sUsername .. '"][!SetVariable "AvatarHash'.. number ..'" "' .. sAvatarHash .. '"][!SetVariable "ID'.. number ..'" "' .. S_STEAM_USER_DATA_ID .. '"]')
					end
				end
			end
		end
	end
end

function ParseVDFTable(atTable, anStart)
	anStart = anStart or 1
	assert(type(atTable) == 'table')
	assert(type(anStart) == 'number')
	local tResult = {}
	local sKey = ''
	local sValue = ''
	local i = anStart
	while i <= #atTable do
		sKey = string.match(atTable[i], '^%s*"([^"]+)"%s*$')
		if sKey ~= nil then
			sKey = sKey:lower()
			i = i + 1
			if string.match(atTable[i], '^%s*{%s*$') then
				sValue, i = ParseVDFTable(atTable, (i + 1))
				if sValue == nil and i == nil then
					return nil, nil
				else
					tResult[sKey] = sValue
				end
			else
				DisplayMessage('Error! Failure to parse table at line ' .. tostring(i) .. '(' .. atTable[i] .. ')')
				return nil, nil
			end
		else
			sKey = string.match(atTable[i], '^%s*"(.-)"%s*".-"%s*$')
			if sKey ~= nil then
				sKey = sKey:lower()
				sValue = string.match(atTable[i], '^%s*".-"%s*"(.-)"%s*$')
				tResult[sKey] = sValue
			else
				if string.match(atTable[i], '^%s*}%s*$') then
					return tResult, i
				elseif string.match(atTable[i], '^%s*//.*$') then
					-- Comment - Better support is still needed for comments
				else
					sValue = string.match(atTable[i], '^%s*"#base"%s*"(.-)"%s*$')
					if sValue ~= nil then
						-- Base - Needs to be implemented
					else
						DisplayMessage('Error! Failure to parse key-value pair at line ' .. tostring(i) .. '(' .. atTable[i] .. ')')
						return nil, nil
					end
				end
			end
		end
		i = i + 1
	end
	return tResult, i
end

function ParseVDFFile(asFile)
	local fFile = io.open(asFile, 'r')
	local tTable = {}
	if fFile ~= nil then
		for sLine in fFile:lines() do
			table.insert(tTable, sLine)
		end
		fFile:close()
	else
		return nil
	end
	local tResult = ParseVDFTable(tTable)
	if tResult == nil then
		print('Error! Failure to parse' .. asFile)
	end
	return tResult
end

function RecursiveTableSearch(atTable, asKey)
	for sKey, sValue in pairs(atTable) do
		if sKey == asKey then
			return sValue
		end
	end
	for sKey, sValue in pairs(atTable) do
		local asType = type(sValue)
		if asType == 'table' then
			local tResult = RecursiveTableSearch(sValue, asKey)
			if tResult ~= nil then
				return tResult
			end
		end
	end
	return nil
end

function getstate(skin)
	local configpath = SKIN:GetVariable('SETTINGSPATH').."rainmeter.ini"
	local rainmeterini = io.open(configpath, "r")
	local skin = string.gsub(skin, "%-", "%%%-")
	local text = rainmeterini:read('*all')
	local var = "Active"
	state = tonumber(string.match(text, '%['..skin..'%]\n.-'..var..'=(%d+)'))
	if state > 0 then
		return true
	else
		return false
	end
	rainmeterini:close(rainmeterini)
end
