function Initialize()
	NOTESLIST   = {}
	CURRENTFILE = nil
	SKINSPATH   = SKIN:GetVariable('SKINSPATH')
	FOLDERPATH  = SKIN:MakePathAbsolute(SKINSPATH.."NXT-OS Data\\Notes\\")
	FIRSTSTART  = true
	AFTERFIND   = nil
	POSITION    = 0
end

function NewFile()
	local highestvalue = -1
	local newname = "New Note"
	for _,v in ipairs(NOTESLIST) do
		local num = nil
		if v[1] == "New Note" then
			print("Found new note")
			num = 0
		else
			num = tonumber(v[1]:match('New Note %((.-)%)$'))
		end
		if num ~= nil and num >= highestvalue then
			highestvalue = num
		end
	end
	if highestvalue == 0 then 
		newname = "New Note (2)"
	elseif highestvalue > 0 then
		newname = "New Note ("..(highestvalue+1)..")"
	else
		newname = "New Note"
	end
	CURRENTFILE = newname
	SKIN:Bang('!SetVariable','Note.Title',newname)
	SKIN:Bang('!SetVariable','Note.Text','')
	SKIN:Bang('!Update')
end

function DisplayFile(FileName)
	CURRENTFILE = FileName
	SKIN:Bang('!SetVariable','Note.Title',FileName)
	SKIN:Bang('!SetVariable','Note.Text',ReadFile(FileName))
	SKIN:Bang('!Update')
end

function DeleteFile()
	os.remove(FOLDERPATH..CURRENTFILE)
	SKIN:Bang("!Update")
	RefreshFiles(FinishDelete)
end

function FinishDelete()
	SKIN:Bang("!Update")
	if NOTESLIST[1] ~= nil then
		DisplayFile(NOTESLIST[1][1])
	else
		NewFile()
	end
	SKIN:Bang('[!HideMeterGroup Deleting][!Update]')
end

function RenameFile()
	local oldname = SKIN:GetVariable("Note.Title")
	local newname = SKIN:GetVariable("Note.NewTitle")
	SKIN:Bang("!Update")
	os.rename(FOLDERPATH..oldname,FOLDERPATH..newname)
	RefreshFiles()
	DisplayFile(newname)
end

function RefreshFiles(name)
	AFTERFIND = name
	SKIN:Bang('!CommandMeasure NotesPath Update')
end

function FindFiles(RunAfter)
	for k,v in pairs(NOTESLIST) do
		NOTESLIST[k] = nil
	end
	SKIN:Bang('!UpdateMeasureGroup FindFiles')
	local FileCount = SKIN:GetMeasure('NotesFileCount') 
	local IndexName = SKIN:GetMeasure('NotesIndexName')
	local IndexDate = SKIN:GetMeasure('NotesIndexDate')
	local Count = FileCount:GetStringValue()
	if FIRSTSTART then
		FIRSTSTART = false
		local name = IndexName:GetStringValue()
		if name ~= "" then
			DisplayFile(name)
		else
			NewFile()
		end
	end
	for i=1,Count do
		SKIN:Bang("[!Setoption NotesIndexName Index "..i.."][!Setoption NotesIndexDate Index "..i.."][!UpdateMeasureGroup FindFiles]")
		local Name = IndexName:GetStringValue()
		local Date = IndexDate:GetStringValue()
		table.insert(NOTESLIST,{Name,Date})
	end
	if RunAfter ~= nil then
		RunAfter()
	end
	if table.getn(NOTESLIST) < 1 then
		SKIN:Bang('[!SetOption Window.Title.Button.Trash ImageAlpha 100][!SetOption Window.Title.Button.Trash ButtonCommand ""][!Update]')
	else
		SKIN:Bang('[!SetOption Window.Title.Button.Trash ImageAlpha 255][!SetOption Window.Title.Button.Trash ButtonCommand """[play #@#Sounds\\Information.wav][!HideMeterGroup "SideOverlay"][!ShowMeterGroup "Dialogue"][!Update]"""][!Update]')
	end
end

function ListFiles()
	SKIN:Bang("[!SetVariable Total "..table.getn(NOTESLIST).."]")
	SKIN:Bang("[!SetVariable position "..POSITION.."]")
	if table.getn(NOTESLIST) > 0 then
		for i = 1,11 do 
			index = (i + POSITION)
			if NOTESLIST[i] ~= nil then
				local Name = string.sub(NOTESLIST[index][1],1,42) 
				if string.len(Name) >= 42 then
					Name = Name.."..."
				end
				SKIN:Bang('!SetOption','Side.Item.'..i,'Text',Name..'\n'..NOTESLIST[index][2])
				SKIN:Bang('!SetOption','Side.Item.'..i,'MouseOverAction','[!SetOption Side.Item.'..i..' "SolidColor" "#Window.SelectColor#"][!SetOption Side.Item.'..i..' "FontColor" "255,255,255"][!UpdateMeter Side.Item.'..i..'][!Redraw]')
				SKIN:Bang('!SetOption','Side.Item.'..i,'MouseLeaveAction','[!SetOption Side.Item.'..i..' "SolidColor" "255,255,255"][!SetOption Side.Item.'..i..' "FontColor" "#Window.FontColor#"][!UpdateMeter Side.Item.'..i..'][!Redraw]')
				SKIN:Bang('!SetOption','Side.Item.'..i,'LeftMouseUpAction','[!CommandMeasure "Script" "DisplayFile('.."'"..NOTESLIST[index][1].."'"..')"][!HideMeterGroup SideOverlay][!Update]')
			else
				SKIN:Bang('!SetOption','Side.Item.'..i,'Text','')
				SKIN:Bang('!SetOption','Side.Item.'..i,'MouseOverAction','')
				SKIN:Bang('!SetOption','Side.Item.'..i,'MouseLeaveAction','')
				SKIN:Bang('!SetOption','Side.Item.'..i,'LeftMouseUpAction','')
			end
		end
	else
		for i = 1,11 do
			SKIN:Bang('!SetOption','Side.Item.'..i,'Text','')
			SKIN:Bang('!SetOption','Side.Item.'..i,'MouseOverAction','')
			SKIN:Bang('!SetOption','Side.Item.'..i,'MouseLeaveAction','')
			SKIN:Bang('!SetOption','Side.Item.'..i,'LeftMouseUpAction','') 
		end
		SKIN:Bang('!SetOption','Side.Item.6','Text','                      No Saved Notes')
	end

	SKIN:Bang('!Update')
end

function scrollto(num)
	POSITION = num 
	ListFiles()
end

function scrolldown()
	local max = (table.getn(NOTESLIST)-11)
	if POSITION < max then
		POSITION = POSITION + 1
		--print(POSITION)
		ListFiles()
	end
end

function scrollup()
	if POSITION > 0 then
		POSITION = POSITION - 1
		ListFiles()
	end
end



function SaveNote()
	SKIN:Bang('!Update')
	local Contents = SKIN:GetVariable('Note.Text')
	WriteFile(FOLDERPATH..CURRENTFILE,Contents)
	RefreshFiles()
end

function ReadFile(FileName)
	local FilePath = FOLDERPATH..FileName
	-- HANDLE RELATIVE PATH OPTIONS.
	FilePath = SKIN:MakePathAbsolute(FilePath)
	-- OPEN FILE.
	local File = io.open(FilePath)
	-- HANDLE ERROR OPENING FILE.
	if not File then
		print('ReadFile: unable to open file at ' .. FilePath)
		return
	end
	-- READ FILE CONTENTS AND CLOSE.
	local Contents = File:read('*all')
	File:close()
	return Contents
end

function WriteFile(FilePath, Contents)
	-- HANDLE RELATIVE PATH OPTIONS.
	FilePath = SKIN:MakePathAbsolute(FilePath)
	-- OPEN FILE.
	local File = io.open(FilePath, 'w')
	-- HANDLE ERROR OPENING FILE.
	if not File then
		print('WriteFile: unable to open file at ' .. FilePath)
		return
	end
	-- WRITE CONTENTS AND CLOSE FILE
	File:write(Contents)
	File:close()
	return true
end
