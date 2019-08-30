function Initialize()
	SkinsPath = SKIN:GetVariable('SKINSPATH')
	FilePath = SkinsPath.."NXT-OS Data\\WidgetListCache.inc"
	info={}
	page=1
	File = io.open(FilePath,"r")
	if File then
		for line in io.lines(FilePath) do 
			table.insert(info,line)
		end
		io.close(File)
	end
	Calc = SKIN:GetMeasure('MainCalc')
	Display()
end

function Display()
	SKIN:Bang("!HideMeterGroup","Icons")
	SKIN:Bang("!HideMeterGroup","Arrows")
	Number = Calc:GetValue()
	for i=1,Number do
		index = i+(Number*(page-1))
		if info[index] ~= nil then
			local name, iconpath, launchpath, ini = string.match(info[index], "<Name>(.-)</Name><IconPath>(.-)</IconPath><LaunchPath>(.-)</LaunchPath><Ini>(.-)</Ini>")
			SKIN:Bang("!SetOption","Index"..i.."Title","Text",name)
			SKIN:Bang("!SetOption","Index"..i.."Icon","ImageName",iconpath)
			SKIN:Bang("!SetOption","Index"..i.."Icon","LeftMouseUpAction",'[!ActivateConfig "'..launchpath..'" "'..ini..'"][!ZPos 1][!ZPosGroup 1 "NXTWidgets"]')
			SKIN:Bang("!ShowMeter","Index"..i.."Title")
			SKIN:Bang("!ShowMeter","Index"..i.."Icon")
		end
	end
	if page > 1 then
		SKIN:Bang("!ShowMeter","LeftArrow")
	end 
	if (table.getn(info)/Number) > 1 then
		if page < math.ceil(table.getn(info)/Number) then
			SKIN:Bang("!ShowMeter","RightArrow")
		end
	end
	SKIN:Bang('!Update')
end

function pageforward()
	Number = Calc:GetValue()
	maxpage = math.ceil(table.getn(info)/Number)
	if page < maxpage then
		page = page+1
	end 
	Display()
end

function pagebackward()
	Number = Calc:GetValue()
	maxpage = math.ceil(table.getn(info)/Number)
	if page > 1 then
		page = page-1
	end 
	Display()
end