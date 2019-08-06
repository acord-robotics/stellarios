[ColorIT]
Measure=Plugin
Plugin=InputText
Command1=[!WriteKeyValue Variables Color "$UserInput$" "#@#Other\Variables.inc"][!Refresh *]
DefaultValue=#Color#
StringAlign=Center
SolidColor=15,15,15
FontFace =Open Sans
FontSize =10
FontColor=255,255,255
Antialias=1
X=[ColorVar:X]
Y=[ColorVar:Y]
W=[ColorVar:W]
H=[ColorVar:H]

[FontIT]
Measure=Plugin
Plugin=InputText
Command1=[!WriteKeyValue Variables Font "$UserInput$" "#@#Other\Variables.inc"][!Refresh][!Refresh "#RootConfig#\Track Info"][!Refresh "#RootConfig#\Track Info\Progress Bar"]
DefaultValue=#Font#
StringAlign=Center
SolidColor=15,15,15
FontFace =Open Sans
FontSize =10
FontColor=255,255,255
Antialias=1
X=[FontVar:X]
Y=[FontVar:Y]
W=[FontVar:W]
H=[FontVar:H]

[AlbumArtScaleIT]
Measure=Plugin
Plugin=InputText
Command1=[!WriteKeyValue Variables AScale "$UserInput$" "#@#Other\Variables.inc"][!Refresh][!Refresh "#RootConfig#\Track Info\Cover"]
DefaultValue=#AScale#
StringAlign=Center
SolidColor=15,15,15
FontFace =Open Sans
FontSize =10
FontColor=255,255,255
Antialias=1
X=[AlbumArtScaleVar:X]
Y=[AlbumArtScaleVar:Y]
W=[AlbumArtScaleVar:W]
H=[AlbumArtScaleVar:H]

[ButtonScaleIT]
Measure=Plugin
Plugin=InputText
Command1=[!WriteKeyValue Variables BScale "$UserInput$" "#@#Other\Variables.inc"][!Refresh *]
DefaultValue=#BScale#
StringAlign=Center
SolidColor=15,15,15
FontFace =Open Sans
FontSize =10
FontColor=255,255,255
Antialias=1
X=[ButtonScaleVar:X]
Y=[ButtonScaleVar:Y]
W=[ButtonScaleVar:W]
H=[ButtonScaleVar:H]

[ProgressScaleIT]
Measure=Plugin
Plugin=InputText
Command1=[!WriteKeyValue Variables PScale "$UserInput$" "#@#Other\Variables.inc"][!Refresh][!Refresh "#RootConfig#\Track Info\Progress Bar"]
DefaultValue=#PScale#
StringAlign=Center
SolidColor=15,15,15
FontFace =Open Sans
FontSize =10
FontColor=255,255,255
Antialias=1
X=[ProgressScaleVar:X]
Y=[ProgressScaleVar:Y]
W=[ProgressScaleVar:W]
H=[ProgressScaleVar:H]

[BarWidthIT]
Measure=Plugin
Plugin=InputText
Command1=[!WriteKeyValue Variables BarWidth "$UserInput$" "#@#Other\Variables.inc"][!Refresh][!Refresh "#RootConfig#\Visualizer"]
DefaultValue=#BarWidth#
StringAlign=Center
SolidColor=15,15,15
FontFace =Open Sans
FontSize =10
FontColor=255,255,255
Antialias=1
X=[BarWidthVar:X]
Y=[BarWidthVar:Y]
W=[BarWidthVar:W]
H=[BarWidthVar:H]

[BarHeightIT]
Measure=Plugin
Plugin=InputText
Command1=[!WriteKeyValue Variables BarHeight "$UserInput$" "#@#Other\Variables.inc"][!Refresh][!Refresh "#RootConfig#\Visualizer"]
DefaultValue=#BarHeight#
StringAlign=Center
SolidColor=15,15,15
FontFace =Open Sans
FontSize =10
FontColor=255,255,255
Antialias=1
X=[BarHeightVar:X]
Y=[BarHeightVar:Y]
W=[BarHeightVar:W]
H=[BarHeightVar:H]

[BarSpacingIT]
Measure=Plugin
Plugin=InputText
Command1=[!WriteKeyValue Variables BarSpacing "$UserInput$" "#@#Other\Variables.inc"][!Refresh][!Refresh "#RootConfig#\Visualizer"]
DefaultValue=#BarSpacing#
StringAlign=Center
SolidColor=15,15,15
FontFace =Open Sans
FontSize =10
FontColor=255,255,255
Antialias=1
X=[BarSpacingVar:X]
Y=[BarSpacingVar:Y]
W=[BarSpacingVar:W]
H=[BarSpacingVar:H]

[BarsIT]
Measure=Plugin
Plugin=InputText
Command1=[!WriteKeyValue Variables Bars (Clamp("$UserInput$",0,50)) "#@#Other\Variables.inc"][!Refresh][!Refresh "#RootConfig#\Visualizer"]
DefaultValue=#Bars#
StringAlign=Center
SolidColor=15,15,15
FontFace =Open Sans
FontSize =10
FontColor=255,255,255
Antialias=1
X=[BarsVar:X]
Y=[BarsVar:Y]
W=[BarsVar:W]
H=[BarsVar:H]