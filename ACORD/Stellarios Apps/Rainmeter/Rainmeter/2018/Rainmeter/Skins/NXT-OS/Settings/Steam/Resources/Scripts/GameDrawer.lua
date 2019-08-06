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
	local username,avatarhash = SetVars(SKIN:GetVariable('GameDrawer.SteamUserDataID'))
	SKIN:Bang('!SetOption','Pic','URL','https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/b5/'..avatarhash..'_full.jpg')
	SKIN:Bang('!SetOption','ProfileDefaultText','Text',username)
	SKIN:Bang('!SetOption','Profilename','Text',username)
	SKIN:Bang('[!EnableMeasureGroup Pics]')
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
	local DDOptions = {}
	local DDCommands = {}
	local FoundCurr = false
	for i=1,math.min(tonumber(TotalCount),5) do 
		local Path = SKIN:GetMeasure('Folder' .. i)
		local S_STEAM_USER_DATA_ID = Path:GetStringValue()
		local tFriendsProfile = ParseVDFFile(S_PATH_STEAM .. 'userdata\\' .. S_STEAM_USER_DATA_ID ..'\\config\\localconfig.vdf')
		if S_STEAM_USER_DATA_ID == SKIN:GetVariable('GameDrawer.SteamUserDataID') then FoundCurr = true end 
		if tFriendsProfile ~= nil then
			local username,avatarhash = SetVars(S_STEAM_USER_DATA_ID)
			table.insert(DDOptions,username)
			table.insert(DDCommands,'[!WriteKeyValue "Variables" "GameDrawer.SteamUserDataID" "'..S_STEAM_USER_DATA_ID..'" "#@#Settings.inc"][!Refresh NXT-OS\\GameDrawer][!Refresh]')
		else
			print("not found")
		end
	end
	if not FoundCurr and #DDCommands > 0 then
		SKIN:Bang(DDCommands[1])
	end
	if #DDOptions > 0 then
		SKIN:Bang('!SetOption','ProfileInputBoxBG','DropDownList',table.concat(DDOptions,'|'))
		SKIN:Bang('!SetOption','ProfileInputBoxBG','DropDownBangs',table.concat(DDCommands,'|'))
	else 
		SKIN:Bang('!SetOption','ProfileInputBoxBG','DropDownList','No profiles found! Please set Steam Directory.')
		SKIN:Bang('!SetOption','ProfileInputBoxBG','DropDownBangs','')
	end
	SKIN:Bang('!Update')
end

function SetVars(S_STEAM_USER_DATA_ID)
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
						return sUsername,sAvatarHash
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