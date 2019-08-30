function Initialize()
	queue = {}
	status = {{"0",nil},{"0",nil},{"0",nil},{"0",nil},{"0",nil},{"0",nil},{"0",nil},{"0",nil},{"0",nil},{"0",nil}}
	active = false
	running = false
end

function Update()
	if active then
		if not running then
			running = true
			GetStates()
			for k,v in ipairs(status) do
				if v[1] == "1" and DeepCompare(v[2],queue[1],false) then	
					table.remove(queue,1)
					SKIN:Bang("!CommandMeasure","Animate","Execute 4","NXT-OS\\System\\Error\\"..k)
					if table.getn(queue) < 1 then
						active = false
					end
					running = false
					return
				end
			end
			for k,v in ipairs(status) do
				if v[1] == "0" then
					SentTo(k)
					table.remove(queue,1)
					if table.getn(queue) < 1 then
						active = false
					end
					running = false
					return
				end 
			end
		end 
	end
end

function SentTo(num)
	status[num][2]=queue[1]
	SKIN:Bang("!ActivateConfig","NXT-OS\\System\\Error\\"..num,"Error.ini")
	SKIN:Bang("!SetVariable","text",queue[1]["desc"], "NXT-OS\\System\\Error\\"..num)
	SKIN:Bang("!SetVariable","active","1", "NXT-OS\\System\\Error\\"..num)
	SKIN:Bang("!SetVariable","window.title",queue[1]["title"], "NXT-OS\\System\\Error\\"..num)
	SKIN:Bang("!SetVariable","rightaction",queue[1]["rightcommand"], "NXT-OS\\System\\Error\\"..num)
	SKIN:Bang("!SetVariable","leftaction",queue[1]["leftcommand"], "NXT-OS\\System\\Error\\"..num)
	if queue[1]["lefttext"] == "" then
		SKIN:Bang("!HideMeterGroup", "Left", "NXT-OS\\System\\Error\\"..num)
		SKIN:Bang("!CommandMeasure","kLEFT", "Stop", "NXT-OS\\System\\Error\\"..num)
	else 
		SKIN:Bang("!SetVariable","lefttext",queue[1]["lefttext"], "NXT-OS\\System\\Error\\"..num)
	end
	if queue[1]["righttext"] == "" then
		SKIN:Bang("!HideMeterGroup","Right", "NXT-OS\\System\\Error\\"..num)
		SKIN:Bang("!CommandMeasure","kRIGHT", "Stop", "NXT-OS\\System\\Error\\"..num)
		SKIN:Bang('[!SetOption "kRUN" "IfAboveAction" """#*leftaction*#[!CommandMeasure "Animate" "Execute 3"]""" NXT-OS\\System\\Error\\'..num..'][!SetOption LeftButton MeterStyle Window.Element.Button.Small.Active NXT-OS\\System\\Error\\'..num..'][!SetOption RightButton MeterStyle Window.Element.Button.Small NXT-OS\\System\\Error\\'..num..']')
	else 
		SKIN:Bang("!SetVariable","righttext",queue[1]["righttext"], "NXT-OS\\System\\Error\\"..num)
	end
	if queue[1]["type"] == "1" then
		SKIN:Bang("!SetOption","Icon","ImageName","#SKINSPATH#NXT-OS\\@Resources\\Images\\Information.png","NXT-OS\\System\\Error\\"..num)
		SKIN:Bang("!SetOption","Icon","ImageTint","57,164,255","NXT-OS\\System\\Error\\"..num)
		SKIN:Bang("Play #@#Sounds\\Information.wav")
	elseif queue[1]["type"] == "2" then
		SKIN:Bang("!SetOption","Icon","ImageName","#SKINSPATH#NXT-OS\\@Resources\\Images\\Warning.png","NXT-OS\\System\\Error\\"..num)
		SKIN:Bang("!SetOption","Icon","ImageTint","255,175,0","NXT-OS\\System\\Error\\"..num)
		SKIN:Bang("Play #@#Sounds\\Warning.wav")
	elseif queue[1]["type"] == "3" then
		SKIN:Bang("!SetOption","Icon","ImageName","#SKINSPATH#NXT-OS\\@Resources\\Images\\Critical.png","NXT-OS\\System\\Error\\"..num)
		SKIN:Bang("!SetOption","Icon","ImageTint","222,23,23","NXT-OS\\System\\Error\\"..num)
		SKIN:Bang("Play #@#Sounds\\Critical.wav")
	end
end

function DeepCompare(t1,t2,ignore_mt)
	local ty1 = type(t1)
	local ty2 = type(t2)
	if ty1 ~= ty2 then return false end
	if ty1 ~= 'table' and ty2 ~= 'table' then return t1 == t2 end
	local mt = getmetatable(t1)
	if not ignore_mt and mt and mt.__eq then return t1 == t2 end
	for k1,v1 in pairs(t1) do
	local v2 = t2[k1]
	if v2 == nil or not DeepCompare(v1,v2) then return false end
	end
	for k2,v2 in pairs(t2) do
	local v1 = t1[k2]
	if v1 == nil or not DeepCompare(v1,v2) then return false end
	end
	return true
end

function DisplayError(temptable)
	if temptable.type == nil then
		temptable.type = "1"
	end
	if temptable.title == nil then
		temptable.title = "Error!"
	end
	if temptable.righttext == nil then
		temptable.righttext = "Ok" 
	end
	if temptable.lefttext == nil then
		temptable.lefttext = "Cancel"
	end
	if temptable.rightcommand == nil then
		temptable.rightcommand = ""
	end
	if temptable.leftcommand == nil then
		temptable.leftcommand = ""
	end
	if temptable.desc ~= nil then
		table.insert(queue, {["type"]=temptable.type, ["title"]=temptable.title, ["desc"]=temptable.desc, ["rightcommand"]=temptable.rightcommand, ["righttext"]=temptable.righttext, ["leftcommand"]=temptable.leftcommand, ["lefttext"]=temptable.lefttext})
	end
	active = true
	Update()
end

function GetStates()
	for i = 1,10 do 
		local state = tonumber(SKIN:ReplaceVariables('[&ErrorMeasureActive:IsActive(NXT-OS\\System\\Error\\'..i..')]'))
		if state > 0 then
			status[i][1]="1"
		else
			status[i][1]="0"
		end
	end
end
