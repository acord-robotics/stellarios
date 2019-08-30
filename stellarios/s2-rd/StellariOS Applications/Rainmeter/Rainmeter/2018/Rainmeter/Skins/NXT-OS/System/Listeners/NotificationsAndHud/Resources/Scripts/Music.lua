function display(version)
	if SKIN:GetVariable("Command") ~= "" then
		TRACK = (SKIN:GetMeasure("TRACK")):GetStringValue()
		ARTIST = (SKIN:GetMeasure("ARTIST")):GetStringValue()
		ALBUM = (SKIN:GetMeasure("ALBUM")):GetStringValue()
		if string.len(ALBUM) == 0 then
			Separator = " "
		else
			Separator = " - "
		end
		if string.len(TRACK) ~= 0 then
			SKIN:Bang("!SetVariable", "SongTitle", TRACK, "NXT-OS\\Notify")
			SKIN:Bang("!SetVariable", "SongBody", ARTIST..Separator..ALBUM, "NXT-OS\\Notify")
			if version == 1 then
				SKIN:Bang("!CommandMeasure", "Notify", 'notify({name = "Music", group = "Play/Pause", style = 1, icon = "Resources\\\\Images\\\\Music.png", title = "#SongTitle#", body = "#SongBody#"})', "nxt-os\\Notify")
			elseif version == 2 then
				SKIN:Bang("!CommandMeasure", "Notify", 'notify({name = "Music", group = "New Song", style = 1, icon = "Resources\\\\Images\\\\Music.png", title = "#SongTitle#", body = "#SongBody#"})', "nxt-os\\Notify")
			end
		end
	end
end