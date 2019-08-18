function Initialize()
	info = {
		Other={"NXT-OS\\Notify"},
		System={"NXT-OS\\System","NXT-OS\\System\\Listeners\\Clipboard","NXT-OS\\System\\Listeners\\NotificationsAndHud"},
		Desktop={"NXT-OS\\Dock","NXT-OS\\Top","NXT-OS\\Drawer","NXT-OS\\CenterClock","NXT-OS\\GameDrawer"}
	}
	Draw()
end

function Draw()
	local i = 1
	local section = 1
	local numloaded = 0
	local numtotal = 0
	for k,v in pairs(info) do
		SKIN:Bang("!SetOption","Item"..i,"Text",k)
		SKIN:Bang("!SetOption","Item"..i,"StringStyle","Bold")
		SKIN:Bang("!SetOption","Item"..section.."R","StringStyle","Bold")
		SKIN:Bang("!SetOption","Item"..section.."R","Text",numloaded.." / "..numtotal)
		numloaded = 0
		numtotal = 0
		section = i
		i = i + 1
		for k1,v1 in pairs(v) do
			SKIN:Bang("!SetOption","Item"..i,"StringStyle","Normal")
			SKIN:Bang("!SetOption","Item"..i.."R","StringStyle","Normal")
			SKIN:Bang("!SetOption","Item"..i,"Text","        "..v1)
			if getstate(v1) then
				SKIN:Bang("!SetOption","Item"..i.."R","Text","Loaded")
				numloaded = numloaded +1
			else
				SKIN:Bang("!SetOption","Item"..i.."R","Text","Unloaded")
			end
			numtotal = numtotal + 1
			i = i + 1
		end
	end
	SKIN:Bang("!SetOption","Item"..section.."R","StringStyle","Bold")
	SKIN:Bang("!SetOption","Item"..section.."R","Text",numloaded.." / "..numtotal)
end

function getstate(skin)
	local configpath = SKIN:GetVariable('SETTINGSPATH').."rainmeter.ini"
	local rainmeterini = io.open(configpath, "r")
	local skin = string.gsub(skin, "%-", "%%%-")
	local text = rainmeterini:read('*all')
	local var = "Active"
	local state = tonumber(string.match(text, '%['..skin..'%]\n.-'..var..'=(%d+)'))
	rainmeterini:close(rainmeterini)
	if state > 0 then
		return true
	else
		return false
	end
end