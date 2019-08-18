[sLineScript]
Measure=Script
ScriptFile=#SKINSPATH#\NXT-OS\Visualizer\Resources\Scripts\Wave.lua

[Wave]
Meter=Shape
X=0
Y=0
Shape=Path Path | StrokeWidth 0 | Fill Color #Color.ClockSecondary#
Shape2=Ellipse (#ExtrudeMax#+#Radius#),(#ExtrudeMax#+#RadiusY#),#Radius#,#RadiusY# | StrokeWidth 0
Shape3=Combine Shape | Exclude Shape2
Path=0,0 | LineTo 0,0
AntiAlias=1
