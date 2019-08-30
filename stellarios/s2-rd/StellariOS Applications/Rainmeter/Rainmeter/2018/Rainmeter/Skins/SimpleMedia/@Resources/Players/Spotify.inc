[Player]
Measure=Plugin
Plugin=NowPlaying
PlayerName=Spotify

[Cover]
Measure=Plugin
Plugin=SpotifyPlugin
Type=AlbumArt
CoverPath=#@#Images\Cover.png

[Track]
Measure=Plugin
Plugin=SpotifyPlugin
Type=TrackName
Substitute="":"N/A"

[Album]
Measure=Plugin
Plugin=SpotifyPlugin
Type=AlbumName
Substitute="":"N/A"

[Artist]
Measure=Plugin
Plugin=SpotifyPlugin
Type=ArtistName
Substitute="":"N/A"

[Progress]
Measure=Plugin
Plugin=SpotifyPlugin
Type=Progress
NumOfDecimals=0

[Duration]
Measure=Plugin
Plugin=SpotifyPlugin
Type=Duration
NumOfDecimals=0

[Position]
Measure=Plugin
Plugin=SpotifyPlugin
Type=Position
NumOfDecimals=0

[PlayerState]
Measure=Plugin
Plugin=NowPlaying
PlayerName=[Player]
PlayerType=State

[PlayerStateCalc]
Measure=Plugin
Plugin=SpotifyPlugin
DynamicVariables=1
Type=Playing
IfCondition=(PlayerState=0)
IfTrueAction=[!SetOption PauseShape "Modifiers" "StrokeWidth 0 | FillColor #Color#"][!SetOption PauseShapeR "Modifiers" "StrokeWidth 0 | FillColor #Color#"][!SetOption PlayShape "Modifiers" "StrokeWidth 0 | FillColor 0,0,0,0"][!SetOption PlayShapeR "Modifiers" "StrokeWidth 0 | FillColor 0,0,0,0"][!Update]
IfFalseAction=[!SetOption PauseShape "Modifiers" "StrokeWidth 0 | FillColor 0,0,0,0"][!SetOption PauseShapeR "Modifiers" "StrokeWidth 0 | FillColor 0,0,0,0"][!SetOption PlayShape "Modifiers" "StrokeWidth 0 | FillColor #Color#"][!SetOption PlayShapeR "Modifiers" "StrokeWidth 0 | FillColor #Color#"][!Update]
