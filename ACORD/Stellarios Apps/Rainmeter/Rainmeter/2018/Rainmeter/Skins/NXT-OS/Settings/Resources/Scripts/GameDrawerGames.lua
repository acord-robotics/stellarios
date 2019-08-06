function Initialize()
	json = loadfile(SKIN:GetVariable('@')..'Scripts\\Json.lua')() -- Include the JSON lib
	
	--Path variables
	dirSKINSPATH     = SKIN:GetVariable('SKINSPATH')
	dirDOWNLOADS     = SKIN:MakePathAbsolute("DownloadFile\\")
	dirDATA          = SKIN:MakePathAbsolute(dirSKINSPATH.."NXT-OS Data\\GameDrawer\\")
	dirBANNERS       = dirDATA.."Banners\\"
	fileINFO         = dirDATA..'info.json'

	sortBy = "All"

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

	-- Scroll Control Vars	
	scrollPos = tonumber(SKIN:GetVariable('Scroll.Position')) -- Current Shift in pixels
	scrollMax = 0


	--Start
	DrawDD()
	UpdateGames()
	Draw()
end

function debug()
end

function EndsWith(String, Ending)
	return String:match('^(.-' .. Ending .. ')$') ~= nil
end

function DrawDD()
	local list = {'All Games','Added Games'}
	local commands = {'[!SetOption "SortDefaultText" "Text" "All Games"][!CommandMeasure GameDrawer """Sort("All")"""]','[!SetOption "SortDefaultText" "Text" "Added Games"][!CommandMeasure GameDrawer """Sort("User Added Games")"""]'}
	if SKIN:GetVariable('GameDrawer.Steam') == "0" then
		table.insert(list,'Steam Games')
		table.insert(commands, '[!SetOption "SortDefaultText" "Text" "Steam Games"][!CommandMeasure GameDrawer """Sort("Steam")"""]')
	end
	if SKIN:GetVariable('GameDrawer.SteamShortcuts') == "0" then
		table.insert(list,'Steam Shortcuts')
		table.insert(commands, '[!SetOption "SortDefaultText" "Text" "Steam Shortcuts"][!CommandMeasure GameDrawer """Sort("Steam Shortcuts")"""]')
	end
	if SKIN:GetVariable('GameDrawer.Bnet') == "0" then
		table.insert(list,'Battle.net Games')
		table.insert(commands, '[!SetOption "SortDefaultText" "Text" "Battle.net Games"][!CommandMeasure GameDrawer """Sort("Battle.net")"""]')
	end
	table.insert(list,'Hidden Games')
	table.insert(commands, '[!SetOption "SortDefaultText" "Text" "Hidden Games"][!CommandMeasure GameDrawer """Sort("Hidden")"""]')
	SKIN:Bang('!SetOption','SortInputBoxBG','DropDownList',table.concat(list, "|"))
	SKIN:Bang('!SetOption','SortInputBoxBG','DropDownBangs',table.concat(commands, "|"))
end

function Sort(by)
	sortBy = by
	scrollPos = 1
	Filter()
	Draw()
end

function UpdateGames()
	GatherGames()
	CompleteGames()
	Filter()
	ValidateBanners()
end

function GatherGames()
	for k,v in pairs(LAUNCHERPLUGINS) do
		if v[1] == "0" then
			dofile(dirSKINSPATH..'NXT-OS\\GameDrawer\\Resources\\Scripts\\'..v[2]..'.lua')
			local tempinfo = main(v[3],v[4])
			if type(tempinfo) == "table" then
				for k1,v1 in pairs(tempinfo) do 
					table.insert(listGames,v1)
				end
			end
		end
	end
end

function CompleteGames()
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
			else
				listGames[k]['hidden'] = nil
			end
		end
	end
end

function ValidateBanners()
	for k,v in pairs(listGames) do
		if not CheckForBanner(v.bannerName) then
			listGames[k]['bannerName'] = nil
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

function Filter()
	listView = {}
	for k,v in pairs(listGames) do
		if sortBy == v["launcher"] then
			table.insert(listView,v)
		elseif sortBy == "Hidden" and v["hidden"] == true then
			table.insert(listView,v)
		elseif sortBy == "All" then
			table.insert(listView,v)
		end
	end


	table.sort(listView, SortAlphabetically)

	NUMGAMES = table.getn(listView) -- Get the number of games in the master games list
	scrollMax = (NUMGAMES-6)
	SKIN:Bang('!SetVariable', 'Scroll.Total', NUMGAMES)
end

function SortAlphabetically(First, Second)
	if First["appName"] < Second["appName"] then
		return true
	else
		return false
	end
end


function ForwardShift()
	if (scrollPos) ~= scrollMax then
		if (scrollMax+6) >= 7 then
			scrollPos = scrollPos+1
			Draw()
		end
	end
end
function BackwardShift()
	if (scrollPos) ~= 1 then
		if (scrollMax+6) >= 7 then
			scrollPos = scrollPos-1
			Draw()
		end
	end
end
function ShiftTo(num)
	scrollPos = (num+1)
	Draw()
end

function Hide(appID,pos)
	if not listInfo[appID] then
		listInfo[appID] = {hidden = true}
	else
		listInfo[appID]["hidden"] = true
	end
	
	json.save(listInfo,fileINFO)
	SKIN:Bang('[!ShowMeter RefreshGD]')
	CompleteGames()

	Filter()
	Draw()
end

function Show(appID,pos)
	if listInfo[appID] then
		listInfo[appID]["hidden"] = nil
	end
	
	json.save(listInfo,fileINFO)
	SKIN:Bang('[!ShowMeter RefreshGD]')
	CompleteGames()

	Filter()
	Draw()
end




function Draw()
	if (scrollPos) > scrollMax then
		if (scrollMax+6) >= 7 then
			scrollPos = scrollPos-1
		end
	end
	if table.getn(listView) <= 7 then
		SKIN:Bang('!HideMeterGroup Scroll')
	else
		SKIN:Bang('!ShowMeterGroup Scroll')
	end
	if (scrollPos % 2 == 0) then
		SKIN:Bang('[!SetOptionGroup Even SolidColor 230,230,230][!SetOptionGroup Odd SolidColor 240,240,240]')
	else
		SKIN:Bang('[!SetOptionGroup Odd SolidColor 230,230,230][!SetOptionGroup Even SolidColor 240,240,240]')
	end
	SKIN:Bang('!HideMeterGroup All')
	for i=1,7 do 
		local index = i+(scrollPos-1)
		if listView[index] ~= nil then
			SKIN:Bang('!ShowMeterGroup Section'..i)
			
			if listView[index]['bannerName'] ~= nil then
				SKIN:Bang('[!SetOption Banner'..i..' ImageName "#SKINSPATH#NXT-OS Data\\GameDrawer\\Banners\\'..listView[index]['bannerName']..'"]')
			else
				SKIN:Bang('[!SetOption Banner'..i..' ImageName "Resources\\Images\\NoBanner.png"]')
			end
			if listView[index]['hidden'] then
				SKIN:Bang('[!SetOption Banner'..i..' ImageAlpha 128][!SetOption Section'..i..' FontColor #Window.FontColor#,128][!SetOption Hide'..i..' ButtonImage "#SKINSPATH#NXT-OS\\@Resources\\Images\\Show.png"]')
				SKIN:Bang('[!SetOption Hide'..i..' LeftMouseUpAction """[!CommandMeasure GameDrawer """Show("'..listView[index]['appID']..'",'..index..')"""]"""]')
				SKIN:Bang('!SetOption','Section'..i,'Text','Name:    '..listView[index]['appName']..'#CRLF#Source:  '..listView[index]['launcher']..' - Hidden')
			else
				SKIN:Bang('[!SetOption Banner'..i..' ImageAlpha 255][!SetOption Section'..i..' FontColor #Window.FontColor#,255][!SetOption Hide'..i..' ButtonImage "#SKINSPATH#NXT-OS\\@Resources\\Images\\Hide.png"]')
				SKIN:Bang('[!SetOption Hide'..i..' LeftMouseUpAction """[!CommandMeasure GameDrawer """Hide("'..listView[index]['appID']..'",'..index..')"""]"""]')
				SKIN:Bang('!SetOption','Section'..i,'Text','Name:    '..listView[index]['appName']..'#CRLF#Source:  '..listView[index]['launcher'])
			end
			if listView[index]['launcher'] == 'User Added Games' then
				SKIN:Bang('[!SetOption Delete'..i..' ButtonImage "#SKINSPATH#NXT-OS\\@Resources\\Images\\Trash.png"]')
				SKIN:Bang('!SetOption', 'Delete'..i, 'LeftMouseUpAction', '[!SetVariable ToDeleteName "'..listView[index]['appName']..'"][!SetVariable ToDelete "'..listView[index]['appID']..'"][play #@#Sounds\\Information.wav][!ShowMeterGroup Dialogue][!Update]')
				SKIN:Bang('[!SetOption Section'..i..' LeftMouseUpAction """[!CommandMeasure AddScript "Edit('.."'"..listView[index]['appID'].."'"..')"]"""]')
			else
				SKIN:Bang('[!SetOption Delete'..i..' ButtonImage ""]')
				SKIN:Bang('[!SetOption Delete'..i..' LeftMouseUpAction ""]')
				SKIN:Bang('[!SetOption Section'..i..' LeftMouseUpAction ""]')
			end
		end
	end
	SKIN:Bang('!SetVariable','Scroll.Position',scrollPos)
	SKIN:Bang('[!Update]')
end