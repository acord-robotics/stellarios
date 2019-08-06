function Initialize()
	-- Folder paths to resources
	S_PATH_DOWNLOADS = SKIN:MakePathAbsolute("DownloadFile\\")
	SKINSPATH = SKIN:GetVariable('SKINSPATH')
	S_PATH_RESOURCES = SKIN:MakePathAbsolute(SKINSPATH.."NXT-OS\\GameDrawer\\Resources\\")
	S_PATH_RESOURCES_INDATA = SKIN:MakePathAbsolute(SKINSPATH.."NXT-OS Data\\GameDrawer\\")

	-- State variables
	N_SORT_STATE = 1 -- 0 = alphabetically, 1 = most recently played
	S_NAME_FILTER = ''
	S_TAGS_FILTER = ''
	N_SCROLL_START_INDEX = 1 -- Index to start from when populating the game meters with games.

	-- Names of various files and folders.
	FILES_IN_DIRECTORY = true
	S_INCLUDE_FILE_METERS = 'Meters.inc' -- File containing game meters.
	S_INCLUDE_FILE_ANIMATION = 'Animation.inc' -- File conainting the Action timer actions for all the game tiles.
	S_INCLUDE_FILE_EXCEPTIONS = 'Exceptions.inc' -- File containing AppIDs of Steam games to not include in the list of games.
	S_INCLUDE_FILE_NON_STEAM_GAMES = 'Games.inc' -- File containing data about non-Steam games and applications to include in the list of games.
	S_INCLUDE_FILE_STEAM_SHORTCUTS = 'SteamShortcuts.inc' -- File containing last played timestamp of non-Steam games that have been added to the Steam library.
	S_BANNER_FOLDER_NAME = 'Banners' -- Name of the folder containing all of the banners.

	-- Steam
	S_STEAM_RUN_COMMAND = 'steam://rungameid/' -- Command for running games via Steam.
	S_PATH_STEAM = SKIN:GetVariable('GameDrawer.SteamPath', nil)
	S_STEAM_USER_DATA_ID = SKIN:GetVariable('GameDrawer.UserDataID', nil)

	-- VDF (de)serializing
	S_VDF_SERIALIZING_INDENTATION = '' -- Used for proper indentation when writing files formatted according to VDF.

	-- Keys of values found in files formatted according to VDF.
	S_VDF_KEY_APPID = 'appid' -- Steam AppID corresponding to a certain game.
	S_VDF_KEY_LAST_PLAYED = 'LastPlayed' -- Unix timestamp of when the game was last launched.
	S_VDF_KEY_NAME = 'name' -- The name of the game.
	S_VDF_KEY_TAGS = 'tags' -- Tags, usually categories.
	S_VDF_KEY_PATH = 'path'
	S_VDF_KEY_HIDDEN = 'hidden'
	S_VDF_KEY_STEAM = 'Steam' -- Whether or not a game is via Steam.
	S_VDF_KEY_STEAM_SHORTCUT = 'SteamShortcut' -- Whether or not this is a non-Steam game that has been added to the Steam library.
	S_VDF_KEY_USER_LOCAL_CONFIG_STORE = 'UserLocalConfigStore'
	S_VDF_KEY_SOFTWARE = 'Software'
	S_VDF_KEY_VALVE = 'Valve'
	S_VDF_KEY_APPS = 'apps'
	S_VDF_KEY_APP_TICKETS = 'apptickets'
	S_VDF_KEY_APP_STATE = 'AppState'
	S_VDF_KEY_USER_CONFIG = 'UserConfig'
	S_VDF_KEY_LIBRARY_FOLDERS = 'LibraryFolders'

	-- Miscellaneous
	T_GAMES = {} -- List of all games.
	T_FILTERED_GAMES = {} -- List of games after they have been filtered according to user-defined criteria.
	T_LOGO_QUEUE = {} -- List of Steam AppIDs to download banners for.
	T_SUPPORTED_BANNER_EXTENSIONS = {'.jpg', '.png'} -- Extensions to use when checking if a banner already exists for a game or not.
	N_SCROLL_MULTIPLIER = tonumber(SKIN:GetVariable('ScrollMultiplier', '1'))
	S_BANNER_VARIABLE_PREFIX = 'BannerID' -- Stem of the name of variables, which contain the names of banner files used, used by the game meters.
	S_NAME_VARIABLE_PREFIX = 'GameName'
	SetBanner()
end

function SerializeTableAsVDFFile(atTable, asFile)
	local tResult = SerializeTableAsVDF(atTable)
	local fFile = assert(io.open(asFile, 'w'))
	for i = 1, #tResult do
		fFile:write(tResult[i] .. '\n')
	end
	fFile:close()
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
		DisplayMessage('Error! Failure to parse' .. asFile)
	end
	return tResult
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

function SerializeTableAsVDF(atTable)
	assert(type(atTable) == 'table')
	local tResult = {}
	for sKey, Value in pairs(atTable) do
		local sType = type(Value)
		if sType == 'table' then
			table.insert(tResult, (S_VDF_SERIALIZING_INDENTATION .. '"' .. tostring(sKey) .. '"'))
			table.insert(tResult, (S_VDF_SERIALIZING_INDENTATION .. '{'))
			S_VDF_SERIALIZING_INDENTATION = S_VDF_SERIALIZING_INDENTATION .. '\t\t'
			local tTemp = SerializeTableAsVDF(Value)
			for i = 1, #tTemp do
				table.insert(tResult, tTemp[i])
			end
			S_VDF_SERIALIZING_INDENTATION = string.sub(S_VDF_SERIALIZING_INDENTATION, 3)
			table.insert(tResult, (S_VDF_SERIALIZING_INDENTATION .. '}'))
		elseif sType == 'number' or sType == 'string' then
			table.insert(tResult, (S_VDF_SERIALIZING_INDENTATION .. '"' .. tostring(sKey) .. '"\t\t"' .. tostring(Value) .. '"'))
		else
			DisplayMessage('ERROR! Unsupported data type (' .. sType .. ')')
		end
	end
	return tResult
end

function AddGame()
	local sName = SKIN:GetVariable('AddGameName', nil)
	if sName ~= nil and sName ~= '' then
		local tNonSteamGames = ParseVDFFile(S_PATH_RESOURCES_INDATA .. S_INCLUDE_FILE_NON_STEAM_GAMES)
		if tNonSteamGames ~= nil then
			local nIndex = 0
			for sKey, Value in pairs(tNonSteamGames) do
				if Value[S_VDF_KEY_NAME] == sName then
					if Value[S_VDF_KEY_HIDDEN] == 'true' then
						tNonSteamGames[sKey][S_VDF_KEY_HIDDEN] = 'false'
						SerializeTableAsVDFFile(tNonSteamGames, (S_PATH_RESOURCES_INDATA .. S_INCLUDE_FILE_NON_STEAM_GAMES))
						--Update()
					end
					nIndex = -1
					break
				else
					nIndex = nIndex + 1
				end
			end
			if nIndex >= 0 then
				local sPath = SKIN:GetVariable('AddGamePath', nil)
				if sPath ~= nil and sPath ~= '' then
					local tGame = {}
					local sAppID = SKIN:GetVariable('AddGameSteamAppID', nil)
					if sAppID ~= nil and sAppID ~= '' then
						tGame[S_VDF_KEY_APPID] = sAppID
					else
						tGame[S_VDF_KEY_APPID] = sName
					end
					tGame[S_VDF_KEY_NAME] = sName
					tGame[S_VDF_KEY_PATH] = sPath

					local sTags = SKIN:GetVariable('AddGameTags', nil)
					if sTags ~= nil and sTags ~= '' then
						local tTags = {}
						for sTag in sTags:gmatch('([^;]+)') do
							table.insert(tTags, sTag)
						end
						if #tTags > 0 then
							tGame[S_VDF_KEY_TAGS] = tTags
						end
					end
					tGame[S_VDF_KEY_LAST_PLAYED] = '0'
					tNonSteamGames[tostring(nIndex)] = tGame
					SerializeTableAsVDFFile(tNonSteamGames, (S_PATH_RESOURCES_INDATA .. S_INCLUDE_FILE_NON_STEAM_GAMES))
					--Update()
				end
			end
			SKIN:Bang('!Refresh NXT-OS\\GameDrawer')
		SKIN:Bang('!ShowMeterGroup Finished')
			return
		end
	end
end

function SetBanner()
	local id = SKIN:GetVariable('AddGameSteamAppID')
	SKIN:Bang('!SetOption','PreviewGame','ImageName','#SKINSPATH#NXT-OS Data\\GameDrawer\\Banners\\'..id..BannerExists(id))
	SKIN:Bang('!Update')
end

function BannerExists(asAppID)
	for i = 1, #T_SUPPORTED_BANNER_EXTENSIONS do
		local fBanner = io.open((S_PATH_RESOURCES_INDATA .. S_BANNER_FOLDER_NAME .. '\\' .. asAppID .. T_SUPPORTED_BANNER_EXTENSIONS[i]), 'r')
		if fBanner ~= nil then
			fBanner:close()
			return T_SUPPORTED_BANNER_EXTENSIONS[i]
		end
	end
	return nil
end