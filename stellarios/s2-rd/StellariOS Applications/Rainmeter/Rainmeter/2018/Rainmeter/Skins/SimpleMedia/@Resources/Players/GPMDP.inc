[Player]
Measure=Plugin
Plugin=GPMDPPlugin

[Cover]
Measure=Plugin
Plugin=GPMDPPlugin
PlayerInfo=Cover
CoverPath=#@#Images\Cover.png

[Track]
Measure=Plugin
Plugin=GPMDPPlugin
PlayerInfo=Title
Substitute="":"N/A"

[Artist]
Measure=Plugin
Plugin=GPMDPPlugin
PlayerInfo=Artist
Substitute="":"N/A"

[Album]
Measure=Plugin
Plugin=GPMDPPlugin
PlayerInfo=Album
Substitute="":"N/A"

[Progress]
Measure=Plugin
Plugin=GPMDPPlugin
PlayerInfo=Progress
NumOfDecimals=0

[Duration]
Measure=Plugin
Plugin=GPMDPPlugin
PlayerInfo=Duration
NumOfDecimals=0

[Position]
Measure=Plugin
Plugin=GPMDPPlugin
PlayerInfo=Position
NumOfDecimals=0

[PlayerState]
Measure=Plugin
Plugin=GPMDPPlugin
DynamicVariables=1
PlayerInfo=State
IfCondition=(PlayerState=1)
IfTrueAction=[!SetOption PauseShape "Modifiers" "StrokeWidth 0 | FillColor #Color#"][!SetOption PauseShapeR "Modifiers" "StrokeWidth 0 | FillColor #Color#"][!SetOption PlayShape "Modifiers" "StrokeWidth 0 | FillColor 0,0,0,0"][!SetOption PlayShapeR "Modifiers" "StrokeWidth 0 | FillColor 0,0,0,0"][!Update]
IfFalseAction=[!SetOption PauseShape "Modifiers" "StrokeWidth 0 | FillColor 0,0,0,0"][!SetOption PauseShapeR "Modifiers" "StrokeWidth 0 | FillColor 0,0,0,0"][!SetOption PlayShape "Modifiers" "StrokeWidth 0 | FillColor #Color#"][!SetOption PlayShapeR "Modifiers" "StrokeWidth 0 | FillColor #Color#"][!Update]
