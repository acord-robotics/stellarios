function Initialize()
	LASTLOADMENU = nil
	HOVERING     = true
	SHOWING      = false
	AUTOHIDE     = true
	if SKIN:GetVariable("Top.Quick.AutoHide") == "1" then
		AUTOHIDE = false
		SKIN:Bang('[!SetVariable "IconOpacity" "255"][!ShowMeterGroup "Buttons"][!Update]')
		SKIN:Bang('!SetOption', 'HoverTrigger', 'MouseLeaveAction', '')
		SKIN:Bang('!SetOption', 'HoverTrigger', 'MouseOverAction', '')
	end
	REFERENCE    = {
		add={name="Add Widget",bangs='[!ActivateConfig NXT-OS\\Top\\WidgetCenter]',icon="Plus"},
		command={name="Command",bangs='[!ActivateConfig "NXT-OS\\Command" "Command.ini"]',icon="Command"},
		dash={name="Dashboard",bangs='[!CommandMeasure "DashScript" "activate()" NXT-OS\\system]',icon="Dash"},
		drawer={name="Drawer",bangs='[!CommandMeasure Animate "Execute 1" NXT-OS\\Drawer]',icon="Drawer"},
		lock={name="Lock PC",bangs='[!EnableMeasure LockCheck][!UpdateMeasure "LockCheck"]',icon="Lock"},
		power={name="Power Menu",menu="Power",icon="Power"},
		volume={name="Volume",menu="Volume",icon="Volume"},
		visualizer={name="[VisualizerName]",bangs='[!EnableMeasure TestVisualizer "NXT-OS\\System"][!Update "NXT-OS\\System"][!SetOption "Label.Text" "Text" "[VisualizerName]"][!UpdateMeterGroup Label][!Update]',icon="Visualizer##VisualizerModeVarName##"},
		rainmeter={name="Manage Rainmeter",bangs="[!Manage]",icon="Rainmeter"}
	}
	ORDER = {}
	local list = SKIN:GetVariable("Top.Quick.Order")
	for item in string.gmatch(list,"(.-)|") do
		table.insert(ORDER,item)
	end
	SetOptions()
end

function SetOptions()
	local max = math.min(table.getn(ORDER),14)
	for i = 1,max do
		params = FindParams(ORDER[i])
		if params ~= nil then
			if AUTOHIDE then
				SKIN:Bang("!SetOption","Icon"..i,"Group","Buttons")
			else
				SKIN:Bang("!ShowMeter","Icon"..i)
			end
			SKIN:Bang("!SetOption","Icon"..i,"ImageName","Resources\\Images\\Icons\\"..params["icon"]..".png")
			if SKIN:GetVariable("Top.Quick.ShowLabel") == "0" then
				SKIN:Bang("!SetOption","Icon"..i,"MouseOverAction",'[!CommandMeasure ControlScript ShowLabel()][!SetOption "Label.Text" "Text" "'..params["name"]..'"][!SetOption "Label.Text" "X" "([Icon'..i..':X]+([Icon'..i..':W]/2))"][!UpdateMeterGroup Label][!Update]')
			end
			if params["bangs"] == nil and params["menu"] ~= nil then
				SKIN:Bang("!SetOption","Icon"..i,"LeftMouseUpAction","[!CommandMeasure ControlScript LoadMenu('"..params["menu"].."','Icon"..i.."')]")
			else
				SKIN:Bang("!SetOption","Icon"..i,"LeftMouseUpAction","[!DeactivateConfig NXT-OS\\Top\\Menus]"..params["bangs"])
			end
		end
	end
	local size = ((max*24)+((max-1)*10))
	SKIN:Bang("!SetOption","HoverTrigger","X",'(((#WORKAREAWIDTH#)-('..(size+20)..'*#Top.Scale#))/2)')
	SKIN:Bang("!SetOption","HoverTrigger","W",'('..(size+20).."*#Top.Scale#)")
	SKIN:Bang("!SetOption","LabelTrigger","W",'('..(size).."*#Top.Scale#)")
end

function LoadMenu(name,icon)
	if name == LASTLOADMENU then
		if getstate("NXT-OS\\Top\\Menus") then
			SKIN:Bang("!DeactivateConfig NXT-OS\\Top\\Menus")
		else
			SKIN:Bang("!ActivateConfig NXT-OS\\Top\\Menus "..name..".ini")
		end
	else
		LASTLOADMENU = name
		SKIN:Bang("!ActivateConfig NXT-OS\\Top\\Menus "..name..".ini")
	end
	local meter = SKIN:GetMeter(icon)
	SKIN:Bang("!Move",'((('..meter:GetX()..'-((300*#Top.Scale#)/2))+((24*#Top.Scale#)/2))+'..SKIN:GetX()..')','(('..meter:GetY()..'+(24*#Top.Scale#)-(5*(2-#Top.Scale#)))+'..SKIN:GetY()..')',"NXT-OS\\Top\\Menus")
	SKIN:Bang("!Draggable", "0", "NXT-OS\\Top\\Menus")
end

function Dismiss()
	if getstate("NXT-OS\\Top\\Menus") then
		SKIN:Bang('[!CommandMeasure Menu.Timer "Execute 2" NXT-OS\\Top\\Menus]')
	end
end

function getstate(skin)
	local configpath = SKIN:GetVariable('SETTINGSPATH').."rainmeter.ini"
	local rainmeterini = io.open(configpath, "r")
	local skin = string.gsub(skin, "%-", "%%%-")
	local text = rainmeterini:read('*all')
	local var = "Active"
	state = tonumber(string.match(text, '%['..skin..'%]\n.-'..var..'=(%d+)'))
	rainmeterini:close(rainmeterini)
	if state > 0 then
		return true
	else
		return false
	end
end

function FindParams(name)
	local entry = REFERENCE[name] 
	if entry ~= nil then
		return entry
	else
		return nil
	end
end

function ShowLabel()
	if not SHOWING then
		SKIN:Bang('[!ShowMeterGroup "Label"]')
	end 
end

function ChangeState(State)
	HOVERING = State
end

function Leave()
	HOVERING = false
end

function MenuShow()
	SHOWING = true
	if AUTOHIDE then
		SKIN:Bang('[!CommandMeasure "Timer" "Stop 1"][!HideMeterGroup "Label"][!Update]')
		SKIN:Bang('[!Update][!SetVariable "IconOpacity" "255"][!ShowMeterGroup "Buttons"][!SetOption "HoverTrigger" "MouseLeaveAction" "[!CommandMeasure ControlScript ChangeState(false)]"][!Update]')
	else
		SKIN:Bang('[!HideMeterGroup "Label"][!Update]')
	end
end

function MenuHide()
	SHOWING = false
	if AUTOHIDE then
		SKIN:Bang('!SetOption', 'HoverTrigger', 'MouseLeaveAction', '[!CommandMeasure ControlScript ChangeState(false)][!CommandMeasure "Timer" "Execute 1"]')
		if not HOVERING then
			SKIN:Bang('[!CommandMeasure "Timer" "Execute 1"]')
		end
		SKIN:Bang("!Update")
	end
end