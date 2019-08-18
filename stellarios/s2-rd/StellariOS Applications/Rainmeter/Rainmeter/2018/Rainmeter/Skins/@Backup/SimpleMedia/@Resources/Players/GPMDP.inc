[Cover]
Measure=Plugin
Plugin=GPMDPPlugin
PlayerInfo=Cover
DefaultPath=#@#Cover.png
CoverPath=#@#Cover.png
UpdateDivider=10

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

[Progress]
Measure=Plugin
Plugin=GPMDPPlugin
PlayerInfo=Progress

[Duration]
Measure=Plugin
Plugin=GPMDPPlugin
PlayerInfo=Duration

[Position]
Measure=Plugin
Plugin=GPMDPPlugin
PlayerInfo=Position

[PlayerState]
Measure=Plugin
Plugin=GPMDPPlugin
PlayerInfo=State
IfCondition=PlayerState=1
IfTrueAction=[!ShowMeter PauseShape][!HideMeter PlayShape][!Update][!Redraw]
IfFalseAction=[!HideMeter PauseShape][!ShowMeter PlayShape][!Update][!Redraw]