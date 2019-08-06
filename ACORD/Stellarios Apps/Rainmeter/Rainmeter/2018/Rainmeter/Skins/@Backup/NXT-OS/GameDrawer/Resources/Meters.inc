[Game1]
Meter=Image
ImageName=
X=[SpaceCalc]r
MeterStyle=GameBanner
MouseOverAction=#SoundCommand#[#HoverCommand# TileAnimation "execute1"]
MouseLeaveAction=[#HoverCommand# TileAnimation "execute2"]
LeftMouseDownAction=[!CommandMeasure TileAnimation "execute3"]
LeftMouseUpAction=[!SetOptionGroup GameMeters W 240][!SetOptionGroup GameMeters H 112][!SetOptionGroup GameMeters Padding 6,3,6,3][!UpdateMeterGroup GameMeters][!Redraw][!CommandMeasure LauncherScript "LaunchGame('#BannerID1#')"]#CloseGameAction#
MiddleMouseDoubleClickAction=[!CommandMeasure LauncherScript "AddToExceptions('#BannerID1#')"]

[Game2]
Meter=Image
ImageName=
MeterStyle=GameBanner
MouseOverAction=#SoundCommand#[#HoverCommand# TileAnimation "execute4"]
MouseLeaveAction=[#HoverCommand# TileAnimation "execute5"]
LeftMouseDownAction=[!CommandMeasure TileAnimation "execute6"]
LeftMouseUpAction=[!SetOptionGroup GameMeters W 240][!SetOptionGroup GameMeters H 112][!SetOptionGroup GameMeters Padding 6,3,6,3][!UpdateMeterGroup GameMeters][!Redraw][!CommandMeasure LauncherScript "LaunchGame('#BannerID2#')"]#CloseGameAction#
MiddleMouseDoubleClickAction=[!CommandMeasure LauncherScript "AddToExceptions('#BannerID2#')"]

[Game3]
Meter=Image
ImageName=
MeterStyle=GameBanner
MouseOverAction=#SoundCommand#[#HoverCommand# TileAnimation "execute7"]
MouseLeaveAction=[#HoverCommand# TileAnimation "execute8"]
LeftMouseDownAction=[!CommandMeasure TileAnimation "execute9"]
LeftMouseUpAction=[!SetOptionGroup GameMeters W 240][!SetOptionGroup GameMeters H 112][!SetOptionGroup GameMeters Padding 6,3,6,3][!UpdateMeterGroup GameMeters][!Redraw][!CommandMeasure LauncherScript "LaunchGame('#BannerID3#')"]#CloseGameAction#
MiddleMouseDoubleClickAction=[!CommandMeasure LauncherScript "AddToExceptions('#BannerID3#')"]

[Game4]
Meter=Image
ImageName=
MeterStyle=GameBanner
MouseOverAction=#SoundCommand#[#HoverCommand# TileAnimation "execute10"]
MouseLeaveAction=[#HoverCommand# TileAnimation "execute11"]
LeftMouseDownAction=[!CommandMeasure TileAnimation "execute12"]
LeftMouseUpAction=[!SetOptionGroup GameMeters W 240][!SetOptionGroup GameMeters H 112][!SetOptionGroup GameMeters Padding 6,3,6,3][!UpdateMeterGroup GameMeters][!Redraw][!CommandMeasure LauncherScript "LaunchGame('#BannerID4#')"]#CloseGameAction#
MiddleMouseDoubleClickAction=[!CommandMeasure LauncherScript "AddToExceptions('#BannerID4#')"]

