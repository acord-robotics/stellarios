function Initialize()
	json = loadfile(SKIN:GetVariable('@')..'Scripts\\Json.lua')() -- Include the JSON lib
	--Path variables
	dirSKINSPATH     = SKIN:GetVariable('SKINSPATH')
	dirDOWNLOADS     = SKIN:MakePathAbsolute("DownloadFile\\")
	dirDATA          = SKIN:MakePathAbsolute(dirSKINSPATH.."NXT-OS Data\\GameDrawer\\")
	dirBANNERS       = dirDATA.."Banners\\"
	fileGames		 = dirDATA.."addedgames.json"

	curEdit 		 = '' -- The ID of the game that is currently being chagned

	listGames        = json.load(fileGames) -- Get infromation from the info file
	if type(listGames) ~= 'table' then listGames = {} end --Check if the info file is empty or if it does not exist, then create a blank table.
end

function Delete(id)
	if id ~= nil and listGames[id] ~= nil then
		print("Delete",id)
		listGames[id] = nil
		json.save(listGames,fileGames)
		SKIN:Bang('[!Refresh NXT-OS\\GameDrawer][!Refresh]')
	end 
end

function Edit(id)
	if id == nil then
		SKIN:Bang('!SetVariable','TempAppName','')
		SKIN:Bang('!SetVariable','TempAppPath','')
		SKIN:Bang('!SetVariable','TempBannerPath','')
		SKIN:Bang('!SetOption','DragAndDropChild','Disabled','0')
		SKIN:Bang('[!ShowMeterGroup "Edit"][!Update]')
		curEdit = ''
	else
		SKIN:Bang('!SetVariable','TempAppName',listGames[id]['appName'])
		SKIN:Bang('!SetVariable','TempAppPath',listGames[id]['appPath'])
		SKIN:Bang('!SetVariable','TempBannerPath',dirBANNERS..listGames[id]['bannerName'])
		SKIN:Bang('!SetOption','DragAndDropChild','Disabled','0')
		SKIN:Bang('[!ShowMeterGroup "Edit"][!Update]')
		curEdit = id
	end
end

function AddGame()
	local temp_appName = SKIN:GetVariable('TempAppName','')
	local temp_appPath = SKIN:GetVariable('TempAppPath','')	
	if temp_appName ~= '' and temp_appPath ~= '' then
		if curEdit == '' then
			local temp_appID      = GenerateAppID(temp_appName)
			local temp_bannerPath = SKIN:GetVariable('TempBannerPath','')
			local temp_bannerName = temp_appID..GetExtension(temp_bannerPath)

			listGames[temp_appID] = {appName = temp_appName, appPath = temp_appPath, bannerName = temp_bannerName}
			json.save(listGames,fileGames)
			if temp_bannerPath ~= '' then 
				Copy(temp_bannerPath,dirBANNERS..temp_bannerName)
			end
		else
			local temp_bannerPath = SKIN:GetVariable('TempBannerPath','')
			local temp_bannerName = curEdit..GetExtension(temp_bannerPath)

			listGames[curEdit] = {appName = temp_appName, appPath = temp_appPath, bannerName = temp_bannerName}
			json.save(listGames,fileGames)
			if temp_bannerPath ~= '' then 
				Copy(temp_bannerPath,dirBANNERS..temp_bannerName)
			end
		end
		SKIN:Bang('[!Refresh NXT-OS\\GameDrawer][!Refresh]')
		curEdit = ''
	else
		SKIN:Bang("!CommandMeasure", "Error", 'DisplayError({type="1",title="Notice",desc="You must enter an Game Name and Path before you can continue.",lefttext=""})', "nxt-os\\system")
	end	
end

function GenerateAppID(appName)
	local appID = string.lower(string.gsub("custom_"..appName, "%s+", ""))
	local newname = ""
	local highestvalue = -1
	for k,_ in pairs(listGames) do
		local currID = tostring(k)
		local num = nil
		if currID == appID then
			num = 0
		else
			num = tonumber(currID:match(appID..'%((.-)%)$'))
		end
		if num ~= nil and num >= highestvalue then
			highestvalue = num
		end
	end
	if highestvalue == 0 then 
		newname = appID.."(2)"
	elseif highestvalue > 0 then
		newname = appID.."("..(highestvalue+1)..")"
	else
		newname = appID
	end
	return newname
end

function Copy(from,to)
	print(from,to)
	if from ~= to then 
		os.execute('copy "'..from..'" "'..to..'"')
	end
end

function GetExtension(FileName)
	if FileName ~= nil and FileName ~= '' then
		return FileName:match("^.+(%..+)$")
	else
		return ''
	end
end

function CheckBanner()
	local extension = string.lower(GetExtension(SKIN:GetVariable('TempBannerPath')))
	if extension == '.png' or extension == '.jpg' or extension == '.jpeg' then
		print("Valid Banner")
	else
		SKIN:Bang('[!SetVariable TempBannerPath ""][!Update]')
		SKIN:Bang("!CommandMeasure", "Error", 'DisplayError({type="2",title="Banner File Type",desc="Game Drawer banners must be one of the following file types: .png .jpg .jpeg",lefttext=""})', "nxt-os\\system")
	end
end