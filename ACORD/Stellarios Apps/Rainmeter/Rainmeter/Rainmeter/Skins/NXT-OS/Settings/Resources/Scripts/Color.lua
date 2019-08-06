function Initialize()
	page=1
	settings={
		{sectionname="General",icon="#@#Images\\Icons\\Appearance.png",settings={
				{title="Main Color",desc="The desktop skin lines",var="Color.Main",bangs='[!RefreshGroup "NXTDesktop"]'},
				{title="Glass Color",desc="The background of Drawer and GameDrawer",var="Color.Glass",alpha="true",bangs='[!RefreshGroup "NXTDesktop"]'}
			}
		},
		{sectionname="Center Clock",icon="#@#Images\\Icons\\Clock.png",settings={
				{title="Main Color",desc="The thick outline of the clock and the hands",var="Color.ClockMain",bangs='[!Refresh "NXT-OS\\CenterClock"]'},
				{title="Secondary Color",desc="The thinner outline of the clock",var="Color.ClockSecondary",alpha="true",bangs='[!Refresh "NXT-OS\\CenterClock"][!Refresh NXT-OS\\Visualizer]'},
				{title="Dot Color",desc="The center dock of the clock",var="Color.ClockDot",bangs='[!Refresh "NXT-OS\\CenterClock"]'},
				{title="Second Hand Color",desc="The clock's second hand",var="Color.ClockSecHand",alpha="true",bangs='[!Refresh "NXT-OS\\CenterClock"]'}
			}
		},
		{sectionname="Dock",icon="#@#Images\\Icons\\Dock.png",settings={
				{title="Background Color",desc="The background of the Dock behind the icons",var="Color.Dock",alpha="true",bangs='[!Refresh "NXT-OS\\Dock"]'},
				{title="Icon Color",desc="The color of the icons in the Dock",var="Color.DockIcon",bangs='[!Refresh "NXT-OS\\Dock"]'},
				{title="Folder Tint",desc="The tint of the Dock when a Dock Folder is open",var="Color.DockFolderTint",bangs=''},
				{title="Folder Background",desc="The color of the Dock Folder's background",var="Color.DockFolderBackground",bangs=''},
				{title="Folder Text",desc="The font color for the Dock Folders",var="Color.DockFolderText",bangs=''},
			}
		}
	}
	draw()
end

function draw()
	section=settings[page]
	--reset left side
	for i=1,6 do 
		SKIN:Bang('[!SetOption Left'..i..' MeterStyle LeftListStyle][!SetOption LeftIcon'..i..' ImageTint #Window.FontColor#][!HideMeterGroup Right'..i..']')
	end
	--set information for the left side
	local i = 1
	for k,v in ipairs(settings) do
		SKIN:Bang('[!SetOption Left'..i..' Text "'..v.sectionname..'"][!SetOption Left'..i..' LeftMouseUpAction "[!CommandMeasure ColorScript switch('..k..')]"][!SetOption LeftIcon'..i..' ImageName "'..v.icon..'"]')
		if k == page then
			SKIN:Bang('[!SetOption Left'..i..' MeterStyle LeftListStyle|LeftListStyleActive][!SetOption LeftIcon'..i..' ImageTint 255,255,255]')
		end
		i = i + 1
	end
	SKIN:Bang('[!SetOption LeftSepSection H '..((i-1)*49)..']')
	--set information for the right side
	i = 1
	for k,v in pairs(section.settings) do
		SKIN:Bang('[!SetOption Right'..i..' Text "'..v.title..'#CRLF#'..v.desc..'"][!ShowMeterGroup Right'..i..']')
		SKIN:Bang('[!SetOption RightColor'..i..' ImageTint #'..v.var..'#]')
		SKIN:Bang('[!SetOption RightColorText'..i..' Text #'..v.var..'#]')
		-- calculate luminance to see if the font needs to be white or black
		local rgba = {}
		for val in SKIN:GetVariable(v.var):gmatch('[^,]+') do
			table.insert(rgba,tonumber(val))
		end
		for i = 1,3 do 
			local p = tonumber(rgba[i])
			p = p / 255.0
			if p <= 0.03928 then 
				p = p/12.92 
			else 
				p = ((p+0.055)/1.055) ^ 2.4 
			end
			rgba[i] = p
		end
		local luminance = (0.2126 * rgba[1]) + (0.7152 * rgba[2]) + (0.0722 * rgba[3])
		if luminance > 0.179 then
			SKIN:Bang('[!SetOption RightColorText'..i..' FontColor 0,0,0]')
		else 
			SKIN:Bang('[!SetOption RightColorText'..i..' FontColor 255,255,255]')
		end

		-- Set infromation for the color picker extension
		if v.alpha == nil then v.alpha = "false" end
		SKIN:Bang('[!SetVariable ColorPicker.StartColorVar'..i..' "'..v.var..'"][!SetVariable ColorPicker.Alpha'..i..' "'..v.alpha..'"][!SetVariable ColorPicker.Bangs'..i..' """[!WriteKeyValue "Variables" "'..v.var..'" "$ColorPicker.Output$" "#@#Settings.inc"][!SetVariable "'..v.var..'" "$ColorPicker.Output$"]'..v.bangs..'[!CommandMeasure ColorScript draw()]"""]')
		i = i + 1
	end
	SKIN:Bang('[!SetOption RightSepSection H '..((i-1)*49)..']')
	SKIN:Bang('!Update')
end

function switch(name)
	page=name
	draw()
end