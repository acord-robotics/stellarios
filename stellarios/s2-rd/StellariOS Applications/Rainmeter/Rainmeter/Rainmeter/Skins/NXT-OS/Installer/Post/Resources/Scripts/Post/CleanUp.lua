function Main()
	Display("Removing old NXT-OS layout")
	local path = SKIN:GetVariable('SETTINGSPATH')..'Layouts\\NXTOS\\'
	os.execute('rd "'..path..'" /S /Q')
end
