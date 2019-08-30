function Initialize()
	SkinsPath = SKIN:GetVariable('SKINSPATH')
	FilePath = SkinsPath.."NXT-OS Data\\WidgetListCache.inc"
	tblCache = {}
	File = io.open(FilePath,"r")
	if File then
		for line in io.lines(FilePath) do
			local Name, Icon, Path, Ini = string.match(line, "<Name>(.-)</Name><IconPath>(.-)</IconPath><LaunchPath>(.-)</LaunchPath><Ini>(.-)</Ini>")
			table.insert(tblCache,{itemName = Name, itemIcon = Icon, itemPath = Path, itemIni = Ini})
		end
		io.close(File)
	end
	curIndex = 0
	maxIndex = (math.ceil(#tblCache/12)-1)
	Draw()
end

function Draw()
	for i = 1,12 do 
		local index = i + (12*curIndex)
		if tblCache[index] ~= nil then
			SKIN:Bang("!SetOption","Index"..i.."Title","Text",tblCache[index]["itemName"])
			SKIN:Bang("!SetOption","Index"..i.."Icon","ImageName",tblCache[index]["itemIcon"])
			SKIN:Bang("!SetOption","Index"..i.."Icon","LeftMouseUpAction",'[!ActivateConfig "'..tblCache[index]["itemPath"]..'" "'..tblCache[index]["itemIni"]..'"][!EnableMeasure Widget.CenterLoad "'..tblCache[index]["itemPath"]..'"][!Update "'..tblCache[index]["itemPath"]..'"][!ZPos 1 "'..tblCache[index]["itemPath"]..'"]')
			SKIN:Bang("!ShowMeter","Index"..i.."Title")
			SKIN:Bang("!ShowMeter","Index"..i.."Icon")
		else
			SKIN:Bang("!HideMeter","Index"..i.."Title")
			SKIN:Bang("!HideMeter","Index"..i.."Icon")
		end
	end
	if curIndex == 0 then
		SKIN:Bang("!HideMeter","UpButton")
	else
		SKIN:Bang("!ShowMeter","UpButton")
	end
	if maxIndex > 0 and curIndex < maxIndex then
		SKIN:Bang("!ShowMeter","DownButton")
	else
		SKIN:Bang("!HideMeter","DownButton")
	end
	SKIN:Bang('!Update')
end

function ScrollUp()
	if curIndex > 0 then
		curIndex = curIndex - 1
		Draw()
	end
end


function ScrollDown()
	if curIndex < maxIndex then
		curIndex = curIndex + 1
		Draw()
	end
end