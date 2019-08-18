[Player]
Measure=Plugin
Plugin=WebNowPlaying
PlayerType=Cover

[Cover]
Measure=Plugin
Plugin=WebNowPlaying
PlayerType=Cover
CoverPath=#@#Images\Cover.png

[Track]
Measure=Plugin
Plugin=WebNowPlaying
PlayerType=Title
Substitute="":"N/A"

[Artist]
Measure=Plugin
Plugin=WebNowPlaying
PlayerType=Artist
Substitute="":"N/A"

[Album]
Measure=Plugin
Plugin=WebNowPlaying
PlayerType=Album
Substitute="":"N/A"

[Progress]
Measure=Plugin
Plugin=WebNowPlaying
PlayerType=Progress
NumOfDecimals=0

[Duration]
Measure=Plugin
Plugin=WebNowPlaying
PlayerType=Duration
NumOfDecimals=0

[Position]
Measure=Plugin
Plugin=WebNowPlaying
PlayerType=Position
NumOfDecimals=0

[Volume]
Measure=Plugin
Plugin=WebNowPlaying
PlayerType=Volume

[PlayerState]
Measure=Plugin
Plugin=WebNowPlaying
DynamicVariables=1
PlayerType=State
IfCondition=(PlayerState=1)
IfTrueAction=[!SetOption PauseShape "Modifiers" "StrokeWidth 0 | FillColor #Color#"][!SetOption PauseShapeR "Modifiers" "StrokeWidth 0 | FillColor #Color#"][!SetOption PlayShape "Modifiers" "StrokeWidth 0 | FillColor 0,0,0,0"][!SetOption PlayShapeR "Modifiers" "StrokeWidth 0 | FillColor 0,0,0,0"][!Update]
IfFalseAction=[!SetOption PauseShape "Modifiers" "StrokeWidth 0 | FillColor 0,0,0,0"][!SetOption PauseShapeR "Modifiers" "StrokeWidth 0 | FillColor 0,0,0,0"][!SetOption PlayShape "Modifiers" "StrokeWidth 0 | FillColor #Color#"][!SetOption PlayShapeR "Modifiers" "StrokeWidth 0 | FillColor #Color#"][!Update]
