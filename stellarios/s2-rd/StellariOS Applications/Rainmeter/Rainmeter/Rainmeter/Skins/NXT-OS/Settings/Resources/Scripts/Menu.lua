function Initialize()
	currPath = SKIN:GetVariable('CURRENTCONFIG')
	currFile = SKIN:GetVariable('CURRENTFILE')
	listSettings = {
		{"Appearance","NXT-OS\\Settings","Appearance"},
		{"Center Clock","NXT-OS\\Settings","Clock"},
		{"Desktop","NXT-OS\\Settings","Desktop"},
		{"Displays","NXT-OS\\Settings","Displays"},
		{"Dock","NXT-OS\\Settings","Dock"},
		{"Game Drawer","NXT-OS\\Settings","GameDrawer"},
		{"Game Mode","NXT-OS\\Settings","GameMode"},
		{"General","NXT-OS\\Settings","General"},
		{"Hotkeys","NXT-OS\\Settings","Hotkeys"},
		{"Locale","NXT-OS\\Settings","Locale"},
		{"Lock Screen","NXT-OS\\Settings","LockScreen"},
		{"Notifications","NXT-OS\\Settings","Notifications"},
		{"Scout","NXT-OS\\Settings","Scout"},
		{"Sounds","NXT-OS\\Settings","Sounds"},
		{"Top Bar","NXT-OS\\Settings","Topbar"},
		{"User","NXT-OS\\Settings","User"},
		{"Visualizer","NXT-OS\\Settings","Visualizer"}
	}
	Draw()
end

function Start(i)
	if SKIN:GetVariable('Settings.Mode') == 'I' then
		SKIN:Bang('[!ActivateConfig "'..listSettings[i][2]..'" "'..listSettings[i][3]..'.ini"]')
	else
		SKIN:Bang('[!Update][!Update]')
		SKIN:Bang('[!ActivateConfig "'..listSettings[i][2]..'" "'..listSettings[i][3]..'.ini"]')
		SKIN:Bang('[!Move #CURRENTCONFIGX# #CURRENTCONFIGY# NXT-OS\\Settings][!DeactivateConfig]')
	end
end

function Draw()
	local num = #listSettings
	local bangs = ""
	for i = 1,num do
		if listSettings[i][2] == currPath and string.match(currFile,'^'..listSettings[i][3]) ~= nil then 
			bangs = bangs .. '[!SetOption Window.Left'..i..' MeterStyle Window.LeftListStyle|Window.LeftListStyleActive]'
		else
			bangs = bangs .. '[!SetOption Window.Left'..i..' MeterStyle Window.LeftListStyle]'
		end
		bangs = bangs .. '[!SetOption Window.Left'..i..' Text "'..listSettings[i][1]..'"]'
		bangs = bangs .. '[!SetOption Window.Left'..i..' LeftMouseUpAction """[!CommandMeasure Window.Menu.Control Start('..i..')]"""]'
	end
	bangs = bangs .. '[!SetOption Window.LeftSepSection H '..(25*num)..']'
	SKIN:Bang(bangs..'[!UpdateMeterGroup Window.LeftList]')
end

function Launch(meter,external,measure)
	SKIN:Bang("!ActivateConfig",path,ini.."")
	SKIN:Bang("!WriteKeyValue","Variables","ForwardCommand","[!CommandMeasure Script Launch('"..meter.."',"..tostring(external)..")]")
end