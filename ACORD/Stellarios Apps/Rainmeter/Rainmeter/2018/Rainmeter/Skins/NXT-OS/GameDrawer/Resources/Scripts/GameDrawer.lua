function Initialize()
	MONITORWIDTH    = SKIN:GetVariable("Width") -- Get the width of GameDrawer acording to the rainmeter Width variable
	BANNERWIDTHRAW  = tonumber(SKIN:GetMeter("Game0"):GetW())-12
	BANNERHEIGHTRAW = tonumber(SKIN:GetMeter("Game0"):GetH())-6
	BANNERWIDTH     = tonumber(SKIN:GetMeter("Game0"):GetW())+8
	NUMBANNERS      = math.ceil((MONITORWIDTH-20)/BANNERWIDTH) -- Number of banners that are displayed at one 
	RIGHTSTOP       = MONITORWIDTH-((BANNERWIDTH*NUMBANNERS)+14) -- The max scroll pos for scrolling to the right side
	FIRSTPOS        = tonumber(SKIN:GetMeter("Game0"):GetX())+6 -- Retrive the current x value from the Game0 meter
	DEBUG			= false -- Is Game Drawer in debug mode
	if SKIN:GetVariable('Debug') == '1' then DEBUG = true end -- Get the debug variable from the skin environment.
	if SKIN:GetVariable('Sound.GameHover') == '0' then HOVERSOUND = true end -- Tell GameDrawer if it should play a sound on hover of a game banner
	if SKIN:GetVariable('Sound.GameLaunch') == '0' then LAUNCHSOUND = true end -- Tell GameDrawer if it should play a sound when a game is launched
	if SKIN:GetVariable('Sound.GameItemClick') == '0' then SKIN:Bang('[!SetOptionGroup FunctionButtons LeftMouseDownAction """[play #@#Sounds\\0\\Click.wav]"""]') end -- Tell GameDrawer if it should play a sound when a function button is pressed.

	-- This if statement refreshes GameDrawer 2 times to make sure that it loades the current version of the Banners include file.
	if SELF:GetOption("Refreshed", "0") == "0" then
		SKIN:Bang("!WriteKeyValue", SELF:GetName(), "Refreshed", "1")

		WriteInclude() -- Generate the include file that GameDrawer uses for the interface and some animations

		SKIN:Bang("!Refresh")
	else
		SKIN:Bang("!WriteKeyValue", SELF:GetName(), "Refreshed", "0") -- Set the variable to make sure that gamedrawer does not reload more than 2 times in a row. 

		json = loadfile(SKIN:GetVariable('@')..'Scripts\\Json.lua')() -- Include the JSON lib
		
		--Path variables
		dirSKINSPATH     = SKIN:GetVariable('SKINSPATH')
		dirDOWNLOADS     = SKIN:MakePathAbsolute("DownloadFile\\")
		dirDATA          = SKIN:MakePathAbsolute(dirSKINSPATH.."NXT-OS Data\\GameDrawer\\")
		dirBANNERS       = dirDATA.."Banners\\"
		fileINFO         = dirDATA..'info.json'

		--Launcher Plugins and their parameters
		local SteamPath = SKIN:GetVariable('GameDrawer.SteamPath') -- Check if the steam path in the settings has a ending back slash, if not add one.
		if SteamPath ~= nil then
			if SteamPath ~= '' and EndsWith(SteamPath, '\\') == false then
				SteamPath = SteamPath .. '\\'
			end
		end

		LAUNCHERPLUGINS = {
		{'0',"AddedGames"},
		{SKIN:GetVariable('GameDrawer.Steam'),"Steam",SteamPath,SKIN:GetVariable('GameDrawer.SteamUserDataID')},
		{SKIN:GetVariable('GameDrawer.SteamShortcuts'),"SteamShortcuts",SteamPath,SKIN:GetVariable('GameDrawer.SteamUserDataID')},
		{SKIN:GetVariable('GameDrawer.Bnet'),"Battlenet",os.getenv("appdata").."\\Battle.net\\battle.net.config"}
		}

		listInfo = json.load(fileINFO) -- Get infromation from the info file
		if type(listInfo) ~= 'table' then listInfo = {} end --Check if the info file is empty or if it does not exist, then create a blank table.
		listGames = {} --Master Games list, contains all games gathered by the plugins
		listView = {}  --The view games list, contains all games after going through sorting
		listDownloads = {} --Contains the games that need to have their banners downloaded
		listNoBanner = {} --Conains the games that have no banner
		listIndicators = {} --Contains the currently displayed indicators

		numPreviousIndicators = 0 --The previous number of indicatiors that Game Drawer is displaying. 

		sortMode = "LastPlayed" --The current sort mode that Game Drawer is using.

		if sortMode == "Alphabetically" then
			SKIN:Bang("[!SetOption SortButton ImageName Resources\\Images\\Alphabetically.png]")
		end

		-- Scroll Control Vars	
		scrollPos      = 0 -- Current Shift in pixels
		scrollIndex    = 0 -- Step Value for position shift

		currentHide = nil -- Current display index of banner that is showing the hide menu.
		
		search = ""	
		
		for i = 0,(NUMBANNERS+1) do
			local Index = (i*2)+1
			if HOVERSOUND then
				SKIN:Bang('[!SetOption Game'..i..' MouseOverAction """[!CommandMeasure TileAnimation "Execute '..Index..'"][play "#@#Sounds\\0\\Dock.wav"]"""]')
			else
				SKIN:Bang('[!SetOption Game'..i..' MouseOverAction """[!CommandMeasure TileAnimation "Execute '..Index..'"]"""]')
			end
			SKIN:Bang('[!SetOption Game'..i..' MouseLeaveAction """[!CommandMeasure TileAnimation "Execute '..(Index+1)..'"]"""]')
		end


		-- Debug Section
		if DEBUG then 
			DrawIndicator("Debug","Debug Mode Enabled, Instant Search Disabled")
			SKIN:Bang('[!SetOption SearchBoxInput Continuous 0]')
		end
		debug('GAME DRAWER')
		debug('Version: 3.0')
		debug('Starting Session...')
		debug('Time: '..os.date('%x %X'))
		debug('Constants:')
		debug(MONITORWIDTH, BANNERWIDTHRAW, BANNERHEIGHTRAW, BANNERWIDTH, NUMBANNERS, RIGHTSTOP, FIRSTPOS)
		debug('Launcher Settings:')
		for k,v in pairs(LAUNCHERPLUGINS) do
			debug(string.gsub(table.concat(v,"   "), "\\", "\\\\"))
		end
		debug('')


		--Start
		DrawIndicator("Loading","Loading")
		UpdateGames()
		Draw()
		DrawIndicator("Loading",nil)
	end	
end

--Game Drawer Sorting functions

function Search(input)
	search = input
	Filter()
	Draw()
	ScrollToFront()
	if input == "" then
		DrawIndicator("Search",nil)
	else
		if NUMGAMES > 1 or NUMGAMES < 1 then
			DrawIndicator("Search",NUMGAMES..' results for: '..input)
		else
			DrawIndicator("Search",NUMGAMES..' result for: '..input)
		end
	end
	SKIN:Bang('[!SetOption SearchBoxInput DefaultValue "'..input..'"]')
	SKIN:Bang("[!Update]")
end

function ToggleSort()
	if sortMode == "Alphabetically" then
		sortMode = "LastPlayed"
		SKIN:Bang("[!SetOption SortButton ImageName Resources\\Images\\SortByTime.png]")
	elseif sortMode == "LastPlayed" then
		sortMode = "Alphabetically"
		SKIN:Bang("[!SetOption SortButton ImageName Resources\\Images\\Alphabetically.png]")
	end
	Filter()
	Draw()
	ScrollToFront()
	SKIN:Bang("[!Update]")
end

function Sort()
	if sortMode == "Alphabetically" then
		table.sort(listView, SortAlphabetically)
	elseif sortMode == "LastPlayed" then
		table.sort(listView, SortLastPlayed)
	end
end

function SortAlphabetically(First, Second)
	if First["appName"] < Second["appName"] then
		return true
	else
		return false
	end
end

function SortLastPlayed(First, Second)
	if tonumber(First["lastPlayed"]) > tonumber(Second["lastPlayed"]) then
		return true
	else
		return false
	end
end

function Filter()
	-- Apply the filters to the view list
	debug("Sorting games...")
	listView = {}
	search = search:lower()
	for k,v in pairs(listGames) do
		if v.hidden == false then
			if search ~= "" then
				debug("Starting Game Search...")
				debug("Applying Search Term: "..search.." to "..v.appName)
				if string.find(v.appName:lower(),search) then
					debug(v.appName.." MATCH!")
					table.insert(listView,v)
				end
			else
				table.insert(listView,v)
			end
		end
	end
	
	Sort()

	NUMGAMES = table.getn(listView) -- Get the number of games in the master games list
	MAXSCROLLINDEX = NUMGAMES - NUMBANNERS -- The max scrollIndex value for scrolling
end


function UpdateGames()
	GatherGames()
	CompleteGames()
	Filter()
	ValidateBanners()
	DownloadBanners()
end


function GatherGames()
	debug('Gathering Games...')
	for k,v in pairs(LAUNCHERPLUGINS) do
		if v[1] == "0" then

			debug('Running '..v[2]..' plugin...')
			debug('================================================================================')
			debug('Debug output from '..v[2]..':')
			dofile(SKIN:MakePathAbsolute('Resources\\Scripts\\'..v[2]..'.lua'))
			local tempinfo = main(v[3],v[4])
			if type(tempinfo) == "table" then
				debug('')
				debug(v[2]..' Found Games:')
				for k1,v1 in pairs(tempinfo) do 
					table.insert(listGames,v1)
					debug(v1["appName"])
				end
			end
			debug('')
			debug('')
		end
	end
end

function CompleteGames()
	debug("Update external info file...")
	for k,v in pairs(listGames) do 
		if not listInfo[v.appID] then
			if not v.lastPlayed then 
				listInfo[v.appID] = {lastPlayed = 0}
				listGames[k]['lastPlayed'] = 0
				listGames[k]['timeExternal'] = true
			end
		else
			if listInfo[v.appID]['lastPlayed'] ~= nil then
				listGames[k]['lastPlayed'] = listInfo[v.appID]['lastPlayed']
				listGames[k]['timeExternal'] = true
			end
			if listInfo[v.appID]['hidden'] then
				listGames[k]['hidden'] = true
			end
		end
	end
end

function ValidateBanners()
	debug("Checking if games have banners...")
	for k,v in pairs(listGames) do
		if not CheckForBanner(v.bannerName) and not v.hidden then
			debug("No banner found for: "..v.appName)
			table.insert(listDownloads,{v.bannerURL,v.bannerName,v.appName})
		end
	end
end

function CheckForBanner(banner)
	local bannerfile = io.open(dirDATA..'Banners\\'..banner,'r')
	if bannerfile ~= nil then
		bannerfile:close()
		return true
	end
	return false
end

function DownloadBanners()
	debug("Starting Banner Downloader...")
	if table.getn(listDownloads) > 0 then
		if listDownloads[1][1] ~= nil then
			debug("Download Banner: "..listDownloads[1][3])
			DrawIndicator("Download","Download Banner: "..listDownloads[1][3])
			SKIN:Bang('!SetOption','Downloader','URL',listDownloads[1][1])
			SKIN:Bang('!SetOption','Downloader','DownloadFile',listDownloads[1][2])
			SKIN:Bang('[!EnableMeasure Downloader][!CommandMeasure Downloader Update]')
			SKIN:Bang('[!UpdateMeasure Downloader]')
		elseif listDownloads[1][1] == nil then
			debug(listDownloads[1][3]..' does not have a defined Banner URL... Skipping.')
			listNoBanner[listDownloads[1][2]] = true
			table.remove(listDownloads,1)
			if table.getn(listDownloads) > 0 then
				DownloadBanners()
			else
				debug("Finished downloading all available banners.")
				DrawIndicator("Download",nil)
				Draw()
				SKIN:Bang('[!Update]')
			end
		end
	end
end

function FinishDownload(status)
	if status > 0 then
		print("Could not download banner for: " .. listDownloads[1][3])
		debug("Could not download banner for: " .. listDownloads[1][3])
		listNoBanner[listDownloads[1][2]] = true
	else
		debug("Successfully retrived banner for: " .. listDownloads[1][3])
		os.rename(dirDOWNLOADS..listDownloads[1][2], dirBANNERS..listDownloads[1][2])
	end
	table.remove(listDownloads,1)
	if table.getn(listDownloads) > 0 then
		DownloadBanners()
	else
		debug("Finished downloading all available banners.")
		DrawIndicator("Download",nil)
		Draw()
		SKIN:Bang('[!Update]')
	end
end

function Hide(appID,pos)
	if not listInfo[appID] then
		listInfo[appID] = {hidden = true}
	else
		listInfo[appID]["hidden"] = true
	end
	
	json.save(listInfo,fileINFO)
	CompleteGames()

	Filter()
	if pos ~= nil and pos > (NUMGAMES-1) and NUMGAMES > NUMBANNERS then
		scrollIndex = scrollIndex - 1
	end
	currentHide = nil
	Draw()
	SKIN:Bang('[!Update]')
end

function debug(...)
	if DEBUG then
		local string = string.gsub(table.concat(arg, "   "),'"',"'")
		string = string.gsub(string,'\\','\\\\')
		SKIN:Bang('!CommandMeasure','Debug','Log("'..string..'")','NXT-OS\\GameDrawer\\Debug')
	end
end

function EndsWith(String, Ending)
	return String:match('^(.-' .. Ending .. ')$') ~= nil
end

function ScrollToFront()
	scrollIndex = 0
	scrollPos = 0
	Draw()
	SKIN:Bang('[!SetOption Game0B X '..FIRSTPOS + scrollPos..']')
	SKIN:Bang('[!Update]')
end

function ScrollLeft(num)
	local change = false
	if scrollIndex < MAXSCROLLINDEX then
		if scrollIndex >= (MAXSCROLLINDEX-1) and ((scrollPos - num) - num) < (-BANNERWIDTH+RIGHTSTOP) then 
			scrollPos = RIGHTSTOP
			scrollIndex = MAXSCROLLINDEX
			Draw()
			change = true
		elseif (scrollPos - num) <= (-BANNERWIDTH+RIGHTSTOP) then
			scrollIndex = scrollIndex + 1
			scrollPos = scrollPos + BANNERWIDTH - num
			Draw()
			change = true
		else
			scrollPos = scrollPos - num
			change = true
		end
	elseif scrollIndex == MAXSCROLLINDEX then
		if ((scrollPos - num) >= RIGHTSTOP) then --make a case where if gamedrawer does not have a scroll scrollIndex so it can still move
			scrollPos = scrollPos - num
			change = true
		elseif (scrollPos - num) < RIGHTSTOP and scrollPos ~= RIGHTSTOP then
			scrollPos = RIGHTSTOP
			change = true
		end
	end

	if change then
		if currentHide ~= nil then
			currentHide = nil
			Draw()
		end
		SKIN:Bang('[!SetOption Game0B X '..FIRSTPOS + scrollPos..']')
		SKIN:Bang('[!Update]')
	end
end

function ScrollRight(num)
	local change = false
	if scrollIndex > 0 and (scrollPos + num) >= BANNERWIDTH then
		scrollIndex = scrollIndex - 1
		if scrollIndex == 0 and (scrollPos + num) > 0 then 
			scrollPos = 0
			Draw()
			change = true
		else
			scrollPos = (scrollPos + num) - BANNERWIDTH
			Draw()
			change = true
		end
	elseif scrollIndex == 0 then
		if (scrollPos+num) < 0 then 
			scrollPos = (scrollPos + num)
			change = true
		elseif (scrollPos+num) >= 0 then 
			scrollPos = 0
			change = true
		end
	else
		scrollPos = (scrollPos + num)
		change = true
	end

	if change then
		if currentHide ~= nil then
			currentHide = nil
			Draw()
		end
		SKIN:Bang('[!SetOption Game0B X '..FIRSTPOS + scrollPos..']')
		SKIN:Bang('[!Update]')
	end
end

function Launch(num)
	local time = os.time()
	local appID = listView[num]['appID']
	if listView[num]['timeExternal'] then
		listInfo[appID]['lastPlayed'] = time
		
		json.save(listInfo,fileINFO)
		CompleteGames()
	else
		for k,v in pairs(listGames) do
			if v.appID == appID then
				listGames[k]['lastPlayed'] = time
			end
		end
	end

	SKIN:Bang('[!SetOption LaunchText Text "Launching '..listView[num]['appName']..'"]')
	SKIN:Bang('[!CommandMeasure Timer "Execute 7"]')
	SKIN:Bang('["'..listView[num]['appPath']..'"]')

	if sortMode == "LastPlayed" then
		Filter()
		ScrollToFront()
	end
end

function CloseOnLaunch()
	local bol = SKIN:GetVariable('GameDrawer.CloseOnGame')
	if bol == "0" then
		SKIN:Bang('[!CommandMeasure Timer "Execute 2"]')
	end
end

function WriteInclude()
	--Write Banners Include File
	local file = io.open(SKIN:MakePathAbsolute("Resources\\Includes\\Banners.inc"), "w")
	local t = {}

	--Write Action timer block for hover animations.
	table.insert(t, [[
[TileAnimation]
Measure=Plugin
Plugin=ActionTimer]])
	for i = 0, (NUMBANNERS+1) do
		local Index = (i*2)+1
		table.insert(t, [[
ActionList]]..Index..[[=Zoom]]..i..[[_I_0|Zoom]]..i..[[_I_1|Wait 20|Zoom]]..i..[[_I_2|Wait 20|Zoom]]..i..[[_I_3
ActionList]]..(Index+1)..[[=Zoom]]..i..[[_O_0|Zoom]]..i..[[_O_1|Wait 20|Zoom]]..i..[[_O_2|Wait 20|Zoom]]..i..[[_O_3
Zoom]]..i..[[_I_0=[!CommandMeasure TileAnimation "Stop ]]..(Index+1)..[["]
Zoom]]..i..[[_I_1=[!SetOption "Game]]..i..[[" "W" "]]..(BANNERWIDTHRAW+4)..[["][!SetOption "Game]]..i..[[" "H" "]]..(BANNERHEIGHTRAW+2)..[["][!SetOption "Game]]..i..[[" "Padding" "4,2,4,2"][!UpdateMeter "Game]]..i..[["][!Redraw]
Zoom]]..i..[[_I_2=[!SetOption "Game]]..i..[[" "W" "]]..(BANNERWIDTHRAW+8)..[["][!SetOption "Game]]..i..[[" "H" "]]..(BANNERHEIGHTRAW+4)..[["][!SetOption "Game]]..i..[[" "Padding" "2,1,2,1"][!UpdateMeter "Game]]..i..[["][!Redraw]
Zoom]]..i..[[_I_3=[!SetOption "Game]]..i..[[" "W" "]]..(BANNERWIDTHRAW+12)..[["][!SetOption "Game]]..i..[[" "H" "]]..(BANNERHEIGHTRAW+8)..[["][!SetOption "Game]]..i..[[" "Padding" "0,0,0,0"][!UpdateMeter "Game]]..i..[["][!Redraw]
Zoom]]..i..[[_O_0=[!CommandMeasure TileAnimation "Stop ]]..Index..[["]
Zoom]]..i..[[_O_1=[!SetOption "Game]]..i..[[" "W" "]]..(BANNERWIDTHRAW+8)..[["][!SetOption "Game]]..i..[[" "H" "]]..(BANNERHEIGHTRAW+4)..[["][!SetOption "Game]]..i..[[" "Padding" "2,1,2,1"][!UpdateMeter "Game]]..i..[["][!Redraw]
Zoom]]..i..[[_O_2=[!SetOption "Game]]..i..[[" "W" "]]..(BANNERWIDTHRAW+4)..[["][!SetOption "Game]]..i..[[" "H" "]]..(BANNERHEIGHTRAW+2)..[["][!SetOption "Game]]..i..[[" "Padding" "4,2,4,2"][!UpdateMeter "Game]]..i..[["][!Redraw]
Zoom]]..i..[[_O_3=[!SetOption "Game]]..i..[[" "W" "]]..(BANNERWIDTHRAW)..[["][!SetOption "Game]]..i..[[" "H" "]]..(BANNERHEIGHTRAW)..[["][!SetOption "Game]]..i..[[" "Padding" "6,3,6,3"][!UpdateMeter "Game]]..i..[["][!Redraw]
]])
	end

	for i = 1, (NUMBANNERS+1) do
		-- Write Include meters for games
		table.insert(t, [[
[Game]]..i..[[B]
Meter=Image
MeterStyle=GameBackStyle
[Game]]..i..[[T]
Meter=String
MeterStyle=GameTextStyle
[Game]]..i..[[C]
Meter=String
MeterStyle=GameCloseButtonStyle
[Game]]..i..[[]
Meter=Image
MeterStyle=GameBannerStyle
]])
	end

	file:write(table.concat(t, "\n"))
	file:close()
end

function PlaceSkin()
	SKIN:Bang('[!Move #WORKAREAX# (#WORKAREAY#+#WORKAREAHEIGHT#-#Height#) NXT-OS\\GameDrawer]')
end

function ToggleHideMenu(index)
	if currentHide ~= nil then
		if currentHide == index then
			currentHide = nil
			Draw()
			SKIN:Bang('[!Update]')
			return
		else
			Draw()
		end
	end
	currentHide = index
	SKIN:Bang('[!SetOption Game'..index..' ImageName ""]')
	SKIN:Bang('[!SetOption Game'..index..' LeftMouseUpAction ""]')
	SKIN:Bang('[!SetOption Game'..index..'T Fontcolor #Color.Main#,(255-(((Clamp((([*SlideProgress*]*[*SizeCalc*])+20),20,(#*Height*#-42))-20)/(#*Height*#-62))*255))]')
	SKIN:Bang('[!SetOption Game'..index..'C Fontcolor #Color.Main#,(255-(((Clamp((([*SlideProgress*]*[*SizeCalc*])+20),20,(#*Height*#-42))-20)/(#*Height*#-62))*255))]')
	SKIN:Bang('[!SetOption Game'..index..'B ImageAlpha (255-(((Clamp((([*SlideProgress*]*[*SizeCalc*])+20),20,(#*Height*#-42))-20)/(#*Height*#-62))*255))]')
	SKIN:Bang('[!Update]')
end

function DrawIndicator(name,text)
	listIndicators[name]=text
	local num = 0
	local string = ""
	for k,v in pairs(listIndicators) do
		num = num + 1
		if num > 1 then
			string = string..', '..v
		else
			string = v
		end
	end
	if num > 0 and numPreviousIndicators == 0 then
		SKIN:Bang('[!SetOption SearchStatus Text "'..string..'"]')
		SKIN:Bang('[!CommandMeasure Timer "Execute 5"]')
	elseif num == 0 and numPreviousIndicators > 0 then
		SKIN:Bang('[!CommandMeasure Timer "Execute 6"]')
	elseif num > 0 and numPreviousIndicators > 0 then
		SKIN:Bang('[!SetOption SearchStatus Text "'..string..'"][!UpdateMeterGroup "AnimateSearchIndicator"][!Redraw]')
	end
	numPreviousIndicators = num
end

function Draw()
	-- Reset all banners
	for i = 0,(NUMBANNERS+1) do
		SKIN:Bang('[!SetOption Game'..i..' MouseOverAction ""] [!SetOption Game'..i..' MouseLeaveAction ""][!SetOption Game'..i..' ImageName ""] [!SetOption Game'..i..' LeftMouseUpAction ""] [!SetOption Game'..i..' RightMouseUpAction ""] [!SetOption Game'..i..'T Text ""] [!SetOption Game'..i..'T Fontcolor #Color.Main#,0] [!SetOption Game'..i..'C Fontcolor #Color.Main#,0] [!SetOption Game'..i..'B ImageAlpha 0]')
	end
	local soundcommand = ''
	local hoversoundcommand = ''
	if LAUNCHSOUND then soundcommand = '[play "#@#Sounds\\Launch.wav"]' end
	if HOVERSOUND then hoversoundcommand = '[play "#@#Sounds\\0\\Dock.wav"]' end
	for i = 0,(math.min((NUMBANNERS+1),NUMGAMES)) do
		local index = (i+scrollIndex)
		local soundindex = (i*2)+1
		if index ~= 0 and index <= NUMGAMES then
			local time = os.date("%x", listView[index]["lastPlayed"])
			if listNoBanner[listView[index]['bannerName']] ~= nil then
				SKIN:Bang('[!SetOption Game'..i..' MouseOverAction """'..hoversoundcommand..'[!CommandMeasure TileAnimation "Execute '..soundindex..'"]"""] [!SetOption Game'..i..' MouseLeaveAction """[!CommandMeasure TileAnimation "Execute '..(soundindex+1)..'"]"""] [!SetOption Game'..i..'T Text "No banner...\n'..listView[index]['appName']..'\nLast Played: '..time..'"] [!SetOption Game'..i..'T LeftMouseUpAction """'..soundcommand..'[!CommandMeasure GameDrawer """Launch('..index..')"""]"""] [!SetOption Game'..i..'T Fontcolor #Color.Main#,(255-(((Clamp((([*SlideProgress*]*[*SizeCalc*])+20),20,(#*Height*#-42))-20)/(#*Height*#-62))*255))] [!SetOption Game'..i..'C Fontcolor #Color.Main#,(255-(((Clamp((([*SlideProgress*]*[*SizeCalc*])+20),20,(#*Height*#-42))-20)/(#*Height*#-62))*255))] [!SetOption Game'..i..'C LeftMouseUpAction """[!CommandMeasure GameDrawer """Hide("'..listView[index]['appID']..'",'..index..')"""]"""] [!SetOption Game'..i..'B ImageAlpha (255-(((Clamp((([*SlideProgress*]*[*SizeCalc*])+20),20,(#*Height*#-42))-20)/(#*Height*#-62))*255))]')
			else
				SKIN:Bang('[!SetOption Game'..i..' MouseOverAction """'..hoversoundcommand..'[!CommandMeasure TileAnimation "Execute '..soundindex..'"]"""] [!SetOption Game'..i..' MouseLeaveAction """[!CommandMeasure TileAnimation "Execute '..(soundindex+1)..'"]"""] [!SetOption Game'..i..' ImageName "#SKINSPATH#NXT-OS Data\\GameDrawer\\Banners\\'..listView[index]['bannerName']..'"] [!SetOption Game'..i..' LeftMouseUpAction """'..soundcommand..'[!CommandMeasure GameDrawer """Launch('..index..')"""]"""] [!SetOption Game'..i..' RightMouseUpAction """[!CommandMeasure GameDrawer """ToggleHideMenu('..i..')"""]"""] [!SetOption Game'..i..' ImageAlpha (255-(((Clamp((([*SlideProgress*]*[*SizeCalc*])+20),20,(#*Height*#-42))-20)/(#*Height*#-62))*255))] [!SetOption Game'..i..'T Text "'..listView[index]['appName']..'\nLast Played: '..time..'"] [!SetOption Game'..i..'T LeftMouseUpAction """[!CommandMeasure GameDrawer """Launch('..index..')"""]"""] [!SetOption Game'..i..'T Fontcolor #Color.Main#,0] [!SetOption Game'..i..'C Fontcolor #Color.Main#,0] [!SetOption Game'..i..'C LeftMouseUpAction """[!CommandMeasure GameDrawer """Hide("'..listView[index]['appID']..'",'..index..')"""]"""] [!SetOption Game'..i..'B ImageAlpha 0]')
			end
		end
	end
end