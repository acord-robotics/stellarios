function Initialize()
-- Grab information and set table.
	SkinsPath = SKIN:GetVariable('SKINSPATH')
	FilePath = SKIN:MakePathAbsolute(SkinsPath.."NXT-OS Data\\AppListCache.inc")
	info={}
	page = 0
	for line in io.lines(FilePath) do
		local active = string.match(line, ".-<Active>(.-)</Active>")
		if active == "true" then
			table.insert(info, line)
		end
	end

-- Determine the number of page dots
	Numberofpages = math.floor((table.getn(info)/10)+0.999)
	if Numberofpages > 1 then 
		local space = ((216-(16*Numberofpages))/2)
		SKIN:Bang("!SetOption","DotSpacer","W",space)
		SKIN:Bang("!SetOption","RightArrow","X",(4-(8*(13-Numberofpages))).."R")
		SKIN:Bang("!ShowMeter","LeftArrow")
		for i=1,Numberofpages do
			SKIN:Bang("!ShowMeter","Dot"..i)
		end
		SKIN:Bang("!ShowMeter","RightArrow")
	else
		SKIN:Bang("!HideMeter","LeftArrow")
		SKIN:Bang("!HideMeter","RightArrow")
		SKIN:Bang("!HideMeterGroup","AllDots")
	end

	setinfo()
end

function setinfo()
	for i=1,10 do
		local index = (i + (10*page))
		if info[index] ~= nil then
			local name, description, icon, launch = string.match(info[index], "<Name>(.-)</Name><Description>(.-)</Description><Icon>(.-)</Icon><Launch>(.-)</Launch>")
			SKIN:Bang("!SetOption", "Icon"..i, "ImageName", "#SkinsPath#"..icon)
			SKIN:Bang("!SetOption", "Text"..i, "Text", name)
			if SKIN:GetVariable('Drawer.CloseOnLaunch') == "0" then
				SKIN:Bang("!SetOption", "Icon"..i, "LeftMouseUpAction", launch.."[!CommandMeasure Animate "..'"Execute 1"]')
			else
				SKIN:Bang("!SetOption", "Icon"..i, "LeftMouseUpAction", launch)
			end
		else
			SKIN:Bang("!SetOption", "Icon"..i, "ImageName", "")
			SKIN:Bang("!SetOption", "Text"..i, "Text", "")
			SKIN:Bang("!SetOption", "Icon"..i, "LeftMouseUpAction", "")
		end
	end	
	if Numberofpages > 1 then
		SKIN:Bang("!SetOptionGroup","AllDots","ImageName","Resources\\Images\\Dot_Inactive.png")
		SKIN:Bang("!SetOption","Dot"..(page+1),"ImageName","Resources\\Images\\Dot.png")
	end
	SKIN:Bang("!Update")
end

function ScrollForward()
	if Numberofpages > 1 then
		if (page+1) < Numberofpages then
			if (page+1) < 13 then
				page = (page+1)
				setinfo()
			end
		end
	end
end

function ScrollBackward()
	if page > 0 then
		page = (page-1)
		setinfo()
	end
end

function SetPage(num)
	if (num-1) ~= page then
		page = (num-1)
		setinfo() 
	end
end