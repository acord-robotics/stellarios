function Main()
	local state = SKIN:GetVariable("GameDrawer.DrawerMode")
	if state == "0" then
		SKIN:Bang('[!WriteKeyValue Variables GameDrawer.DrawerMode 1 "#@#Settings.inc"]')
		SKIN:Bang('[!ActivateConfig NXT-OS\\GameDrawer GameDrawer.ini]')
		SKIN:Bang('[!CommandMeasure GameDrawer PlaceSkin() NXT-OS\\GameDrawer]')
		SKIN:Bang('[!DeactivateConfig NXT-OS\\GameDrawer]')
		SKIN:Bang('[!WriteKeyValue Variables GameDrawer.DrawerMode 0 "#@#Settings.inc"]')
	else
		SKIN:Bang('[!ActivateConfig NXT-OS\\GameDrawer GameDrawer.ini]')
		SKIN:Bang('[!CommandMeasure GameDrawer PlaceSkin() NXT-OS\\GameDrawer]')
	end
end