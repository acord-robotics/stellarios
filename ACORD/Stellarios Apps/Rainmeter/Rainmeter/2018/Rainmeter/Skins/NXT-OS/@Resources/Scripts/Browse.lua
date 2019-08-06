function Accept(num)
	local Type = SKIN:GetVariable('FileBrowser.Type'..num,'')
	local Style = SKIN:GetVariable('FileBrowser.Style'..num,'')
	local StartDir = SKIN:GetVariable('FileBrowser.StartDir'..num,'')
	local Bangs = SKIN:GetVariable('FileBrowser.Bangs'..num,'')
	if Type == '' then
		Type = '1'
	end
	if StartDir == '' then
		StartDir = 'C:\\'
	end
	if Bangs == '' then
		SKIN:Bang("!CommandMeasure", "Error", 'DisplayError({type="3",title="'..SKIN:GetVariable("CURRENTFILE")..'",desc="The bangs were not set for the browse dialogue. If you are the developer for this skin make sure that you set the bangs variable. If you are not the developer of this skin, please report this error to the developer.",lefttext=""})', "nxt-os\\system")
		return
	end
	SKIN:Bang('[!WriteKeyValue Variables Path "'..StartDir..'" "#SKINSPATH#NXT-OS\\System\\FileBrowser\\Temp.inc"][!WriteKeyValue Variables Mode "'..Type..'" "#SKINSPATH#NXT-OS\\System\\FileBrowser\\Temp.inc"][!WriteKeyValue Variables Bangs """'..Bangs..'""" "#SKINSPATH#NXT-OS\\System\\FileBrowser\\Temp.inc"][!WriteKeyValue Variables Target "'..SKIN:GetVariable("CurrentConfig")..'" "#SKINSPATH#NXT-OS\\System\\FileBrowser\\Temp.inc"]')
	if Style == '' then
		if GetVarFromFile("Style") == "0" then
			SKIN:Bang('[!ActivateConfig NXT-OS\\System\\FileBrowser "Icons.ini"]')
			SKIN:Bang('[!EnableMeasure "Window.Measure.CenterOnload" "NXT-OS\\System\\FileBrowser"][!Update NXT-OS\\System\\FileBrowser]')
		else 
			SKIN:Bang('[!ActivateConfig NXT-OS\\System\\FileBrowser "List.ini"]')
			SKIN:Bang('[!EnableMeasure "Window.Measure.CenterOnload" "NXT-OS\\System\\FileBrowser"][!Update NXT-OS\\System\\FileBrowser]')
		end
	elseif Style == '0' then
		SKIN:Bang('[!ActivateConfig NXT-OS\\System\\FileBrowser "Icons.ini"]')
		SKIN:Bang('[!EnableMeasure "Window.Measure.CenterOnload" "NXT-OS\\System\\FileBrowser"][!Update NXT-OS\\System\\FileBrowser]')
	else
		SKIN:Bang('[!ActivateConfig NXT-OS\\System\\FileBrowser "List.ini"]')
		SKIN:Bang('[!EnableMeasure "Window.Measure.CenterOnload" "NXT-OS\\System\\FileBrowser"][!Update NXT-OS\\System\\FileBrowser]')
	end
end

function Destroy()
	local CurrentConfig = string.gsub(SKIN:GetVariable("CurrentConfig"),"\\","\\\\")
	SKIN:Bang('!Commandmeasure','Browse','Destroy("'..CurrentConfig..'")','NXT-OS\\System')
end

function Execute(num)
	local CurrentConfig = string.gsub(SKIN:GetVariable("CurrentConfig"),"\\","\\\\")
	SKIN:Bang('!Commandmeasure','Browse','BrowseCall("'..CurrentConfig..'",'..num..')','NXT-OS\\System')
end

function GetVarFromFile(name)
	local SkinsPath = SKIN:GetVariable('SKINSPATH')
	local FilePath = SKIN:MakePathAbsolute(SkinsPath.."NXT-OS\\System\\FileBrowser\\Temp.inc")
	for line in io.lines(FilePath) do 
		local var = line:match(name..'=(.+)')
		if var then
			return var
		end
	end
end
