function Initialize()
	local state = getstate('NXT-OS\\System\\Listeners\\GameMode')
	if state and SKIN:GetVariable('GameMode.Enable') == "1" then
		SKIN:Bang('!WriteKeyValue','Variables','GameMode.Enable','0','#@#Settings.inc')
		SKIN:Bang('!Refresh')
		SKIN:Bang('[!DectivateConfig NXT-OS\\System\\Listeners\\GameMode GameModeListener.ini]')
	elseif not state and SKIN:GetVariable('GameMode.Enable') == "0" then
		SKIN:Bang('[!ActivateConfig NXT-OS\\System\\Listeners\\GameMode GameModeListener.ini]')
	end
	DISPLAYSLOTS = 10

	tblKnownList = GetList('GameMode.Known')
	tblBlackList = GetList('GameMode.Blacklist')

	scrollLeftMax  = 0
	scrollLeftPos  = 0
	scrollRightMax = 0
	scrollRightPos = 0

	Draw()
end

function GetList(rmvar,sep)
	if sep == nil or sep == "" then sep = "|" end --Make sure that there is a separator to use
	local list  = SKIN:GetVariable(rmvar) --Get the current order stored in the settings.inc
	local order = {} --Store the output from the list
	if list ~= nil then
		for item in string.gmatch(list,"(.-)"..sep) do
			table.insert(order,{name = item})
		end
	end
	return order
end

function LeftScroll(num)
	scrollLeftPos = num
	Draw()
end

function LeftScrollUp()
	if scrollLeftPos > 0 then
		scrollLeftPos = scrollLeftPos - 1
	end
	Draw()
end

function LeftScrollDown()
	if scrollLeftPos < scrollLeftMax then 
		scrollLeftPos = scrollLeftPos + 1
	end
	Draw()
end


function RightScroll(num)
	scrollRightPos = num
	Draw()
end

function RightScrollUp()
	if scrollRightPos > 0 then
		scrollRightPos = scrollRightPos - 1
	end
	Draw()
end

function RightScrollDown()
	if scrollRightPos < scrollRightMax then 
		scrollRightPos = scrollRightPos + 1
	end
	Draw()
end

function SelectLeft(num)
	if num <= numKnownList then
		local index = num + scrollLeftPos
		if tblKnownList[index]['selected'] then
			tblKnownList[index]['selected'] = nil
		else
			tblKnownList[index]['selected'] = true
		end
		Draw()
	end
end

function SelectRight(num)
	if num <= numBlackList then
		local index = num + scrollRightPos
		if tblBlackList[index]['selected'] then
			tblBlackList[index]['selected'] = nil
		else
			tblBlackList[index]['selected'] = true
		end
		Draw()
	end
end

function MoveToLeft()
	for i = #tblBlackList,1,-1 do
		if tblBlackList[i]['selected'] then
			tblBlackList[i]['selected'] = nil
			table.insert(tblKnownList,tblBlackList[i])
			table.remove(tblBlackList,i)
		end
	end
	scrollLeftPos = math.max(0,(#tblKnownList - DISPLAYSLOTS))
	Draw()
	Save()
end

function MoveToRight()
	for i = #tblKnownList,1,-1 do
		if tblKnownList[i]['selected'] then
			tblKnownList[i]['selected'] = nil
			table.insert(tblBlackList,tblKnownList[i])
			table.remove(tblKnownList,i)
		end
	end
	scrollRightPos = math.max(0,(#tblBlackList - DISPLAYSLOTS))
	Draw()
	Save()
end

function Draw()
	numKnownList   = math.min(DISPLAYSLOTS,#tblKnownList)
	numBlackList   = math.min(DISPLAYSLOTS,#tblBlackList)
	scrollLeftMax  = math.max(0,(#tblKnownList - DISPLAYSLOTS))
	scrollRightMax = math.max(0,(#tblBlackList - DISPLAYSLOTS))

	if scrollLeftPos > scrollLeftMax then scrollLeftPos = scrollLeftMax end
	if scrollRightPos > scrollRightMax then scrollRightPos = scrollRightMax end

	SKIN:Bang('[!SetVariable LeftScroll.Total '..#tblKnownList..'][!SetVariable LeftScroll.Position '..scrollLeftPos..'][!SetVariable RightScroll.Total '..#tblBlackList..'][!SetVariable RightScroll.Position '..scrollRightPos..']')
	SKIN:Bang('[!SetOptionGroup AllLists Text ""][!SetOptionGroup Leftlist MeterStyle "LeftListStyle"][!SetOptionGroup Rightlist MeterStyle "RightListStyle"][!SetOption MoveToRight ImageAlpha 120][!SetOption MoveToLeft ImageAlpha 120]')

	for k,v in pairs(tblKnownList) do
		if v.selected then
			SKIN:Bang('[!SetOption MoveToRight ImageAlpha 255]')
			break
		end
	end

	for k,v in pairs(tblBlackList) do
		if v.selected then
			SKIN:Bang('[!SetOption MoveToLeft ImageAlpha 255]')
			break
		end
	end

	if #tblKnownList <= DISPLAYSLOTS then
		SKIN:Bang('[!HideMeterGroup LeftScroll][!SetOption LeftSepSection W ([LeftBox:W]-20)]')
	else
		SKIN:Bang('[!ShowMeterGroup LeftScroll][!SetOption LeftSepSection W ([LeftBox:W]-30)]')
	end

	if #tblBlackList <= DISPLAYSLOTS then
		SKIN:Bang('[!HideMeterGroup RightScroll][!SetOption RightSepSection W ([LeftBox:W]-20)]')
	else
		SKIN:Bang('[!ShowMeterGroup RightScroll][!SetOption RightSepSection W ([LeftBox:W]-30)]')
	end


	for i=1,numKnownList do
		local index = i + scrollLeftPos
		SKIN:Bang('[!SetOption Left'..i..' Text "'..tblKnownList[index]['name']..'"]')
		if tblKnownList[index]['selected'] then
			SKIN:Bang('[!SetOption Left'..i..' MeterStyle "LeftListStyle|ListStyleActive"]')
		end
	end
	for i=1,numBlackList do
		local index = i + scrollRightPos
		SKIN:Bang('[!SetOption Right'..i..' Text "'..tblBlackList[index]['name']..'"]')
		if tblBlackList[index]['selected'] then
			SKIN:Bang('[!SetOption Right'..i..' MeterStyle "RightListStyle|ListStyleActive"]')
		end
	end

	SKIN:Bang('[!SetOption LeftSepSection H '..(25*numKnownList)..'][!SetOption RightSepSection H '..(25*numBlackList)..'][!Update]')
end

function Save()
	local Known = ""
	local BlackList = ""
	for _,v in ipairs(tblKnownList) do
		Known = Known..v.name.."|"
	end
	for _,v in ipairs(tblBlackList) do
		BlackList = BlackList..v.name.."|"
	end
	SKIN:Bang("!WriteKeyValue","Variables","GameMode.Known",Known,"#@#Settings.inc")
	SKIN:Bang("!WriteKeyValue","Variables","GameMode.Blacklist",BlackList,"#@#Settings.inc")
	SKIN:Bang("!Refresh","NXT-OS\\System\\Listeners\\GameMode")
end

function getstate(skin)
	local skin = skin:gsub("\\","\\\\")
	local state = tonumber(SKIN:ReplaceVariables('[&MeasureActive:IsActive('..skin..')]'))
	if state > 0 then
		return true
	else
		return false
	end
end
