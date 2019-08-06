;=
; meterstyles
;============================

[styleLine]
LineColor=#Color.ClockSecondary#
LineWidth=(#ItemWidth#/2)
RotationAngle=(#Inward#*PI)
ControlAngle=0
AntiAlias=1
DynamicVariables=1

[sFactoryBars]
Measure=Script
ScriptFile=Resources\Scripts\Factory.lua
IncFile=Resources\Includes\Lines.inc
Number=#NumOfItems#
SectionName=%%
Option0=Meter
Value0=Roundline
Option1=MeterStyle
Value1=styleLine
Option2=StartAngle
Value2={#FORMULA_THETA#}
Option3=X
Value3={#Radius#*Cos(#FORMULA_THETA#%(PI*2))+#Radius#+#ExtrudeMax#}
Option4=Y
Value4={#RadiusY#*Sin(#FORMULA_THETA#%(PI*2))+#RadiusY#+#ExtrudeMax#}
Option5=LineLength
Value5=((#FORMULA_AVG#=0)?{#ExtrudeMin#=0?-1:#ExtrudeMin#}:((#FORMULA_AVG#-[mBand%%])*{#Smoothing#}+[mBand%%])*{#ExtrudeMax#-#ExtrudeMin#}+#ExtrudeMin#)
Option6=DynamicVariables
Value6=1
UpdateDivider=-1

@Include3=#SKINSPATH#\NXT-OS\Visualizer\Resources\Includes\Lines.inc