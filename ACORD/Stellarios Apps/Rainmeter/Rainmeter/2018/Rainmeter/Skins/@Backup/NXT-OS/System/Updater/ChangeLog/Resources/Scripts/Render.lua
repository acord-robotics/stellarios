function Initialize()
	info = {}
	pos = 0
	max = 27
	number = 0
end

function Draw()
	info, number = explode("#LINE#",SKIN:GetMeasure("ChangeLog"):GetStringValue(),9999) 
	local text = ""
	if table.getn(info) <= max then
		max = table.getn(info)
		SKIN:Bang("!HideMeterGroup Scroll")
	end
	for i=1,max do
		text = text .. info[i+pos].. "#CRLF#"
	end
	SKIN:Bang("!SetVariable","Scroll.Total",number)
	SKIN:Bang("!SetVariable","Scroll.Position",pos)
	SKIN:Bang("!SetOption","Text","Text",text)
	SKIN:Bang("[!Update]")
end

function ScrollDown()
	if pos+3 < number-max then
		pos = pos + 3
		Draw()
	elseif pos < number-max then
		pos = number-max
		Draw()
	end 
end

function ScrollUp()
	if pos > 0 then
		if pos-3 > 0 then
			pos = pos - 3
			Draw()
		elseif pos-3 <= 0 then
			pos = 0
			Draw() 
		end
	end 
end

function ScrollTo(num)
	pos = num
	Draw()
end

function explode(sep, str, limit)
	if not sep or sep == "" then return false end
	if not str then return false end
	if limit == 0 or limit == 1 then return {str},1 end

	local r = {}
	local n, init = 0, 1

	while true do
		local s,e = string.find(str, sep, init, true)
		if not s then break end
		r[#r+1] = string.sub(str, init, s - 1)
		init = e + 1
		n = n + 1
		if n == limit - 1 then break end
	end

	if init <= string.len(str) then
		r[#r+1] = string.sub(str, init)
	else
		r[#r+1] = ""
	end
	n = n + 1

	if limit < 0 then
		for i=n, n + limit + 1, -1 do r[i] = nil end
		n = n + limit
	end

	return r, n
end