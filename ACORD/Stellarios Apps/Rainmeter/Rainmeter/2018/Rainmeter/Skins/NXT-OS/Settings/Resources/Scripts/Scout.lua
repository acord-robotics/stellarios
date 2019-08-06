function Initialize()
	tblExtensions = {}
	for item in string.gmatch(SKIN:GetVariable("Scout.IndexExtensions"),"(.-);") do
		table.insert(tblExtensions,{item})
	end

	tblTargets = {}
	for item in string.gmatch(SKIN:GetVariable("Scout.IndexTargets"),"(.-)|") do
		table.insert(tblTargets,{item})
	end

	max = 10

	curEdit = nil
	numExtensions = math.min(max,#tblExtensions)
	numTargets = math.min(max,#tblTargets)

	Draw()
end

function AddExtension()
	if numExtensions < max then
		curEdit = "Extension"
		SKIN:Bang('[!SetVariable Input ""][!SetOption EditBox MeterStyle Window.Element.Input.Background.Active][!SetOption EditBoxTitle Text "Add Extension"][!ShowMeterGroup Edit][!Update]')
	end
end

function RemoveExtension()
	for i = numExtensions,1,-1 do
		if tblExtensions[i]['selected'] then
			table.remove(tblExtensions,i)
		end
	end
	if #tblExtensions < 1 then
		table.insert(tblExtensions,{'lnk'})
		SKIN:Bang("!CommandMeasure", "Error", 'DisplayError({type="2",title="Scout Warning!",desc="Scout must have at least one extension defined.",lefttext="",righttext="OK",rightcommand=""})', "nxt-os\\system")
	end
	SKIN:Bang('!WriteKeyValue','Variables','Scout.IndexExtensions',Concat(tblExtensions,';'),'#@#Settings.inc')
	SKIN:Bang('!WriteKeyValue','Variables','Rebuild','1','#SKINSPATH#NXT-OS\\System\\Listeners\\FileIndexer\\Index.ini')
	Draw()
end

function SelectExtension(num)
	if num <= numExtensions then
		if tblExtensions[num]['selected'] then
			tblExtensions[num]['selected'] = nil
			SKIN:Bang('[!SetOption Left'..num..' MeterStyle "LeftListStyle"]')
		else
			tblExtensions[num]['selected'] = true
			SKIN:Bang('[!SetOption Left'..num..' MeterStyle "LeftListStyle|ListStyleActive"]')
		end
		SKIN:Bang('!Update')
	end
end

function AddPath()
	if numTargets < max then
		curEdit = "Targets"
		SKIN:Bang('[!SetVariable Input ""][!SetOption EditBox MeterStyle Window.Element.Input.Background.Browse.Active][!SetOption EditBoxTitle Text "Add Directory To Scan"][!ShowMeterGroup Edit][!Update]')
	end
end

function RemovePath()
	for i = numTargets,1,-1 do
		if tblTargets[i]['selected'] then
			table.remove(tblTargets,i)
		end
	end
	SKIN:Bang('!WriteKeyValue','Variables','Scout.IndexTargets',Concat(tblTargets,'|'),'#@#Settings.inc')
	SKIN:Bang('!WriteKeyValue','Variables','Rebuild','1','#SKINSPATH#NXT-OS\\System\\Listeners\\FileIndexer\\Index.ini')
	Draw()
end

function SelectPath(num)
	if num <= numTargets then
		if tblTargets[num]['selected'] then
			tblTargets[num]['selected'] = nil
			SKIN:Bang('[!SetOption Right'..num..' MeterStyle "RightListStyle"]')
		else
			tblTargets[num]['selected'] = true
			SKIN:Bang('[!SetOption Right'..num..' MeterStyle "RightListStyle|ListStyleActive"]')
		end
		SKIN:Bang('!Update')
	end
end

function Save()
	local Input = SKIN:GetVariable('Input',"")
	if Input ~= "" and Input ~= nil then
		if curEdit == "Extension" then
			if string.sub(Input,1,1) == "." then
				table.insert(tblExtensions,{string.sub(Input,2)})
			else
				table.insert(tblExtensions,{Input})
			end
			SKIN:Bang('!WriteKeyValue','Variables','Scout.IndexExtensions',Concat(tblExtensions,';'),'#@#Settings.inc')
			SKIN:Bang('!WriteKeyValue','Variables','Rebuild','1','#SKINSPATH#NXT-OS\\System\\Listeners\\FileIndexer\\Index.ini')
			Draw()
		elseif curEdit == "Targets" then
			table.insert(tblTargets,{Input})
			SKIN:Bang('!WriteKeyValue','Variables','Scout.IndexTargets',Concat(tblTargets,'|'),'#@#Settings.inc')
			SKIN:Bang('!WriteKeyValue','Variables','Rebuild','1','#SKINSPATH#NXT-OS\\System\\Listeners\\FileIndexer\\Index.ini')
			Draw()
		end
		SKIN:Bang('[!SetVariable "Input" ""][!HideMeterGroup "Edit"][!Update]')
	end
	
end

function Draw()
	numExtensions = math.min(max,#tblExtensions)
	numTargets = math.min(max,#tblTargets)

	SKIN:Bang('[!SetOptionGroup AllLists Text ""][!SetOptionGroup Leftlist MeterStyle "LeftListStyle"][!SetOptionGroup Rightlist MeterStyle "RightListStyle"]')

	for i=1,numExtensions do
		SKIN:Bang('[!SetOption Left'..i..' Text "'..tblExtensions[i][1]..'"]')
		if tblExtensions[i]['selected'] then
			SKIN:Bang('[!SetOption Left'..i..' MeterStyle "LeftListStyle|ListStyleActive"]')
		end
	end
	for i=1,numTargets do
		SKIN:Bang('[!SetOption Right'..i..' Text "'..tblTargets[i][1]..'"]')
		if tblTargets[i]['selected'] then
			SKIN:Bang('[!SetOption Right'..i..' MeterStyle "RightListStyle|ListStyleActive"]')
		end
	end

	if numExtensions == 0 then
		SKIN:Bang('[!SetOption LeftMinus ImageAlpha 120][!SetOption LeftPlus ImageAlpha 255]')
	elseif numExtensions < max then
		SKIN:Bang('[!SetOption LeftMinus ImageAlpha 255][!SetOption LeftPlus ImageAlpha 255]')
	else
		SKIN:Bang('[!SetOption LeftMinus ImageAlpha 255][!SetOption LeftPlus ImageAlpha 120]')
	end

	if numTargets == 0 then
		SKIN:Bang('[!SetOption RightMinus ImageAlpha 120][!SetOption RightPlus ImageAlpha 255]')
	elseif numTargets < max then
		SKIN:Bang('[!SetOption RightMinus ImageAlpha 255][!SetOption RightPlus ImageAlpha 255]')
	else
		SKIN:Bang('[!SetOption RightMinus ImageAlpha 255][!SetOption RightPlus ImageAlpha 120]')
	end

	SKIN:Bang('[!SetOption LeftSepSection H '..(25*numExtensions)..'][!SetOption RightSepSection H '..(25*numTargets)..'][!Update]')
end

function Concat(tbl,sep)
	local string = ""
	for k,v in ipairs(tbl) do
		string = string .. v[1] .. sep
	end
	return string
end