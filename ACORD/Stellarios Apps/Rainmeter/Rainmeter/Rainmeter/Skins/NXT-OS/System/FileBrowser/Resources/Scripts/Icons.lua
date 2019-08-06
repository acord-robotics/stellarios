function Initialize()
	listlength = 18
	index = 1
	selectlock = false
	showingsortby = false
	pathlist = {}
	info = {}
	mode = SKIN:GetVariable('Mode')
	table.insert(pathlist,SKIN:GetVariable('Path'))
	DrawSort()
end

function Up()
	SKIN:Bang('!SetOption','FileBrowser.Confirm.Text','FontColor','150,150,150')
	SKIN:Bang('!SetOption','FileBrowser.Confirm.Text','Text','Select')
	SKIN:Bang('!SetOption','FileBrowser.Confirm','LeftMouseUpAction','')
	SKIN:Bang('!SetVariable','SelectedName','')
	SKIN:Bang('[!CommandMeasure mPath "PreviousFolder"][!Update]')
	if index < table.getn(pathlist) then
		while table.getn(pathlist) > index do
			table.remove(pathlist)
		end
	end
	table.insert(pathlist,SKIN:GetMeasure('mPath'):GetStringValue())
	index = table.getn(pathlist)
end

function Back()
	if index > 1 then
		index = (index-1)
		path=pathlist[index]
		SKIN:Bang('!SetOption','FileBrowser.Confirm.Text','FontColor','150,150,150')
		SKIN:Bang('!SetOption','FileBrowser.Confirm.Text','Text','Select')
		SKIN:Bang('!SetOption','FileBrowser.Confirm','LeftMouseUpAction','')
		SKIN:Bang('!SetVariable','SelectedName','')
		SKIN:Bang('[!SetOption "mPath" "Path" "'..path..'"][!CommandMeasure "mPath" "Update"][!Update]')
	end
end

function Forward()
	if index < table.getn(pathlist) then
		index = (index+1)
		path=pathlist[index]
		SKIN:Bang('!SetOption','FileBrowser.Confirm.Text','FontColor','150,150,150')
		SKIN:Bang('!SetOption','FileBrowser.Confirm.Text','Text','Select')
		SKIN:Bang('!SetOption','FileBrowser.Confirm','LeftMouseUpAction','')
		SKIN:Bang('!SetVariable','SelectedName','')
		SKIN:Bang('[!SetOption "mPath" "Path" "'..path..'"][!CommandMeasure "mPath" "Update"][!Update]')
	end
end

function Confirm()
	local path = SKIN:GetVariable('SelectedPath')
	local finishcommands = string.gsub(SKIN:GetVariable("Bangs"),"%$FileBrowser.Output%$",path)
 	SKIN:Bang(finishcommands)
	SKIN:Bang('!DeactivateConfig')
end

function DrawSort()
	SKIN:Bang('!SetOptionGroup FileBrowserDots Text ""')
	local Ascending = SKIN:GetVariable('Ascending')
	local SortBy = SKIN:GetVariable('SortBy')
	if Ascending == "0" then
		SKIN:Bang('!SetOption','FileBrowser.SortDropDown.Descending.Dot','Text','=')
	else
		SKIN:Bang('!SetOption','FileBrowser.SortDropDown.Ascending.Dot','Text','=')
	end
	SKIN:Bang('!SetOption','FileBrowser.SortDropDown.'..SortBy..'.Dot','Text','=')
end

function Sort(SortBy,Ascending)
	if SortBy == SKIN:GetVariable('SortBy') then
		if Ascending == nil then
			if SKIN:GetVariable('Ascending') == "1" then
				Ascending = "0"
			else
				Ascending = "1"
			end
		end
	else
		Ascending = SKIN:GetVariable('Ascending')
	end
	SKIN:Bang('!SetVariable','SortBy',SortBy)
	SKIN:Bang('!SetOption','mPath','SortType',SortBy)
	SKIN:Bang('!SetVariable','Ascending',Ascending)
	SKIN:Bang('!SetOption','mPath','SortAscending',Ascending)
	DrawSort()
	SKIN:Bang('[!SetOption "mPath" "Path" "#Path#"][!CommandMeasure "mPath" "Update"][!SetVariable Selected 0][!SetOption mCurrentPosition Formula "0"][!UpdateMeasureGroup "Measures"][!UpdateMeterGroup "ListItems"][!Update]')
end

function SetPath(meter)
	local path = SKIN:GetMeter(meter):GetOption('Path')
	local pathname = SKIN:GetMeter(meter):GetOption('Text')
	if path ~= "" then
		SKIN:Bang('!SetOption','FileBrowser.Confirm.Text','FontColor','150,150,150')
		SKIN:Bang('!SetOption','FileBrowser.Confirm.Text','Text','Select')
		SKIN:Bang('!SetOption','FileBrowser.Confirm','LeftMouseUpAction','')
		if mode == "0" then
			SKIN:Bang('!SetVariable','SelectedName',pathname)
			SKIN:Bang('!SetVariable','SelectedPath',path)
			SKIN:Bang('!SetOption','FileBrowser.Confirm.Text','FontColor','80,80,80')
			SKIN:Bang('!SetOption','FileBrowser.Confirm.Text','Text','Select')
			SKIN:Bang('!SetOption','FileBrowser.Confirm','LeftMouseUpAction','[!CommandMeasure ControllerScript "Confirm()"]')
		else
			SKIN:Bang('!SetVariable','SelectedName','')
		end
		SKIN:Bang('[!SetOption mPath Path "'..path..'"][!SetVariable Path "'..path..'"][!CommandMeasure mPath Update][!Update]')
		if index < table.getn(pathlist) then
			while table.getn(pathlist) > index do
				table.remove(pathlist)
			end
		end
		table.insert(pathlist,SKIN:GetMeasure('mPath'):GetStringValue())
		index = table.getn(pathlist)
	end
end

function Follow(num)
	SKIN:Bang('[!SetOption FileBrowser.IconElement.'..num..' LeftMouseUpAction ""]')
	SKIN:Bang('[!UpdateMeasureGroup "Measures"][!UpdateMeterGroup "IconElement"]')
	local fullpath = SKIN:GetMeasure('mPath'):GetStringValue()
	local path = SKIN:GetMeasure('mIndex'..num..'Name'):GetStringValue()
	local kind = SKIN:GetMeasure('mIndex'..num..'Type'):GetStringValue()
	if path ~= "" then
		if kind == "" then
			SKIN:Bang('!SetOption','FileBrowser.Confirm.Text','FontColor','150,150,150')
			SKIN:Bang('!SetOption','FileBrowser.Confirm.Text','Text','Select')
			SKIN:Bang('!SetOption','FileBrowser.Confirm','LeftMouseUpAction','')
			SKIN:Bang('!SetVariable','SelectedName','')
			SKIN:Bang('[!CommandMeasure mIndex'..num..'Name "FollowPath"][!Update]')
		else
			Confirm()
		end
		if index < table.getn(pathlist) then
			while table.getn(pathlist) > index do
				table.remove(pathlist)
			end
		end
		table.insert(pathlist,SKIN:GetMeasure('mPath'):GetStringValue())
		index = table.getn(pathlist)
		SKIN:Bang('!SetOption', 'FileBrowser.IconElement.'..num, 'LeftMouseUpAction','[!CommandMeasure ControllerScript Select('..num..')]')
	end
end

function Select(num)
	local fullpath = SKIN:GetMeasure('mPath'):GetStringValue()
	local path = SKIN:GetMeasure('mIndex'..num..'Name'):GetStringValue()
	local kind = SKIN:GetMeasure('mIndex'..num..'Type'):GetStringValue()
	if path ~= "" then
		SKIN:Bang('!SetVariable','SelectedName',path)
		SKIN:Bang('!SetVariable','SelectedPath',fullpath..path)
		if mode == "1" then
			if kind ~= "" then 
				SKIN:Bang('!SetOption','FileBrowser.Confirm.Text','FontColor','80,80,80')
				SKIN:Bang('!SetOption','FileBrowser.Confirm.Text','Text','Select')
				SKIN:Bang('!SetOption','FileBrowser.Confirm','LeftMouseUpAction','[!CommandMeasure ControllerScript "Follow('..num..')"]')
			else
				SKIN:Bang('!SetOption','FileBrowser.Confirm.Text','FontColor','80,80,80')
				SKIN:Bang('!SetOption','FileBrowser.Confirm.Text','Text','Open')
				SKIN:Bang('!SetOption','FileBrowser.Confirm','LeftMouseUpAction','[!CommandMeasure ControllerScript "Follow('..num..')"]')
			end
		else
			SKIN:Bang('!SetOption','FileBrowser.Confirm.Text','FontColor','80,80,80')
			SKIN:Bang('!SetOption','FileBrowser.Confirm.Text','Text','Select')
			SKIN:Bang('!SetOption','FileBrowser.Confirm','LeftMouseUpAction','[!CommandMeasure ControllerScript "Confirm()"]')
		end
		SKIN:Bang('[!UpdateMeasureGroup "Measures"][!UpdateMeterGroup "ListItems"][!Update]')
	end
end
