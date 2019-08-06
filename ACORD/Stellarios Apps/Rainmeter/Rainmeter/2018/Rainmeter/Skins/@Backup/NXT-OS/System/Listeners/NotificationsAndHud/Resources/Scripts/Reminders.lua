function Initialize()
	SkinsPath = SKIN:GetVariable('SKINSPATH')
	FilePath = SKIN:MakePathAbsolute(SkinsPath.."NXT-OS Data\\Reminders.inc")
	info = {}
	time = {}
	lock = false
	local i = 1
	for line in io.lines(FilePath) do 
		table.insert(info, line)
		local text, date, done, remind, reminded = string.match(line, "<Text>(.-)</Text><Date>(.-)</Date><Done>(.-)</Done><Remind>(.-)</Remind><Reminded>(.-)</Reminded>")
		if text == nil and date == nil and done == nil and remind == nil and reminded == nil then
			text, date, done, remind = string.match(line, "<Text>(.-)</Text><Date>(.-)</Date><Done>(.-)</Done><Remind>(.-)</Remind>")
			reminded = "0"
		end
		if remind == "1" and done == "0" and reminded == "0" then
			if tonumber(date) then
				table.insert(time,{i,tonumber(date)})
			end
		end
		i = i + 1
	end
end

function Update()
	if table.getn(time) > 0 and not lock then
		for k,v in ipairs(time) do
			if v[2] <= os.time() then 
				Notify(v[1],k)
			end
		end
	end
end

function Notify(num,key)
	lock = true
	local text, date, done, remind = string.match(info[num], "<Text>(.-)</Text><Date>(.-)</Date><Done>(.-)</Done><Remind>(.-)</Remind>")
	local body = text:gsub("\\", "\\\\")
	local body = body:gsub("'", "\\'")
	SKIN:Bang('!CommandMeasure','Notify', "notify({name = 'Reminders', group = 'Reminders', sound = '2', style = '2', icon = '$SkinsPath$NXT-OS\\\\@Resources\\\\Images\\\\Icons\\\\Reminders.png', title = 'Reminder', body = '"..body.."', clickaction = '[!ActivateConfig NXT-OS\\\\Reminders Reminders.ini]'})",'NXT-OS\\Notify')
	info[num] = "<Text>"..text.."</Text><Date>"..date.."</Date><Done>"..done.."</Done><Remind>"..remind.."</Remind><Reminded>1</Reminded>"
	table.remove(time,key)
	write()
	SKIN:Bang('!Refresh','NXT-OS\\Dash\\Widgets\\Reminders')
	lock = false
end

function write()
	File = io.open(FilePath, "w+")
	if not File then
		print('WriteFile: unable to open file at ' .. FilePath)
		return
	end
	for k, v in pairs(info) do
		File:write(v.."\n")
	end
	File:close()
end