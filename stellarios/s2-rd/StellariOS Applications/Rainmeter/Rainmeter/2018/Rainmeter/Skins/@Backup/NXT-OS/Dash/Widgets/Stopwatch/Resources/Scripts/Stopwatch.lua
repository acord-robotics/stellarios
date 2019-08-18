function Initialize()
	RunStamp = tonumber(SKIN:GetVariable("RunStamp"))
	PauseStamp = tonumber(SKIN:GetVariable("PauseStamp"))
	Paused = tobool(SKIN:GetVariable("Paused"))
	if RunStamp > 0 and not Paused then
		Running = true
		SKIN:Bang(SELF:GetOption('RunCommands'))
	elseif Paused then
		SKIN:Bang(SELF:GetOption('RunCommands'))
		SKIN:Bang(SELF:GetOption('PauseCommands'))
		return MakeString(PausedTime)
	else
		SKIN:Bang(SELF:GetOption('StopCommands'))
		return MakeString(0)
	end
end

function Update()
	if Running and not Paused then
		local currtime = (os.time()-RunStamp)
		return MakeString(currtime)
	elseif Paused then
		return MakeString(PauseStamp)
	else
		return MakeString(0)
	end
end

function MakeString(time)
	local hours = math.floor(time/3600)
	local minutes = math.floor((time-(hours*3600))/60)
	local seconds = (time-((hours*3600)+(minutes*60)))
	local drawtime = nil
	drawtime = (hours >= 10 and hours or "0"..hours)..":"..(minutes >= 10 and minutes or "0"..minutes)..":"..(seconds >= 10 and seconds or "0"..seconds)
	return drawtime
end

function Start()
	RunStamp = os.time()
	SKIN:Bang("!WriteKeyValue","Variables","RunStamp",RunStamp)
	Running = true
	SKIN:Bang(SELF:GetOption('RunCommands'))
end

function Stop(bool)
	bool = bool or false
	RunStamp = 0
	Running = false
	Paused = false
	PauseStamp = 0
	SKIN:Bang("!WriteKeyValue","Variables","RunStamp",RunStamp)
	SKIN:Bang("!WriteKeyValue","Variables","PauseStamp","0")
	SKIN:Bang("!WriteKeyValue","Variables","Paused","false")
	if not bool then
		SKIN:Bang(SELF:GetOption('UnpauseCommands'))
		SKIN:Bang(SELF:GetOption('StopCommands'))
	end
end

function Pause()
	if Running then
		Running = false
		Paused = true
		PauseStamp = os.time() - RunStamp
		SKIN:Bang("!WriteKeyValue","Variables","PauseStamp",PauseStamp)
		SKIN:Bang("!WriteKeyValue","Variables","Paused","true")
		SKIN:Bang(SELF:GetOption('PauseCommands'))
	elseif PauseStamp > 0 and Paused then
		RunStamp = os.time() - PauseStamp
		Running = true
		Paused = false
		SKIN:Bang("!WriteKeyValue","Variables","RunStamp",RunStamp)
		SKIN:Bang("!WriteKeyValue","Variables","PauseStamp","0")
		SKIN:Bang("!WriteKeyValue","Variables","Paused","false")
		SKIN:Bang(SELF:GetOption('UnpauseCommands'))
	end
end

-- Helper functions
function tobool(bool)
	if bool == "true" then
		return true
	else 
		return false
	end
end