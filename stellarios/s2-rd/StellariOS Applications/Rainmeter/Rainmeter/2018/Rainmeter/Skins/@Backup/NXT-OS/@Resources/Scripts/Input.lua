Lock = false
function processinput(name,style,active,mousex,mousey)
	Name = name
	Meter = SKIN:GetMeter(name)
	local MeterW = Meter:GetW()
	local mousex = tonumber(mousex)
	local mousey = tonumber(mousey)
	if style == "normal" and active == "true" then
		input(style)
	elseif style == "browse" then
		if active == "true" then
			if mousex < (MeterW-73) then
				input(style)
			end
		end
		if mousex > (MeterW-73) then
			local BrowseCommand = Meter:GetOption("BrowseCommand")
			if BrowseCommand ~= "" then
				SKIN:Bang(BrowseCommand)
			else
				SKIN:Bang("!CommandMeasure", "Error", 'DisplayError({type="3",title="'..SKIN:GetVariable("CURRENTFILE")..'",desc="The command peramiter for this browse button was left unused. If you are not the developer of this skin please contact them to report this issue.",lefttext=""})', "nxt-os\\system")
			end
		end
	elseif style == "password" then
		if active == "true" then
			if mousex < (MeterW-30) then
				input(style)
			end
		end
		--if mousex > (MeterW-30) then
		--	local EnterCommand = Meter:GetOption("EnterCommand")
		--	if EnterCommand ~= "" then
		--		SKIN:Bang(EnterCommand)
		--	else
		--		SKIN:Bang("!CommandMeasure", "Error", 'DisplayError({type="3",title="'..SKIN:GetVariable("CURRENTFILE")..'",desc="The command peramiter for this enter button was left unused. If you are not the developer of this skin please contact them to report this issue.",lefttext=""})', "nxt-os\\system")
		--	end
		--end
	elseif style == "adjust" then
		if active == "true" then
			if mousex < (MeterW-59) then
				input(style)
			end
		end
		if mousex > (MeterW-59) and mousex < (MeterW-30) then
			local MinusCommand = Meter:GetOption("MinusCommand",'N/A')
			if MinusCommand ~= "N/A" then
				SKIN:Bang(MinusCommand)
			else
				SKIN:Bang("!CommandMeasure", "Error", 'DisplayError({type="3",title="'..SKIN:GetVariable("CURRENTFILE")..'",desc="The command peramiter for this minus button was left unused. If you are not the developer of this skin please contact them to report this issue.",lefttext=""})', "nxt-os\\system")
			end
		elseif mousex > (MeterW-30) then
			local PlusCommand = Meter:GetOption("PlusCommand",'N/A')
			if PlusCommand ~= "N/A" then
				SKIN:Bang(PlusCommand)
			else
				SKIN:Bang("!CommandMeasure", "Error", 'DisplayError({type="3",title="'..SKIN:GetVariable("CURRENTFILE")..'",desc="The command peramiter for this plus button was left unused. If you are not the developer of this skin please contact them to report this issue.",lefttext=""})', "nxt-os\\system")
			end
		end
	end
end

function input(style)
	local Command = Meter:GetOption("Command")
	if Command == "" then
		SKIN:Bang("!CommandMeasure", "Error", 'DisplayError({type="3",title="'..SKIN:GetVariable("CURRENTFILE")..'",desc="The command peramiter for this input box was left unused. If this box is not intened to be used for input make sure to remove .active from the end of the meterstyle name. If you are not the developer of this skin please contact them to report this issue.",lefttext=""})', "nxt-os\\system")
		return
	end
	local PosX = Meter:GetX()
	local PosY = Meter:GetY()
	local MeterW = Meter:GetW()
	local MeterH = Meter:GetH()
	local DefaultValue = Meter:GetOption('DefaultValue')
	local Password = Meter:GetOption('Password',"0")
	local PassState = Meter:GetOption('PassState',"0")
	local RunDismiss = Meter:GetOption('RunDismiss',"0")
	local InputNumber = Meter:GetOption('InputNumber',"0")
	local InputLimit = Meter:GetOption('InputLimit',"0")
	local SetX = nil
	local SetY = nil
	local SetW = nil
	local SetH = nil 
	local ActiveImageName = nil
	local ImageName = nil
	if style == "normal" then
		SetX = (PosX+5)
		SetY = (PosY+5)
		SetW = (MeterW-10)
		SetH = (MeterH-10)
		ActiveImageName = "#SKINSPATH#NXT-OS\\@Resources\\Images\\InputBoxActive.png"
		ImageName = "#SKINSPATH#NXT-OS\\@Resources\\Images\\InputBox.png"
	elseif style == "browse" then
		SetX = (PosX+5)
		SetY = (PosY+5)
		SetW = (MeterW-82)
		SetH = (MeterH-10)
		ActiveImageName = "#SKINSPATH#NXT-OS\\@Resources\\Images\\InputBox_BrowseActive.png"
		ImageName = "#SKINSPATH#NXT-OS\\@Resources\\Images\\InputBox_Browse.png"
	elseif style == "password" then
		SetX = (PosX+5)
		SetY = (PosY+5)
		SetW = (MeterW-39)
		SetH = (MeterH-10)
		if PassState == "1" then
			ActiveImageName = "#SKINSPATH#NXT-OS\\@Resources\\Images\\InputBox_PasswordWrong.png"
		else
			ActiveImageName = "#SKINSPATH#NXT-OS\\@Resources\\Images\\InputBox_PasswordActive.png"
		end
		ImageName = "#SKINSPATH#NXT-OS\\@Resources\\Images\\InputBox_Password.png"
	elseif style == "adjust" then
		SetX = (PosX+5)
		SetY = (PosY+5)
		SetW = (MeterW-68)
		SetH = (MeterH-10)
		ActiveImageName = "#SKINSPATH#NXT-OS\\@Resources\\Images\\InputBox_AdjustActive.png"
		ImageName = "#SKINSPATH#NXT-OS\\@Resources\\Images\\InputBox_Adjust.png"
	end
	if not Lock then
		SKIN:Bang("!SetOption","Window.InputMeasure","OnDismissAction",'[!SetOption "'..Name..'" "ImageName" "'..ImageName..'"][!Update][!CommandMeasure Window.Input.Script lock(false)]')
		SKIN:Bang("!SetOption","Window.InputMeasure","InputNumber",InputNumber)
		SKIN:Bang("!SetOption","Window.InputMeasure","InputLimit",InputLimit)
		SKIN:Bang("!SetOption","Window.InputMeasure","Command1",Command..'[!SetOption "'..Name..'" "ImageName" "'..ImageName..'"][!UpdateMeter "'..Name..'"][!Redraw][!CommandMeasure Window.Input.Script lock(false)] X='..SetX.." Y="..SetY.." W="..SetW.." H="..SetH.." Password="..Password.." RunDismiss="..RunDismiss..' DefaultValue="'..DefaultValue..'"')
		SKIN:Bang("!Update")
		SKIN:Bang("!CommandMeasure", "Window.InputMeasure", "ExecuteBatch 1")
		SKIN:Bang("!SetOption",Name,"ImageName",ActiveImageName)
		SKIN:Bang('!Update')
		Lock = true
	end
end

function adjust(name,direction)
	local Meter = SKIN:GetMeter(name)
	local MinusCommand = Meter:GetOption("MinusCommand",'N/A')
	local PlusCommand = Meter:GetOption("PlusCommand",'N/A')
	if direction == "up" then
		if PlusCommand ~= "N/A" then
			SKIN:Bang(PlusCommand)
		else
			SKIN:Bang("!CommandMeasure", "Error", 'DisplayError({type="3",title="'..SKIN:GetVariable("CURRENTFILE")..'",desc="The command peramiter for this plus button was left unused. If you are not the developer of this skin please contact them to report this issue.",lefttext=""})', "nxt-os\\system")
		end
	elseif direction == "down" then
		if MinusCommand ~= "N/A" then
			SKIN:Bang(MinusCommand)
		else
			SKIN:Bang("!CommandMeasure", "Error", 'DisplayError({type="3",title="'..SKIN:GetVariable("CURRENTFILE")..'",desc="The command peramiter for this minus button was left unused. If you are not the developer of this skin please contact them to report this issue.",lefttext=""})', "nxt-os\\system")
		end
	end
end

function lock(state)
	Lock = state
end
