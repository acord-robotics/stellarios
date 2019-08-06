function Main()
	Display("Running Top Bar Scripts")
	ORDER = {}
	local list = SKIN:GetVariable("Top.Quick.Order") --Get the current order stored in the settings.inc
	for item in string.gmatch(list,"(.-)|") do
		table.insert(ORDER,item)
	end
	Check()
	Save()
end

function Check()
	for k,v in ipairs(ORDER) do
		Display("Checking: "..v)
		if v == "command" then
			Display('Replacing command with scout')
			ORDER[k] = "scout"
		elseif v == "dash" then
			Display('Replacing dash with overlaywidgets')
			ORDER[k] = "overlaywidgets"
		elseif v == "drawer" then
			Display('Replacing drawer with overlaylauncher')
			ORDER[k] = "overlaylauncher"
		end
	end
end

function Save() --Called to save the order information in the users settings file. 
	local line = ""
	for _,v in ipairs(ORDER) do
		line = line..v.."|"
	end
	SKIN:Bang("!WriteKeyValue","Variables","Top.Quick.Order",line,"#@#Settings.inc")
end
