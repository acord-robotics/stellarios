function Initialize()
	state = "0"
	getstate(SELF:GetOption("Skin"))
end
function Update()
	return state
end
function getstate(skin)
	local configpath = SKIN:GetVariable('SETTINGSPATH').."rainmeter.ini"
	local rainmeterini = io.open(configpath, "r")
	local skin = string.gsub(skin, "%-", "%%%-")
	local text = rainmeterini:read('*all')
	local var = "Active"
	state = tonumber(string.match(text, '%['..skin..'%]\n.-'..var..'=(%d+)'))
	if state > 0 then
		SKIN:Bang(SELF:GetOption("ActiveBangs"))
	else
		SKIN:Bang(SELF:GetOption("InactiveBangs"))
	end
	rainmeterini:close(rainmeterini)
end
