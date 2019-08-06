function Initialize()
	json = loadfile(SKIN:GetVariable('@')..'Scripts\\Json.lua')() -- Include the JSON lib
	dirSKINSPATH     	= SKIN:GetVariable('SKINSPATH')
	dirWINDATA          = SKIN:MakePathAbsolute(dirSKINSPATH.."NXT-OS Data\\WindowsAppCache\\")
	dirWINICONS			= dirWINDATA..'Icons\\'
	fileWINCACHE		= dirWINDATA..'Cache.json'
	tblWinAppsCache 	= json.load(fileWINCACHE) -- Retrive Current windows app cache
	if type(tblWinAppsCache) ~= 'table' then tblWinAppsCache = {} end

	numCache = 0
	for _,v in pairs(tblWinAppsCache) do
		numCache = numCache + 1
	end
	numLastIndex = SKIN:GetVariable('Scout.LastIndex')
	numNextIndex = SKIN:GetVariable('Scout.NextIndex')

	ENABLEWINSCAN 		= false
	if SKIN:GetVariable('Scout.IndexWin','1') == '0' then ENABLEWINSCAN = true end 

	if ENABLEWINSCAN then
		SKIN:Bang('[!SetOption StatusText Text "'..numCache..' files indexed#CRLF#Last Indexed on:  '..os.date('%x at %I:%M:%S %p',numLastIndex)..'#CRLF#Next Index on:  '..os.date('%x at %I:%M:%S %p',numNextIndex)..'"][!Update]')
	else
		SKIN:Bang('[!SetOption StatusText Text "#CRLF#Windows File Scanner is disabled...#CRLF#"][!Update]')
	end
end

function ExternalStart()
	SKIN:Bang('[!CommandMeasure Script EnableGUI() "NXT-OS\\System\\Listeners\\FileIndexer"]')
end

function Recive(input)
	SKIN:Bang('[!SetOption StatusText Text "#CRLF#Index in progress"][!SetOption PathTitle Text "Directory: '..input.curScan..' of '..input.maxScan..'"][!SetOption PathProgress W ((#Window.Width#-80)*'..(input.curScan/input.maxScan)..')]')
	SKIN:Bang('[!SetOption ProgressTitle Text "File: '..input.curIndex..' of '..input.numFiles..' | '..input.itemName..'"][!SetOption Progress W ((#Window.Width#-80)*'..(input.curIndex/input.numFiles)..')][!Update]')
end

function Finish(time)
	SKIN:Bang('[!Refresh]')
end