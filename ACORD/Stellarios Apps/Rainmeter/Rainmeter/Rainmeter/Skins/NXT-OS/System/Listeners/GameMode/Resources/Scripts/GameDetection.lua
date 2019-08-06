function Initialize()
	CheckForPlaceHolders()
	CheckForBlank()
	tableNums = {0,0,0,0,0}
	currIndex = 1
	active = false
	activeName = ""
	Measure = SKIN:GetMeasure('GPUUsage')
	Threshold = tonumber(SKIN:GetVariable("GameMode.Detect"))
end

function CheckForPlaceHolders() -- On fresh install remove the placeholders '...'
	local bol = false
	if SKIN:GetVariable("GameMode.Blacklist") == "..." then 
		SKIN:Bang('!WriteKeyValue','Variables','GameMode.Blacklist','','#@#Settings.inc')
		bol = true
	end
	if SKIN:GetVariable("GameMode.Known") == "..." then 
		SKIN:Bang('!WriteKeyValue','Variables','GameMode.Known','','#@#Settings.inc')
		bol = true
	end
	if bol then SKIN:Bang('[!Refresh NXT-OS\\Settings][!Refresh]') end
end

function CheckForBlank()
	if SKIN:GetVariable("GameMode.Known") == '' or SKIN:GetVariable("GameMode.Known") == nil then 
		SKIN:Bang('[!DisableMeasure "AppRunning"][!Update]')
	end
end

function Update()
	tableNums[currIndex] = tonumber(Measure:GetValue())
	currName = Measure:GetStringValue()
	currIndex = currIndex + 1
	if currIndex == 6 then currIndex = 1 end
	local Total = 0
	for i=1,5 do
		Total = Total + tableNums[i]
	end
	local Average = Total / 5
	if Average > Threshold then
		if not active then
			print(currName..' is now active')
			active = true
			activeName = currName
			SKIN:Bang('[!SetVariable CurrentGame "'..activeName..'"]')
			if SKIN:GetVariable('GameMode.Mode') == "0" then
				SKIN:Bang(SELF:GetOption("UnknownCommands"))
				SKIN:Bang('!SetVariable','Text','Enable Game Mode?#CRLF#' .. currName .. ' is using a significant amount of GPU resources. Would you like to switch to Game Mode when this application starts?','NXT-OS\\Hud\\GameMode')
				SKIN:Bang('!SetVariable','Name',currName,'NXT-OS\\Hud\\GameMode')
			elseif SKIN:GetVariable('GameMode.Mode') == "1" then
				BlacklistTask(currName)
			elseif SKIN:GetVariable('GameMode.Mode') == "2" then
				LearnTask(currName)
			end
		end
	elseif active then
		active = false
		print(activeName..' is no longer active')
	end
end

function BlacklistTask(name)
	local currVar = SKIN:GetVariable("GameMode.Blacklist")
	SKIN:Bang('!WriteKeyValue','Variables','GameMode.Blacklist',currVar..name..'|','#@#Settings.inc')
	SKIN:Bang('!Refresh')
end

function LearnTask(name)
	local currVar = SKIN:GetVariable("GameMode.Known")
	SKIN:Bang('!WriteKeyValue','Variables','GameMode.Known',currVar..name..'|','#@#Settings.inc')
	SKIN:Bang('!Refresh')
end