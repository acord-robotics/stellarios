function Initialize()
-- Grab information and set table.
	SkinsPath = SKIN:GetVariable('SKINSPATH')
	FilePath = SKIN:MakePathAbsolute(SkinsPath.."NXT-OS Data\\Dock.inc")
	info={}
	for line in io.lines(FilePath) do
		local p_icon, p_path, p_text, p_format, p_foldersettings = string.match(line, "<Icon>(.-)</Icon><Path>(.-)</Path><Text>(.-)</Text><Format>(%d)(.-)</Format>")
		local p_sort, p_ascending = nil, nil
		if p_foldersettings ~= '' then
			p_sort, p_ascending =string.match(p_foldersettings, "<Sort>(.-)</Sort><Ascending>(.-)</Ascending>")
		end
		table.insert(info,{icon = p_icon, path = p_path, text = p_text, format = p_format, sort = p_sort, ascending = p_ascending})
	end
	total = table.getn(info)
	max = (total-2)
	position = tonumber(SKIN:GetVariable('position'))
-- Check to show scroll bar
	SKIN:Bang('!SetVariable', 'total', table.getn(info))
	if table.getn(info) <= 3 then
		SKIN:Bang('!HideMeter Scroll')
	end
-- Make sure that position is not above the max possible
	if position > max then
		position = 1
		SKIN:Bang('!SetVariable','Position',position)
	end
-- Check to see if click sound is enabled
	sound = ""
	if SKIN:GetVariable("Sound.DockClick") == "0" then
		sound = "[play #@#Sounds\\0\\Click.wav]"
	end 
	setvar()
end
-- Sets variables for icons as the dock scrolls.

function setvar()
	for i=1,5 do
		local icon, path, text, format, sort, ascending = "","","","","",""
		-- check to see if the dock is at the beginning or at the end, clears the icons in the dummy slots
		local value = info[(i-1+(position-1))]
		if value ~= nil then	
			icon, path, text, format, sort, ascending = value.icon, value.path, value.text, value.format, value.sort, value.ascending
		end
		-- dont set extra settings on dummy slots
		if i == 1 or i == 5 then
			SKIN:Bang('!SetOption', 'Icon'..i,'ImageName', icon)
		else
			SKIN:Bang('!SetOption', 'Icon'..i,'ImageName', icon)
			SKIN:Bang('!SetOption', 'Title'..i,'Text', text)
			SKIN:Bang('!SetOption', 'Icon'..i,'MiddleMouseUpAction','')
			if format == "3" then
				SKIN:Bang('!SetOption', 'Icon'..i,'LeftMouseUpAction', sound..'[!WriteKeyValue "Variables" "FolderPath" "'..path..'" "\\Resources\\Folder\\Folder.ini"][!WriteKeyValue "Variables" "SortBy" "'..sort..'" "\\Resources\\Folder\\Folder.ini"][!WriteKeyValue "Variables" "SortAscending" "'..ascending..'" "\\Resources\\Folder\\Folder.ini"][!WriteKeyValue "Variables" "FolderPosition" "'..(i-1)..'" "\\Resources\\Folder\\Folder.ini"][!ActivateConfig "NXT-OS\\Dock\\Resources\\Folder" "Folder.ini"][!Move #CURRENTCONFIGX# #CURRENTCONFIGY# "NXT-OS\\Dock\\Resources\\Folder"]')
				SKIN:Bang('!SetOption', 'Icon'..i,'MiddleMouseUpAction','"'..path..'"')
			elseif string.len(path) > 0 then
				SKIN:Bang('!SetOption', 'Icon'..i,'LeftMouseUpAction', sound..'["'..path..'"]')
			else
				SKIN:Bang('!SetOption', 'Icon'..i,'LeftMouseUpAction', sound..'[!ActivateConfig "NXT-OS\\Settings" "Dock.ini"]')
			end
		end
	end
	SKIN:Bang('!Update')
end

function determineshow()
	SKIN:Bang("!ShowMeterGroup Title")
	local title2 = tonumber(SKIN:GetVariable("Title2Opacity"))
	local title3 = tonumber(SKIN:GetVariable("Title3Opacity"))
	local title4 = tonumber(SKIN:GetVariable("Title4Opacity"))
	if title2 == 255 then
		SKIN:Bang("!CommandMeasure","Timer","Execute 5")
	elseif title3 == 255 then
		SKIN:Bang("!CommandMeasure","Timer","Execute 7")
	elseif title4 == 255 then
		SKIN:Bang("!CommandMeasure","Timer","Execute 9")
	end
end
--Check Functions
function Forward()
	if position < max then 
		SKIN:Bang('!commandmeasure timer "execute 1" nxt-os\\dock')
	end
end
function Backward()
	if position ~= 1 then
		SKIN:Bang('!commandmeasure timer "execute 2" nxt-os\\dock')
	end
end
--Move Functions
function ForwardShift()
	position = position+1
	SKIN:Bang('!SetVariable','Position',position)
	setvar()
end
function BackwardShift()
	position = position-1
	SKIN:Bang('!SetVariable','Position',position)
	setvar()
end