function getinfo()
	local inc = 0
	for i=1,10 do 
		if SKIN:GetMeasure(i):GetStringValue() ~= "" then
			SKIN:Bang("!SetVariable","Clip"..i,SKIN:GetMeasure(i):GetStringValue(),"NXT-OS\\ClipboardHud")
			inc = inc +1
		else
			SKIN:Bang("!SetVariable","Clip"..i," ","NXT-OS\\ClipboardHud")
		end
	end
	SKIN:Bang("!SetVariable","Total",inc,"NXT-OS\\ClipboardHud")
	SKIN:Bang('[!Update "NXT-OS\\ClipboardHud"]')
end

function clearinfo(num)
	SKIN:Bang('!CommandMeasure', tostring(num), "Delete")
	SKIN:Bang('!Update')
	getinfo()
end