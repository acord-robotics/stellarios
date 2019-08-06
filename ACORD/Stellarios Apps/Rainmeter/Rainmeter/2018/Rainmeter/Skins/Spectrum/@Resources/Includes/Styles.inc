[Rainmeter]
SolidColor=0,0,0,1

[SidebarR]
Meter=Image
X=(#WValue#)
Y=0
W=336
H=(#SCREENAREAHEIGHT#)
SolidColor=0,0,0,102
DynamicVariables=1
MouseLeaveAction=#BGExit#

[LineF1]
Meter=Image
X=60
Y=20
W=266
H=4
SolidColor=0,153,255
SolidColor2=139,22,216
UpdateDivider=-1
Hidden=1
Group=DashMenu
AntiAlias=1

;===== Meter Styles=====
;All of these meter styles are required.

;Day Label Styles
[LblTxtSty]
H=#C.h#
W=#C.w#
X=#Space.X#R
Y=r
FontFace=DecimaPro
FontColor=255,255,255,255
FontSize=18
stringAlign=CenterCenter
AntiAlias=1
Hidden=1
Group=DashMenu

[LblTxtStart]
X=(#Bumper.x#+#C.w#/2)
Y=(#Bumper.top#+#C.h#*1.5+#Space.y#)

[LblCurrSty]

;Main Calendar Styles
[TextStyle]
H=#C.h#
W=#C.w#
X=(#Space.X#+#C.w#)r
Y=r
FontColor=255,255,255,255
FontFace=DecimaPro
FontSize=16
stringAlign=center
AntiAlias=1
Hidden=1
Group=DashMenu

[FirstDay]
Y=(#C.h#/2+#Space.y#)r
X=(#Bumper.x#+#C.w#/2)

[NewWk]
Y=#Space.y#R
X=(#Bumper.x#+#C.w#/2)

[CurrentDay]
FontColor=255,255,255,255
SolidColor=255,255,255,64
FontFace=DecimaPro-Bold

[LastWeek]
FontColor=0,0,0,0

[PreviousMonth]
FontColor=255,255,255,64

[NextMonth]
FontColor=255,255,255,64

[HolidayStyle]
FontColor=255,255,255,64

[WeekendStyle]

;========== METERS ==========
;These are not required.
[mLabel]
Meter=String
Text=#MonthLabel#
W=(#C.w#*7+#Space.x#*6)
X=((#C.w#*7+#Space.x#*6)/2+#Bumper.x#+10)
Y=(#Bumper.top#-6)
H=#C.h#
FontColor=255,255,255,255
FontFace=DecimaPro
FontSize=18
stringAlign=Center
AntiAlias=1
DynamicVariables=1
Hidden=1
Group=DashMenu

;Control Bar
[ControlForward]
Meter=String
MeterStyle=TextStyle
FontFace=Klavika Arrows
StringAlign=Left
StringStyle=Bold
Text="B"
FontSize=16
Y=#Bumper.top#
X=((#C.w#*6+#Space.x#*6)+#Bumper.x#)
LeftMouseUpAction=[!CommandMeasure "Lua" "Move(1)"][!Update]
Hidden=1
Group=DashMenu

[ControlBack]
Meter=String
MeterStyle=TextStyle|ControlForward
Text="A"
X=#Bumper.x#
LeftMouseUpAction=[!CommandMeasure "Lua" "Move(-1)"][!Update]

[ControlHome]
Meter=String
MeterStyle=TextStyle|ControlForward
Text="H"
X=10R
Y=-2r
LeftMouseUpAction=[!CommandMeasure "Lua" "Move()"][!Update]

;Date Indicator
[TodayHL]
Meter=image
X=(#Bumper.x#+(#C.w#+#Space.x#)*#Week#+3)
Y=(#Bumper.top#+(#C.h#+#Space.y#)*(#ThisWeek#+1)+#C.h#-2)
H=2
W=(#C.w#-6)
SolidColor=#Clr.Hrl#
Hidden=#NotCurrentMonth#
DynamicVariables=1
Group=DashMenu

[Ghost]
Meter=Image
SolidColor=0,0,0,1
H=1
W=1
X=(#C.w#*7+#Space.x#*6+#Bumper.x#*2-1)
Y=(#Bumper.top#+#Bumper.bottom#+(#C.h#+#Space.y#)*7+#C.h#+1)