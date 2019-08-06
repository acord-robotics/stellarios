[Cover]
Measure=Plugin
Plugin=SpotifyPlugin.dll
Type=AlbumArt
DefaultPath=#@#cover.png
CoverPath=#@#Cover.png

[Track]
Measure=Plugin
Plugin=SpotifyPlugin
Type=TrackName
Substitute="":"N/A"

[Artist]
Measure=Plugin
Plugin=SpotifyPlugin
Type=ArtistName
Substitute="":"N/A"

[Progress]
Measure=Plugin
Plugin=SpotifyPlugin.dll
Type=Progress

[Duration]
Measure=Plugin
Plugin=SpotifyPlugin.dll
Type=Duration

[Position]
Measure=Plugin
Plugin=SpotifyPlugin.dll
Type=Position

[PlayerState]
Measure=Plugin
Plugin=SpotifyPlugin.dll
Type=Playing
IfCondition=PlayerState=0
IfTrueAction=[!ShowMeter PauseShape][!HideMeter PlayShape][!Update][!Redraw]
IfFalseAction=[!HideMeter PauseShape][!ShowMeter PlayShape][!Update][!Redraw]