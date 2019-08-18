function Initialize()
	queue = {}
	current = {}
	timer = {}
	active = false
	running = false
	drawing = false
	timeractive = false
	MaxNotificationAmount = SKIN:GetMeasure('DetermineMaxNotificationAmount')
	NotificationMainTimer = SKIN:GetMeasure('Notification.MainTimer.Loop')
	DefaulDecay = SKIN:GetVariable("Notification.Duration")
	SkinsPath = SKIN:GetVariable('SKINSPATH')
	FilePath = SKIN:MakePathAbsolute(SkinsPath.."NXT-OS Data\\Notifications.inc")
	info={}
	for line in io.lines(FilePath) do 
		table.insert(info, line)
	end
end

function Update()
	local maintimer = NotificationMainTimer:GetValue()
	if timeractive then
		for k,v in pairs(timer) do
			if v < maintimer then
				if not drawing then
					DismissNotification(k)
				end
			end
		end
	end
end

function Save()
	table.sort(info)
	File = io.open(FilePath, "w+")

	if File then
		for k, v in ipairs(info) do
			File:write(v.."\n")
		end
	else
		print('WriteFile: unable to open file at ' .. FilePath)
		return
	end

	File:close()
end

function DrawAllNotifications()
	drawing = true
	local maxdisplay = MaxNotificationAmount:GetValue()
	local maxtable = table.getn(current)
	local maintimer = NotificationMainTimer:GetValue()
	local currentcounter = 0
	timer = {}
	timeractive = false
	if maxtable >= maxdisplay then 
		max = maxdisplay
	else 
		max = maxtable
	end
	SKIN:Bang("!HideMeterGroup","AllNotifications")
	for i=1,max do 
		local index = ((maxtable-i)+1)
		if current[index]["style"] == "1" then
			SKIN:Bang("!SetOption","Notification.Background."..i, "LeftMouseUpAction", current[index]["clickaction"].."[!commandmeasure Notify DismissNotification("..i..")][!UpdateMeterGroup Animate][!UpdateMeasureGroup Animate][!Redraw]")
			SKIN:Bang("!SetOption","Notification.Body."..i, "W", "241")
			timer[i] = current[index]["time"]
		elseif current[index]["style"] == "2" then
			SKIN:Bang("!ShowMeter","Notification.CloseButton."..i)
			SKIN:Bang("!SetOption","Notification.CloseButton."..i, "LeftMouseUpAction", "[!commandmeasure Notify DismissNotification("..i..")][!UpdateMeterGroup Animate][!UpdateMeasureGroup Animate][!Redraw]")
			if current[index]["clickaction"] ~= "" then
				SKIN:Bang("!SetOption","Notification.Background."..i, "LeftMouseUpAction", current[index]["clickaction"].."[!commandmeasure Notify DismissNotification("..i..")][!UpdateMeterGroup Animate][!UpdateMeasureGroup Animate][!Redraw]")
			else
				SKIN:Bang("!SetOption","Notification.Background."..i, "LeftMouseUpAction", "")
			end
			SKIN:Bang("!SetOption","Notification.Body."..i, "W", "200")
		elseif current[index]["style"] == "3" then
			SKIN:Bang("!ShowMeterGroup","NotificationOptions"..i)
			SKIN:Bang("!SetOption","Notification.FirstOption."..i, "Text", current[index]["topbuttontext"])
			SKIN:Bang("!SetOption","Notification.FirstOption."..i, "LeftMouseUpAction", current[index]["topbuttonaction"].."[!commandmeasure Notify DismissNotification("..i..")][!UpdateMeterGroup Animate][!UpdateMeasureGroup Animate][!Redraw]")
			SKIN:Bang("!SetOption","Notification.SecondOption."..i, "Text", current[index]["bottombuttontext"])
			SKIN:Bang("!SetOption","Notification.SecondOption."..i, "LeftMouseUpAction", current[index]["bottombuttonaction"].."[!commandmeasure Notify DismissNotification("..i..")][!UpdateMeterGroup Animate][!UpdateMeasureGroup Animate][!Redraw]")
			SKIN:Bang("!SetOption","Notification.Background."..i, "LeftMouseUpAction", "")
			SKIN:Bang("!SetOption","Notification.Body."..i, "W", "141")			
		end
		if current[index]["tint"] == "1" then
			SKIN:Bang("!SetOption","Notification.Icon."..i, "ImageTint", "#MainColor#")
		else
			SKIN:Bang("!SetOption","Notification.Icon."..i, "ImageTint", "")
		end
		SKIN:Bang("!SetOption","Notification.Icon."..i, "ImageName", current[index]["icon"])
		SKIN:Bang("!SetOption","Notification.Title."..i, "Text", current[index]["title"])
		SKIN:Bang("!SetOption","Notification.Body."..i, "Text", current[index]["body"])
		SKIN:Bang("!ShowMeterGroup","Notification"..i)
	end
	for k,v in pairs(timer) do
		currentcounter = (currentcounter+1)
	end
	if currentcounter > 0 then
		timeractive = true
	end
	drawing = false
end

function DismissNotification(num)
	local maxtable = table.getn(current)
	local index = ((maxtable-num)+1)
	table.remove(current,index)
	DrawAllNotifications()
end
function DisplayNotification()
	local maintimer = NotificationMainTimer:GetValue()
	local currentamount = table.getn(current)
	running = true
	local value = table.remove(queue, 1)
	if value["sound"] ~= "0" then 
		if value["sound"] == "1" then
			SKIN:Bang("Play #@#Sounds\\Notify_Normal.wav")
		elseif value["sound"] == "2" then
			SKIN:Bang("Play #@#Sounds\\Notify_Remind.wav")
		else
			SKIN:Bang("Play",value["sound"])
		end
	end
	if value["style"] == "1" then
		SKIN:Bang("!HideMeter","Notification.CloseButton.Trigger")
		SKIN:Bang("!HideMeter","Notification.Separator.Trigger")
		SKIN:Bang("!SetOption","Notification.Body.Trigger", "W", "241")
		if (maintimer+DefaulDecay) > 3600 then
			value["time"] = ((maintimer+DefaulDecay)-3600)
		else
			value["time"] = (maintimer+DefaulDecay)
		end
	elseif value["style"] == "2" then
		SKIN:Bang("!ShowMeter","Notification.CloseButton.Trigger")
		SKIN:Bang("!HideMeter","Notification.Separator.Trigger")
		SKIN:Bang("!HideMeter","Notification.FirstOption.Trigger")
		SKIN:Bang("!HideMeter","Notification.SecondOption.Trigger")
		SKIN:Bang("!SetOption","Notification.Body.Trigger", "W", "200")
	elseif value["style"] == "3" then
		SKIN:Bang("!HideMeter","Notification.CloseButton.Trigger")
		SKIN:Bang("!ShowMeter","Notification.Separator.Trigger")
		SKIN:Bang("!ShowMeter","Notification.FirstOption.Trigger")
		SKIN:Bang("!ShowMeter","Notification.SecondOption.Trigger")
		SKIN:Bang("!SetOption","Notification.FirstOption.Trigger", "Text", value["topbuttontext"])
		SKIN:Bang("!SetOption","Notification.SecondOption.Trigger", "Text", value["bottombuttontext"])
		SKIN:Bang("!SetOption","Notification.Body.Trigger", "W", "141")
	else
		print('NX-OS Notify: An invalid notification type was passed for a notification from '..value["name"])
		FinishDisplayNotification()
		return
	end
	if value["tint"] == "1" then
		SKIN:Bang("!SetOption","Notification.Icon.Trigger", "ImageTint", "#MainColor#")
	else
		SKIN:Bang("!SetOption","Notification.Icon.Trigger", "ImageTint", "")
	end
	SKIN:Bang("!SetOption","Notification.Icon.Trigger", "ImageName", value["icon"])
	SKIN:Bang("!SetOption","Notification.Title.Trigger", "Text", value["title"])
	SKIN:Bang("!SetOption","Notification.Body.Trigger", "Text", value["body"])
	SKIN:Bang("!Update")
	if currentamount > 0 then 
		SKIN:Bang("!CommandMeasure","Animate", "Execute 2")
		table.insert(current,value)
	else
		SKIN:Bang("!CommandMeasure","Animate", "Execute 1")
		table.insert(current,value)
	end
end

function FinishDisplayNotification()
	DrawAllNotifications()
	running = false
	if table.getn(queue) < 1 then
		active = false
	else
		DisplayNotification()
	end
end

function notify(temp)
	if type(temp) == "table" then
		local parameters = {name = nil, group = nil, style = nil, sound = '0', icon = nil, tint = '1', title = nil, body = nil, clickaction = '', topbuttontext = nil, bottombuttontext = nil, topbuttonaction = nil, bottombuttonaction = nil}
		for k,v in pairs(temp) do
			parameters[k] = tostring(v)
		end
		if parameters.name == nil or parameters.group == nil or parameters.style == nil or parameters.icon == nil or parameters.title == nil or parameters.body == nil then 
			print('NXT-OS Notify: The parameters were not passed correctly.')
			return
		end
		if parameters.style == "3" then
			if parameters.topbuttontext == nil or parameters.bottombuttontext == nil or parameters.topbuttonaction == nil or parameters.bottombuttonaction == nil then
				print('NXT-OS Notify: The parameters for the 3 button notification style were not passed correctly.')
				return
			end
		end
		found = false
		allow = false
	-- Check the Cache files to see if that notification has an entry, if it does set found to true if not then add it to the table.
		if parameters.name == "~~" then
			found = true
			allow = true
		else
			if table.getn(info) > 0 then
				for k,v in pairs(info) do
					local storedname, storedgroup, storedallow = string.match(v, "<Name>(.-)</Name><Group>(.-)</Group><Allow>(.-)</Allow>")
					if storedname == parameters.name then
						if storedgroup == parameters.group then
							found = true
							if storedallow == "true" then
								allow = true
							end
							break
						end
					end
				end
			end			
		end
		parameters.title = SKIN:ReplaceVariables(parameters.title)
		parameters.body = SKIN:ReplaceVariables(parameters.body)
		parameters.icon = string.gsub(parameters.icon,"%$SkinsPath%$",SkinsPath) 
		parameters.sound = string.gsub(parameters.sound,"%$SkinsPath%$",SkinsPath)
		if found then
			if allow then
				table.insert(queue, parameters)
				if not running then
					DisplayNotification()
				end
			end
		else
			table.insert(info,"<Name>"..parameters.name.."</Name><Group>"..parameters.group.."</Group><Allow>true</Allow>")
			table.insert(queue, parameters)
			if not running then
				DisplayNotification()
			end
			Save()
		end
	else
		print('NXT-OS Notify: The parameters were not passed as a table. Make sure that all parameters are between "{}".')
	end
end