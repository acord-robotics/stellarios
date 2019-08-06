[LineStyle]
; Area behind the main icon, title, and subtitle
X=0
Y=0
W=200
H=#h.Bar#
SolidColor=#color.Dark#

[IconStyle]
X=5
Y=#y.Icon#
W=22
H=22
ImageTint=#image.Tint#
GreyScale=#image.GreyScale#

[LauncherStyle]
X=28r
Y=0r
W=22
H=22
ImageTint=#image.Tint#
GreyScale=#image.GreyScale#
MouseActionCursor=1

[GapStyle]
; Defines a blank area to the bottom and/or right of a skin to make snapping into position easier
X=205
Y=13r

[GapNoPopupStyle]
; Defines a blank area to the bottom and/or right of a skin to make snapping into position easier
X=205
Y=35

[PopupStyle]
X=0
Y=#h.Bar#
W=200
H=10
SolidColor=#color.Light#

[TitleStyle]
X=33
Y=0
W=160
H=#h.Title#
FontColor=#color.Title#
FontFace=#font.Name#
FontSize=#font.SizeTitle#
StringCase=NONE
StringStyle=BOLD
StringEffect=SHADOW
StringAlign=LEFT
ClipString=1
AntiAlias=1

[SubtitleStyle]
X=34
Y=#h.Title#
W=160
H=#h.Other#
FontColor=#color.Highlight#
FontFace=#font.Name#
FontSize=#font.SizeOther#
StringCase=NONE
StringStyle=BOLD
StringEffect=SHADOW
FontEffectColor=00000040
StringAlign=LEFT
ClipString=1
AntiAlias=1

[TextLeftStyle]
X=5
Y=5r
H=#h.Other#
W=185
ClipString=1
FontColor=#color.Text#
FontFace=#font.Name#
FontSize=#font.SizeOther#
StringCase=NONE
StringStyle=BOLD
StringEffect=SHADOW
FontEffectColor=00000040
StringAlign=LEFT
AntiAlias=1

[TextRightStyle]
X=195
Y=0r
H=#h.Other#
W=145
ClipString=1
FontColor=#color.Text#
FontFace=#font.Name#
FontSize=#font.SizeOther#
StringCase=NONE
StringStyle=BOLD
StringEffect=SHADOW
FontEffectColor=00000040
StringAlign=RIGHT
AntiAlias=1

[SeperatorStyle]
X=6
Y=#h.Other#r
W=188
H=1
BarColor=#color.Highlight#
SolidColor=#color.Seperator#
BarOrientation=HORIZONTAL