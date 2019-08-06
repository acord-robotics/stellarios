function Initialize()
-- Grab allrmation and set table.
	SkinsPath = SKIN:GetVariable('SKINSPATH')
	FilePath = SKIN:MakePathAbsolute(SkinsPath.."NXT-OS Data\\Reminders.inc")
	all={}
	uncompleted={}
	completed={}
	for line in io.lines(FilePath) do 
		table.insert(all, {nil,line})
	end
	displaying = 0
	position = 0
	lock = false
	deleteshowing = false
	tab = "all"
	active = all
	SetOptions()
end

function switch(mytable)
	tab = mytable
	SKIN:Bang('!SetOptionGroup','Tabs','MeterStyle','Window.Element.Tab.inActive')
	if tab == "all" then
		active = all
		SKIN:Bang('!SetOption','TabAll','MeterStyle','Window.Element.Tab.Active')
	elseif tab == "uncompleted" then
		active = uncompleted
		SKIN:Bang('!SetOption','TabUncompleted','MeterStyle','Window.Element.Tab.Active')
	elseif tab == "completed" then
		active = completed
		SKIN:Bang('!SetOption','TabCompleted','MeterStyle','Window.Element.Tab.Active')
	end
	position = 0
	SKIN:Bang("!SetVariable","position",position)
	SetOptions()
	refreshdelete()
end

function SetOptions()
	displaying = 0
	if not deleteshowing then
		max = (table.getn(active)+1)
	else
		max = table.getn(active)
	end
	SKIN:Bang("!SetVariable","Total",max)
	if max <= 14 then
		SKIN:Bang("!HideMeterGroup Scroll")
	else
		SKIN:Bang("!ShowMeterGroup Scroll")
	end
	SKIN:Bang("!HideMeterGroup All")
	for i=1,14 do
		local index = (i+position)
		if active[index] ~= nil then
			local key = active[index][1]
			local info = active[index][2]
			if key == nil then
				key = index
			end
			local text, date, done, remind, reminded = string.match(info, "<Text>(.-)</Text><Date>(.-)</Date><Done>(.-)</Done><Remind>(.-)</Remind><Reminded>(.-)</Reminded>")
			if text == nil and date == nil and done == nil and remind == nil and reminded == nil then
				text, date, done, remind = string.match(info, "<Text>(.-)</Text><Date>(.-)</Date><Done>(.-)</Done><Remind>(.-)</Remind>")
				reminded = "0"
			end
			if done == "0" and reminded == "1" then 
				SKIN:Bang('!SetOption','TextBox'..i,'FontColor',"255,0,0")
			else
				SKIN:Bang('!SetOption','TextBox'..i,'FontColor',"80,80,80")
			end
			SKIN:Bang('!SetOption','TextBox'..i,'Text',text)
			SKIN:Bang('!SetOption','TextBox'..i,'LeftMouseUpAction','[!CommandMeasure "Reminders" "edit('..i..','..key..')"]')
			SKIN:Bang('!SetOption','TextBox'..i, 'MouseOverAction', '[!ShowMeter "Info'..i..'"][!Redraw]')
			SKIN:Bang('!SetOption','TextBox'..i, 'MouseLeaveAction', '[!HideMeter "Info'..i..'"][!Redraw]')
			SKIN:Bang('!SetOption','CheckBox'..i,'ImageName','Resources\\Images\\Check'..done..'.png')
			SKIN:Bang('!SetOption','CheckBox'..i,'LeftMouseUpAction','[!CommandMeasure "Reminders" "toggle('..i..','..key..')"]')
			SKIN:Bang('!SetOption','Delete'..i,'LeftMouseUpAction','[!CommandMeasure "Reminders" "delete('..i..','..key..')"]')
			SKIN:Bang('!SetOption','Info'..i,'LeftMouseUpAction','[!CommandMeasure Reminders "Edit('..key..')"]')
			SKIN:Bang('!ShowMeter','CheckBox'..i)
			SKIN:Bang('!ShowMeter','TextBox'..i)
			displaying = i
		elseif index == max and not deleteshowing then
			SKIN:Bang('!SetOption','CheckBox'..i,'ImageName','Resources\\Images\\Plus.png')
			SKIN:Bang('!SetOption','CheckBox'..i,'LeftMouseUpAction','')
			SKIN:Bang('!SetOption','TextBox'..i,'Text',"")
			SKIN:Bang('!SetOption','TextBox'..i,'LeftMouseUpAction','[!CommandMeasure "Reminders" "edit('..i..','..(table.getn(all)+1)..')"]')
			SKIN:Bang('!SetOption','TextBox'..i, 'MouseOverAction', '')
			SKIN:Bang('!SetOption','TextBox'..i, 'MouseLeaveAction', '')
			SKIN:Bang("!HideMeter","Info"..i)
			SKIN:Bang("!ShowMeter","CheckBox"..i)
			SKIN:Bang("!ShowMeter","TextBox"..i)
			SKIN:Bang('!Update')
			break
		else
			break
		end
	end
	SKIN:Bang('!Update')
end

function toggle(num,index)
	local text, date, done, remind, reminded = string.match(all[index][2], "<Text>(.-)</Text><Date>(.-)</Date><Done>(.-)</Done><Remind>(.-)</Remind><Reminded>(.-)</Reminded>")
	if text == nil and date == nil and done == nil and remind == nil and reminded == nil then
		text, date, done, remind = string.match(all[index][2], "<Text>(.-)</Text><Date>(.-)</Date><Done>(.-)</Done><Remind>(.-)</Remind>")
		reminded = "0"
	end
	if done == "0" then
		all[index][2]="<Text>"..text.."</Text><Date>"..date.."</Date><Done>1</Done><Remind>"..remind.."</Remind><Reminded>"..reminded.."</Reminded>"
		SKIN:Bang('!SetOption','TextBox'..num,'FontColor',"80,80,80")
		SKIN:Bang('!SetOption','CheckBox'..num,'ImageName','Resources\\Images\\Check1.png')
	elseif done == "1" then
		all[index][2]="<Text>"..text.."</Text><Date>"..date.."</Date><Done>0</Done><Remind>"..remind.."</Remind><Reminded>"..reminded.."</Reminded>"
		if reminded == "1" then 
			SKIN:Bang('!SetOption','TextBox'..num,'FontColor',"255,0,0")
		else
			SKIN:Bang('!SetOption','TextBox'..num,'FontColor',"80,80,80")
		end
		SKIN:Bang('!SetOption','CheckBox'..num,'ImageName','Resources\\Images\\Check0.png')
	end
	SKIN:Bang('!Update')
	write()
	if tab ~= "all" then 
		SetOptions()
	end
end

function edit(num,index)
	if not deleteshowing then
		lock = true
		local meter = SKIN:GetMeter("TextBox"..num)
		local x = (tonumber(meter:GetX())-4)
		local y = (tonumber(meter:GetY())+7)
		local currtext = meter:GetOption('Text')
		SKIN:Bang('!SetOption','Input','DefaultValue',currtext)
		SKIN:Bang('!SetOption','Input','Command1', '[!SetOption Reminders Input """$UserInput$"""][!CommandMeasure Reminders commit('..num..','..index..')] y='..y..' x='..x)
		SKIN:Bang('!CommandMeasure Input "ExecuteBatch 1"')
	end
end

function commit(num,index)
	lock = false
	local input = SELF:GetOption("Input")
	if all[index] ~= nil then
		local text, date, done, remind, reminded = string.match(all[index][2], "<Text>(.-)</Text><Date>(.-)</Date><Done>(.-)</Done><Remind>(.-)</Remind><Reminded>(.-)</Reminded>")
		if text == nil and date == nil and done == nil and remind == nil and reminded == nil then
			text, date, done, remind = string.match(all[index][2], "<Text>(.-)</Text><Date>(.-)</Date><Done>(.-)</Done><Remind>(.-)</Remind>")
			reminded = "0"
		end
		all[index][2]="<Text>"..input.."</Text><Date>"..date.."</Date><Done>"..done.."</Done><Remind>"..remind.."</Remind><Reminded>"..reminded.."</Reminded>"
		write()
		SKIN:Bang('!SetOption','TextBox'..num,'Text',input)
		SKIN:Bang('!Update')
	elseif input ~= "" then
		table.insert(all,{(table.getn(all)+1),"<Text>"..input.."</Text><Date>None</Date><Done>0</Done><Remind>0</Remind><Reminded>0</Reminded>"})
		write()
		SetOptions()
		scrolldown()
	end
end

function delete(num,index)
	table.remove(all,index)
	write()
	if position >= (max-14) then
		scrolltobottom(1,false)
	end
	SetOptions()
	refreshdelete()
end

function scrollto(num)
	if not lock then
		position = num
		SKIN:Bang("!SetVariable","position",position)
		SetOptions()
	end
end

function scrollup()
	if not lock then
		if position > 0 then
			position = position-1
			SKIN:Bang("!SetVariable","position",position)
			SetOptions()
		end
	end
end

function scrolldown()
	if not lock then
		if position < max-14 then
			position = position+1
			SKIN:Bang("!SetVariable","position",position)
			SetOptions()
		end
	end
end

function scrolltobottom(offset,set)
	if offset == nil then
		offset = 0
	end
	if set == nil then
		set = true
	end
	if (max-(14+(offset))) > 0 then
		position = (max-(14+(offset)))
		SKIN:Bang("!SetVariable","position",position)
		if set then
			SetOptions()
		end
	end
end

function add()
	if not deleteshowing then
		scrolltobottom(0,true)
		edit(displaying+1,(table.getn(all)+1))
	else
		deleteshowing = false
		scrolltobottom(-1,false)
		SKIN:Bang("!HideMeterGroup Delete")	
		SetOptions()
		edit(displaying+1,(table.getn(all)+1))
	end
end

function showdelete()
	if not deleteshowing then
		deleteshowing = true
		SKIN:Bang("!SetOption", "Window.Title.Button.Trash", "ButtonImage", "#SKINSPATH#NXT-OS\\@Resources\\Images\\Done.png")
		if position > 0 then
			if position > (max-15)then
				position=(max-15)
				SKIN:Bang("!SetVariable","position",position)
			end
		end
		SetOptions()
		for i=1,displaying do
			SKIN:Bang("!ShowMeter Delete"..i)
		end
		SKIN:Bang("!Redraw")
	elseif deleteshowing then
		SKIN:Bang("!SetOption", "Window.Title.Button.Trash", "ButtonImage", "#SKINSPATH#NXT-OS\\@Resources\\Images\\Trash.png")
		deleteshowing = false
		SetOptions()
		SKIN:Bang("!HideMeterGroup Delete")
	end
end

function refreshdelete()
	if deleteshowing then
		SKIN:Bang("!HideMeterGroup Delete")
		for i=1,displaying do
			SKIN:Bang("!ShowMeter Delete"..i)
		end
		SKIN:Bang("!Redraw")
	end
end

function unlock()
	lock = false
end


function write()
	File = io.open(FilePath, "w+")
	if not File then
		print('WriteFile: unable to open file at ' .. FilePath)
		return
	end
	for k, v in pairs(all) do
		File:write(v[2].."\n")
	end
	File:close()
	SKIN:Bang('!CommandMeasure','RemindersNotification','Initialize()','NXT-OS\\System\\Listeners\\NotificationsAndHud')
	SKIN:Bang('!Refresh','NXT-OS\\Reminders')
end

-- Calendar/Time Functions

function StartCal()
	-- If in the current month or if browsing and Month changes to that month, set to Real Time
	if (Time.stats.inmonth and Time.show.month ~= Time.curr.month) or ((not Time.stats.inmonth) and Time.show.month == Time.curr.month and Time.show.year == Time.curr.year) then
		MoveCal()
	end

	if Time.show.month ~= Time.old.month or Time.show.year ~= Time.old.year then -- Recalculate and Redraw if Month and/or Year changes
		Time.old = {month = Time.show.month, year = Time.show.year, day = Time.curr.day}
		String = DrawCal()
	elseif Time.curr.day ~= Time.old.day then -- Redraw if Today changes
		Time.old.day = Time.curr.day
		String = DrawCal()
	end
end -- Update

Time = { -- Used to store and call date functions and statistics
	curr = setmetatable({}, {__index = function(_, index) return os.date('*t')[index] end,}),
	old = {day = 0, month = 0, year = 0,},
	show = {month = 0, year = 0,},
	timestamp = {},
	stats = setmetatable({inmonth = true,}, {__index = function(_, index)
		local tstart = os.time{day = 1, month = Time.show.month, year = Time.show.year, isdst = false,}
		local nstart = os.time{day = 1, month = (Time.show.month % 12 + 1), year = (Time.show.year + (Time.show.month == 12 and 1 or 0)), isdst = false,}
		
		return ({
			clength = ((nstart - tstart) / 86400),
			plength = tonumber(os.date('%d', tstart - 86400)),
			startday = tonumber(os.date('%w', tstart)),
		})[index]
	end,}),
} -- Time

Adjusting = "hour"
Editing = false
TimeMod = 0

function DrawCal() -- Sets all meter properties and calculates days	
	local StartDay = Time.stats.startday
	local MonthLength = Time.stats.clength
	local PreviousMonth = Time.stats.plength
	local current = Time.stats.inmonth and Time.curr.day or 0
	SKIN:Bang('[!SetOptionGroup Cells Text " "][!SetOptionGroup Cells SolidColor " "][!SetOptionGroup Cells FontColor 80,80,80][!SetOptionGroup Cells StringStyle Normal]')
	SKIN:Bang('!SetOption','Cal.Month','Text',os.date('%B %Y', os.time{month = Time.show.month, day = 1, year = Time.show.year, isdst = false,}))
	os.setlocale('', 'time')
	for i = 0, 5 do
		for j = 1, 7 do
			local day = i * 7 + j - StartDay
			local style = nil
			local timestampn = os.time{year=Time.show.year, month=Time.show.month, day=day}
			if day < 1 then
				day = nil
			elseif day > MonthLength then
				day = nil
			elseif day == current then
				style = true
			end
			if day ~= nil then
				SKIN:Bang('!SetOption','Cal.Cell.'..((i*7)+j),'text',day)
				SKIN:Bang('!SetOption','Cal.Cell.'..((i*7)+j),'LeftMouseUpAction','[!Commandmeasure Reminders SetCalTimeStamp('..timestampn..')]')
				if Time.show.year == Time.timestamp.year and Time.show.month == Time.timestamp.month and Time.timestamp.day == day then
					SKIN:Bang('!SetOption','Cal.Cell.'..((i*7)+j),'SolidColor','0,168,255,128')
				else
					if style then
						SKIN:Bang('!SetOption','Cal.Cell.'..((i*7)+j),'FontColor','0,168,255')
						SKIN:Bang('!SetOption','Cal.Cell.'..((i*7)+j),'StringStyle','Bold')
					end
				end
			end
		end
	end
	SKIN:Bang("!Update")
end -- Draw

function MoveCal(value) -- Move calendar through the months
	if value then assert(tonumber(value), string.format('Move: input must be a number. Received %s instead.', type(value))) end
	if not value then
		Time.show = Time.curr
	elseif math.ceil(value) == value then
		local mvalue = Time.show.month + value - (math.modf(value / 12)) * 12
		local mchange = value < 0 and (mvalue < 1 and 12 or 0) or (mvalue > 12 and -12 or 0)
		Time.show = {month = (mvalue + mchange), year = (Time.show.year + (math.modf(value / 12)) - mchange / 12),}
	end

	Time.stats.inmonth = Time.show.month == Time.curr.month and Time.show.year == Time.curr.year
	StartCal()
end -- Move

function SetTimeStamp(timestamp)
	timestamp = tonumber(timestamp)
	local timet = os.date("*t", timestamp)
	Time.timestamp = timet
	Time.show = {month = timet.month, year = timet.year,}
	Time.stats.inmonth = Time.show.month == Time.curr.month and Time.show.year == Time.curr.year
	DrawCal()
	DrawTime()
end

function SetCalTimeStamp(timestamp)
	timestamp = tonumber(timestamp)
	local timet = os.date("*t", timestamp)
	Time.timestamp.day = timet.day
	Time.timestamp.month = timet.month
	Time.timestamp.year = timet.year
	Time.timestamp.isdst = timet.isdst
	Time.show = {month = timet.month, year = timet.year,}
	Time.stats.inmonth = Time.show.month == Time.curr.month and Time.show.year == Time.curr.year
	DrawCal()
	DrawTime()
end

-- Time Set Functions

function DrawTime()
	Editing = false
	SKIN:Bang('!SetOptionGroup','TimeAdjust','SolidColor','0,0,0,0')
	if Time.timestamp.hour > 11 and Time.timestamp.hour < 24 then 
		TimeMod = 12
		SKIN:Bang('!SetOption','Cal.Time.Adjust.Mod','Text','PM')
	else 
		TimeMod = 0
		SKIN:Bang('!SetOption','Cal.Time.Adjust.Mod','Text','AM')
	end
	SKIN:Bang('!SetOption','Cal.Time.Adjust.Hours','Text',12-((12-Time.timestamp.hour)%12))
	if Time.timestamp.min < 10 then
		SKIN:Bang('!SetOption','Cal.Time.Adjust.Minutes','Text','0'..tostring(Time.timestamp.min))
	else
		SKIN:Bang('!SetOption','Cal.Time.Adjust.Minutes','Text',Time.timestamp.min)
	end
	SKIN:Bang('!Update')
end


function SwitchTimeSet(name)
	SKIN:Bang('!SetOptionGroup','TimeAdjust','SolidColor','0,0,0,0')
	if name == "hour" then
		Adjusting = "hour"
		SKIN:Bang('!SetOption','Cal.Time.Adjust.Hours','SolidColor','0,168,255,128')
	elseif name == "min" then
		Adjusting = "min"
		SKIN:Bang('!SetOption','Cal.Time.Adjust.Minutes','SolidColor','0,168,255,128')
	elseif name == "mod" then
		Adjusting = "mod"
		SKIN:Bang('!SetOption','Cal.Time.Adjust.Mod','SolidColor','0,168,255,128')
	end
	SKIN:Bang('!Update')
end

function AdjustTime(num)
	if Adjusting == "hour" then
		if not Editing then
			Editing = true
			SKIN:Bang('!SetOption','Cal.Time.Adjust.Hours','SolidColor','0,168,255,128')
		end
		local hour = 12-((12-Time.timestamp.hour)%12)
		if (hour + (num)) < 1 then
			hour = 12
		elseif (hour + (num)) > 12 then
			hour = 1
		else
			hour = (hour + (num))
		end
		SKIN:Bang('!SetOption','Cal.Time.Adjust.Hours','Text',hour)
		if hour+TimeMod == 12 then
			Time.timestamp.hour = 0
		elseif hour+TimeMod < 24 and hour+TimeMod > 0 then
			Time.timestamp.hour = hour+TimeMod
		else 
			Time.timestamp.hour = 12
		end
	elseif Adjusting == "min" then
		if (Time.timestamp.min + (num)) < 0 then
			Time.timestamp.min = 59
		elseif (Time.timestamp.min + (num)) > 59 then
			Time.timestamp.min = 0
		else
			Time.timestamp.min = (Time.timestamp.min + (num))
		end
		if Time.timestamp.min < 10 then
			SKIN:Bang('!SetOption','Cal.Time.Adjust.Minutes','Text','0'..tostring(Time.timestamp.min))
		else
			SKIN:Bang('!SetOption','Cal.Time.Adjust.Minutes','Text',Time.timestamp.min)
		end
	elseif Adjusting == "mod" then
		if TimeMod == 0 then
			TimeMod = 12
			SKIN:Bang('!SetOption','Cal.Time.Adjust.Mod','Text','PM')
		elseif TimeMod == 12 then
			TimeMod = 0
			SKIN:Bang('!SetOption','Cal.Time.Adjust.Mod','Text','AM')
		end
		local hour = 12-((12-Time.timestamp.hour)%12)
		if hour+TimeMod == 12 then
			Time.timestamp.hour = 0
		elseif hour+TimeMod < 24 and hour+TimeMod > 0 then
			Time.timestamp.hour = hour+TimeMod
		else 
			Time.timestamp.hour = 12
		end
	end
	SKIN:Bang('!Update')
end

--Save Function
function SaveTimeStamp()
	local time = os.time(Time.timestamp)
	local text, date, done, remind = string.match(all[CurrentEdit][2], "<Text>(.-)</Text><Date>(.-)</Date><Done>(.-)</Done><Remind>(.-)</Remind>")
	all[CurrentEdit][2] = "<Text>"..text.."</Text><Date>"..time.."</Date><Done>"..done.."</Done><Remind>"..CurrentRemind.."</Remind><Reminded>0</Reminded>"
	write()
	SetOptions()
	SKIN:Bang('!SetOptionGroup TextBoxes MouseActionCursor 1')
	SKIN:Bang('!SetOptionGroup InfoButtons MouseActionCursor 1')
	SKIN:Bang('[!HideMeterGroup "TimeSetBoxFull"][!Update]')
end

--Call functions to bring up calendar
function Edit(index)
	StartCal()
	local text, date, done, remind = string.match(all[index][2], "<Text>(.-)</Text><Date>(.-)</Date><Done>(.-)</Done><Remind>(.-)</Remind>")
	CurrentEdit = tonumber(index)
	CurrentRemind = remind
	SKIN:Bang('!SetOptionGroup TextBoxes MouseActionCursor 0')
	SKIN:Bang('!SetOptionGroup InfoButtons MouseActionCursor 0')
	SKIN:Bang('!SetOption','TimeSetBox.Title','Text',text)
	SKIN:Bang('!ShowMeterGroup','TimeSetBoxBase')
	if remind == "1" then
		SKIN:Bang('!SetOption','TimeSetBox','H','416')
		SKIN:Bang('!SetOption','Remind.Switch','ImageName','#@#Images\\Switch_0')
		SKIN:Bang('!ShowMeterGroup','TimeSetCalTime')
	else
		SKIN:Bang('!SetOption','TimeSetBox','H','120')
		SKIN:Bang('!SetOption','Remind.Switch','ImageName','#@#Images\\Switch_1')
		SKIN:Bang('!HideMeterGroup','TimeSetCalTime')
	end
	if date == "None" then
		Call(0)
	elseif tonumber(date) then
		Call(tonumber(date))
	else
		Call(0)
	end 
end

function SwitchRemind()
	if CurrentRemind == "1" then
		CurrentRemind = "0"
		SKIN:Bang('!SetOption','TimeSetBox','H','120')
		SKIN:Bang('!SetOption','Remind.Switch','ImageName','#@#Images\\Switch_1')
		SKIN:Bang('!HideMeterGroup','TimeSetCalTime')
	else
		CurrentRemind = "1"
		SKIN:Bang('!SetOption','TimeSetBox','H','416')
		SKIN:Bang('!SetOption','Remind.Switch','ImageName','#@#Images\\Switch_0')
		SKIN:Bang('!ShowMeterGroup','TimeSetCalTime')
	end
	SKIN:Bang('!Update')
end

function Call(timestamp)
	if timestamp == 0 then
		local temptable = os.date("*t",(os.time()+3600))
		temptable.min = 0
		temptable.sec = 0
		Time.timestamp = temptable
	else
		Time.timestamp = os.date("*t",timestamp)
	end
	SwitchTimeSet("hour")
	SetTimeStamp(os.time(Time.timestamp))
end