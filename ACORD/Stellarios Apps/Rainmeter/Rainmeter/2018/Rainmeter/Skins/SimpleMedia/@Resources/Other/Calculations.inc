; ----------------------------------------- Rounded Calc

[RoundCalc]
Measure=Calc
IfCondition=(#Round#=1)
IfTrueAction=[!ShowMeterGroup Rounded][!HideMeterGroup Angled]
IfFalseAction=[!HideMeterGroup Rounded][!ShowMeterGroup Angled]

; ----------------------------------------- Border Calc

[AlbumArtBorderCalc]
Measure=Calc
IfCondition=(#BorderCA#=1)
IfTrueAction=[!ShowMeter BorderS][!ShowMeter BorderC]
IfFalseAction=[!HideMeter BorderS][!HideMeter BorderC]

[ProgressBorderCalc]
Measure=Calc
IfCondition=(#BorderPG#=1)
IfTrueAction=[!SetOption ProgressBar "Background" "FillColor #Color#,100"]
IfFalseAction=[!SetOption ProgressBar "Background" "FillColor 0,0,0,0"]