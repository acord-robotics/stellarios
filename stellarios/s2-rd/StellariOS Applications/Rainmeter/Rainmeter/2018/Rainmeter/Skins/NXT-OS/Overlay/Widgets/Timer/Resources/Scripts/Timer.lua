function Initialize()
	Timer = tonumber(SKIN:GetVariable("Timer"))
	RunStamp = tonumber(SKIN:GetVariable("RunStamp"))
	PauseStamp = tonumber(SKIN:GetVariable("PauseStamp"))
	Paused = tobool(SKIN:GetVariable("Paused"))
	if RunStamp > 0 and not Paused then
		Running=true
		SKIN:Bang(SELF:GetOption('RunCommands'))
	elseif Paused then
		SKIN:Bang(SELF:GetOption('RunCommands'))
		SKIN:Bang(SELF:GetOption('PauseCommands'))
		SKIN:Bang("!SetVariable","CurrentDisplay",(MakeString((RunStamp-os.time()))))
		SKIN:Bang("!SetVariable","CurrentPrecent",(1-((RunStamp-os.time())/Timer)))
	else
		SKIN:Bang(SELF:GetOption('StopCommands'))
	end
	DrawEdit()
end

function Update()
	if Running and not Paused then
		local currtime = (RunStamp-os.time())
		if currtime > 0 then
			SKIN:Bang("!SetVariable","CurrentDisplay",(MakeString(currtime)))
			SKIN:Bang("!SetVariable","CurrentPrecent",(1-(currtime/Timer)))
		else
			Stop(false)
			SKIN:Bang(SELF:GetOption('FinishCommands'))
		end
	end
end

function MakeString(time)
	local hours = math.floor(time/3600)
	local minutes = math.floor((time-(hours*3600))/60)
	local seconds = (time-((hours*3600)+(minutes*60)))
	local drawtime = nil
	if time >= 3600 then
		drawtime = hours..":"..(minutes >= 10 and minutes or "0"..minutes)..":"..(seconds >= 10 and seconds or "0"..seconds)
	elseif time < 3600 and time >= 60 then 
		drawtime = (minutes >= 10 and minutes or "0"..minutes)..":"..(seconds >= 10 and seconds or "0"..seconds)
	elseif time < 60 then
		drawtime = "00:"..(seconds >= 10 and seconds or "0"..seconds)
	end
	return drawtime
end

function Start()
	if PauseStamp > 0 and Paused then
		RunStamp = os.time()+PauseStamp
		Running = true
		Paused = false
		SKIN:Bang("!WriteKeyValue","Variables","RunStamp",RunStamp)
		SKIN:Bang("!WriteKeyValue","Variables","PauseStamp","0")
		SKIN:Bang("!WriteKeyValue","Variables","Paused","false")
	else
		SKIN:Bang("!WriteKeyValue","Variables","Timer",Timer)
		RunStamp = os.time()+Timer
		Running = true
		SKIN:Bang(SELF:GetOption('RunCommands'))
		SKIN:Bang("!WriteKeyValue","Variables","RunStamp",RunStamp)
	end
end

function Stop(bool)
	bool = bool or false
	RunStamp = 0
	Running = false
	Paused = false
	PauseStamp = 0
	SKIN:Bang("!SetVariable","CurrentDisplay","Done")
	SKIN:Bang("!SetVariable","CurrentPrecent","0")
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
		PauseStamp = RunStamp - os.time()
		SKIN:Bang("!WriteKeyValue","Variables","PauseStamp",PauseStamp)
		SKIN:Bang("!WriteKeyValue","Variables","Paused","true")
		SKIN:Bang(SELF:GetOption('PauseCommands'))
	elseif PauseStamp > 0 and Paused then
		RunStamp = os.time()+PauseStamp
		Running = true
		Paused = false
		SKIN:Bang("!WriteKeyValue","Variables","RunStamp",RunStamp)
		SKIN:Bang("!WriteKeyValue","Variables","PauseStamp","0")
		SKIN:Bang("!WriteKeyValue","Variables","Paused","false")
		SKIN:Bang(SELF:GetOption('UnpauseCommands'))
	end
end

function End()
	
end

function SetTime(num)
	local timer = (Timer+(num))
	if timer > 0 and timer < 86400 then
		Timer = timer
		DrawEdit()
	end
end

function DrawEdit()
	local hours = math.floor(Timer/3600)
	local minutes = math.floor((Timer-(hours*3600))/60)
	local seconds = (Timer-((hours*3600)+(minutes*60)))
	SKIN:Bang('[!SetOption Num1 Text '..hours..'][!SetOption Num2 Text '..(minutes >= 10 and minutes or "0"..minutes)..'][!SetOption Num3 Text '..(seconds >= 10 and seconds or "0"..seconds)..'][!Update]')
end

-- Helper functions
function tobool(bool)
	if bool == "true" then
		return true
	else 
		return false
	end
end