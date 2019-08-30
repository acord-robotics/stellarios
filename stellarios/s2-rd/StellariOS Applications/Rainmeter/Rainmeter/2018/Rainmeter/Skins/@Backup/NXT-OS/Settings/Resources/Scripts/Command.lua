function Initialize()
-- Grab information and set table.
	SkinsPath = SKIN:GetVariable('SKINSPATH')
	FilePath = SKIN:MakePathAbsolute(SkinsPath.."NXT-OS Data\\Commands.inc")
	info={}
	for line in io.lines(FilePath) do 
		table.insert(info, line)
	end

	max = (table.getn(info)-2)
	position = tonumber(SKIN:GetVariable('Scroll.Position'))
-- Check to show help
	if table.getn(info) < 1 then
		SKIN:Bang('!ShowMeter CommandHelpBubble')
	end 
-- Check to show scroll bar
	SKIN:Bang('!SetVariable', 'Scroll.Total', table.getn(info))
	if table.getn(info) <= 3 then
		SKIN:Bang('!HideMeterGroup Scroll')
	end
-- Make sure that position is not above the max possible
	if position > max then
		position = 1
		SKIN:Bang('!SetVariable','Scroll.Position',position)
	end
	setoptions()
end

function delete(number)
	table.remove(info, number)
	write()
	if table.getn(info) < 1 then
		SKIN:Bang('!ShowMeter CommandHelpBubble')
	end 
	setoptions()
	SKIN:Bang('!Update')
end

-- Sets options for meters.
function setoptions()
	max = (table.getn(info)-6)
	if table.getn(info) <= 7 then
		SKIN:Bang('!HideMeterGroup Scroll')
	end
	if position > max then
		if (max+6) > 7 then
			position = (position-1)
		end
	end
	if table.getn(info) <= 7 then
		position = 1
	end
	if (position % 2 == 0) then
		SKIN:Bang('[!SetOptionGroup Even SolidColor 230,230,230][!SetOptionGroup Odd SolidColor 240,240,240]')
	else
		SKIN:Bang('[!SetOptionGroup Odd SolidColor 230,230,230][!SetOptionGroup Even SolidColor 240,240,240]')
	end
	SKIN:Bang('!SetVariable', 'Scroll.Total', table.getn(info))
	SKIN:Bang('!HideMeterGroup All')
	for i=1,7 do 
		local index = i+(position-1)
		if info[index] ~= nil then
			local command, execute = string.match(info[index], "<Command>(.-)</Command><Action>(.-)</Action>")
			SKIN:Bang('!ShowMeterGroup Section'..i)
			SKIN:Bang('!SetOption','Section'..i,'Text','Key:               '..command..'#CRLF#Command:   '..execute)
			SKIN:Bang('!SetOption','Section'..i,'LeftMouseUpAction','[!CommandMeasure Command Invoke('..(i+position-1)..')]')
			SKIN:Bang('!SetOption','Delete'..i,'LeftMouseUpAction','[play #@#Sounds\\Information.wav][!ShowMeterGroup Dialogue][!SetVariable ToDelete '..(i+position-1)..'][!SetVariable ToDeleteName "'..command..'"][!Update]')
		end
	end
	SKIN:Bang('!SetVariable','Scroll.Position',position)
	SKIN:Bang('!Update')
end
--Move Functions
function ForwardShift()
	if (position) ~= max then
		if (max+6) >= 7 then
			position = position+1
			setoptions()
		end
	end
end
function BackwardShift()
	if (position) ~= 1 then
		if (max+6) >= 7 then
			position = position-1
			setoptions()
		end
	end
end
function ShiftTo(num)
	position = (num+1)
	setoptions()
end


--Bring Up Edit Menu
function Invoke(number)
	if number ~= nil then
		local command, execute = string.match(info[number], "<Command>(.-)</Command><Action>(.-)</Action>")
		SKIN:Bang('!SetVariable','TempKey',command)
		SKIN:Bang('!SetVariable','TempCommand',execute)
		SKIN:Bang('!SetOption','EditOKButton','LeftMouseUpAction','[!CommandMeasure Command Edit('..number..')]')
		SKIN:Bang('!ShowMeterGroup','Edit')
		SKIN:Bang('!Update')
	else
		SKIN:Bang('!SetVariable','TempKey','Key')
		SKIN:Bang('!SetVariable','TempCommand','Command')
		SKIN:Bang('!SetOption','EditOKButton','LeftMouseUpAction','[!CommandMeasure Command Edit()]')
		SKIN:Bang('!ShowMeterGroup','Edit')
		SKIN:Bang('!Update')
	end
end
--Insert to table
function Edit(number)
	TempKey = SKIN:GetVariable('TempKey')
	TempCommand = SKIN:GetVariable('TempCommand')
	if number ~= nil then
		info[number]="<Command>"..TempKey.."</Command><Action>"..TempCommand.."</Action>"
	else
		table.insert(info,"<Command>"..TempKey.."</Command><Action>"..TempCommand.."</Action>")
	end
	write()
	SKIN:Bang("!Refresh")
	SKIN:Bang("!Refresh NXT-OS\\Top\\Widgets\\Command")
end

--Write File
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