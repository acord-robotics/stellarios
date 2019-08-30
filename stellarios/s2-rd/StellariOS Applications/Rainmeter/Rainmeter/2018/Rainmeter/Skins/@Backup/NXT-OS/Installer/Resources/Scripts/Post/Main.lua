function Initialize()
	Scripts = {}
	CurrentFile = 1
	Version = string.gsub(SKIN:GetVariable("SYS.Version"),"%.","")
	OldVersion = string.gsub(SKIN:GetVariable("SYS.OldVersion"),"%.","")
	Version = tonumber(Version)
	OldVersion = tonumber(OldVersion)

	if SELF:GetOption("Ran") == "0" then
		SKIN:Bang("!WriteKeyValue", SELF:GetName(), "Ran", "1")
		SKIN:Bang("[!Hide *][!Show]")
		VersionCheck()
	else
		SKIN:Bang("!WriteKeyValue", SELF:GetName(), "Ran", "0")
		SKIN:Bang("!CommandMeasure","Timer","Stop 1")
		SKIN:Bang("!CommandMeasure","Timer","Execute 2")
	end
end

function VersionCheck()
	if OldVersion < 300 then
		Run("Dock.lua")
	elseif OldVersion >= 300 and OldVersion < 310 then 
		Run("Dock.lua","CheckSpotify.lua")
	elseif OldVersion < 313 then
		Run("FixDockHold.lua")
	elseif OldVersion >= Version then
		Display("Done")
		SKIN:Bang("!RefreshApp")
	else
		Display("Done")
		SKIN:Bang("!RefreshApp")
	end
end

function Run(...)
	for i=1,table.getn(arg) do
		table.insert(Scripts,arg[i])
	end
	CurrentFile = 1
	SKIN:Bang("!CommandMeasure","Timer","Execute 1")
end

function Display(string)
	print("NXT-OS Post Install: "..string)
	SKIN:Bang("!SetOption","LoadingText","Text",string)
	SKIN:Bang("!Update")
end

function Next()
	if (CurrentFile + 1) <= table.getn(Scripts) then
		CurrentFile = CurrentFile + 1
		SKIN:Bang("!CommandMeasure","Timer","Execute 1")
	else
		Display("Done")
		SKIN:Bang("!RefreshApp")
	end
end

function Execute()
	Display("Running: "..Scripts[CurrentFile])
	dofile(SKIN:MakePathAbsolute('Resources\\Scripts\\Post\\'..Scripts[CurrentFile]))
	Main()
	Display("Finished: "..Scripts[CurrentFile])
	Next()
end