function Initialize()
	if SELF:GetOption("Ran", "0") == "0" then
		SKIN:Bang("!WriteKeyValue", SELF:GetName(), "Ran", "1")
		Scripts = {"Dock.lua","CheckSpotify.lua","FixDockHold.lua","MoveGameDrawer.lua","TopBar.lua","CleanUp.lua"}
		CurrentFile = 1
		Version = string.gsub(SKIN:GetVariable("SYS.Version"),"%.","")
		OldVersion = string.gsub(SKIN:GetVariable("SYS.OldVersion"),"%.","")
		Version = tonumber(Version)
		OldVersion = tonumber(OldVersion)
		Steps = 2 + table.getn(Scripts)
		Finished = false
		DrawSlots()
		SKIN:Bang('[!CommandMeasure Timer "Execute 1"]')
	else
		SKIN:Bang("!WriteKeyValue", SELF:GetName(), "Ran", "0")
		SKIN:Bang('[!SetOption AnimationReference Formula 1][!SetOption Progress Formula 1][!ShowMeter LoadingText]')
		SKIN:Bang('[!ShowMeter Complete]')
		Display("Installation Complete!")
	end
end

function Start()
	Display('Finished Copy')
	VersionCheck()
end

function Progress(pos,continue)
	SKIN:Bang('[!SetVariable "Progress" "'..(pos/Steps)..'"]')
	if continue then
		SKIN:Bang("!CommandMeasure","Timer","Execute 3")
	else
		SKIN:Bang("!CommandMeasure","Timer","Execute 2")
	end
end

function DrawSlots()
	for i = 2,(Steps+1) do
		local deg = (360/Steps)*(i-2)
		SKIN:Bang('!SetOption','AroundBG','Shape'..i,'Line 105,-3,105,6 | StrokeWidth 10 | Stroke Color #BGColor# | Rotate '..deg..',5,108')
	end
	SKIN:Bang('!Update')
end

function VersionCheck()
	if OldVersion < Version then
		Progress(2,true)
	elseif OldVersion >= Version then
		Finished = true
		Progress(Steps,true)
	else
		Finished = true
		Progress(Steps,true)
	end
end

function Display(string)
	print("NXT-OS Post Install: "..string)
	SKIN:Bang("!SetOption","LoadingText","Text",string)
	SKIN:Bang("!Update")
end

function Next()
	if (CurrentFile + 1) <= table.getn(Scripts) then
		CurrentFile = CurrentFile + 1
		Progress((1+CurrentFile),true)
	else
		Finished = true
		Progress(Steps,true)
	end
end

function Execute()
	if Finished then
		SKIN:Bang('[!RefreshApp]')
	else
		Display("Running: "..Scripts[CurrentFile])
		dofile(SKIN:MakePathAbsolute('Resources\\Scripts\\Post\\'..Scripts[CurrentFile]))
		Main()
		Display("Finished: "..Scripts[CurrentFile])
		Next()
	end
end