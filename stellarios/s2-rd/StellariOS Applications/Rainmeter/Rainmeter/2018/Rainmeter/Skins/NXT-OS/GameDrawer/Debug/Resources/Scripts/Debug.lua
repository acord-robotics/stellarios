function Initialize()
	lines = {}
	Time = 0
	Index = 0
	SkinsPath = SKIN:GetVariable('SKINSPATH')
	FilePath = SkinsPath.."NXT-OS Data\\GameDrawer\\Debug\\"
	if SELF:GetOption("Refreshed", "0") == "1" then
		SKIN:Bang('[!SetOption Text Text "Loading..."][!HideMeter StartButton][!Update]')
		SKIN:Bang('[!CommandMeasure Timer "Execute 1"]')
	end
end

function FirstStart()
	SKIN:Bang('!WriteKeyValue','Rainmeter','Logging','1','#SETTINGSPATH#Rainmeter.ini')
	SKIN:Bang('!WriteKeyValue','Rainmeter','Debug','1','#SETTINGSPATH#Rainmeter.ini')
	SKIN:Bang('!WriteKeyValue', 'Variables', 'Debug', '0' ,'#ROOTCONFIGPATH#GameDrawer\\GameDrawer.ini')
	SKIN:Bang("!WriteKeyValue", SELF:GetName(), "Refreshed", "1")
	SKIN:Bang('!RefreshApp')
end

function Start()
	local file = io.open(SKIN:GetVariable('SETTINGSPATH')..'Rainmeter.log', "wb")
	file:write('')
	file:close()
	SKIN:Bang('[!WriteKeyValue "Variables" "Debug" "1" "#ROOTCONFIGPATH#GameDrawer\\GameDrawer.ini"][!Refresh NXT-OS\\GameDrawer]')
	SKIN:Bang("!WriteKeyValue", SELF:GetName(), "Refreshed", "0")
end

function Close()
	if table.getn(lines) < 1 then
		SKIN:Bang('[!DeactivateConfig]') 
	else
		SKIN:Bang('!CommandMeasure', 'error', "DisplayError({type = '2', title='Save Session',desc='Are you sure you want to close the Console without saving your session?',lefttext='Dont Save', leftcommand='[!DeactivateConfig NXT-OS\\\\GameDrawer\\\\Debug]',rightcommand='[!CommandMeasure Debug SaveAndClose() NXT-OS\\\\GameDrawer\\\\Debug]',righttext='Save'})", 'NXT-OS\\System')
	end 
end

function ScrollUp()
	local max = math.max(0,(table.getn(lines)-25))
	if (Index+3) <= max then
		Index = Index + 3
		Draw()
	elseif Index ~= max then
		Index = max
		Draw()
	end 
end

function ScrollDown()
	if (Index-3) >= 0 then
		Index = Index - 3
		Draw()
	elseif Index > 0 then
		Index = 0
		Draw()
	end 
end

function Log(line)
	table.insert(lines,line)
	Index = 0
	Draw()
end

function Draw()
	local string = ""
	local num = table.getn(lines)
	for i=1,math.min(25,num) do
		index = i + math.max(0,(num-25)) - Index
		local part = string.sub(lines[index],1,80)
		string = string..part.."\n"
	end
	SKIN:Bang('!SetOption','Text','Text',string)
	SKIN:Bang('[!UpdateMeter Text][!Redraw]')
end

function SaveAndClose()
	Save()
	SKIN:Bang('!CommandMeasure', 'error', "DisplayError({type = '1', title='Save Complete',desc='Saved console session as: Game_Drawer_"..Time..".log\\nFile located in NXT-OS Data\\\\GameDrawer\\\\Debug',lefttext='Open Log Folder', leftcommand='["..'"#*SKINSPATH*#\\\\NXT-OS Data\\\\GameDrawer\\\\Debug\\\\"'.."][!DeactivateConfig NXT-OS\\\\GameDrawer\\\\Debug]',rightcommand='[!DeactivateConfig NXT-OS\\\\GameDrawer\\\\Debug]'})", 'NXT-OS\\System')
	SKIN:Bang('') 
end

function NormalSave()
	Save()
	SKIN:Bang('!CommandMeasure', 'error', "DisplayError({type = '1', title='Save Complete',desc='Saved console session as: Game_Drawer_"..Time..".log\\nFile located in NXT-OS Data\\\\GameDrawer\\\\Debug',lefttext='Open Log Folder', leftcommand='["..'"#*SKINSPATH*#\\\\NXT-OS Data\\\\GameDrawer\\\\Debug\\\\"'.."]',rightcommand=''})", 'NXT-OS\\System')
end

function Save()
	if table.getn(lines) < 1 then return end 
	Time = os.time()
	local filename = FilePath.."\\Game_Drawer_"..Time..".log"
	local file,err = io.open( filename, "wb" )
	if err then return err end
	for k,v in ipairs(lines) do
		file:write(v.."\r\n")
	end
	file:write("\r\nStart of Rainmeter.log\r\n================================================================================\r\n")
	for v in io.lines(SKIN:GetVariable('SETTINGSPATH')..'Rainmeter.log') do
		file:write(v.."\r\n")
	end
	file:close()
	SKIN:Bang('!SetOption','Text','Text','Saved console session as: Game_Drawer_'..Time..'.log')
	SKIN:Bang('[!UpdateMeter Text][!Redraw]')
	lines = {}
end
