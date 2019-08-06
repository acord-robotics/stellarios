function Initialize()
	json = loadfile(SKIN:GetVariable('@')..'Scripts\\Json.lua')() -- Include the JSON lib

	Input 				= ''

	dirSKINSPATH     	= SKIN:GetVariable('SKINSPATH')
	dirDATA          	= SKIN:MakePathAbsolute(dirSKINSPATH.."NXT-OS Data\\")
	fileCACHE			= dirDATA..'AppsCache.json'
	fileCOMMANDS		= dirDATA..'Commands.inc'

	bolShowPath			= false
	if SKIN:GetVariable('Scout.ShowPath','1') == '0' then bolShowPath = true end 
	bolManualSelect 	= false

	curSelect			= 1
	curMax				= 1
	curIcon				= 'Scout.png'

	tblCache = json.load(fileCACHE)
	if type(tblCache) ~= 'table' then tblCache = {} end 

	tblBuiltInCommands  = {
		{command = 'google', action = 'https://www.google.com/search?q=#Action#'},
		{command = 'g', action = 'https://www.google.com/search?q=#Action#'},
		{command = 'info', action = '[!ActivateConfig NXT-OS\\info info.ini]'},
		{command = 'help', action = '[!ActivateConfig "NXT-OS\\System\\Help" "Help.ini"][!CommandMeasure "Script" """GoTo("Scout")""" "NXT-OS\\System\\Help"]'},
		{command = 'settings', action = '[!ActivateConfig NXT-OS\\settings settings.ini]'},
		{command = 'eeeh', action = '["Play #@#Sounds\\Notice2.wav"]'}
	} 
	tblCommands 		= ReadInfoFile(fileCOMMANDS)
	for k,v in ipairs(tblBuiltInCommands) do table.insert(tblCommands, v) end
	tblDraw 			= {}
end

function ChangeSelect(num)
	local Select = curSelect + (num)
	if Select > 0 and Select < (curMax+1) then
		curSelect = Select
		SKIN:Bang('[!SetOptionGroup Items MeterStyle "ItemStyle"][!SetOption Item'..curSelect..' MeterStyle "ItemStyle|ItemActiveStyle"][!Update]')
	end
end

function Close() -- Ensure that all actions are carried out if the user has clicked on a list item with the mouse. 
	if not bolManualSelect then
		SKIN:Bang('[!DeactivateConfig]')
	end
end

function MSelect(num)
	SKIN:Bang('[!HideFade]')
	bolManualSelect = true
	curSelect = num
	SKIN:Bang('[!SetOptionGroup Items MeterStyle "ItemStyle"][!SetOption Item'..curSelect..' MeterStyle "ItemStyle|ItemActiveStyle"][!Update]')
	local hits = tblDraw[curSelect]['scoutHits'] or 0
	tblDraw[curSelect]['scoutHits'] = hits + 1
	json.save(tblCache,fileCACHE)
	Run(tblDraw[curSelect]['itemPath'])
	SKIN:Bang('[!DeactivateConfig]')
end

function Execute()
	local input = tostring(SELF:GetOption("Input"))
	if input ~= nil and input ~= '' then
		if string.sub(input,1,1) == "/" then
			input = string.sub(input,2)
			local commandinput = string.match(input, "(%a+)")
			local actioninput = string.match(input, "%s(.+)")
			if commandinput ~= nil then 
				for k, v in pairs(tblCommands) do
					if string.lower(commandinput) == string.lower(v.command) then
						SKIN:Bang("!SetVariable", "Action", actioninput)
						Run(v.action)
					end
				end
				SKIN:Bang('[!CommandMeasure "Animate" "Execute 2"]')
			else
				SKIN:Bang('[!CommandMeasure "Animate" "Execute 2"]')
			end
		else
			if curMax > 0 then
				local hits = tblDraw[curSelect]['scoutHits'] or 0
				tblDraw[curSelect]['scoutHits'] = hits + 1
				json.save(tblCache,fileCACHE)
				Run(tblDraw[curSelect]['itemPath'])
			else
				SKIN:Bang('[!CommandMeasure "Animate" "Execute 2"]')
			end
		end
	else
		SKIN:Bang('[!CommandMeasure "Animate" "Execute 2"]')
	end
end

function Search()
	Input = string.lower(tostring(SELF:GetOption("Input")))
	tblDraw = {}
	SKIN:Bang('!SetVariable','CurrentSearch',Input)
	curSelect = 1
	if Input ~= nil and Input ~= "" then 
		if string.sub(Input,1,1) == "/" then -- Check if the user is entering a command
			ChangeIcon('Command.png')
		else
			ChangeIcon('Search.png')
			for k,v in pairs(tblCache) do
				if string.find(string.lower(v['itemName']),Input) then
					table.insert(tblDraw,v)
				end
			end	
			Sort(tblDraw)
			Draw()
		end
	else
		ChangeIcon('Scout.png')
		SKIN:Bang('[!HideMeterGroup Items][!HideMeterGroup Icons][!HideMeter NoItems][!SetVariable DropHeight 20][!Update]')
	end
end

function Draw()
	curMax = math.min(8,#tblDraw)
	SKIN:Bang('[!SetOptionGroup Items MeterStyle "ItemStyle"][!HideMeterGroup Items][!HideMeterGroup Icons][!HideMeter NoItems]')
	if curMax > 0 then
		for i=1,curMax do
			local ImageTint = '[!SetOption Icon'..i..' ImageTint ""]'
			local Text = tblDraw[i]['itemName']
			if tblDraw[i]['itemSource'] == 'NXT-OS' or tblDraw[i]['itemSource'] == 'NXT-OS System' then 
				ImageTint = '[!SetOption Icon'..i..' ImageTint "#FontColor#"]'
			end
			if bolShowPath then
				Text = tblDraw[i]['itemName']..'#CRLF#'..tblDraw[i]['itemPath']
			end

			SKIN:Bang('[!ShowMeter Item'..i..'][!ShowMeter Icon'..i..'][!SetOption Item'..i..' Text """'..Text..'"""][!SetOption Icon'..i..' ImageName "'..tblDraw[i]['itemIcon']..'"]'..ImageTint)
		end
		SKIN:Bang('[!SetOption Item'..curSelect..' MeterStyle "ItemStyle|ItemActiveStyle"][!SetVariable DropHeight '..((curMax*49)+28)..'][!Update]')
	else
		SKIN:Bang('[!ShowMeter NoItems][!SetVariable DropHeight 52][!Update]')
	end
end

-- Sort Functions

function Sort(ptable)
	table.sort(ptable,Order)
end

function Order(First,Second)
	local FirstFind = string.find(string.lower(First['itemName']),Input)
	local SecondFind = string.find(string.lower(Second['itemName']),Input)
	local FirstHits = First['scoutHits'] or 0
	local SecondHits = Second['scoutHits'] or 0
	if FirstHits ~= SecondHits then
		if FirstHits > SecondHits then
			return true
		else
			return false
		end
	end
	if FirstFind ~= SecondFind then 
		if FirstFind < SecondFind then
			return true
		else
			return false
		end
	end
	if string.len(First['itemName']) < string.len(Second['itemName']) then 
		return true
	else
		return false
	end
end

-- Helper Functions

function Run(command)
	if string.match(command,"[%[]*[%]]") then
		SKIN:Bang(command)
		SKIN:Bang('[!DeactivateConfig]')
	else
		SKIN:Bang('"'..command..'"')
		SKIN:Bang('[!DeactivateConfig]')
	end
end

function ChangeIcon(icon)
	if curIcon ~= icon then 
		curIcon = icon
		SKIN:Bang('[!SetOption Icon ImageName Resources\\Images\\'..icon..'][!Update]')
	end
end

function ReadInfoFile(path)
	local temp = {}
	local File = io.open(path,"r")
	if File then
		for line in io.lines(path) do 
			local tc, ta = string.match(line, "<Command>(.-)</Command><Action>(.-)</Action>")
			table.insert(temp,{command = tc, action=ta})
		end
		io.close(File)
	end
	return temp
end