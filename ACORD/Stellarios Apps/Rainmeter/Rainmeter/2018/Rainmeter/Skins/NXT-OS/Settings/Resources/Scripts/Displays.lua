function Initialize()
	monitors={}
	for i=1,7 do
		local x,y,w,h = SKIN:GetVariable('SCREENAREAX@'..i),SKIN:GetVariable('SCREENAREAY@'..i),SKIN:GetVariable('SCREENAREAWIDTH@'..i),SKIN:GetVariable('SCREENAREAHEIGHT@'..i)
		if x~=nil and y~=nil and w~=nil and h~=nil then
			monitors[i] = x..' '..y..' '..w..' '..h
		end
	end

	local hash = {}
	actual = {}
	for k,v in ipairs(monitors) do
		if (not hash[v]) then
			actual[k] = v
			hash[v] = true
		end
	end
	local DDList1= 'Primary Monitor: #PSCREENAREAWIDTH#x#PSCREENAREAHEIGHT#|'
	local DDBangs1= '[!CommandMeasure "Displays" """Save("P")"""]|'

	local DDBangs2= '[!Move #PWORKAREAX# #PWORKAREAY# NXT-OS\\Dock][!Move #PWORKAREAX# #PWORKAREAY# NXT-OS\\Top][!Move (#PSCREENAREAX#+(#PSCREENAREAWIDTH#-600)/2) (#PSCREENAREAY#+(#PSCREENAREAHEIGHT#-600)/2) NXT-OS\\CenterClock][!Move #PWORKAREAX# (#PWORKAREAY#+#PWORKAREAHEIGHT#-228) NXT-OS\\GameDrawer][!RefreshGroup NXTDesktop]|'

	for k,v in pairs(actual) do
		DDList1 = DDList1 .. '|Monitor '..k..': #SCREENAREAWIDTH@'..k..'#x#SCREENAREAHEIGHT@'..k..'#'
		DDBangs1 = DDBangs1 .. '|[!CommandMeasure "Displays" "Save('..k..')"]'
		DDBangs2 = DDBangs2 .. '|[!Move #WORKAREAX@'..k..'# #WORKAREAY@'..k..'# NXT-OS\\Dock][!Move #WORKAREAX@'..k..'# #WORKAREAY@'..k..'# NXT-OS\\Top][!Move (#SCREENAREAX@'..k..'#+(#SCREENAREAWIDTH@'..k..'#-600)/2) (#SCREENAREAY@'..k..'#+(#SCREENAREAHEIGHT@'..k..'#-600)/2) NXT-OS\\CenterClock][!Move #WORKAREAX@'..k..'# (#WORKAREAY@'..k..'#+#WORKAREAHEIGHT@'..k..'#-228) NXT-OS\\GameDrawer][!RefreshGroup NXTDesktop]'
	end
	SKIN:Bang('!SetOption','MainDD','DropDownList',DDList1)
	SKIN:Bang('!SetOption','DeskDD','DropDownList',DDList1)
	SKIN:Bang('!SetOption','MainDD','DropDownBangs',DDBangs1)
	SKIN:Bang('!SetOption','DeskDD','DropDownBangs',DDBangs2)
	SKIN:Bang('!Update')
end

function Save(num)
	if num == "P" then
		SKIN:Bang('[!SetVariable num '..num..'][!Update]')
		SKIN:Bang('!WriteKeyValue','Variables','Monitor.MainNum',num,'#@#Settings.inc')
		SKIN:Bang('!WriteKeyValue','Variables','Monitor.MainX','##num#SCREENAREAX#','#@#Settings.inc')
		SKIN:Bang('!WriteKeyValue','Variables','Monitor.MainY','##num#SCREENAREAY#','#@#Settings.inc')
		SKIN:Bang('!WriteKeyValue','Variables','Monitor.MainW','##num#SCREENAREAWIDTH#','#@#Settings.inc')
		SKIN:Bang('!WriteKeyValue','Variables','Monitor.MainH','##num#SCREENAREAHEIGHT#','#@#Settings.inc')
		SKIN:Bang('!RefreshApp')
	else
		num = tostring(num)
		SKIN:Bang('[!SetVariable num '..num..'][!Update]')
		SKIN:Bang('!WriteKeyValue','Variables','Monitor.MainNum',num,'#@#Settings.inc')
		SKIN:Bang('!WriteKeyValue','Variables','Monitor.MainX','#SCREENAREAX@#num##','#@#Settings.inc')
		SKIN:Bang('!WriteKeyValue','Variables','Monitor.MainY','#SCREENAREAY@#num##','#@#Settings.inc')
		SKIN:Bang('!WriteKeyValue','Variables','Monitor.MainW','#SCREENAREAWIDTH@#num##','#@#Settings.inc')
		SKIN:Bang('!WriteKeyValue','Variables','Monitor.MainH','#SCREENAREAHEIGHT@#num##','#@#Settings.inc')
		SKIN:Bang('!RefreshApp')
	end
end

function Identify()
	for k,v in pairs(actual) do
		SKIN:Bang('!ActivateConfig','NXT-OS\\Settings\\iDisplays\\'..k,'Identify.ini')
	end
end