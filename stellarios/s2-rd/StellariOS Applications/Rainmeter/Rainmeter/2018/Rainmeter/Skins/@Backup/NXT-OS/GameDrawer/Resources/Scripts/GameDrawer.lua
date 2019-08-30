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

	-- Keys of user settings.
	SKIN:Bang('!UpdateMeasure MainCalc')
	local MainCalc = SKIN:GetMeasure('MainCalc')
	S_USER_SETTING_KEY_SLOTS = tonumber(MainCalc:GetValue()) -- Number of rows.

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
	if S_PATH_STEAM ~= nil then
		if S_PATH_STEAM ~= '' and EndsWith(S_PATH_STEAM, '\\') == false then
			S_PATH_STEAM = S_PATH_STEAM .. '\\'
		end
		S_PATH_STEAM = Trim(S_PATH_STEAM)
	end
	S_STEAM_USER_DATA_ID = SKIN:GetVariable('GameDrawer.UserDataID', nil)
	if S_STEAM_USER_DATA_ID ~= nil then
		S_STEAM_USER_DATA_ID = Trim(S_STEAM_USER_DATA_ID)
	end

	-- VDF (de)serializing
	S_VDF_SERIALIZING_INDENTATION = '' -- Used for proper indentation when writing files formatted according to VDF.

	-- Keys of values found in files formatted according to VDF.
	S_VDF_KEY_APPID = 'appid' -- Steam AppID corresponding to a certain game.
	S_VDF_KEY_LAST_PLAYED = 'lastplayed' -- Unix timestamp of when the game was last launched.
	S_VDF_KEY_NAME = 'name' -- The name of the game.
	S_VDF_KEY_TAGS = 'tags' -- Tags, usually categories.
	S_VDF_KEY_PATH = 'path'
	S_VDF_KEY_HIDDEN = 'hidden'
	S_VDF_KEY_STEAM = 'steam' -- Whether or not a game is via Steam.
	S_VDF_KEY_STEAM_SHORTCUT = 'steamshortcut' -- Whether or not this is a non-Steam game that has been added to the Steam library.
	S_VDF_KEY_USER_LOCAL_CONFIG_STORE = 'userlocalconfigstore'
	S_VDF_KEY_SOFTWARE = 'software'
	S_VDF_KEY_VALVE = 'valve'
	S_VDF_KEY_APPS = 'apps'
	S_VDF_KEY_APP_TICKETS = 'apptickets'
	S_VDF_KEY_APP_STATE = 'appstate'
	S_VDF_KEY_USER_CONFIG = 'userconfig'
	S_VDF_KEY_LIBRARY_FOLDERS = 'libraryfolders'

	-- Miscellaneous
	T_GAMES = {} -- List of all games.
	T_FILTERED_GAMES = {} -- List of games after they have been filtered according to user-defined criteria.
	T_LOGO_QUEUE = {} -- List of Steam AppIDs to download banners for.
	T_SUPPORTED_BANNER_EXTENSIONS = {'.jpg', '.png'} -- Extensions to use when checking if a banner already exists for a game or not.
	N_SCROLL_MULTIPLIER = tonumber(SKIN:GetVariable('ScrollMultiplier', '1'))
	S_BANNER_VARIABLE_PREFIX = 'BannerID' -- Stem of the name of variables, which contain the names of banner files used, used by the game meters.
	S_NAME_VARIABLE_PREFIX = 'GameName'
end

function Update() -- Generates the list of games and, if necessary, the layout of game meters.
	if CheckFiles() then
		GenerateMetersAndVariables()
		SKIN:Bang('!Refresh')
	elseif tonumber(SKIN:GetVariable('OldSlots')) ~= S_USER_SETTING_KEY_SLOTS then
		SKIN:Bang('!WriteKeyValue','Variables','OldSlots',S_USER_SETTING_KEY_SLOTS)
		GenerateMetersAndVariables()
		SKIN:Bang('!Refresh')
	else
		T_GAMES = GenerateGames()
		if #T_GAMES <= 0 then
			SKIN:Bang("!ShowMeter NoGamesToShow")
		else
			SKIN:Bang("!HideMeter NoGamesToShow")
			local ScrollStartIndexOld = N_SCROLL_START_INDEX
			if S_NAME_FILTER ~= '' then
				T_FILTERED_GAMES = GetFilteredByKey(T_GAMES, S_VDF_KEY_NAME, S_NAME_FILTER)
			elseif S_TAGS_FILTER ~= '' then
				T_FILTERED_GAMES = GetFilteredByTags(T_GAMES)
			else
				T_FILTERED_GAMES = T_GAMES
			end
			N_SCROLL_START_INDEX = ScrollStartIndexOld
			SortByState(T_FILTERED_GAMES)
			PopulateMeters(T_FILTERED_GAMES)
		end
	end
end

-- Meter and variable generation
	function GenerateMetersAndVariables()
		local fAnimate = io.open((S_PATH_RESOURCES .. S_INCLUDE_FILE_ANIMATION), 'w')
		if fAnimate ~= nil then
			fAnimate:write("[TileAnimation]\nMeasure=Plugin\nPlugin=ActionTimer\n")
			fAnimate:close()
		end
		local fMeters = io.open((S_PATH_RESOURCES.. S_INCLUDE_FILE_METERS), 'w')
		if fMeters ~= nil then
			fMeters:close()
		end
		local n = 0
		for j = 1, S_USER_SETTING_KEY_SLOTS do
			n = n + 1
			GenerateAnimation(n)
			GenerateMeter(n)
		end
	end

	function GenerateAnimation(anIndex)
		local fAnimate = io.open((S_PATH_RESOURCES .. S_INCLUDE_FILE_ANIMATION), 'a+')
		local index = (((anIndex-1)*3)+1)
		if fAnimate ~= nil then
			fAnimate:write('ActionList'..index..'=Zoom'..anIndex..'_I_0|Zoom'..anIndex..'_I_1|Wait 20|Zoom'..anIndex..'_I_2|Wait 20|Zoom'..anIndex..'_I_3\n')
			fAnimate:write('ActionList'..(index+1)..'=Zoom'..anIndex..'_O_0|Zoom'..anIndex..'_O_1|Wait 20|Zoom'..anIndex..'_O_2|Wait 20|Zoom'..anIndex..'_O_3\n')
			fAnimate:write('ActionList'..(index+2)..'=Zoom'..anIndex..'_D_1|Wait 20|Zoom'..anIndex..'_D_2|Wait 20|Zoom'..anIndex..'_D_3|Wait 20|Zoom'..anIndex..'_D_4|Wait 20|Zoom'..anIndex..'_D_5|Wait 20|Zoom'..anIndex..'_D_6\n')

			fAnimate:write('Zoom'..anIndex..'_I_0=[!CommandMeasure TileAnimation "Stop '..(index+1)..'"]\n')
			fAnimate:write('Zoom'..anIndex..'_I_1=[!SetOption "Game'..anIndex..'" "W" "244"][!SetOption "Game'..anIndex..'" "H" "114"][!SetOption "Game'..anIndex..'" "Padding" "4,2,4,2"][!UpdateMeter "Game'..anIndex..'"][!Redraw]\n')
			fAnimate:write('Zoom'..anIndex..'_I_2=[!SetOption "Game'..anIndex..'" "W" "248"][!SetOption "Game'..anIndex..'" "H" "116"][!SetOption "Game'..anIndex..'" "Padding" "2,1,2,1"][!UpdateMeter "Game'..anIndex..'"][!Redraw]\n')
			fAnimate:write('Zoom'..anIndex..'_I_3=[!SetOption "Game'..anIndex..'" "W" "252"][!SetOption "Game'..anIndex..'" "H" "118"][!SetOption "Game'..anIndex..'" "Padding" "0,0,0,0"][!UpdateMeter "Game'..anIndex..'"][!Redraw]\n')
			fAnimate:write('Zoom'..anIndex..'_O_0=[!CommandMeasure TileAnimation "Stop '..index..'"]\n')
			fAnimate:write('Zoom'..anIndex..'_O_1=[!SetOption "Game'..anIndex..'" "W" "248"][!SetOption "Game'..anIndex..'" "H" "116"][!SetOption "Game'..anIndex..'" "Padding" "2,1,2,1"][!UpdateMeter "Game'..anIndex..'"][!Redraw]\n')
			fAnimate:write('Zoom'..anIndex..'_O_2=[!SetOption "Game'..anIndex..'" "W" "244"][!SetOption "Game'..anIndex..'" "H" "114"][!SetOption "Game'..anIndex..'" "Padding" "4,2,4,2"][!UpdateMeter "Game'..anIndex..'"][!Redraw]\n')
			fAnimate:write('Zoom'..anIndex..'_O_3=[!SetOption "Game'..anIndex..'" "W" "240"][!SetOption "Game'..anIndex..'" "H" "112"][!SetOption "Game'..anIndex..'" "Padding" "6,3,6,3"][!UpdateMeter "Game'..anIndex..'"][!Redraw]\n')
			fAnimate:write('Zoom'..anIndex..'_D_1=[!SetOption "Game'..anIndex..'" "W" "248"][!SetOption "Game'..anIndex..'" "H" "116"][!SetOption "Game'..anIndex..'" "Padding" "2,1,2,1"][!UpdateMeter "Game'..anIndex..'"][!Redraw]\n')
			fAnimate:write('Zoom'..anIndex..'_D_2=[!SetOption "Game'..anIndex..'" "W" "244"][!SetOption "Game'..anIndex..'" "H" "114"][!SetOption "Game'..anIndex..'" "Padding" "4,2,4,2"][!UpdateMeter "Game'..anIndex..'"][!Redraw]\n')
			fAnimate:write('Zoom'..anIndex..'_D_3=[!SetOption "Game'..anIndex..'" "W" "240"][!SetOption "Game'..anIndex..'" "H" "112"][!SetOption "Game'..anIndex..'" "Padding" "6,3,6,3"][!UpdateMeter "Game'..anIndex..'"][!Redraw]\n')
			fAnimate:write('Zoom'..anIndex..'_D_4=[!SetOption "Game'..anIndex..'" "W" "236"][!SetOption "Game'..anIndex..'" "H" "110"][!SetOption "Game'..anIndex..'" "Padding" "8,4,8,4"][!UpdateMeter "Game'..anIndex..'"][!Redraw]\n')
			fAnimate:write('Zoom'..anIndex..'_D_5=[!SetOption "Game'..anIndex..'" "W" "232"][!SetOption "Game'..anIndex..'" "H" "108"][!SetOption "Game'..anIndex..'" "Padding" "10,5,10,5"][!UpdateMeter "Game'..anIndex..'"][!Redraw]\n')
			fAnimate:write('Zoom'..anIndex..'_D_6=[!SetOption "Game'..anIndex..'" "W" "228"][!SetOption "Game'..anIndex..'" "H" "106"][!SetOption "Game'..anIndex..'" "Padding" "12,6,12,6"][!UpdateMeter "Game'..anIndex..'"][!Redraw]\n')
			fAnimate:close()
		end
	end
	function GenerateMeter(anIndex)
		local index = (((anIndex-1)*3)+1)
		local fMeters = io.open((S_PATH_RESOURCES .. S_INCLUDE_FILE_METERS), 'a+')
		if fMeters ~= nil then
			fMeters:write('[Game' .. anIndex .. ']\n')
			fMeters:write('Meter=Image\n')
			fMeters:write('ImageName=\n')
			if anIndex == 1 then
				fMeters:write('X=[SpaceCalc]r\n')
			end
			fMeters:write('MeterStyle=GameBanner\n')
			fMeters:write('MouseOverAction=#SoundCommand#[#HoverCommand# TileAnimation "execute'..index..'"]\n')
			fMeters:write('MouseLeaveAction=[#HoverCommand# TileAnimation "execute'..(index+1)..'"]\n')
			fMeters:write('LeftMouseDownAction=[!CommandMeasure TileAnimation "execute'..(index+2)..'"]\n')
			fMeters:write('LeftMouseUpAction=[!SetOptionGroup GameMeters W 240][!SetOptionGroup GameMeters H 112][!SetOptionGroup GameMeters Padding 6,3,6,3][!UpdateMeterGroup GameMeters][!Redraw][!CommandMeasure LauncherScript "LaunchGame(\'#' .. S_BANNER_VARIABLE_PREFIX .. anIndex .. '#\')"]#CloseGameAction#\n')
			fMeters:write('MiddleMouseDoubleClickAction=[!CommandMeasure LauncherScript "AddToExceptions(\'#' .. S_BANNER_VARIABLE_PREFIX .. anIndex .. '#\')"]\n')
			fMeters:write('\n')
			fMeters:close()
		end
	end

-- Generating game objects
	function GenerateGames()
		local tGames = {}

		-- Non-Steam games
		local tNonSteamGames = ParseVDFFile(S_PATH_RESOURCES_INDATA .. S_INCLUDE_FILE_NON_STEAM_GAMES)
		if tNonSteamGames ~= nil then
			for sKey, sValue in pairs(tNonSteamGames) do
				if sValue[S_VDF_KEY_HIDDEN] ~= 'true' then
					local tGame = {}
					tGame[S_VDF_KEY_APPID] = sValue[S_VDF_KEY_APPID]
					tGame[S_VDF_KEY_NAME] = sValue[S_VDF_KEY_NAME]
					tGame[S_VDF_KEY_TAGS] = sValue[S_VDF_KEY_TAGS]
					tGame[S_VDF_KEY_PATH] = sValue[S_VDF_KEY_PATH]
					tGame[S_VDF_KEY_LAST_PLAYED] = sValue[S_VDF_KEY_LAST_PLAYED]
					if tGame[S_VDF_KEY_LAST_PLAYED] == nil then
						tGame[S_VDF_KEY_LAST_PLAYED] = '0'
					end
					if BannerExists(tGame[S_VDF_KEY_APPID]) == nil then
						if tonumber(tGame[S_VDF_KEY_APPID]) ~= nil then
							DisplayMessage('Missing banner ' .. tGame[S_VDF_KEY_APPID] .. ' for ' .. tGame[S_VDF_KEY_NAME])
							table.insert(T_LOGO_QUEUE, tGame[S_VDF_KEY_APPID])
							table.insert(tGames, tGame)
						else
							DisplayMessage('Missing banner ' .. tGame[S_VDF_KEY_APPID] .. ' for ' .. tGame[S_VDF_KEY_NAME])
						end
					else
						table.insert(tGames, tGame)
					end
					tGame = nil
				end
			end
			tNonSteamGames = nil
		end

		-- Steam games and non-Steam games that have been added to the Steam library.
		local tSteamLibraryPaths = {}
		table.insert(tSteamLibraryPaths, S_PATH_STEAM)
		local tSteamLibraryFolders = ParseVDFFile(S_PATH_STEAM .. 'SteamApps\\libraryfolders.vdf')
		if tSteamLibraryFolders ~= nil then
			tSteamLibraryFolders = tSteamLibraryFolders[S_VDF_KEY_LIBRARY_FOLDERS]
			if tSteamLibraryFolders ~= nil then
				for sKey, sValue in pairs(tSteamLibraryFolders) do
					if tonumber(sKey) then
						if sValue ~= '' then
							if not EndsWith(sValue, '\\') then
								sValue = sValue .. '\\'
							end
							table.insert(tSteamLibraryPaths, sValue)
						end
					end
				end
			else
				DisplayMessage('Error: The "LibraryFolders" key-value pair could not be found in "\\Steam\\SteamApps\\libraryfolders.vdf"')
			end
		end

		if S_PATH_STEAM ~= nil and S_PATH_STEAM ~= '' then
			if S_STEAM_USER_DATA_ID == nil or S_STEAM_USER_DATA_ID == '' then
				DisplayMessage('Missing Steam UserDataID or invalid Steam path, check your settings.')
			else
				local tLocalConfigApps = ParseVDFFile(S_PATH_STEAM .. 'userdata\\' .. S_STEAM_USER_DATA_ID ..'\\config\\localconfig.vdf')
				if tLocalConfigApps == nil then
					DisplayMessage('Invalid Steam UserDataID and/or Steam path, check your settings.')
				else
					local tLocalConfigAppTickets = RecursiveTableSearch(tLocalConfigApps, S_VDF_KEY_APP_TICKETS)
					tLocalConfigApps = RecursiveTableSearch(tLocalConfigApps, S_VDF_KEY_STEAM)[S_VDF_KEY_APPS]
					local tSharedConfigApps = ParseVDFFile(S_PATH_STEAM .. 'userdata\\' .. S_STEAM_USER_DATA_ID .. '\\7\\remote\\sharedconfig.vdf')
					tSharedConfigApps = RecursiveTableSearch(tSharedConfigApps, S_VDF_KEY_STEAM)[S_VDF_KEY_APPS]
					local tExceptions = ParseVDFFile(S_PATH_RESOURCES_INDATA .. S_INCLUDE_FILE_EXCEPTIONS)
					if tLocalConfigApps ~= nil and tLocalConfigAppTickets ~= nil and tSharedConfigApps ~= nil then
						-- Steam games.
						for i = 1, #tSteamLibraryPaths do
							for sAppID, tTable in pairs(tLocalConfigAppTickets) do
								if tExceptions[sAppID] == nil then
									local tGame = {}
									tGame[S_VDF_KEY_STEAM] = 'true'
									tGame[S_VDF_KEY_APPID] = sAppID
									if tLocalConfigApps[sAppID] ~= nil and tLocalConfigApps[sAppID][S_VDF_KEY_LAST_PLAYED] ~= nil then
										tGame[S_VDF_KEY_LAST_PLAYED] = tLocalConfigApps[sAppID][S_VDF_KEY_LAST_PLAYED]
										local tAppManifest = ParseVDFFile(tSteamLibraryPaths[i] .. 'SteamApps\\appmanifest_' .. sAppID .. '.acf')
										if tAppManifest ~= nil and tAppManifest[S_VDF_KEY_APP_STATE] ~= nil then
											tGame[S_VDF_KEY_NAME] = tAppManifest[S_VDF_KEY_APP_STATE][S_VDF_KEY_NAME]
											if tGame[S_VDF_KEY_NAME] == nil then
												if tAppManifest[S_VDF_KEY_APP_STATE][S_VDF_KEY_USER_CONFIG] ~= nil then
													tGame[S_VDF_KEY_NAME] = tAppManifest[S_VDF_KEY_APP_STATE][S_VDF_KEY_USER_CONFIG][S_VDF_KEY_NAME]
												end
											end
											if tGame[S_VDF_KEY_NAME] ~= nil then
												local tGameSharedConfig = RecursiveTableSearch(tSharedConfigApps, sAppID)
												if tGameSharedConfig ~= nil then
													tGame[S_VDF_KEY_TAGS] = RecursiveTableSearch(tGameSharedConfig, S_VDF_KEY_TAGS)
													tGame[S_VDF_KEY_HIDDEN] = tGameSharedConfig[S_VDF_KEY_HIDDEN]
												end
												tGameSharedConfig = nil
												if tGame[S_VDF_KEY_HIDDEN] == nil or tGame[S_VDF_KEY_HIDDEN] == '0' then
													table.insert(tGames, tGame)
													if BannerExists(tGame[S_VDF_KEY_APPID]) == nil then
														table.insert(T_LOGO_QUEUE, tGame[S_VDF_KEY_APPID])
													end
												end
											end
										end
									end
									tGame = nil
								end
							end
						end

						-- Non-Steam games that have been added to the Steam library.
						local sShortcuts = ''
						-- Convert from hexadecimal to UTF8. Replace control characters with "|".
						local fShortcuts = io.open((S_PATH_STEAM .. 'userdata\\' .. S_STEAM_USER_DATA_ID ..'\\config\\shortcuts.vdf'), 'rb')
						if fShortcuts ~= nil then
							while true do
								local sHex = fShortcuts:read(5)
								if sHex == nil then
									fShortcuts:close()
									break
								else
									sShortcuts = sShortcuts .. string.gsub(sHex, '%c', '|')
								end
							end
							local tSteamShortcuts = ParseVDFFile(S_PATH_RESOURCES_INDATA .. S_INCLUDE_FILE_STEAM_SHORTCUTS)
							local nSteamShortcutsBefore = 0
							for k,v in pairs(tSteamShortcuts) do
								nSteamShortcutsBefore = nSteamShortcutsBefore + 1
							end
							for sName, sPath, sTags in string.gmatch(sShortcuts, '|appname|([^|]+)||exe|\"(.-)\"|.-|tags|(.-)||||') do
								local nIndex = 0
								local nMaxIndex = 0
								if tSteamShortcuts ~= nil then
									for sKey, tValue in pairs(tSteamShortcuts) do
										local nKey = tonumber(sKey)
										if tValue[S_VDF_KEY_NAME] == sName then
											nIndex = nKey
											break
										elseif nKey >= nMaxIndex then
											nMaxIndex = nKey + 1
										end
									end
								end
								local tGame = {}
								tGame[S_VDF_KEY_APPID] = sName
								tGame[S_VDF_KEY_NAME] = sName
								tGame[S_VDF_KEY_PATH] = sPath
								tGame[S_VDF_KEY_STEAM_SHORTCUT] = 'true'
								tGame[S_VDF_KEY_LAST_PLAYED] = '0'
								local tTags = {}
								local nTags = 0
								for sTag in string.gmatch(sTags, '|+%d+|([^|]+)') do
									tTags[tostring(nTags)] = sTag
									nTags = nTags + 1
								end
								if nTags > 0 then
									tGame[S_VDF_KEY_TAGS] = tTags
								end
								local sMaxIndex = tostring(nMaxIndex)
								if tSteamShortcuts[sMaxIndex] == nil then
									local tLocalGame = {}
									tLocalGame[S_VDF_KEY_NAME] = sName
									tLocalGame[S_VDF_KEY_LAST_PLAYED] = '0'
									tSteamShortcuts[sMaxIndex] = tLocalGame
								else
									local sIndex = tostring(nIndex)
									tGame[S_VDF_KEY_LAST_PLAYED] = tSteamShortcuts[sIndex][S_VDF_KEY_LAST_PLAYED]
									if tSteamShortcuts[sIndex][S_VDF_KEY_PATH] ~= nil then
										tGame[S_VDF_KEY_PATH] = tSteamShortcuts[sIndex][S_VDF_KEY_PATH]
									end
									if tSteamShortcuts[sIndex][S_VDF_KEY_STEAM] ~= nil then
										tGame[S_VDF_KEY_STEAM] = tSteamShortcuts[sIndex][S_VDF_KEY_STEAM]
									end

									if tSteamShortcuts[sIndex][S_VDF_KEY_APPID] ~= nil then
										tGame[S_VDF_KEY_APPID] = tSteamShortcuts[sIndex][S_VDF_KEY_APPID]
									end

								end
								if BannerExists(tGame[S_VDF_KEY_APPID]) == nil then
									if tonumber(tGame[S_VDF_KEY_APPID]) ~= nil then
										table.insert(T_LOGO_QUEUE, tGame[S_VDF_KEY_APPID])
										table.insert(tGames, tGame)
									else
										DisplayMessage('Missing banner ' .. tGame[S_VDF_KEY_APPID] .. ' for ' .. tGame[S_VDF_KEY_NAME])
									end
								else
									table.insert(tGames, tGame)
								end
							end
							local nSteamShortcutsAfter = 0
							for k,v in pairs(tSteamShortcuts) do
								nSteamShortcutsAfter = nSteamShortcutsAfter + 1
							end
							if nSteamShortcutsBefore ~= nSteamShortcutsAfter then
								SerializeTableAsVDFFile(tSteamShortcuts, (S_PATH_RESOURCES_INDATA .. S_INCLUDE_FILE_STEAM_SHORTCUTS))
							end
							tSteamShortcuts = nil
						end
					end
				end
			end
		end
		if #tGames > 0 then
			AcquireBanner()
		end
		return tGames
	end

-- Refresh banners
	function PopulateMeters(atGames)
		local BannerPath = '#SKINSPATH#\\NXT-OS Data\\GameDrawer\\' .. S_BANNER_FOLDER_NAME .. '\\'
		for i = 1, S_USER_SETTING_KEY_SLOTS do
			SKIN:Bang('!SetVariable ' .. S_BANNER_VARIABLE_PREFIX .. i .. ' "blank.png"')
		end
		local j = N_SCROLL_START_INDEX
		for i = 1, S_USER_SETTING_KEY_SLOTS do
			if j > 0 and j <= #atGames then
				local sExtension = BannerExists(atGames[j][S_VDF_KEY_APPID])
				if sExtension ~= nil then
					if j > #atGames then
						SKIN:Bang('!SetVariable ' .. S_BANNER_VARIABLE_PREFIX .. i .. ' "blank.png"')
						SKIN:Bang('!SetOption Game'.. i ..' ImageName ""')
					else
						SKIN:Bang('!SetVariable ' .. S_BANNER_VARIABLE_PREFIX .. i .. ' "' .. atGames[j][S_VDF_KEY_APPID] .. sExtension .. '"')
						SKIN:Bang('!SetOption Game'.. i ..' ImageName "' .. BannerPath .. atGames[j][S_VDF_KEY_APPID] .. sExtension .. '"')
					end
				end
				j = j + 1
			else
				SKIN:Bang('!SetVariable ' .. S_BANNER_VARIABLE_PREFIX .. i .. ' "blank.png"')
				SKIN:Bang('!SetOption Game'.. i ..' ImageName ""')
			end
		end
		local DisplayNum = #T_FILTERED_GAMES - S_USER_SETTING_KEY_SLOTS + 1
		SKIN:Bang('!SetVariable','DisplayNum',DisplayNum)
		SKIN:Bang('[!UpdateMeterGroup GameMeters][!Redraw]')
		--AcquireBanner()    Removed to fix download banner bug that started when valve changed the steam web api address.
	end

	function Scroll(asAmount)
		local anStart = N_SCROLL_START_INDEX
		local anMaxScroll = #T_FILTERED_GAMES - S_USER_SETTING_KEY_SLOTS + 1
		local anAmount = tonumber(asAmount) * N_SCROLL_MULTIPLIER
		N_SCROLL_START_INDEX = N_SCROLL_START_INDEX + anAmount
		if N_SCROLL_START_INDEX < 1 or #T_FILTERED_GAMES < S_USER_SETTING_KEY_SLOTS then
			N_SCROLL_START_INDEX = 1
		elseif N_SCROLL_START_INDEX >  anMaxScroll then
			N_SCROLL_START_INDEX = anMaxScroll
		end
		if N_SCROLL_START_INDEX ~= anStart then
			PopulateMeters(T_FILTERED_GAMES)
		end
		SKIN:Bang('!SetVariable','ScrollPos',N_SCROLL_START_INDEX)
	end

	function ScrollTo(num)
		N_SCROLL_START_INDEX = num
		SKIN:Bang('!SetVariable','ScrollPos',N_SCROLL_START_INDEX)
		PopulateMeters(T_FILTERED_GAMES)
	end

-- Acquire banners
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

	function AcquireBanner()
		if #T_LOGO_QUEUE > 0 then
			local tExceptions = ParseVDFFile(S_PATH_RESOURCES_INDATA .. S_INCLUDE_FILE_EXCEPTIONS)
			while #T_LOGO_QUEUE > 0 and tExceptions[T_LOGO_QUEUE[1]] ~= nil do
				table.remove(T_LOGO_QUEUE, 1)
			end
			tExceptions = nil
			if #T_LOGO_QUEUE > 0 then
				for i = 1, #T_GAMES do
					if T_GAMES[S_VDF_KEY_APPID] == T_LOGO_QUEUE[1] then
						break
					end
				end
				SKIN:Bang('[!ShowMeterGroup "Loading"]')
				SKIN:Bang('[!SetVariable LogoToDownload "' .. T_LOGO_QUEUE[1] .. '"][!EnableMeasure LogoDownloader][!CommandMeasure LogoDownloader Update]')
			end
		end
		SKIN:Bang('!Update')
	end

	function BannerAcquisitionEnded(anStatus)
		SKIN:Bang('!Update')
		anStatus = tonumber(anStatus)
		--[[
		anStatus codes
		0 = Successful acquisition
		1 = Failure to connect (file doesn't exist or internet connection is down).
		2 = Failure to download due to e.g. lack of permission to write.
		--]]
		if anStatus >= 0 then
			if anStatus == 0 then
				if #T_LOGO_QUEUE > 0 then
					local sFileName = T_LOGO_QUEUE[1] .. '.jpg'
					local sOldFilePath = S_PATH_DOWNLOADS .. sFileName
					local sNewFilePath = S_PATH_RESOURCES_INDATA .. S_BANNER_FOLDER_NAME .. '\\' .. sFileName
					os.rename(sOldFilePath, sNewFilePath)
					if S_NAME_FILTER ~= '' then
						T_FILTERED_GAMES = GetFilteredByKey(T_GAMES, S_VDF_KEY_NAME, S_NAME_FILTER)
					elseif S_TAGS_FILTER ~= '' then
						T_FILTERED_GAMES = GetFilteredByTags(T_GAMES)
					else
						T_FILTERED_GAMES = T_GAMES
					end
					SortByState(T_FILTERED_GAMES)
					PopulateMeters(T_FILTERED_GAMES)
				end
			else
				local tExceptions = ParseVDFFile(S_PATH_RESOURCES_INDATA .. S_INCLUDE_FILE_EXCEPTIONS)
				if tExceptions[T_LOGO_QUEUE[1]] == nil then
					local sName = 'Unknown'
					for i = 1, #T_GAMES do
						if T_GAMES[i][S_VDF_KEY_APPID] == T_LOGO_QUEUE[1] then
							sName = T_GAMES[i][S_VDF_KEY_NAME]
							break
						end
					end
					tExceptions[T_LOGO_QUEUE[1]] = sName
					SerializeTableAsVDFFile(tExceptions, (S_PATH_RESOURCES_INDATA .. S_INCLUDE_FILE_EXCEPTIONS))
					DisplayMessage('Download failed ' .. sName)
				end
			end
			table.remove(T_LOGO_QUEUE, 1)
			if #T_LOGO_QUEUE > 0 then
				AcquireBanner()
			else
				SKIN:Bang('[!Refresh]')
				SKIN:Bang('[!HideMeterGroup "Loading"]')
			end
		end
		SKIN:Bang('!Update')
	end

-- Sorting lists of game objects
	function SortAlphabetically(atFirst, atSecond)
		if atFirst[S_VDF_KEY_NAME]:gsub(':', ' ') < atSecond[S_VDF_KEY_NAME]:gsub(':', ' ') then
			return true
		else
			return false
		end
	end

	function SortLastPlayed(atFirst, atSecond)
		if tonumber(atFirst[S_VDF_KEY_LAST_PLAYED]) > tonumber(atSecond[S_VDF_KEY_LAST_PLAYED]) then
			return true
		else
			return false
		end
	end

	function SortGames()
		N_SORT_STATE = N_SORT_STATE + 1
		SortByState(T_FILTERED_GAMES)
		PopulateMeters(T_FILTERED_GAMES)
	end

	function SortByState(atGames)
		if N_SORT_STATE > 1 then
			N_SORT_STATE = 0
		end
		if N_SORT_STATE == 0 then
			table.sort(atGames, SortAlphabetically)
			SKIN:Bang('!SetOption SortButton ImageName "Resources\\Images\\SortAlphabetically.png"')
			SKIN:Bang('!WriteKeyValue Variables SortState '..N_SORT_STATE)
		elseif N_SORT_STATE == 1 then
			table.sort(atGames, SortLastPlayed)
			SKIN:Bang('!SetOption SortButton ImageName "Resources\\Images\\SortLastPlayed.png"')
			SKIN:Bang('!WriteKeyValue Variables SortState '..N_SORT_STATE)
		end
		SKIN:Bang('!Update')
	end

	function Filter(asFilter)
		SKIN:Bang('!SetVariable','CurrentSearch', asFilter)
		asFilter = asFilter:lower()
		local bAdditive = false
		if StartsWith(asFilter, '+') then
			bAdditive = true
			asFilter = asFilter:sub(2)
		end
		if StartsWith(asFilter, 'tags:') then
			asFilter = Trim(asFilter:sub(6))
			S_TAGS_FILTER = asFilter
			S_NAME_FILTER = ''
			if bAdditive == true then
				T_FILTERED_GAMES = GetFilteredByTags(T_FILTERED_GAMES)
			else
				T_FILTERED_GAMES = GetFilteredByTags(T_GAMES)
			end
			SortByState(T_FILTERED_GAMES)
			PopulateMeters(T_FILTERED_GAMES)
		elseif StartsWith(asFilter, 'steam:') then
			asFilter = Trim(asFilter:sub(7))
			if asFilter == 'true' then
				if bAdditive == true then
					T_FILTERED_GAMES = GetFilteredByKey(T_FILTERED_GAMES, S_VDF_KEY_STEAM, 'true')
				else
					T_FILTERED_GAMES = GetFilteredByKey(T_GAMES, S_VDF_KEY_STEAM, 'true')
				end
				SortByState(T_FILTERED_GAMES)
				PopulateMeters(T_FILTERED_GAMES)
			elseif asFilter == 'false' then
				if bAdditive == true then
					T_FILTERED_GAMES = GetFilteredByKey(T_FILTERED_GAMES, S_VDF_KEY_STEAM, 'false')
				else
					T_FILTERED_GAMES = GetFilteredByKey(T_GAMES, S_VDF_KEY_STEAM, 'false')
				end
				SortByState(T_FILTERED_GAMES)
				PopulateMeters(T_FILTERED_GAMES)
			end
		else
			asFilter = Trim(asFilter)
			S_NAME_FILTER = asFilter
			S_TAGS_FILTER = ''
			if bAdditive == true then
				T_FILTERED_GAMES = GetFilteredByKey(T_FILTERED_GAMES, S_VDF_KEY_NAME, S_NAME_FILTER)
			else
				T_FILTERED_GAMES = GetFilteredByKey(T_GAMES, S_VDF_KEY_NAME, S_NAME_FILTER)
			end
			SortByState(T_FILTERED_GAMES)
			PopulateMeters(T_FILTERED_GAMES)
		end
	end

	function GetFilteredByTags(atSelection)
		N_SCROLL_START_INDEX = 1
		if S_TAGS_FILTER == nil or S_TAGS_FILTER == '' then
			return T_GAMES
		else
			local tTags = {}
			for sTag in string.gmatch(S_TAGS_FILTER, "([^;]+)") do
				table.insert(tTags, Trim(sTag))
			end
			local tFilteredGames = {}
			for i = 1, #atSelection do
				if atSelection[i][S_VDF_KEY_TAGS] ~= nil then
					local tTagsCopy = {}
					for j = 1, #tTags do
						table.insert(tTagsCopy, tTags[j])
					end
					for sKey, sTag in pairs(atSelection[i][S_VDF_KEY_TAGS]) do
						for j = #tTagsCopy, 1, -1 do
							if (sTag:lower()):match(tTagsCopy[j]) then
								table.remove(tTagsCopy, j)
							end
						end
					end
					if #tTagsCopy == 0 then
						table.insert(tFilteredGames, atSelection[i])
					end
				end
			end
			return tFilteredGames
		end
	end

	function GetFilteredByKey(atSelection, asKey, asValue)
		N_SCROLL_START_INDEX = 1
		if asValue == nil or asValue == '' then
			return T_GAMES
		else
			local tFilteredGames = {}
			asValue = asValue:lower()
			if asKey == S_VDF_KEY_STEAM then
				if asValue == 'true' then
					for i = 1, #atSelection do
						if atSelection[i][asKey] == 'true' then
							table.insert(tFilteredGames, atSelection[i])
						end
					end
				elseif asValue == 'false' then
					for i = 1, #atSelection do
						if atSelection[i][asKey] == nil or atSelection[i][asKey] == 'false' then
							table.insert(tFilteredGames, atSelection[i])
						end
					end
				end
			else

				for i = 1, #atSelection do
					if atSelection[i][asKey] ~= nil and string.find(atSelection[i][asKey]:lower(), asValue) then
						table.insert(tFilteredGames, atSelection[i])
					end
				end
			end
			return tFilteredGames
		end
	end

-- Meter functionality
	function LaunchGame(asAppID)
		if SKIN:GetVariable('Sound.GameLaunch') == "0" then
			SKIN:Bang('Play #@#Sounds\\Launch.wav')
		end
		asAppID = string.sub(asAppID, 1, (string.find(asAppID, '%.') - 1))
		if asAppID ~= 'blank' then
			for i = 1, #T_GAMES do
				if asAppID == T_GAMES[i][S_VDF_KEY_APPID] then
					T_GAMES[i][S_VDF_KEY_LAST_PLAYED] = os.time()
					if T_GAMES[i][S_VDF_KEY_STEAM] == 'true' and T_GAMES[i][S_VDF_KEY_PATH] == nil then
						SKIN:Bang('[' .. S_STEAM_RUN_COMMAND .. asAppID .. ']')
					else
						local tLocal = ParseVDFFile(S_PATH_RESOURCES_INDATA .. S_INCLUDE_FILE_NON_STEAM_GAMES)
						if T_GAMES[i][S_VDF_KEY_STEAM_SHORTCUT] == 'true' then
							tLocal = ParseVDFFile(S_PATH_RESOURCES_INDATA .. S_INCLUDE_FILE_STEAM_SHORTCUTS)
						else
							tLocal = ParseVDFFile(S_PATH_RESOURCES_INDATA .. S_INCLUDE_FILE_NON_STEAM_GAMES)
						end
						if tLocal ~= nil then
							for sKey, tValue in pairs(tLocal) do
								if tValue[S_VDF_KEY_APPID] == asAppID then
									tValue[S_VDF_KEY_LAST_PLAYED] = T_GAMES[i][S_VDF_KEY_LAST_PLAYED]
									break
								end
							end
							if T_GAMES[i][S_VDF_KEY_STEAM_SHORTCUT] == 'true' then
								SerializeTableAsVDFFile(tLocal, (S_PATH_RESOURCES_INDATA .. S_INCLUDE_FILE_STEAM_SHORTCUTS))
							else
								SerializeTableAsVDFFile(tLocal, (S_PATH_RESOURCES_INDATA .. S_INCLUDE_FILE_NON_STEAM_GAMES))
							end
							tLocal = nil
						end
						if T_GAMES[i][S_VDF_KEY_PATH] ~= nil then
							SKIN:Bang('["' .. T_GAMES[i][S_VDF_KEY_PATH] .. '"]')
						end
					end
					SortByState(T_FILTERED_GAMES)
					PopulateMeters(T_FILTERED_GAMES)
					break
				end
			end
		end
	end

	function AddToExceptions(asAppID)
		asAppID = string.sub(asAppID, 1, (string.find(asAppID, '%.') - 1))
		for i = 1, #T_GAMES do
			if asAppID == T_GAMES[i][S_VDF_KEY_APPID] then
				if T_GAMES[i][S_VDF_KEY_STEAM] == 'true' then
					local tExceptions = ParseVDFFile(S_PATH_RESOURCES_INDATA .. S_INCLUDE_FILE_EXCEPTIONS)
					if tExceptions[asAppID] == nil then
						local sName = T_GAMES[i][S_VDF_KEY_NAME]
						tExceptions[asAppID] = sName
						SerializeTableAsVDFFile(tExceptions, (S_PATH_RESOURCES_INDATA .. S_INCLUDE_FILE_EXCEPTIONS))
						Update()
					end
				else
					local tNonSteamGames = ParseVDFFile(S_PATH_RESOURCES_INDATA .. S_INCLUDE_FILE_NON_STEAM_GAMES)
					if tNonSteamGames ~= nil then
						for sKey, Value in pairs(tNonSteamGames) do
							if asAppID == Value[S_VDF_KEY_APPID] then
								Value[S_VDF_KEY_HIDDEN] = 'true'
								SerializeTableAsVDFFile(tNonSteamGames, (S_PATH_RESOURCES_INDATA .. S_INCLUDE_FILE_NON_STEAM_GAMES))
								Update()
							end
						end
					end
				end
				break
			end
		end
	end

-- VDF (de)serializing
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
			DisplayMessage('Error! Failure to parse' .. asFile)
		end
		return tResult
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

	function SerializeTableAsVDFFile(atTable, asFile)
		local tResult = SerializeTableAsVDF(atTable)
		local fFile = assert(io.open(asFile, 'w'))
		for i = 1, #tResult do
			fFile:write(tResult[i] .. '\n')
		end
		fFile:close()
	end

-- Utility
	function StartsWith(asString, asPrefix)
		if asString == nil or asPrefix == nil then
			return false
		end
		return asString:match('^(' .. asPrefix .. '.-)$') ~= nil
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

	function CheckFiles()
		local fAnimate = io.open((S_PATH_RESOURCES .. S_INCLUDE_FILE_ANIMATION), 'r')
		if fAnimate == nil then
			return true
		else
			fAnimate:close()
		end
		local fMeters = io.open((S_PATH_RESOURCES.. S_INCLUDE_FILE_METERS), 'r')
		if fMeters == nil then
			return true
		else 
			fMeters:close()
		end
		return false
	end

	function RepairFiles()
		GenerateMetersAndVariables()
		SKIN:Bang('!Refresh')
	end

	function DisplayMessage(message)
		local message = tostring(message)
		SKIN:Bang('!Log','GameDrawer: '..message)
	end

-- Adding games

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
							Update()
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
						Update()
					end
				end
				StopAddGame()
				return
			end
		end
	end

	function StopAddGame()
		SKIN:Bang('[!SetVariable "AddGameName" ""][!SetVariable "AddGamePath" ""][!SetVariable "AddGameSteamAppID" ""][!SetVariable "AddGameTags" ""]')
		if #T_GAMES <= 0 then

		end
	end
