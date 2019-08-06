function Initialize()
	dirSKINSPATH     = SKIN:GetVariable('SKINSPATH')
	fileHISTORY      = dirSKINSPATH..'NXT-OS\\Settings\\Resources\\History.inc'
	tblHistory		 = {}
	curIndex 		 = 0
	bolClear		 = false
	bolChange 		 = false
end

function Follow()
	if bolClear then
		curIndex = 0
		tblHistory = {}
		Save()
	else
		if not bolChange then
			local curBang = SKIN:ReplaceVariables('#Settings.Mode#[!ActivateConfig "#CURRENTCONFIG#" "#CURRENTFILE#"]')
			Read()
			curIndex = curIndex + 1
			if curIndex < #tblHistory then
				while #tblHistory >= curIndex do
					table.remove(tblHistory)
				end
				curIndex = #tblHistory
			else
				table.insert(tblHistory,curBang)
			end
			Save()
		else

		end
	end
end

function Back()
	Read()
	if curIndex > 1 then
		bolChange = true
		local curBang = SKIN:ReplaceVariables('#Settings.Mode#[!ActivateConfig "#CURRENTCONFIG#" "#CURRENTFILE#"]')
		if curIndex == #tblHistory and tblHistory[curIndex] ~= curBang then
			table.insert(tblHistory,curBang)
			Save()
		else
			curIndex = curIndex - 1
			Save()
		end
		Start(tblHistory[curIndex])
	elseif curIndex == 1 and #tblHistory <= 1 then
		bolChange = true
		local curBang = SKIN:ReplaceVariables('#Settings.Mode#[!ActivateConfig "#CURRENTCONFIG#" "#CURRENTFILE#"]')
		table.insert(tblHistory,curBang)
		Save()
		Start(tblHistory[curIndex])
	end
end

function Forward()
	Read()
	if curIndex < #tblHistory then
		bolChange = true
		curIndex = curIndex + 1
		Save()
		Start(tblHistory[curIndex])
	end
end

function Start(bang)
	local mode = SKIN:GetVariable('Settings.Mode')
	local source = string.sub(bang,1,1)
	bang = string.sub(bang,2)
	if source == "I" then
		if mode == "I" then
			SKIN:Bang(bang)
		elseif mode == "E" then
			SKIN:Bang('[!Update][!Update]')
			SKIN:Bang(bang)
			SKIN:Bang('[!Move #CURRENTCONFIGX# #CURRENTCONFIGY# NXT-OS\\Settings][!DeactivateConfig]')
		end
	elseif source == "E" then
		local path,ini = string.match(bang,'%[!ActivateConfig%s+"(.-)"%s+"(.-).ini"%]')
		if mode == "I" then
			SKIN:Bang('[!Update][!Update]')
			SKIN:Bang(bang)
			SKIN:Bang('[!Move #CURRENTCONFIGX# #CURRENTCONFIGY# "'..path..'"][!DeactivateConfig]')
		elseif mode == "E" then
			if SKIN:GetVariable('CURRENTCONFIG') == path then
				SKIN:Bang(bang)
			else
				SKIN:Bang('[!Update][!Update]')
				SKIN:Bang(bang)
				SKIN:Bang('[!Move #CURRENTCONFIGX# #CURRENTCONFIGY# "'..path..'"][!DeactivateConfig]')
			end
		end
	end
end

function Clear()
	bolClear = true
end

function Read()
	tblHistory = {}
	for line in io.lines(fileHISTORY) do
		table.insert(tblHistory,line)
	end
	if tblHistory[1] == nil then 
		curIndex = 0
	else
		curIndex = tonumber(tblHistory[1])
		table.remove(tblHistory,1)
	end
end

function Save()
	local File = io.open(fileHISTORY, "w+")

	if not File then
		print('WriteFile: unable to open file at ' .. fileHISTORY)
		return
	end

	File:write(curIndex.."\n")
	for k, v in pairs(tblHistory) do
		File:write(v.."\n")
	end

	File:close()
end