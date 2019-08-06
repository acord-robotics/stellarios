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
	Others()
end

function Others()
	local x,y,w,h = SKIN:GetVariable('Monitor.MainX'),SKIN:GetVariable('Monitor.MainY'),SKIN:GetVariable('Monitor.MainW'),SKIN:GetVariable('Monitor.MainH')
	for k,v in pairs(actual) do
		if v ~= x..' '..y..' '..w..' '..h then
			local finishcommands = string.gsub(SELF:GetOption("Bangs"),"%$NUM%$",k)
			SKIN:Bang(finishcommands)
		end
	end
end