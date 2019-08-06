function Main()
	Display("Checking player plugin")
	local Player = string.lower(SKIN:GetVariable("System.Player"))
	local Plugin = string.lower(SKIN:GetVariable("System.PlayerPlugin"))
	Display("Player: "..Player.." Plugin: "..Plugin)
	if Player == "spotify" and Plugin ~= "spotify" then
		Display("Changing Plugin to Spotify")
		SKIN:Bang("!WriteKeyValue", "Variables", "System.PlayerPlugin", "Spotify", "#@#Settings.inc")
	elseif Player ~= "spotify" and Plugin == "spotify" then
		Display("Changing Plugin to NowPlaying")
		SKIN:Bang("!WriteKeyValue", "Variables", "System.PlayerPlugin", "NowPlaying", "#@#Settings.inc")
	end
end