[Player]
Measure=Plugin
Plugin=NowPlaying
PlayerName=AIMP
PlayerType=FILE

[Cover]
Measure=Plugin
Plugin=NowPlaying
PlayerName=[Player]
PlayerType=COVER

[Track]
Measure=Plugin
Plugin=NowPlaying
PlayerName=[Player]
PlayerType=TITLE
Substitute="":"N/A"

[Album]
Measure=Plugin
Plugin=NowPlaying
PlayerName=[Player]
PlayerType=ALBUM
Substitute="":"N/A"

[Artist]
Measure=Plugin
Plugin=NowPlaying
PlayerName=[Player]
PlayerType=ARTIST
Substitute="":"N/A"

[Progress]
Measure=Plugin
Plugin=NowPlaying
PlayerName=[Player]
PlayerType=Progress
NumOfDecimals=0

[Duration]
Measure=Plugin
Plugin=NowPlaying
PlayerName=[Player]
PlayerType=Duration
NumOfDecimals=0

[Position]
Measure=Plugin
Plugin=NowPlaying
PlayerName=[Player]
PlayerType=Position
NumOfDecimals=0

[PlayerState]
Measure=Plugin
Plugin=NowPlaying
PlayerName=[Player]
DynamicVariables=1
PlayerType=State
IfCondition=(PlayerState=1)
IfTrueAction=[!SetOption PauseShape "Modifiers" "StrokeWidth 0 | FillColor #Color#"][!SetOption PauseShapeR "Modifiers" "StrokeWidth 0 | FillColor #Color#"][!SetOption PlayShape "Modifiers" "StrokeWidth 0 | FillColor 0,0,0,0"][!SetOption PlayShapeR "Modifiers" "StrokeWidth 0 | FillColor 0,0,0,0"][!Update]
IfFalseAction=[!SetOption PauseShape "Modifiers" "StrokeWidth 0 | FillColor 0,0,0,0"][!SetOption PauseShapeR "Modifiers" "StrokeWidth 0 | FillColor 0,0,0,0"][!SetOption PlayShape "Modifiers" "StrokeWidth 0 | FillColor #Color#"][!SetOption PlayShapeR "Modifiers" "StrokeWidth 0 | FillColor #Color#"][!Update]
