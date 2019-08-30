[Metadata]
Name=Smartphone
Version=1.0
Information=Code
Author=HiTBiT-PA
License=Creative Commons Attribution-Non-commercial-Share Alike 3.0
Website=http://hitbit-pa.deviantart.com/

[ST-Texto_1]
FontFace=Clockopia
FontColor=255,255,255,255
StringAlign=Center
StringStyle=Normal
DynamicVariables=1
AntiAlias=1
ClipString=1
StringEffect=Shadow
FontEffectColor=0,0,0,192

[ST-Texto_2]
FontFace=Open Sans
FontColor=255,255,255,255
StringAlign=Center
StringStyle=Normal
DynamicVariables=1
AntiAlias=1
ClipString=1
StringEffect=Shadow
FontEffectColor=0,0,0,192

[Smartphone]
Meter=IMAGE
ImageName=#@#Images\Suite\skin.png
X=(0*#Escala#)
Y=(0*#Escala#)
W=(377*#Escala#)
H=(540*#Escala#)
DynamicVariables=1
UpdateDivider=-1

[MascaraSMP]
Meter=SHAPE
Shape=Rectangle (47*#Escala#),(26*#Escala#),(212*#Escala#),(391*#Escala#),(14*#Escala#),(14*#Escala#) | Fill Color 24,24,24,255 | Stroke Color 0,0,0,0
DynamicVariables=1
UpdateDivider=-1

[Fondo]
Meter=IMAGE
ImageName=#@#Images\Backgrounds\bg_#Wallpaper#.jpg
Container=MascaraSMP
X=(47*#Escala#)
Y=(26*#Escala#)
W=(213*#Escala#)
H=(392*#Escala#)
DynamicVariables=1
UpdateDivider=-1

[Zona_Activa]
Meter=SHAPE
Shape=Rectangle (0*#Escala#),(460*#Escala#),(375*#Escala#),(78*#Escala#) | Fill Color 0,0,0,1 | Stroke Color 0,0,0,0
Shape2=Rectangle (0*#Escala#),(220*#Escala#),(40*#Escala#),(240*#Escala#) | Fill Color 0,0,0,1 | Stroke Color 0,0,0,0
Shape3=Rectangle (265*#Escala#),(220*#Escala#),(60*#Escala#),(240*#Escala#) | Fill Color 0,0,0,1 | Stroke Color 0,0,0,0
Shape4=Rectangle (325*#Escala#),(300*#Escala#),(50*#Escala#),(160*#Escala#) | Fill Color 0,0,0,1 | Stroke Color 0,0,0,0
MouseScrollUpAction=[!WriteKeyValue Variables Escala #Escala# "#@#Settings\Variables Suite.inc"][!SetVariable Escala "(Clamp(#Escala# - 0.05,1.0,2.0))"][!UpdateMeter *][!Redraw]
MouseScrollDownAction=[!WriteKeyValue Variables Escala #Escala# "#@#Settings\Variables Suite.inc"][!SetVariable Escala "(Clamp(#Escala# + 0.05,1.0,2.0))"][!UpdateMeter *][!Redraw]
DynamicVariables=1
UpdateDivider=-1

[Icono_EditarM]
Group=Menu | Pantalla
Meter=IMAGE
ImageName=#@#Images\Suite\settings.png
ImageAlpha=32
X=(201*#Escala#)
Y=(429*#Escala#)
W=(14*#Escala#)
H=(14*#Escala#)
DynamicVariables=1
UpdateDivider=-1
Hidden=1

[Info_Menu]
Group=Menu | Pantalla
Meter=STRING
MeterStyle=ST-Texto_2
FontSize=(10*#Escala#)
X=(154*#Escala#)
Y=(58*#Escala#)
W=(200*#Escala#)
H=(20*#Escala#)
Text=MENU SMARTPHONE
UpdateDivider=-1
Hidden=1

[Icono_Menu_01]
Group=Menu | Pantalla
Meter=IMAGE
ImageName=#@#Images\Suite\ME01.png
X=(59*#Escala#)
Y=(81*#Escala#)
W=(93*#Escala#)
H=(45*#Escala#)
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!ActivateConfig "Smartphone\" "Settings.ini]
DynamicVariables=1
UpdateDivider=-1
Hidden=1

[Icono_Menu_02]
Group=Menu | Pantalla
Meter=IMAGE
ImageName=#@#Images\Suite\ME02.png
X=(155*#Escala#)
Y=(81*#Escala#)
W=(93*#Escala#)
H=(45*#Escala#)
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!HideMeterGroup Icono_AtrasOff][!ShowMeter Icono_AtrasOn][!HideMeterGroup Pantalla][!ShowMeterGroup SetWin][!Redraw]
DynamicVariables=1
UpdateDivider=-1
Hidden=1

[Icono_Menu_03]
Group=Menu | Pantalla
Meter=IMAGE
ImageName=#@#Images\Suite\ME03.png
X=(59*#Escala#)
Y=(129*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!HideMeterGroup Icono_AtrasOff][!ShowMeter Icono_AtrasOn][!HideMeterGroup Pantalla][!ShowMeterGroup Juegos][!Redraw]
DynamicVariables=1
UpdateDivider=-1
Hidden=1

[Icono_Menu_04]
Group=Menu | Pantalla
Meter=IMAGE
ImageName=#@#Images\Suite\ME04.png
X=(107*#Escala#)
Y=(129*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!HideMeterGroup Icono_AtrasOff][!ShowMeter Icono_AtrasOn][!HideMeterGroup Pantalla][!ShowMeterGroup App1][!Redraw]
DynamicVariables=1
UpdateDivider=-1
Hidden=1

[Icono_Menu_05]
Group=Menu | Pantalla
Meter=IMAGE
ImageName=#@#Images\Suite\ME04.png
X=(155*#Escala#)
Y=(129*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!HideMeterGroup Icono_AtrasOff][!ShowMeter Icono_AtrasOn][!HideMeterGroup Pantalla][!ShowMeterGroup App2][!Redraw]
DynamicVariables=1
UpdateDivider=-1
Hidden=1

[Icono_Menu_06]
Group=Menu | Pantalla
Meter=IMAGE
ImageName=#@#Images\Suite\ME06.png
X=(203*#Escala#)
Y=(129*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!HideMeterGroup Icono_AtrasOff][!ShowMeter Icono_AtrasOn][!HideMeterGroup Pantalla][!ShowMeterGroup WinApp][!Redraw]
DynamicVariables=1
UpdateDivider=-1
Hidden=1

[Icono_Menu_07]
Group=Menu | Pantalla
Meter=IMAGE
ImageName=#@#Images\Suite\ME07.png
X=(59*#Escala#)
Y=(177*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!HideMeterGroup Icono_AtrasOff][!ShowMeter Icono_AtrasOn][!HideMeterGroup Pantalla][!ShowMeterGroup Buscadores][!Redraw]
DynamicVariables=1
UpdateDivider=-1
Hidden=1

[Icono_Menu_08]
Group=Menu | Pantalla
Meter=IMAGE
ImageName=#@#Images\Suite\ME08.png
X=(107*#Escala#)
Y=(177*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!HideMeterGroup Icono_AtrasOff][!ShowMeter Icono_AtrasOn][!HideMeterGroup Pantalla][!ShowMeterGroup Enlaces1][!Redraw]
DynamicVariables=1
UpdateDivider=-1
Hidden=1

[Icono_Menu_09]
Group=Menu | Pantalla
Meter=IMAGE
ImageName=#@#Images\Suite\ME09.png
X=(155*#Escala#)
Y=(177*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!HideMeterGroup Icono_AtrasOff][!ShowMeter Icono_AtrasOn][!HideMeterGroup Pantalla][!ShowMeterGroup Enlaces2][!Redraw]
DynamicVariables=1
UpdateDivider=-1
Hidden=1

[Icono_Menu_10]
Group=Menu | Pantalla
Meter=IMAGE
ImageName=#@#Images\Suite\ME10.png
X=(203*#Escala#)
Y=(177*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!HideMeterGroup Icono_AtrasOff][!ShowMeter Icono_AtrasOn][!HideMeterGroup Pantalla][!ShowMeterGroup Enlaces3][!Redraw]
DynamicVariables=1
UpdateDivider=-1
Hidden=1

[Icono_Menu_11]
Group=Menu | Pantalla
Meter=IMAGE
ImageName=#@#Images\Suite\ME11.png
X=(59*#Escala#)
Y=(225*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!HideMeterGroup Icono_AtrasOff][!ShowMeter Icono_AtrasOn][!HideMeterGroup Pantalla][!ShowMeterGroup Enlaces4][!Redraw]
DynamicVariables=1
UpdateDivider=-1
Hidden=1

[Icono_Menu_12]
Group=Menu | Pantalla
Meter=IMAGE
ImageName=#@#Images\Suite\ME12.png
X=(107*#Escala#)
Y=(225*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!HideMeterGroup Icono_AtrasOff][!ShowMeter Icono_AtrasOn][!HideMeterGroup Pantalla][!ShowMeterGroup Enlaces5][!Redraw]
DynamicVariables=1
UpdateDivider=-1
Hidden=1

[Icono_Menu_13]
Group=Menu | Pantalla
Meter=IMAGE
ImageName=#@#Images\Suite\ME13.png
X=(155*#Escala#)
Y=(225*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!HideMeterGroup Icono_AtrasOff][!ShowMeter Icono_AtrasOn][!HideMeterGroup Pantalla][!ShowMeterGroup Enlaces6][!Redraw]
DynamicVariables=1
UpdateDivider=-1
Hidden=1

[Icono_Menu_14]
Group=Menu | Pantalla
Meter=IMAGE
ImageName=#@#Images\Suite\ME14.png
X=(203*#Escala#)
Y=(225*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!HideMeterGroup Icono_AtrasOff][!ShowMeter Icono_AtrasOn][!HideMeterGroup Pantalla][!ShowMeterGroup Enlaces7][!Redraw]
DynamicVariables=1
UpdateDivider=-1
Hidden=1

[Icono_Menu_15]
Group=Menu | Pantalla
Meter=IMAGE
ImageName=#@#Images\Suite\ME15.png
X=(59*#Escala#)
Y=(321*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!HideMeterGroup Pantalla][!WriteKeyValue Variables AppSmp Ap_MyWeather "#@#Settings\Variables Suite.inc"][!Refresh]
DynamicVariables=1
UpdateDivider=-1
Hidden=1

[Icono_Menu_16]
Group=Menu | Pantalla
Meter=IMAGE
ImageName=#@#Images\Suite\ME16.png
X=(107*#Escala#)
Y=(321*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!HideMeterGroup Pantalla][!WriteKeyValue Variables AppSmp Ap_MyPhone "#@#Settings\Variables Suite.inc"][!Refresh]
DynamicVariables=1
UpdateDivider=-1
Hidden=1

[Icono_Menu_17]
Group=Menu | Pantalla
Meter=IMAGE
ImageName=#@#Images\Suite\ME17.png
X=(155*#Escala#)
Y=(321*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!HideMeterGroup Pantalla][!WriteKeyValue Variables AppSmp Ap_MyPlayer "#@#Settings\Variables Suite.inc"][!Refresh]
DynamicVariables=1
UpdateDivider=-1
Hidden=1

[Icono_Menu_18]
Group=Menu | Pantalla
Meter=IMAGE
ImageName=#@#Images\Suite\ME18.png
X=(203*#Escala#)
Y=(321*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!HideMeterGroup Pantalla][!WriteKeyValue Variables AppSmp Ap_MyReader "#@#Settings\Variables Suite.inc"][!Refresh]
DynamicVariables=1
UpdateDivider=-1
Hidden=1

[Icono_Menu_19]
Group=Menu | Pantalla
Meter=IMAGE
ImageName=#@#Images\Suite\ME19.png
X=(59*#Escala#)
Y=(369*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!HideMeterGroup Pantalla][!WriteKeyValue Variables AppSmp Ap_WeatherClock "#@#Settings\Variables Suite.inc"][!Refresh]
DynamicVariables=1
UpdateDivider=-1
Hidden=1

[Icono_Menu_20]
Group=Menu | Pantalla
Meter=IMAGE
ImageName=#@#Images\Suite\ME20.png
X=(107*#Escala#)
Y=(369*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
UpdateDivider=-1
Hidden=1

[Icono_Menu_21]
Group=Menu | Pantalla
Meter=IMAGE
ImageName=#@#Images\Suite\ME20.png
X=(155*#Escala#)
Y=(369*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
ToolTipText=Coming soon
DynamicVariables=1
UpdateDivider=-1
Hidden=1

[Icono_Menu_22]
Group=Menu | Pantalla
Meter=IMAGE
ImageName=#@#Images\Suite\ME20.png
X=(203*#Escala#)
Y=(369*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
UpdateDivider=-1
Hidden=1

[Info_WS]
Group=SetWin | Pantalla
Meter=STRING
MeterStyle=ST-Texto_2
FontSize=(10*#Escala#)
X=(154*#Escala#)
Y=(58*#Escala#)
W=(200*#Escala#)
H=(20*#Escala#)
Text=#Ajustes# WINDOWS 10
UpdateDivider=-1
Hidden=1

[Icono_Editar02]
Group=SetWin | Pantalla
Meter=IMAGE
ImageName=#@#Images\Suite\edit.png
ImageAlpha=32
X=(201*#Escala#)
Y=(428*#Escala#)
W=(14*#Escala#)
H=(14*#Escala#)
DynamicVariables=1
UpdateDivider=-1
Hidden=1

[Icono_WS01]
Group=SetWin | Pantalla
Meter=IMAGE
ImageName=#@#Images\Windows Settings\WS01.png
X=(59*#Escala#)
Y=(81*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#WS01#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["taskmgr.exe"]
UpdateDivider=-1
Hidden=1

[Icono_WS02]
Group=SetWin | Pantalla
Meter=IMAGE
ImageName=#@#Images\Windows Settings\WS02.png
X=(107*#Escala#)
Y=(81*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#WS02#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["resmon.exe"]
UpdateDivider=-1
Hidden=1

[Icono_WS03]
Group=SetWin | Pantalla
Meter=IMAGE
ImageName=#@#Images\Windows Settings\WS03.png
X=(155*#Escala#)
Y=(81*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#WS03#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["devmgmt.msc"]
UpdateDivider=-1
Hidden=1

[Icono_WS04]
Group=SetWin | Pantalla
Meter=IMAGE
ImageName=#@#Images\Windows Settings\WS04.png
X=(203*#Escala#)
Y=(81*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#WS04#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["diskmgmt.msc"]
UpdateDivider=-1
Hidden=1

[Icono_WS05]
Group=SetWin | Pantalla
Meter=IMAGE
ImageName=#@#Images\Windows Settings\WS05.png
X=(59*#Escala#)
Y=(129*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#WS05#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["C:\Windows\System32\control.exe" "RTSnMg64.cpl"]
UpdateDivider=-1
Hidden=1

[Icono_WS06]
Group=SetWin | Pantalla
Meter=IMAGE
ImageName=#@#Images\Windows Settings\WS06.png
X=(107*#Escala#)
Y=(129*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#WS06#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["C:\Windows\System32\control.exe" "ncpa.cpl"]
UpdateDivider=-1
Hidden=1

[Icono_WS07]
Group=SetWin | Pantalla
Meter=IMAGE
ImageName=#@#Images\Windows Settings\WS07.png
X=(155*#Escala#)
Y=(129*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#WS07#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["eventvwr.msc"]
UpdateDivider=-1
Hidden=1

[Icono_WS08]
Group=SetWin | Pantalla
Meter=IMAGE
ImageName=#@#Images\Windows Settings\WS08.png
X=(203*#Escala#)
Y=(129*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#WS08#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["C:\Windows\System32\control.exe" "powercfg.cpl"]
UpdateDivider=-1
Hidden=1

[Icono_WS09]
Group=SetWin | Pantalla
Meter=IMAGE
ImageName=#@#Images\Windows Settings\WS09.png
X=(59*#Escala#)
Y=(177*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#WS09#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["dxdiag.exe"]
UpdateDivider=-1
Hidden=1

[Icono_WS10]
Group=SetWin | Pantalla
Meter=IMAGE
ImageName=#@#Images\Windows Settings\WS10.png
X=(107*#Escala#)
Y=(177*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#WS10#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["dfrgui.exe"]
UpdateDivider=-1
Hidden=1

[Icono_WS11]
Group=SetWin | Pantalla
Meter=IMAGE
ImageName=#@#Images\Windows Settings\WS11.png
X=(155*#Escala#)
Y=(177*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#WS11#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["cleanmgr.exe"]
UpdateDivider=-1
Hidden=1

[Icono_WS12]
Group=SetWin | Pantalla
Meter=IMAGE
ImageName=#@#Images\Windows Settings\WS12.png
X=(203*#Escala#)
Y=(177*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#WS12#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["C:\Windows\System32\control.exe" "appwiz.cpl"]
UpdateDivider=-1
Hidden=1

[Icono_WS13]
Group=SetWin | Pantalla
Meter=IMAGE
ImageName=#@#Images\Windows Settings\WS13.png
X=(59*#Escala#)
Y=(225*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#WS13#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["wf.msc"]
UpdateDivider=-1
Hidden=1

[Icono_WS14]
Group=SetWin | Pantalla
Meter=IMAGE
ImageName=#@#Images\Windows Settings\WS14.png
X=(107*#Escala#)
Y=(225*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#WS14#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["regedit.exe"]
UpdateDivider=-1
Hidden=1

[Icono_WS15]
Group=SetWin | Pantalla
Meter=IMAGE
ImageName=#@#Images\Windows Settings\WS15.png
X=(155*#Escala#)
Y=(225*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#WS15#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["C:\Windows\System32\control.exe" "main.cpl"]
UpdateDivider=-1
Hidden=1

[Icono_WS16]
Group=SetWin | Pantalla
Meter=IMAGE
ImageName=#@#Images\Windows Settings\WS16.png
X=(203*#Escala#)
Y=(225*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#WS16#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["C:\Windows\System32\control.exe" "timedate.cpl"]
UpdateDivider=-1
Hidden=1

[Icono_WS17]
Group=SetWin | Pantalla
Meter=IMAGE
ImageName=#@#Images\Windows Settings\WS17.png
X=(59*#Escala#)
Y=(273*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#WS17#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["msconfig.exe"]
UpdateDivider=-1
Hidden=1

[Icono_WS18]
Group=SetWin | Pantalla
Meter=IMAGE
ImageName=#@#Images\Windows Settings\WS18.png
X=(107*#Escala#)
Y=(273*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#WS18#
LeftMouseUpAction=[Play #@#Sounds\tap.wav][shell:Appsfolder\windows.immersivecontrolpanel_cw5n1h2txyewy!microsoft.windows.immersivecontrolpanel]
UpdateDivider=-1
Hidden=1

[Icono_WS19]
Group=SetWin | Pantalla
Meter=IMAGE
ImageName=#@#Images\Windows Settings\WS19.png
X=(155*#Escala#)
Y=(273*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#WS19#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["control.exe"]
UpdateDivider=-1
Hidden=1

[Icono_WS20]
Group=SetWin | Pantalla
Meter=IMAGE
ImageName=#@#Images\Windows Settings\WS20.png
X=(203*#Escala#)
Y=(273*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#WS20#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["msinfo32.exe"]
UpdateDivider=-1
Hidden=1

[Icono_WS21]
Group=SetWin | Pantalla
Meter=IMAGE
ImageName=#@#Images\Windows Settings\WS21.png
X=(59*#Escala#)
Y=(321*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#WS21#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["shell:Personal"]
UpdateDivider=-1
Hidden=1

[Icono_WS22]
Group=SetWin | Pantalla
Meter=IMAGE
ImageName=#@#Images\Windows Settings\WS22.png
X=(107*#Escala#)
Y=(321*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#WS22#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["shell:My Music"]
UpdateDivider=-1
Hidden=1

[Icono_WS23]
Group=SetWin | Pantalla
Meter=IMAGE
ImageName=#@#Images\Windows Settings\WS23.png
X=(155*#Escala#)
Y=(321*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#WS23#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["shell:My Pictures"]
UpdateDivider=-1
Hidden=1

[Icono_WS24]
Group=SetWin | Pantalla
Meter=IMAGE
ImageName=#@#Images\Windows Settings\WS24.png
X=(203*#Escala#)
Y=(321*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#WS24#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["shell:My Video"]
UpdateDivider=-1
Hidden=1

[Icono_WS25]
Group=SetWin | Pantalla
Meter=IMAGE
ImageName=#@#Images\Windows Settings\WS25.png
X=(59*#Escala#)
Y=(369*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#WS25#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["shell:Downloads"]
UpdateDivider=-1
Hidden=1

[Icono_WS26]
Group=SetWin | Pantalla
Meter=IMAGE
ImageName=#@#Images\Windows Settings\WS26.png
X=(107*#Escala#)
Y=(369*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#WS26#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["shell:Desktop"]
UpdateDivider=-1
Hidden=1

[Icono_WS27]
Group=SetWin | Pantalla
Meter=IMAGE
ImageName=#@#Images\Windows Settings\WS27.png
X=(155*#Escala#)
Y=(369*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#WS27#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["shell:RecycleBinFolder"]
UpdateDivider=-1
Hidden=1

[Icono_WS28]
Group=SetWin | Pantalla
Meter=IMAGE
ImageName=#@#Images\Windows Settings\WS28.png
X=(203*#Escala#)
Y=(369*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#WS28#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["winver.exe"]
UpdateDivider=-1
Hidden=1

[Icono_Editar03]
Group=Juegos | Pantalla
Meter=IMAGE
ImageName=#@#Images\Suite\edit.png
ImageAlpha=164
X=(201*#Escala#)
Y=(428*#Escala#)
W=(14*#Escala#)
H=(14*#Escala#)
DynamicVariables=1
MouseOverAction=[!SetOption #CURRENTSECTION# ImageAlpha 255][!UpdateMeter #CURRENTSECTION#][!Redraw]
MouseLeaveAction=[!SetOption #CURRENTSECTION# ImageAlpha 164][!UpdateMeter #CURRENTSECTION#][!Redraw]
LeftMouseUpAction=[Play #@#Sounds\vibrador2.wav]["#@#Settings\Variables Games.inc"]
UpdateDivider=-1
Hidden=1

[Info_GA]
Group=Juegos | Pantalla
Meter=STRING
MeterStyle=ST-Texto_2
FontSize=(10*#Escala#)
X=(154*#Escala#)
Y=(58*#Escala#)
W=(200*#Escala#)
H=(20*#Escala#)
DynamicVariables=1
Text=#Juegos#
UpdateDivider=-1
Hidden=1

[Icono_GA01]
Group=Juegos | Pantalla
Meter=IMAGE
ImageName=#@#Images\Games\GA01.png
X=(59*#Escala#)
Y=(81*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#GA01#"]
UpdateDivider=-1
Hidden=1

[Icono_GA02]
Group=Juegos | Pantalla
Meter=IMAGE
ImageName=#@#Images\Games\GA02.png
X=(107*#Escala#)
Y=(81*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#GA02#"]
UpdateDivider=-1
Hidden=1

[Icono_GA03]
Group=Juegos | Pantalla
Meter=IMAGE
ImageName=#@#Images\Games\GA03.png
X=(155*#Escala#)
Y=(81*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#GA03#"]
UpdateDivider=-1
Hidden=1

[Icono_GA04]
Group=Juegos | Pantalla
Meter=IMAGE
ImageName=#@#Images\Games\GA04.png
X=(203*#Escala#)
Y=(81*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#GA04#"]
UpdateDivider=-1
Hidden=1

[Icono_GA05]
Group=Juegos | Pantalla
Meter=IMAGE
ImageName=#@#Images\Games\GA05.png
X=(59*#Escala#)
Y=(129*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#GA05#"]
UpdateDivider=-1
Hidden=1

[Icono_GA06]
Group=Juegos | Pantalla
Meter=IMAGE
ImageName=#@#Images\Games\GA06.png
X=(107*#Escala#)
Y=(129*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#GA06#"]
UpdateDivider=-1
Hidden=1

[Icono_GA07]
Group=Juegos | Pantalla
Meter=IMAGE
ImageName=#@#Images\Games\GA07.png
X=(155*#Escala#)
Y=(129*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#GA07#"]
UpdateDivider=-1
Hidden=1

[Icono_GA08]
Group=Juegos | Pantalla
Meter=IMAGE
ImageName=#@#Images\Games\GA08.png
X=(203*#Escala#)
Y=(129*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#GA08#"]
UpdateDivider=-1
Hidden=1

[Icono_GA09]
Group=Juegos | Pantalla
Meter=IMAGE
ImageName=#@#Images\Games\GA09.png
X=(59*#Escala#)
Y=(177*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#GA09#"]
UpdateDivider=-1
Hidden=1

[Icono_GA10]
Group=Juegos | Pantalla
Meter=IMAGE
ImageName=#@#Images\Games\GA10.png
X=(107*#Escala#)
Y=(177*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#GA10#"]
UpdateDivider=-1
Hidden=1

[Icono_GA11]
Group=Juegos | Pantalla
Meter=IMAGE
ImageName=#@#Images\Games\GA11.png
X=(155*#Escala#)
Y=(177*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#GA11#"]
UpdateDivider=-1
Hidden=1

[Icono_GA12]
Group=Juegos | Pantalla
Meter=IMAGE
ImageName=#@#Images\Games\GA12.png
X=(203*#Escala#)
Y=(177*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#GA12#"]
UpdateDivider=-1
Hidden=1

[Icono_GA13]
Group=Juegos | Pantalla
Meter=IMAGE
ImageName=#@#Images\Games\GA13.png
X=(59*#Escala#)
Y=(225*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#GA13#"]
UpdateDivider=-1
Hidden=1

[Icono_GA14]
Group=Juegos | Pantalla
Meter=IMAGE
ImageName=#@#Images\Games\GA14.png
X=(107*#Escala#)
Y=(225*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#GA14#"]
UpdateDivider=-1
Hidden=1

[Icono_GA15]
Group=Juegos | Pantalla
Meter=IMAGE
ImageName=#@#Images\Games\GA15.png
X=(155*#Escala#)
Y=(225*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#GA15#"]
UpdateDivider=-1
Hidden=1

[Icono_GA16]
Group=Juegos | Pantalla
Meter=IMAGE
ImageName=#@#Images\Games\GA16.png
X=(203*#Escala#)
Y=(225*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#GA16#"]
UpdateDivider=-1
Hidden=1

[Icono_GA17]
Group=Juegos | Pantalla
Meter=IMAGE
ImageName=#@#Images\Games\GA17.png
X=(59*#Escala#)
Y=(273*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#GA17#"]
UpdateDivider=-1
Hidden=1

[Icono_GA18]
Group=Juegos | Pantalla
Meter=IMAGE
ImageName=#@#Images\Games\GA18.png
X=(107*#Escala#)
Y=(273*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#GA18#"]
UpdateDivider=-1
Hidden=1

[Icono_GA19]
Group=Juegos | Pantalla
Meter=IMAGE
ImageName=#@#Images\Games\GA19.png
X=(155*#Escala#)
Y=(273*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#GA19#"]
UpdateDivider=-1
Hidden=1

[Icono_GA20]
Group=Juegos | Pantalla
Meter=IMAGE
ImageName=#@#Images\Games\GA20.png
X=(203*#Escala#)
Y=(273*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#GA20#"]
UpdateDivider=-1
Hidden=1

[Icono_GA21]
Group=Juegos | Pantalla
Meter=IMAGE
ImageName=#@#Images\Games\GA21.png
X=(59*#Escala#)
Y=(321*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#GA21#"]
UpdateDivider=-1
Hidden=1

[Icono_GA22]
Group=Juegos | Pantalla
Meter=IMAGE
ImageName=#@#Images\Games\GA22.png
X=(107*#Escala#)
Y=(321*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#GA22#"]
UpdateDivider=-1
Hidden=1

[Icono_GA23]
Group=Juegos | Pantalla
Meter=IMAGE
ImageName=#@#Images\Games\GA23.png
X=(155*#Escala#)
Y=(321*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#GA23#"]
UpdateDivider=-1
Hidden=1

[Icono_GA24]
Group=Juegos | Pantalla
Meter=IMAGE
ImageName=#@#Images\Games\GA24.png
X=(203*#Escala#)
Y=(321*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#GA24#"]
UpdateDivider=-1
Hidden=1

[Icono_GA25]
Group=Juegos | Pantalla
Meter=IMAGE
ImageName=#@#Images\Games\GA25.png
X=(59*#Escala#)
Y=(369*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#GA25#"]
UpdateDivider=-1
Hidden=1

[Icono_GA26]
Group=Juegos | Pantalla
Meter=IMAGE
ImageName=#@#Images\Games\GA26.png
X=(107*#Escala#)
Y=(369*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#GA26#"]
UpdateDivider=-1
Hidden=1

[Icono_GA27]
Group=Juegos | Pantalla
Meter=IMAGE
ImageName=#@#Images\Games\GA27.png
X=(155*#Escala#)
Y=(369*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#GA27#"]
UpdateDivider=-1
Hidden=1

[Icono_GA28]
Group=Juegos | Pantalla
Meter=IMAGE
ImageName=#@#Images\Games\GA28.png
X=(203*#Escala#)
Y=(369*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#GA28#"]
UpdateDivider=-1
Hidden=1

[Icono_Editar04]
Group=App1 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Suite\edit.png
ImageAlpha=164
X=(201*#Escala#)
Y=(428*#Escala#)
W=(14*#Escala#)
H=(14*#Escala#)
DynamicVariables=1
MouseOverAction=[!SetOption #CURRENTSECTION# ImageAlpha 255][!UpdateMeter #CURRENTSECTION#][!Redraw]
MouseLeaveAction=[!SetOption #CURRENTSECTION# ImageAlpha 164][!UpdateMeter #CURRENTSECTION#][!Redraw]
LeftMouseUpAction=[Play #@#Sounds\vibrador2.wav]["#@#Settings\Variables Apps 1.inc"]
UpdateDivider=-1
Hidden=1

[Info_AP1]
Group=App1 | Pantalla
Meter=STRING
MeterStyle=ST-Texto_2
FontSize=(10*#Escala#)
X=(154*#Escala#)
Y=(58*#Escala#)
W=(200*#Escala#)
H=(20*#Escala#)
DynamicVariables=1
Text=APPs 1
UpdateDivider=-1
Hidden=1

[Icono_APa01]
Group=App1 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Apps 1\APa01.png
X=(59*#Escala#)
Y=(81*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#APa01#"]
UpdateDivider=-1
Hidden=1

[Icono_APa02]
Group=App1 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Apps 1\APa02.png
X=(107*#Escala#)
Y=(81*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#APa02#"]
UpdateDivider=-1
Hidden=1

[Icono_APa03]
Group=App1 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Apps 1\APa03.png
X=(155*#Escala#)
Y=(81*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#APa03#"]
UpdateDivider=-1
Hidden=1

[Icono_APa04]
Group=App1 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Apps 1\APa04.png
X=(203*#Escala#)
Y=(81*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#APa04#"]
UpdateDivider=-1
Hidden=1

[Icono_APa05]
Group=App1 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Apps 1\APa05.png
X=(59*#Escala#)
Y=(129*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#APa05#"]
UpdateDivider=-1
Hidden=1

[Icono_APa06]
Group=App1 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Apps 1\APa06.png
X=(107*#Escala#)
Y=(129*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#APa06#"]
UpdateDivider=-1
Hidden=1

[Icono_APa07]
Group=App1 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Apps 1\APa07.png
X=(155*#Escala#)
Y=(129*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#APa07#"]
UpdateDivider=-1
Hidden=1

[Icono_APa08]
Group=App1 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Apps 1\APa08.png
X=(203*#Escala#)
Y=(129*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#APa08#"]
UpdateDivider=-1
Hidden=1

[Icono_APa09]
Group=App1 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Apps 1\APa09.png
X=(59*#Escala#)
Y=(177*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#APa09#"]
UpdateDivider=-1
Hidden=1

[Icono_APa10]
Group=App1 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Apps 1\APa10.png
X=(107*#Escala#)
Y=(177*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#APa10#"]
UpdateDivider=-1
Hidden=1

[Icono_APa11]
Group=App1 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Apps 1\APa11.png
X=(155*#Escala#)
Y=(177*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#APa11#"]
UpdateDivider=-1
Hidden=1

[Icono_APa12]
Group=App1 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Apps 1\APa12.png
X=(203*#Escala#)
Y=(177*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#APa12#"]
UpdateDivider=-1
Hidden=1

[Icono_APa13]
Group=App1 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Apps 1\APa13.png
X=(59*#Escala#)
Y=(225*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#APa13#"]
UpdateDivider=-1
Hidden=1

[Icono_APa14]
Group=App1 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Apps 1\APa14.png
X=(107*#Escala#)
Y=(225*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#APa14#"]
UpdateDivider=-1
Hidden=1

[Icono_APa15]
Group=App1 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Apps 1\APa15.png
X=(155*#Escala#)
Y=(225*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#APa15#"]
UpdateDivider=-1
Hidden=1

[Icono_APa16]
Group=App1 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Apps 1\APa16.png
X=(203*#Escala#)
Y=(225*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#APa16#"]
UpdateDivider=-1
Hidden=1

[Icono_APa17]
Group=App1 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Apps 1\APa17.png
X=(59*#Escala#)
Y=(273*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#APa17#"]
UpdateDivider=-1
Hidden=1

[Icono_APa18]
Group=App1 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Apps 1\APa18.png
X=(107*#Escala#)
Y=(273*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#APa18#"]
UpdateDivider=-1
Hidden=1

[Icono_APa19]
Group=App1 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Apps 1\APa19.png
X=(155*#Escala#)
Y=(273*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#APa19#"]
UpdateDivider=-1
Hidden=1

[Icono_APa20]
Group=App1 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Apps 1\APa20.png
X=(203*#Escala#)
Y=(273*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#APa20#"]
UpdateDivider=-1
Hidden=1

[Icono_APa21]
Group=App1 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Apps 1\APa21.png
X=(59*#Escala#)
Y=(321*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#APa21#"]
UpdateDivider=-1
Hidden=1

[Icono_APa22]
Group=App1 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Apps 1\APa22.png
X=(107*#Escala#)
Y=(321*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#APa22#"]
UpdateDivider=-1
Hidden=1

[Icono_APa23]
Group=App1 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Apps 1\APa23.png
X=(155*#Escala#)
Y=(321*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#APa23#"]
UpdateDivider=-1
Hidden=1

[Icono_APa24]
Group=App1 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Apps 1\APa24.png
X=(203*#Escala#)
Y=(321*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#APa24#"]
UpdateDivider=-1
Hidden=1

[Icono_APa25]
Group=App1 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Apps 1\APa25.png
X=(59*#Escala#)
Y=(369*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#APa25#"]
UpdateDivider=-1
Hidden=1

[Icono_APa26]
Group=App1 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Apps 1\APa26.png
X=(107*#Escala#)
Y=(369*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#APa26#"]
UpdateDivider=-1
Hidden=1

[Icono_APa27]
Group=App1 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Apps 1\APa27.png
X=(155*#Escala#)
Y=(369*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#APa27#"]
UpdateDivider=-1
Hidden=1

[Icono_APa28]
Group=App1 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Apps 1\APa28.png
X=(203*#Escala#)
Y=(369*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#APa28#"]
UpdateDivider=-1
Hidden=1

[Icono_Editar05]
Group=App2 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Suite\edit.png
ImageAlpha=164
X=(201*#Escala#)
Y=(428*#Escala#)
W=(14*#Escala#)
H=(14*#Escala#)
DynamicVariables=1
MouseOverAction=[!SetOption #CURRENTSECTION# ImageAlpha 255][!UpdateMeter #CURRENTSECTION#][!Redraw]
MouseLeaveAction=[!SetOption #CURRENTSECTION# ImageAlpha 164][!UpdateMeter #CURRENTSECTION#][!Redraw]
LeftMouseUpAction=[Play #@#Sounds\vibrador2.wav]["#@#Settings\Variables Apps 2.inc"]
UpdateDivider=-1
Hidden=1

[Info_AP2]
Group=App2 | Pantalla
Meter=STRING
MeterStyle=ST-Texto_2
FontSize=(10*#Escala#)
X=(154*#Escala#)
Y=(58*#Escala#)
W=(200*#Escala#)
H=(20*#Escala#)
DynamicVariables=1
Text=APPs 2
UpdateDivider=-1
Hidden=1

[Icono_APb01]
Group=App2 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Apps 2\APb01.png
X=(59*#Escala#)
Y=(81*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#APb01#"]
UpdateDivider=-1
Hidden=1

[Icono_APb02]
Group=App2 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Apps 2\APb02.png
X=(107*#Escala#)
Y=(81*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#APb02#"]
UpdateDivider=-1
Hidden=1

[Icono_APb03]
Group=App2 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Apps 2\APb03.png
X=(155*#Escala#)
Y=(81*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#APb03#"]
UpdateDivider=-1
Hidden=1

[Icono_APb04]
Group=App2 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Apps 2\APb04.png
X=(203*#Escala#)
Y=(81*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#APb04#"]
UpdateDivider=-1
Hidden=1

[Icono_APb05]
Group=App2 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Apps 2\APb05.png
X=(59*#Escala#)
Y=(129*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#APb05#"]
UpdateDivider=-1
Hidden=1

[Icono_APb06]
Group=App2 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Apps 2\APb06.png
X=(107*#Escala#)
Y=(129*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#APb06#"]
UpdateDivider=-1
Hidden=1

[Icono_APb07]
Group=App2 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Apps 2\APb07.png
X=(155*#Escala#)
Y=(129*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#APb07#"]
UpdateDivider=-1
Hidden=1

[Icono_APb08]
Group=App2 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Apps 2\APb08.png
X=(203*#Escala#)
Y=(129*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#APb08#"]
UpdateDivider=-1
Hidden=1

[Icono_APb09]
Group=App2 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Apps 2\APb09.png
X=(59*#Escala#)
Y=(177*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#APb09#"]
UpdateDivider=-1
Hidden=1

[Icono_APb10]
Group=App2 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Apps 2\APb10.png
X=(107*#Escala#)
Y=(177*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#APb10#"]
UpdateDivider=-1
Hidden=1

[Icono_APb11]
Group=App2 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Apps 2\APb11.png
X=(155*#Escala#)
Y=(177*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#APb11#"]
UpdateDivider=-1
Hidden=1

[Icono_APb12]
Group=App2 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Apps 2\APb12.png
X=(203*#Escala#)
Y=(177*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#APb12#"]
UpdateDivider=-1
Hidden=1

[Icono_APb13]
Group=App2 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Apps 2\APb13.png
X=(59*#Escala#)
Y=(225*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#APb13#"]
UpdateDivider=-1
Hidden=1

[Icono_APb14]
Group=App2 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Apps 2\APb14.png
X=(107*#Escala#)
Y=(225*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#APb14#"]
UpdateDivider=-1
Hidden=1

[Icono_APb15]
Group=App2 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Apps 2\APb15.png
X=(155*#Escala#)
Y=(225*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#APb15#"]
UpdateDivider=-1
Hidden=1

[Icono_APb16]
Group=App2 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Apps 2\APb16.png
X=(203*#Escala#)
Y=(225*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#APb16#"]
UpdateDivider=-1
Hidden=1

[Icono_APb17]
Group=App2 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Apps 2\APb17.png
X=(59*#Escala#)
Y=(273*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#APb17#"]
UpdateDivider=-1
Hidden=1

[Icono_APb18]
Group=App2 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Apps 2\APb18.png
X=(107*#Escala#)
Y=(273*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#APb18#"]
UpdateDivider=-1
Hidden=1

[Icono_APb19]
Group=App2 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Apps 2\APb19.png
X=(155*#Escala#)
Y=(273*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#APb19#"]
UpdateDivider=-1
Hidden=1

[Icono_APb20]
Group=App2 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Apps 2\APb20.png
X=(203*#Escala#)
Y=(273*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#APb20#"]
UpdateDivider=-1
Hidden=1

[Icono_APb21]
Group=App2 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Apps 2\APb21.png
X=(59*#Escala#)
Y=(321*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#APb21#"]
UpdateDivider=-1
Hidden=1

[Icono_APb22]
Group=App2 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Apps 2\APb22.png
X=(107*#Escala#)
Y=(321*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#APb22#"]
UpdateDivider=-1
Hidden=1

[Icono_APb23]
Group=App2 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Apps 2\APb23.png
X=(155*#Escala#)
Y=(321*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#APb23#"]
UpdateDivider=-1
Hidden=1

[Icono_APb24]
Group=App2 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Apps 2\APb24.png
X=(203*#Escala#)
Y=(321*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#APb24#"]
UpdateDivider=-1
Hidden=1

[Icono_APb25]
Group=App2 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Apps 2\APb25.png
X=(59*#Escala#)
Y=(369*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#APb25#"]
UpdateDivider=-1
Hidden=1

[Icono_APb26]
Group=App2 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Apps 2\APb26.png
X=(107*#Escala#)
Y=(369*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#APb26#"]
UpdateDivider=-1
Hidden=1

[Icono_APb27]
Group=App2 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Apps 2\APb27.png
X=(155*#Escala#)
Y=(369*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#APb27#"]
UpdateDivider=-1
Hidden=1

[Icono_APb28]
Group=App2 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Apps 2\APb28.png
X=(203*#Escala#)
Y=(369*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#APb28#"]
UpdateDivider=-1
Hidden=1

[Info_WA]
Group=WinApp | Pantalla
Meter=STRING
MeterStyle=ST-Texto_2
FontSize=(10*#Escala#)
X=(154*#Escala#)
Y=(58*#Escala#)
W=(200*#Escala#)
H=(20*#Escala#)
DynamicVariables=1
Text=WINDOWS APPs
UpdateDivider=-1
Hidden=1

[Icono_Editar06]
Group=WinApp | Pantalla
Meter=IMAGE
ImageName=#@#Images\Suite\edit.png
ImageAlpha=32
X=(201*#Escala#)
Y=(428*#Escala#)
W=(14*#Escala#)
H=(14*#Escala#)
DynamicVariables=1
UpdateDivider=-1
Hidden=1

[Icono_WA01]
Group=WinApp | Pantalla
Meter=IMAGE
ImageName=#@#Images\Windows Apps\WA01.png
X=(59*#Escala#)
Y=(81*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["Explorer.exe"]
UpdateDivider=-1
Hidden=1

[Icono_WA02]
Group=WinApp | Pantalla
Meter=IMAGE
ImageName=#@#Images\Windows Apps\WA02.png
X=(107*#Escala#)
Y=(81*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][shell:Appsfolder\Microsoft.SkyDrive.Desktop]
UpdateDivider=-1
Hidden=1

[Icono_WA03]
Group=WinApp | Pantalla
Meter=IMAGE
ImageName=#@#Images\Windows Apps\WA03.png
X=(155*#Escala#)
Y=(81*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][shell:Appsfolder\Microsoft.Windows.Cortana_cw5n1h2txyewy!CortanaUI]
UpdateDivider=-1
Hidden=1

[Icono_WA04]
Group=WinApp | Pantalla
Meter=IMAGE
ImageName=#@#Images\Windows Apps\WA04.png
X=(203*#Escala#)
Y=(81*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][shell:Appsfolder\Microsoft.WindowsStore_8wekyb3d8bbwe!App]
UpdateDivider=-1
Hidden=1

[Icono_WA05]
Group=WinApp | Pantalla
Meter=IMAGE
ImageName=#@#Images\Windows Apps\WA05.png
X=(59*#Escala#)
Y=(129*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][shell:Appsfolder\Microsoft.BingWeather_8wekyb3d8bbwe!App]
UpdateDivider=-1
Hidden=1

[Icono_WA06]
Group=WinApp | Pantalla
Meter=IMAGE
ImageName=#@#Images\Windows Apps\WA06.png
X=(107*#Escala#)
Y=(129*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][shell:Appsfolder\Microsoft.windowscommunicationsapps_8wekyb3d8bbwe!microsoft.windowslive.mail]
UpdateDivider=-1
Hidden=1

[Icono_WA07]
Group=WinApp | Pantalla
Meter=IMAGE
ImageName=#@#Images\Windows Apps\WA07.png
X=(155*#Escala#)
Y=(129*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][shell:Appsfolder\Microsoft.windowscommunicationsapps_8wekyb3d8bbwe!microsoft.windowslive.calendar]
UpdateDivider=-1
Hidden=1

[Icono_WA08]
Group=WinApp | Pantalla
Meter=IMAGE
ImageName=#@#Images\Windows Apps\WA08.png
X=(203*#Escala#)
Y=(129*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][shell:Appsfolder\Microsoft.BingNews_8wekyb3d8bbwe!AppexNews]
UpdateDivider=-1
Hidden=1

[Icono_WA09]
Group=WinApp | Pantalla
Meter=IMAGE
ImageName=#@#Images\Windows Apps\WA09.png
X=(59*#Escala#)
Y=(177*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][shell:Appsfolder\Microsoft.WindowsMaps_8wekyb3d8bbwe!App]
UpdateDivider=-1
Hidden=1

[Icono_WA10]
Group=WinApp | Pantalla
Meter=IMAGE
ImageName=#@#Images\Windows Apps\WA10.png
X=(107*#Escala#)
Y=(177*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["calc.exe"]
UpdateDivider=-1
Hidden=1

[Icono_WA11]
Group=WinApp | Pantalla
Meter=IMAGE
ImageName=#@#Images\Windows Apps\WA11.png
X=(155*#Escala#)
Y=(177*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][shell:Appsfolder\Microsoft.WindowsAlarms_8wekyb3d8bbwe!App]
UpdateDivider=-1
Hidden=1

[Icono_WA12]
Group=WinApp | Pantalla
Meter=IMAGE
ImageName=#@#Images\Windows Apps\WA12.png
X=(203*#Escala#)
Y=(177*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["narrator.exe"]
UpdateDivider=-1
Hidden=1

[Icono_WA13]
Group=WinApp | Pantalla
Meter=IMAGE
ImageName=#@#Images\Windows Apps\WA13.png
X=(59*#Escala#)
Y=(225*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][shell:Appsfolder\Microsoft.WindowsCamera_8wekyb3d8bbwe!App]
UpdateDivider=-1
Hidden=1

[Icono_WA14]
Group=WinApp | Pantalla
Meter=IMAGE
ImageName=#@#Images\Windows Apps\WA14.png
X=(107*#Escala#)
Y=(225*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][shell:Appsfolder\Microsoft.Windows.Photos_8wekyb3d8bbwe!App]
UpdateDivider=-1
Hidden=1

[Icono_WA15]
Group=WinApp | Pantalla
Meter=IMAGE
ImageName=#@#Images\Windows Apps\WA15.png
X=(155*#Escala#)
Y=(225*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][shell:Appsfolder\Microsoft.ZuneVideo_8wekyb3d8bbwe!Microsoft.ZuneVideo]
UpdateDivider=-1
Hidden=1

[Icono_WA16]
Group=WinApp | Pantalla
Meter=IMAGE
ImageName=#@#Images\Windows Apps\WA16.png
X=(203*#Escala#)
Y=(225*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][shell:Appsfolder\Microsoft.Windows.Photos_8wekyb3d8bbwe!SecondaryEntry]
UpdateDivider=-1
Hidden=1

[Icono_WA17]
Group=WinApp | Pantalla
Meter=IMAGE
ImageName=#@#Images\Windows Apps\WA17.png
X=(59*#Escala#)
Y=(273*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["sndvol.exe"]
UpdateDivider=-1
Hidden=1

[Icono_WA18]
Group=WinApp | Pantalla
Meter=IMAGE
ImageName=#@#Images\Windows Apps\WA18.png
X=(107*#Escala#)
Y=(273*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["wmplayer.exe"]
UpdateDivider=-1
Hidden=1

[Icono_WA19]
Group=WinApp | Pantalla
Meter=IMAGE
ImageName=#@#Images\Windows Apps\WA19.png
X=(155*#Escala#)
Y=(273*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][shell:Appsfolder\Microsoft.ZuneMusic_8wekyb3d8bbwe!Microsoft.ZuneMusic]
UpdateDivider=-1
Hidden=1

[Icono_WA20]
Group=WinApp | Pantalla
Meter=IMAGE
ImageName=#@#Images\Windows Apps\WA20.png
X=(203*#Escala#)
Y=(273*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][shell:Appsfolder\Microsoft.WindowsSoundRecorder_8wekyb3d8bbwe!App]
UpdateDivider=-1
Hidden=1

[Icono_WA21]
Group=WinApp | Pantalla
Meter=IMAGE
ImageName=#@#Images\Windows Apps\WA21.png
X=(59*#Escala#)
Y=(321*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][shell:Appsfolder\Microsoft.People_8wekyb3d8bbwe!x4c7a3b7dy2188y46d4ya362y19ac5a5805e5x]
UpdateDivider=-1
Hidden=1

[Icono_WA22]
Group=WinApp | Pantalla
Meter=IMAGE
ImageName=#@#Images\Windows Apps\WA22.png
X=(107*#Escala#)
Y=(321*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][shell:Appsfolder\Microsoft.MicrosoftStickyNotes_8wekyb3d8bbwe!App]
UpdateDivider=-1
Hidden=1

[Icono_WA23]
Group=WinApp | Pantalla
Meter=IMAGE
ImageName=#@#Images\Windows Apps\WA23.png
X=(155*#Escala#)
Y=(321*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["notepad.exe"]
UpdateDivider=-1
Hidden=1

[Icono_WA24]
Group=WinApp | Pantalla
Meter=IMAGE
ImageName=#@#Images\Windows Apps\WA24.png
X=(203*#Escala#)
Y=(321*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["write.exe"]
UpdateDivider=-1
Hidden=1

[Icono_WA25]
Group=WinApp | Pantalla
Meter=IMAGE
ImageName=#@#Images\Windows Apps\WA25.png
X=(59*#Escala#)
Y=(369*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["mspaint.exe"]
UpdateDivider=-1
Hidden=1

[Icono_WA26]
Group=WinApp | Pantalla
Meter=IMAGE
ImageName=#@#Images\Windows Apps\WA26.png
X=(107*#Escala#)
Y=(369*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][shell:Appsfolder\Microsoft.MSPaint_8wekyb3d8bbwe!Microsoft.MSPaint]
UpdateDivider=-1
Hidden=1

[Icono_WA27]
Group=WinApp | Pantalla
Meter=IMAGE
ImageName=#@#Images\Windows Apps\WA27.png
X=(155*#Escala#)
Y=(369*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][shell:Appsfolder\Microsoft.MicrosoftEdge_8wekyb3d8bbwe!MicrosoftEdge]
UpdateDivider=-1
Hidden=1

[Icono_WA28]
Group=WinApp | Pantalla
Meter=IMAGE
ImageName=#@#Images\Windows Apps\WA28.png
X=(203*#Escala#)
Y=(369*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][shell:Appsfolder\Microsoft.SkypeApp_kzf8qxf38zg5c!App]
UpdateDivider=-1
Hidden=1

[Info_SE]
Group=Buscadores | Pantalla
Meter=STRING
MeterStyle=ST-Texto_2
FontSize=(10*#Escala#)
X=(154*#Escala#)
Y=(58*#Escala#)
W=(200*#Escala#)
H=(20*#Escala#)
DynamicVariables=1
Text=SEARCH
UpdateDivider=-1
Hidden=1

[Icono_Editar07]
Group=Buscadores | Pantalla
Meter=IMAGE
ImageName=#@#Images\Suite\edit.png
ImageAlpha=32
X=(201*#Escala#)
Y=(428*#Escala#)
W=(14*#Escala#)
H=(14*#Escala#)
DynamicVariables=1
UpdateDivider=-1
Hidden=1

[Solido_SE01]
Group=Buscadores | Pantalla
Meter=SHAPE
Shape=Rectangle (60*#Escala#),(84*#Escala#),(187*#Escala#),(29*#Escala#),(5*#Escala#),(5*#Escala#) | Fill Color 255,255,255,255 | Stroke Color 0,0,0,0
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!CommandMeasure mWebSearch_01 "ExecuteBatch 1"]
UpdateDivider=-1
Hidden=1

[Solido_SE02]
Group=Buscadores | Pantalla
Meter=SHAPE
Shape=Rectangle (60*#Escala#),(121*#Escala#),(187*#Escala#),(29*#Escala#),(5*#Escala#),(5*#Escala#) | Fill Color 255,255,255,255 | Stroke Color 0,0,0,0
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!CommandMeasure mWebSearch_02 "ExecuteBatch 1"]
UpdateDivider=-1
Hidden=1

[Solido_SE03]
Group=Buscadores | Pantalla
Meter=SHAPE
Shape=Rectangle (60*#Escala#),(158*#Escala#),(187*#Escala#),(29*#Escala#),(5*#Escala#),(5*#Escala#) | Fill Color 255,255,255,255 | Stroke Color 0,0,0,0
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!CommandMeasure mWebSearch_03 "ExecuteBatch 1"]
UpdateDivider=-1
Hidden=1

[Solido_SE04]
Group=Buscadores | Pantalla
Meter=SHAPE
Shape=Rectangle (60*#Escala#),(195*#Escala#),(187*#Escala#),(29*#Escala#),(5*#Escala#),(5*#Escala#) | Fill Color 255,255,255,255 | Stroke Color 0,0,0,0
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!CommandMeasure mWebSearch_04 "ExecuteBatch 1"]
UpdateDivider=-1
Hidden=1

[Solido_SE05]
Group=Buscadores | Pantalla
Meter=SHAPE
Shape=Rectangle (60*#Escala#),(232*#Escala#),(187*#Escala#),(29*#Escala#),(5*#Escala#),(5*#Escala#) | Fill Color 255,255,255,255 | Stroke Color 0,0,0,0
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!CommandMeasure mWebSearch_05 "ExecuteBatch 1"]
UpdateDivider=-1
Hidden=1

[Solido_SE06]
Group=Buscadores | Pantalla
Meter=SHAPE
Shape=Rectangle (60*#Escala#),(269*#Escala#),(187*#Escala#),(29*#Escala#),(5*#Escala#),(5*#Escala#) | Fill Color 255,255,255,255 | Stroke Color 0,0,0,0
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!CommandMeasure mWebSearch_06 "ExecuteBatch 1"]
UpdateDivider=-1
Hidden=1

[Solido_SE07]
Group=Buscadores | Pantalla
Meter=SHAPE
Shape=Rectangle (60*#Escala#),(306*#Escala#),(187*#Escala#),(29*#Escala#),(5*#Escala#),(5*#Escala#) | Fill Color 255,255,255,255 | Stroke Color 0,0,0,0
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!CommandMeasure mWebSearch_07 "ExecuteBatch 1"]
UpdateDivider=-1
Hidden=1

[Solido_SE08]
Group=Buscadores | Pantalla
Meter=SHAPE
Shape=Rectangle (60*#Escala#),(343*#Escala#),(187*#Escala#),(29*#Escala#),(5*#Escala#),(5*#Escala#) | Fill Color 255,255,255,255 | Stroke Color 0,0,0,0
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!CommandMeasure mWebSearch_08 "ExecuteBatch 1"]
UpdateDivider=-1
Hidden=1

[Solido_SE09]
Group=Buscadores | Pantalla
Meter=SHAPE
Shape=Rectangle (60*#Escala#),(380*#Escala#),(187*#Escala#),(29*#Escala#),(5*#Escala#),(5*#Escala#) | Fill Color 255,255,255,255 | Stroke Color 0,0,0,0
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!CommandMeasure mWebSearch_09 "ExecuteBatch 1"]
UpdateDivider=-1
Hidden=1

[Icono_SE01]
Group=Buscadores | Pantalla
Meter=IMAGE
ImageName=#@#Images\Search\SE01.png
X=(63*#Escala#)
Y=(87*#Escala#)
W=(24*#Escala#)
H=(24*#Escala#)
DynamicVariables=1
UpdateDivider=-1
Hidden=1

[Icono_SE02]
Group=Buscadores | Pantalla
Meter=IMAGE
ImageName=#@#Images\Search\SE02.png
X=(63*#Escala#)
Y=(124*#Escala#)
W=(24*#Escala#)
H=(24*#Escala#)
DynamicVariables=1
UpdateDivider=-1
Hidden=1

[Icono_SE03]
Group=Buscadores | Pantalla
Meter=IMAGE
ImageName=#@#Images\Search\SE03.png
X=(63*#Escala#)
Y=(161*#Escala#)
W=(24*#Escala#)
H=(24*#Escala#)
DynamicVariables=1
UpdateDivider=-1
Hidden=1

[Icono_SE04]
Group=Buscadores | Pantalla
Meter=IMAGE
ImageName=#@#Images\Search\SE04.png
X=(63*#Escala#)
Y=(198*#Escala#)
W=(24*#Escala#)
H=(24*#Escala#)
DynamicVariables=1
UpdateDivider=-1
Hidden=1

[Icono_SE05]
Group=Buscadores | Pantalla
Meter=IMAGE
ImageName=#@#Images\Search\SE05.png
X=(63*#Escala#)
Y=(235*#Escala#)
W=(24*#Escala#)
H=(24*#Escala#)
DynamicVariables=1
UpdateDivider=-1
Hidden=1

[Icono_SE06]
Group=Buscadores | Pantalla
Meter=IMAGE
ImageName=#@#Images\Search\SE06.png
X=(63*#Escala#)
Y=(272*#Escala#)
W=(24*#Escala#)
H=(24*#Escala#)
DynamicVariables=1
UpdateDivider=-1
Hidden=1

[Icono_SE07]
Group=Buscadores | Pantalla
Meter=IMAGE
ImageName=#@#Images\Search\SE07.png
X=(63*#Escala#)
Y=(309*#Escala#)
W=(24*#Escala#)
H=(24*#Escala#)
DynamicVariables=1
UpdateDivider=-1
Hidden=1

[Icono_SE08]
Group=Buscadores | Pantalla
Meter=IMAGE
ImageName=#@#Images\Search\SE08.png
X=(63*#Escala#)
Y=(346*#Escala#)
W=(24*#Escala#)
H=(24*#Escala#)
DynamicVariables=1
UpdateDivider=-1
Hidden=1

[Icono_SE09]
Group=Buscadores | Pantalla
Meter=IMAGE
ImageName=#@#Images\Search\SE09.png
X=(63*#Escala#)
Y=(383*#Escala#)
W=(24*#Escala#)
H=(24*#Escala#)
DynamicVariables=1
UpdateDivider=-1
Hidden=1

[mWebSearch_01]
Measure=Plugin
Plugin=InputText
FontFace=Segoe UI
FontColor=32,32,32,255
SolidColor=255,255,255,255
FontSize=(9*#Escala#)
StringAlign=Left
StringStyle=Bold
X=(90*#Escala#)
Y=(91*#Escala#)
W=(150*#Escala#)
H=(20*#Escala#)
AntiAlias=1
FocusDismiss=1
Command1=["https://www.google.com/search?q=$UserInput$"]
DefaultValue="Google"
DynamicVariables=1
UpdateDivider=-1

[mWebSearch_02]
Measure=Plugin
Plugin=InputText
FontFace=Segoe UI
FontColor=32,32,32,255
SolidColor=255,255,255,255
FontSize=(9*#Escala#)
StringAlign=Left
StringStyle=Bold
X=(90*#Escala#)
Y=(128*#Escala#)
W=(150*#Escala#)
H=(20*#Escala#)
AntiAlias=1
FocusDismiss=1
Command1=["https://www.bing.com/search?q=$UserInput$"]
DefaultValue="Bing"
DynamicVariables=1
UpdateDivider=-1

[mWebSearch_03]
Measure=Plugin
Plugin=InputText
FontFace=Segoe UI
FontColor=32,32,32,255
SolidColor=255,255,255,255
FontSize=(9*#Escala#)
StringAlign=Left
StringStyle=Bold
X=(90*#Escala#)
Y=(165*#Escala#)
W=(150*#Escala#)
H=(20*#Escala#)
AntiAlias=1
FocusDismiss=1
Command1=["https://search.yahoo.com/search?p=$UserInput$"]
DefaultValue="Yahoo"
DynamicVariables=1
UpdateDivider=-1

[mWebSearch_04]
Measure=Plugin
Plugin=InputText
FontFace=Segoe UI
FontColor=32,32,32,255
SolidColor=255,255,255,255
FontSize=(9*#Escala#)
StringAlign=Left
StringStyle=Bold
X=(90*#Escala#)
Y=(202*#Escala#)
W=(150*#Escala#)
H=(20*#Escala#)
AntiAlias=1
FocusDismiss=1
Command1=["https://duckduckgo.com/?q=$UserInput$"]
DefaultValue="DuckDuckGo"
DynamicVariables=1
UpdateDivider=-1

[mWebSearch_05]
Measure=Plugin
Plugin=InputText
FontFace=Segoe UI
FontColor=32,32,32,255
SolidColor=255,255,255,255
FontSize=(9*#Escala#)
StringAlign=Left
StringStyle=Bold
X=(90*#Escala#)
Y=(239*#Escala#)
W=(150*#Escala#)
H=(20*#Escala#)
AntiAlias=1
FocusDismiss=1
Command1=["https://en.wikipedia.org/wiki/$UserInput$"]
DefaultValue="Wikipedia"
DynamicVariables=1
UpdateDivider=-1

[mWebSearch_06]
Measure=Plugin
Plugin=InputText
FontFace=Segoe UI
FontColor=32,32,32,255
SolidColor=255,255,255,255
FontSize=(9*#Escala#)
StringAlign=Left
StringStyle=Bold
X=(90*#Escala#)
Y=(276*#Escala#)
W=(150*#Escala#)
H=(20*#Escala#)
AntiAlias=1
FocusDismiss=1
Command1=["https://www.youtube.com/results?search_query=$UserInput$"]
DefaultValue="YouTube"
DynamicVariables=1
UpdateDivider=-1

[mWebSearch_07]
Measure=Plugin
Plugin=InputText
FontFace=Segoe UI
FontColor=32,32,32,255
SolidColor=255,255,255,255
FontSize=(9*#Escala#)
StringAlign=Left
StringStyle=Bold
X=(90*#Escala#)
Y=(313*#Escala#)
W=(150*#Escala#)
H=(20*#Escala#)
AntiAlias=1
FocusDismiss=1
Command1=["https://www.reddit.com/search?q=$UserInput$"]
DefaultValue="Reddit"
DynamicVariables=1
UpdateDivider=-1

[mWebSearch_08]
Measure=Plugin
Plugin=InputText
FontFace=Segoe UI
FontColor=32,32,32,255
SolidColor=255,255,255,255
FontSize=(8*#Escala#)
StringAlign=Left
StringStyle=Bold
X=(90*#Escala#)
Y=(350*#Escala#)
W=(150*#Escala#)
H=(20*#Escala#)
AntiAlias=1
FocusDismiss=1
Command1=["https://www.deviantart.com/customization/skins/sysmonitor/rainmeter/newest/?q=$UserInput$"]
DefaultValue="DeviantArt (Rainmeter)"
DynamicVariables=1
UpdateDivider=-1

[mWebSearch_09]
Measure=Plugin
Plugin=InputText
FontFace=Segoe UI
FontColor=32,32,32,255
SolidColor=255,255,255,255
FontSize=(8*#Escala#)
StringAlign=Left
StringStyle=Bold
X=(90*#Escala#)
Y=(387*#Escala#)
W=(150*#Escala#)
H=(20*#Escala#)
AntiAlias=1
FocusDismiss=1
Command1=["https://forum.rainmeter.net/search.php?keywords=$UserInput$"]
DefaultValue="Rainmeter Forum"
DynamicVariables=1
UpdateDivider=-1

[Icono_Editar08]
Group=Enlaces1 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Suite\edit.png
ImageAlpha=164
X=(201*#Escala#)
Y=(428*#Escala#)
W=(14*#Escala#)
H=(14*#Escala#)
DynamicVariables=1
MouseOverAction=[!SetOption #CURRENTSECTION# ImageAlpha 255][!UpdateMeter #CURRENTSECTION#][!Redraw]
MouseLeaveAction=[!SetOption #CURRENTSECTION# ImageAlpha 164][!UpdateMeter #CURRENTSECTION#][!Redraw]
LeftMouseUpAction=[Play #@#Sounds\vibrador2.wav]["#@#Settings\Variables Bookmarks 1.inc"]
UpdateDivider=-1
Hidden=1

[Info_BO1]
Group=Enlaces1 | Pantalla
Meter=STRING
MeterStyle=ST-Texto_2
FontSize=(10*#Escala#)
X=(154*#Escala#)
Y=(58*#Escala#)
W=(200*#Escala#)
H=(20*#Escala#)
DynamicVariables=1
Text=#Marcadores# 1
UpdateDivider=-1
Hidden=1

[Icono_Ba01]
Group=Enlaces1 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 1\Ba01.png
X=(59*#Escala#)
Y=(81*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Ba01#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Ba01#"]
UpdateDivider=-1
Hidden=1

[Icono_Ba02]
Group=Enlaces1 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 1\Ba02.png
X=(107*#Escala#)
Y=(81*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Ba02#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Ba02#"]
UpdateDivider=-1
Hidden=1

[Icono_Ba03]
Group=Enlaces1 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 1\Ba03.png
X=(155*#Escala#)
Y=(81*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Ba03#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Ba03#"]
UpdateDivider=-1
Hidden=1

[Icono_Ba04]
Group=Enlaces1 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 1\Ba04.png
X=(203*#Escala#)
Y=(81*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Ba04#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Ba04#"]
UpdateDivider=-1
Hidden=1

[Icono_Ba05]
Group=Enlaces1 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 1\Ba05.png
X=(59*#Escala#)
Y=(129*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Ba05#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Ba05#"]
UpdateDivider=-1
Hidden=1

[Icono_Ba06]
Group=Enlaces1 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 1\Ba06.png
X=(107*#Escala#)
Y=(129*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Ba06#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Ba06#"]
UpdateDivider=-1
Hidden=1

[Icono_Ba07]
Group=Enlaces1 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 1\Ba07.png
X=(155*#Escala#)
Y=(129*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Ba07#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Ba07#"]
UpdateDivider=-1
Hidden=1

[Icono_Ba08]
Group=Enlaces1 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 1\Ba08.png
X=(203*#Escala#)
Y=(129*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Ba08#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Ba08#"]
UpdateDivider=-1
Hidden=1

[Icono_Ba09]
Group=Enlaces1 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 1\Ba09.png
X=(59*#Escala#)
Y=(177*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Ba09#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Ba09#"]
UpdateDivider=-1
Hidden=1

[Icono_Ba10]
Group=Enlaces1 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 1\Ba10.png
X=(107*#Escala#)
Y=(177*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Ba10#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Ba10#"]
UpdateDivider=-1
Hidden=1

[Icono_Ba11]
Group=Enlaces1 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 1\Ba11.png
X=(155*#Escala#)
Y=(177*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Ba11#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Ba11#"]
UpdateDivider=-1
Hidden=1

[Icono_Ba12]
Group=Enlaces1 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 1\Ba12.png
X=(203*#Escala#)
Y=(177*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Ba12#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Ba12#"]
UpdateDivider=-1
Hidden=1

[Icono_Ba13]
Group=Enlaces1 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 1\Ba13.png
X=(59*#Escala#)
Y=(225*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Ba13#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Ba13#"]
UpdateDivider=-1
Hidden=1

[Icono_Ba14]
Group=Enlaces1 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 1\Ba14.png
X=(107*#Escala#)
Y=(225*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Ba14#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Ba14#"]
UpdateDivider=-1
Hidden=1

[Icono_Ba15]
Group=Enlaces1 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 1\Ba15.png
X=(155*#Escala#)
Y=(225*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Ba15#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Ba15#"]
UpdateDivider=-1
Hidden=1

[Icono_Ba16]
Group=Enlaces1 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 1\Ba16.png
X=(203*#Escala#)
Y=(225*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Ba16#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Ba16#"]
UpdateDivider=-1
Hidden=1

[Icono_Ba17]
Group=Enlaces1 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 1\Ba17.png
X=(59*#Escala#)
Y=(273*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Ba17#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Ba17#"]
UpdateDivider=-1
Hidden=1

[Icono_Ba18]
Group=Enlaces1 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 1\Ba18.png
X=(107*#Escala#)
Y=(273*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Ba18#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Ba18#"]
UpdateDivider=-1
Hidden=1

[Icono_Ba19]
Group=Enlaces1 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 1\Ba19.png
X=(155*#Escala#)
Y=(273*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Ba19#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Ba19#"]
UpdateDivider=-1
Hidden=1

[Icono_Ba20]
Group=Enlaces1 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 1\Ba20.png
X=(203*#Escala#)
Y=(273*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Ba20#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Ba20#"]
UpdateDivider=-1
Hidden=1

[Icono_Ba21]
Group=Enlaces1 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 1\Ba21.png
X=(59*#Escala#)
Y=(321*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Ba21#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Ba21#"]
UpdateDivider=-1
Hidden=1

[Icono_Ba22]
Group=Enlaces1 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 1\Ba22.png
X=(107*#Escala#)
Y=(321*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Ba22#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Ba22#"]
UpdateDivider=-1
Hidden=1

[Icono_Ba23]
Group=Enlaces1 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 1\Ba23.png
X=(155*#Escala#)
Y=(321*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Ba23#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Ba23#"]
UpdateDivider=-1
Hidden=1

[Icono_Ba24]
Group=Enlaces1 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 1\Ba24.png
X=(203*#Escala#)
Y=(321*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Ba24#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Ba24#"]
UpdateDivider=-1
Hidden=1

[Icono_Ba25]
Group=Enlaces1 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 1\Ba25.png
X=(59*#Escala#)
Y=(369*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Ba25#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Ba25#"]
UpdateDivider=-1
Hidden=1

[Icono_Ba26]
Group=Enlaces1 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 1\Ba26.png
X=(107*#Escala#)
Y=(369*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Ba26#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Ba26#"]
UpdateDivider=-1
Hidden=1

[Icono_Ba27]
Group=Enlaces1 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 1\Ba27.png
X=(155*#Escala#)
Y=(369*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Ba27#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Ba27#"]
UpdateDivider=-1
Hidden=1

[Icono_Ba28]
Group=Enlaces1 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 1\Ba28.png
X=(203*#Escala#)
Y=(369*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Ba28#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Ba28#"]
UpdateDivider=-1
Hidden=1

[Icono_Editar09]
Group=Enlaces2 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Suite\edit.png
ImageAlpha=164
X=(201*#Escala#)
Y=(428*#Escala#)
W=(14*#Escala#)
H=(14*#Escala#)
DynamicVariables=1
MouseOverAction=[!SetOption #CURRENTSECTION# ImageAlpha 255][!UpdateMeter #CURRENTSECTION#][!Redraw]
MouseLeaveAction=[!SetOption #CURRENTSECTION# ImageAlpha 164][!UpdateMeter #CURRENTSECTION#][!Redraw]
LeftMouseUpAction=[Play #@#Sounds\vibrador2.wav]["#@#Settings\Variables Bookmarks 2.inc"]
UpdateDivider=-1
Hidden=1

[Info_BO2]
Group=Enlaces2 | Pantalla
Meter=STRING
MeterStyle=ST-Texto_2
FontSize=(10*#Escala#)
X=(154*#Escala#)
Y=(58*#Escala#)
W=(200*#Escala#)
H=(20*#Escala#)
DynamicVariables=1
Text=#Marcadores# 2
UpdateDivider=-1
Hidden=1

[Icono_Bb01]
Group=Enlaces2 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 2\Bb01.png
X=(59*#Escala#)
Y=(81*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bb01#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bb01#"]
UpdateDivider=-1
Hidden=1

[Icono_Bb02]
Group=Enlaces2 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 2\Bb02.png
X=(107*#Escala#)
Y=(81*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bb02#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bb02#"]
UpdateDivider=-1
Hidden=1

[Icono_Bb03]
Group=Enlaces2 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 2\Bb03.png
X=(155*#Escala#)
Y=(81*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bb03#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bb03#"]
UpdateDivider=-1
Hidden=1

[Icono_Bb04]
Group=Enlaces2 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 2\Bb04.png
X=(203*#Escala#)
Y=(81*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bb04#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bb04#"]
UpdateDivider=-1
Hidden=1

[Icono_Bb05]
Group=Enlaces2 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 2\Bb05.png
X=(59*#Escala#)
Y=(129*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bb05#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bb05#"]
UpdateDivider=-1
Hidden=1

[Icono_Bb06]
Group=Enlaces2 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 2\Bb06.png
X=(107*#Escala#)
Y=(129*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bb06#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bb06#"]
UpdateDivider=-1
Hidden=1

[Icono_Bb07]
Group=Enlaces2 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 2\Bb07.png
X=(155*#Escala#)
Y=(129*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bb07#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bb07#"]
UpdateDivider=-1
Hidden=1

[Icono_Bb08]
Group=Enlaces2 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 2\Bb08.png
X=(203*#Escala#)
Y=(129*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bb08#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bb08#"]
UpdateDivider=-1
Hidden=1

[Icono_Bb09]
Group=Enlaces2 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 2\Bb09.png
X=(59*#Escala#)
Y=(177*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bb09#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bb09#"]
UpdateDivider=-1
Hidden=1

[Icono_Bb10]
Group=Enlaces2 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 2\Bb10.png
X=(107*#Escala#)
Y=(177*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bb10#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bb10#"]
UpdateDivider=-1
Hidden=1

[Icono_Bb11]
Group=Enlaces2 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 2\Bb11.png
X=(155*#Escala#)
Y=(177*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bb11#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bb11#"]
UpdateDivider=-1
Hidden=1

[Icono_Bb12]
Group=Enlaces2 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 2\Bb12.png
X=(203*#Escala#)
Y=(177*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bb12#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bb12#"]
UpdateDivider=-1
Hidden=1

[Icono_Bb13]
Group=Enlaces2 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 2\Bb13.png
X=(59*#Escala#)
Y=(225*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bb13#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bb13#"]
UpdateDivider=-1
Hidden=1

[Icono_Bb14]
Group=Enlaces2 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 2\Bb14.png
X=(107*#Escala#)
Y=(225*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bb14#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bb14#"]
UpdateDivider=-1
Hidden=1

[Icono_Bb15]
Group=Enlaces2 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 2\Bb15.png
X=(155*#Escala#)
Y=(225*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bb15#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bb15#"]
UpdateDivider=-1
Hidden=1

[Icono_Bb16]
Group=Enlaces2 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 2\Bb16.png
X=(203*#Escala#)
Y=(225*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bb16#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bb16#"]
UpdateDivider=-1
Hidden=1

[Icono_Bb17]
Group=Enlaces2 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 2\Bb17.png
X=(59*#Escala#)
Y=(273*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bb17#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bb17#"]
UpdateDivider=-1
Hidden=1

[Icono_Bb18]
Group=Enlaces2 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 2\Bb18.png
X=(107*#Escala#)
Y=(273*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bb18#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bb18#"]
UpdateDivider=-1
Hidden=1

[Icono_Bb19]
Group=Enlaces2 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 2\Bb19.png
X=(155*#Escala#)
Y=(273*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bb19#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bb19#"]
UpdateDivider=-1
Hidden=1

[Icono_Bb20]
Group=Enlaces2 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 2\Bb20.png
X=(203*#Escala#)
Y=(273*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bb20#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bb20#"]
UpdateDivider=-1
Hidden=1

[Icono_Bb21]
Group=Enlaces2 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 2\Bb21.png
X=(59*#Escala#)
Y=(321*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bb21#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bb21#"]
UpdateDivider=-1
Hidden=1

[Icono_Bb22]
Group=Enlaces2 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 2\Bb22.png
X=(107*#Escala#)
Y=(321*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bb22#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bb22#"]
UpdateDivider=-1
Hidden=1

[Icono_Bb23]
Group=Enlaces2 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 2\Bb23.png
X=(155*#Escala#)
Y=(321*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bb23#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bb23#"]
UpdateDivider=-1
Hidden=1

[Icono_Bb24]
Group=Enlaces2 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 2\Bb24.png
X=(203*#Escala#)
Y=(321*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bb24#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bb24#"]
UpdateDivider=-1
Hidden=1

[Icono_Bb25]
Group=Enlaces2 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 2\Bb25.png
X=(59*#Escala#)
Y=(369*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bb25#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bb25#"]
UpdateDivider=-1
Hidden=1

[Icono_Bb26]
Group=Enlaces2 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 2\Bb26.png
X=(107*#Escala#)
Y=(369*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bb26#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bb26#"]
UpdateDivider=-1
Hidden=1

[Icono_Bb27]
Group=Enlaces2 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 2\Bb27.png
X=(155*#Escala#)
Y=(369*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bb27#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bb27#"]
UpdateDivider=-1
Hidden=1

[Icono_Bb28]
Group=Enlaces2 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 2\Bb28.png
X=(203*#Escala#)
Y=(369*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bb28#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bb28#"]
UpdateDivider=-1
Hidden=1

[Icono_Editar10]
Group=Enlaces3 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Suite\edit.png
ImageAlpha=164
X=(201*#Escala#)
Y=(428*#Escala#)
W=(14*#Escala#)
H=(14*#Escala#)
DynamicVariables=1
MouseOverAction=[!SetOption #CURRENTSECTION# ImageAlpha 255][!UpdateMeter #CURRENTSECTION#][!Redraw]
MouseLeaveAction=[!SetOption #CURRENTSECTION# ImageAlpha 164][!UpdateMeter #CURRENTSECTION#][!Redraw]
LeftMouseUpAction=[Play #@#Sounds\vibrador2.wav]["#@#Settings\Variables Bookmarks 3.inc"]
UpdateDivider=-1
Hidden=1

[Info_BO3]
Group=Enlaces3 | Pantalla
Meter=STRING
MeterStyle=ST-Texto_2
FontSize=(10*#Escala#)
X=(154*#Escala#)
Y=(58*#Escala#)
W=(200*#Escala#)
H=(20*#Escala#)
DynamicVariables=1
Text=#Marcadores# 3
UpdateDivider=-1
Hidden=1

[Icono_Bc01]
Group=Enlaces3 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 3\Bc01.png
X=(59*#Escala#)
Y=(81*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bc01#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bc01#"]
UpdateDivider=-1
Hidden=1

[Icono_Bc02]
Group=Enlaces3 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 3\Bc02.png
X=(107*#Escala#)
Y=(81*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bc02#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bc02#"]
UpdateDivider=-1
Hidden=1

[Icono_Bc03]
Group=Enlaces3 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 3\Bc03.png
X=(155*#Escala#)
Y=(81*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bc03#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bc03#"]
UpdateDivider=-1
Hidden=1

[Icono_Bc04]
Group=Enlaces3 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 3\Bc04.png
X=(203*#Escala#)
Y=(81*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bc04#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bc04#"]
UpdateDivider=-1
Hidden=1

[Icono_Bc05]
Group=Enlaces3 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 3\Bc05.png
X=(59*#Escala#)
Y=(129*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bc05#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bc05#"]
UpdateDivider=-1
Hidden=1

[Icono_Bc06]
Group=Enlaces3 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 3\Bc06.png
X=(107*#Escala#)
Y=(129*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bc06#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bc06#"]
UpdateDivider=-1
Hidden=1

[Icono_Bc07]
Group=Enlaces3 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 3\Bc07.png
X=(155*#Escala#)
Y=(129*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bc07#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bc07#"]
UpdateDivider=-1
Hidden=1

[Icono_Bc08]
Group=Enlaces3 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 3\Bc08.png
X=(203*#Escala#)
Y=(129*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bc08#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bc08#"]
UpdateDivider=-1
Hidden=1

[Icono_Bc09]
Group=Enlaces3 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 3\Bc09.png
X=(59*#Escala#)
Y=(177*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bc09#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bc09#"]
UpdateDivider=-1
Hidden=1

[Icono_Bc10]
Group=Enlaces3 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 3\Bc10.png
X=(107*#Escala#)
Y=(177*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bc10#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bc10#"]
UpdateDivider=-1
Hidden=1

[Icono_Bc11]
Group=Enlaces3 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 3\Bc11.png
X=(155*#Escala#)
Y=(177*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bc11#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bc11#"]
UpdateDivider=-1
Hidden=1

[Icono_Bc12]
Group=Enlaces3 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 3\Bc12.png
X=(203*#Escala#)
Y=(177*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bc12#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bc12#"]
UpdateDivider=-1
Hidden=1

[Icono_Bc13]
Group=Enlaces3 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 3\Bc13.png
X=(59*#Escala#)
Y=(225*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bc13#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bc13#"]
UpdateDivider=-1
Hidden=1

[Icono_Bc14]
Group=Enlaces3 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 3\Bc14.png
X=(107*#Escala#)
Y=(225*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bc14#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bc14#"]
UpdateDivider=-1
Hidden=1

[Icono_Bc15]
Group=Enlaces3 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 3\Bc15.png
X=(155*#Escala#)
Y=(225*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bc15#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bc15#"]
UpdateDivider=-1
Hidden=1

[Icono_Bc16]
Group=Enlaces3 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 3\Bc16.png
X=(203*#Escala#)
Y=(225*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bc16#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bc16#"]
UpdateDivider=-1
Hidden=1

[Icono_Bc17]
Group=Enlaces3 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 3\Bc17.png
X=(59*#Escala#)
Y=(273*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bc17#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bc17#"]
UpdateDivider=-1
Hidden=1

[Icono_Bc18]
Group=Enlaces3 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 3\Bc18.png
X=(107*#Escala#)
Y=(273*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bc18#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bc18#"]
UpdateDivider=-1
Hidden=1

[Icono_Bc19]
Group=Enlaces3 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 3\Bc19.png
X=(155*#Escala#)
Y=(273*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bc19#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bc19#"]
UpdateDivider=-1
Hidden=1

[Icono_Bc20]
Group=Enlaces3 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 3\Bc20.png
X=(203*#Escala#)
Y=(273*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bc20#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bc20#"]
UpdateDivider=-1
Hidden=1

[Icono_Bc21]
Group=Enlaces3 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 3\Bc21.png
X=(59*#Escala#)
Y=(321*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bc21#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bc21#"]
UpdateDivider=-1
Hidden=1

[Icono_Bc22]
Group=Enlaces3 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 3\Bc22.png
X=(107*#Escala#)
Y=(321*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bc22#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bc22#"]
UpdateDivider=-1
Hidden=1

[Icono_Bc23]
Group=Enlaces3 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 3\Bc23.png
X=(155*#Escala#)
Y=(321*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bc23#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bc23#"]
UpdateDivider=-1
Hidden=1

[Icono_Bc24]
Group=Enlaces3 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 3\Bc24.png
X=(203*#Escala#)
Y=(321*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bc24#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bc24#"]
UpdateDivider=-1
Hidden=1

[Icono_Bc25]
Group=Enlaces3 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 3\Bc25.png
X=(59*#Escala#)
Y=(369*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bc25#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bc25#"]
UpdateDivider=-1
Hidden=1

[Icono_Bc26]
Group=Enlaces3 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 3\Bc26.png
X=(107*#Escala#)
Y=(369*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bc26#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bc26#"]
UpdateDivider=-1
Hidden=1

[Icono_Bc27]
Group=Enlaces3 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 3\Bc27.png
X=(155*#Escala#)
Y=(369*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bc27#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bc27#"]
UpdateDivider=-1
Hidden=1

[Icono_Bc28]
Group=Enlaces3 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 3\Bc28.png
X=(203*#Escala#)
Y=(369*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bc28#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bc28#"]
UpdateDivider=-1
Hidden=1

[Icono_Editar11]
Group=Enlaces4 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Suite\edit.png
ImageAlpha=164
X=(201*#Escala#)
Y=(428*#Escala#)
W=(14*#Escala#)
H=(14*#Escala#)
DynamicVariables=1
MouseOverAction=[!SetOption #CURRENTSECTION# ImageAlpha 255][!UpdateMeter #CURRENTSECTION#][!Redraw]
MouseLeaveAction=[!SetOption #CURRENTSECTION# ImageAlpha 164][!UpdateMeter #CURRENTSECTION#][!Redraw]
LeftMouseUpAction=[Play #@#Sounds\vibrador2.wav]["#@#Settings\Variables Bookmarks 4.inc"]
UpdateDivider=-1
Hidden=1

[Info_BO4]
Group=Enlaces4 | Pantalla
Meter=STRING
MeterStyle=ST-Texto_2
FontSize=(10*#Escala#)
X=(154*#Escala#)
Y=(58*#Escala#)
W=(200*#Escala#)
H=(20*#Escala#)
DynamicVariables=1
Text=#Marcadores# 4
UpdateDivider=-1
Hidden=1

[Icono_Bd01]
Group=Enlaces4 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 4\Bd01.png
X=(59*#Escala#)
Y=(81*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bd01#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bd01#"]
UpdateDivider=-1
Hidden=1

[Icono_Bd02]
Group=Enlaces4 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 4\Bd02.png
X=(107*#Escala#)
Y=(81*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bd02#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bd02#"]
UpdateDivider=-1
Hidden=1

[Icono_Bd03]
Group=Enlaces4 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 4\Bd03.png
X=(155*#Escala#)
Y=(81*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bd03#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bd03#"]
UpdateDivider=-1
Hidden=1

[Icono_Bd04]
Group=Enlaces4 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 4\Bd04.png
X=(203*#Escala#)
Y=(81*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bd04#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bd04#"]
UpdateDivider=-1
Hidden=1

[Icono_Bd05]
Group=Enlaces4 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 4\Bd05.png
X=(59*#Escala#)
Y=(129*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bd05#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bd05#"]
UpdateDivider=-1
Hidden=1

[Icono_Bd06]
Group=Enlaces4 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 4\Bd06.png
X=(107*#Escala#)
Y=(129*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bd06#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bd06#"]
UpdateDivider=-1
Hidden=1

[Icono_Bd07]
Group=Enlaces4 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 4\Bd07.png
X=(155*#Escala#)
Y=(129*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bd07#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bd07#"]
UpdateDivider=-1
Hidden=1

[Icono_Bd08]
Group=Enlaces4 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 4\Bd08.png
X=(203*#Escala#)
Y=(129*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bd08#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bd08#"]
UpdateDivider=-1
Hidden=1

[Icono_Bd09]
Group=Enlaces4 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 4\Bd09.png
X=(59*#Escala#)
Y=(177*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bd09#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bd09#"]
UpdateDivider=-1
Hidden=1

[Icono_Bd10]
Group=Enlaces4 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 4\Bd10.png
X=(107*#Escala#)
Y=(177*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bd10#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bd10#"]
UpdateDivider=-1
Hidden=1

[Icono_Bd11]
Group=Enlaces4 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 4\Bd11.png
X=(155*#Escala#)
Y=(177*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bd11#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bd11#"]
UpdateDivider=-1
Hidden=1

[Icono_Bd12]
Group=Enlaces4 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 4\Bd12.png
X=(203*#Escala#)
Y=(177*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bd12#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bd12#"]
UpdateDivider=-1
Hidden=1

[Icono_Bd13]
Group=Enlaces4 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 4\Bd13.png
X=(59*#Escala#)
Y=(225*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bd13#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bd13#"]
UpdateDivider=-1
Hidden=1

[Icono_Bd14]
Group=Enlaces4 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 4\Bd14.png
X=(107*#Escala#)
Y=(225*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bd14#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bd14#"]
UpdateDivider=-1
Hidden=1

[Icono_Bd15]
Group=Enlaces4 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 4\Bd15.png
X=(155*#Escala#)
Y=(225*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bd15#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bd15#"]
UpdateDivider=-1
Hidden=1

[Icono_Bd16]
Group=Enlaces4 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 4\Bd16.png
X=(203*#Escala#)
Y=(225*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bd16#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bd16#"]
UpdateDivider=-1
Hidden=1

[Icono_Bd17]
Group=Enlaces4 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 4\Bd17.png
X=(59*#Escala#)
Y=(273*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bd17#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bd17#"]
UpdateDivider=-1
Hidden=1

[Icono_Bd18]
Group=Enlaces4 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 4\Bd18.png
X=(107*#Escala#)
Y=(273*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bd18#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bd18#"]
UpdateDivider=-1
Hidden=1

[Icono_Bd19]
Group=Enlaces4 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 4\Bd19.png
X=(155*#Escala#)
Y=(273*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bd19#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bd19#"]
UpdateDivider=-1
Hidden=1

[Icono_Bd20]
Group=Enlaces4 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 4\Bd20.png
X=(203*#Escala#)
Y=(273*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bd20#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bd20#"]
UpdateDivider=-1
Hidden=1

[Icono_Bd21]
Group=Enlaces4 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 4\Bd21.png
X=(59*#Escala#)
Y=(321*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bd21#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bd21#"]
UpdateDivider=-1
Hidden=1

[Icono_Bd22]
Group=Enlaces4 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 4\Bd22.png
X=(107*#Escala#)
Y=(321*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bd22#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bd22#"]
UpdateDivider=-1
Hidden=1

[Icono_Bd23]
Group=Enlaces4 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 4\Bd23.png
X=(155*#Escala#)
Y=(321*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bd23#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bd23#"]
UpdateDivider=-1
Hidden=1

[Icono_Bd24]
Group=Enlaces4 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 4\Bd24.png
X=(203*#Escala#)
Y=(321*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bd24#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bd24#"]
UpdateDivider=-1
Hidden=1

[Icono_Bd25]
Group=Enlaces4 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 4\Bd25.png
X=(59*#Escala#)
Y=(369*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bd25#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bd25#"]
UpdateDivider=-1
Hidden=1

[Icono_Bd26]
Group=Enlaces4 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 4\Bd26.png
X=(107*#Escala#)
Y=(369*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bd26#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bd26#"]
UpdateDivider=-1
Hidden=1

[Icono_Bd27]
Group=Enlaces4 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 4\Bd27.png
X=(155*#Escala#)
Y=(369*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bd27#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bd27#"]
UpdateDivider=-1
Hidden=1

[Icono_Bd28]
Group=Enlaces4 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 4\Bd28.png
X=(203*#Escala#)
Y=(369*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bd28#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bd28#"]
UpdateDivider=-1
Hidden=1

[Icono_Editar12]
Group=Enlaces5 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Suite\edit.png
ImageAlpha=164
X=(201*#Escala#)
Y=(428*#Escala#)
W=(14*#Escala#)
H=(14*#Escala#)
DynamicVariables=1
MouseOverAction=[!SetOption #CURRENTSECTION# ImageAlpha 255][!UpdateMeter #CURRENTSECTION#][!Redraw]
MouseLeaveAction=[!SetOption #CURRENTSECTION# ImageAlpha 164][!UpdateMeter #CURRENTSECTION#][!Redraw]
LeftMouseUpAction=[Play #@#Sounds\vibrador2.wav]["#@#Settings\Variables Bookmarks 5.inc"]
UpdateDivider=-1
Hidden=1

[Info_BO5]
Group=Enlaces5 | Pantalla
Meter=STRING
MeterStyle=ST-Texto_2
FontSize=(10*#Escala#)
X=(154*#Escala#)
Y=(58*#Escala#)
W=(200*#Escala#)
H=(20*#Escala#)
DynamicVariables=1
Text=#Marcadores# 5
UpdateDivider=-1
Hidden=1

[Icono_Be01]
Group=Enlaces5 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 5\Be01.png
X=(59*#Escala#)
Y=(81*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Be01#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Be01#"]
UpdateDivider=-1
Hidden=1

[Icono_Be02]
Group=Enlaces5 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 5\Be02.png
X=(107*#Escala#)
Y=(81*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Be02#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Be02#"]
UpdateDivider=-1
Hidden=1

[Icono_Be03]
Group=Enlaces5 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 5\Be03.png
X=(155*#Escala#)
Y=(81*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Be03#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Be03#"]
UpdateDivider=-1
Hidden=1

[Icono_Be04]
Group=Enlaces5 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 5\Be04.png
X=(203*#Escala#)
Y=(81*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Be04#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Be04#"]
UpdateDivider=-1
Hidden=1

[Icono_Be05]
Group=Enlaces5 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 5\Be05.png
X=(59*#Escala#)
Y=(129*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Be05#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Be05#"]
UpdateDivider=-1
Hidden=1

[Icono_Be06]
Group=Enlaces5 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 5\Be06.png
X=(107*#Escala#)
Y=(129*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Be06#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Be06#"]
UpdateDivider=-1
Hidden=1

[Icono_Be07]
Group=Enlaces5 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 5\Be07.png
X=(155*#Escala#)
Y=(129*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Be07#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Be07#"]
UpdateDivider=-1
Hidden=1

[Icono_Be08]
Group=Enlaces5 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 5\Be08.png
X=(203*#Escala#)
Y=(129*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Be08#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Be08#"]
UpdateDivider=-1
Hidden=1

[Icono_Be09]
Group=Enlaces5 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 5\Be09.png
X=(59*#Escala#)
Y=(177*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Be09#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Be09#"]
UpdateDivider=-1
Hidden=1

[Icono_Be10]
Group=Enlaces5 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 5\Be10.png
X=(107*#Escala#)
Y=(177*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Be10#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Be10#"]
UpdateDivider=-1
Hidden=1

[Icono_Be11]
Group=Enlaces5 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 5\Be11.png
X=(155*#Escala#)
Y=(177*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Be11#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Be11#"]
UpdateDivider=-1
Hidden=1

[Icono_Be12]
Group=Enlaces5 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 5\Be12.png
X=(203*#Escala#)
Y=(177*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Be12#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Be12#"]
UpdateDivider=-1
Hidden=1

[Icono_Be13]
Group=Enlaces5 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 5\Be13.png
X=(59*#Escala#)
Y=(225*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Be13#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Be13#"]
UpdateDivider=-1
Hidden=1

[Icono_Be14]
Group=Enlaces5 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 5\Be14.png
X=(107*#Escala#)
Y=(225*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Be14#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Be14#"]
UpdateDivider=-1
Hidden=1

[Icono_Be15]
Group=Enlaces5 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 5\Be15.png
X=(155*#Escala#)
Y=(225*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Be15#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Be15#"]
UpdateDivider=-1
Hidden=1

[Icono_Be16]
Group=Enlaces5 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 5\Be16.png
X=(203*#Escala#)
Y=(225*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Be16#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Be16#"]
UpdateDivider=-1
Hidden=1

[Icono_Be17]
Group=Enlaces5 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 5\Be17.png
X=(59*#Escala#)
Y=(273*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Be17#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Be17#"]
UpdateDivider=-1
Hidden=1

[Icono_Be18]
Group=Enlaces5 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 5\Be18.png
X=(107*#Escala#)
Y=(273*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Be18#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Be18#"]
UpdateDivider=-1
Hidden=1

[Icono_Be19]
Group=Enlaces5 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 5\Be19.png
X=(155*#Escala#)
Y=(273*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Be19#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Be19#"]
UpdateDivider=-1
Hidden=1

[Icono_Be20]
Group=Enlaces5 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 5\Be20.png
X=(203*#Escala#)
Y=(273*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Be20#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Be20#"]
UpdateDivider=-1
Hidden=1

[Icono_Be21]
Group=Enlaces5 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 5\Be21.png
X=(59*#Escala#)
Y=(321*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Be21#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Be21#"]
UpdateDivider=-1
Hidden=1

[Icono_Be22]
Group=Enlaces5 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 5\Be22.png
X=(107*#Escala#)
Y=(321*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Be22#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Be22#"]
UpdateDivider=-1
Hidden=1

[Icono_Be23]
Group=Enlaces5 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 5\Be23.png
X=(155*#Escala#)
Y=(321*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Be23#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Be23#"]
UpdateDivider=-1
Hidden=1

[Icono_Be24]
Group=Enlaces5 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 5\Be24.png
X=(203*#Escala#)
Y=(321*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Be24#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Be24#"]
UpdateDivider=-1
Hidden=1

[Icono_Be25]
Group=Enlaces5 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 5\Be25.png
X=(59*#Escala#)
Y=(369*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Be25#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Be25#"]
UpdateDivider=-1
Hidden=1

[Icono_Be26]
Group=Enlaces5 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 5\Be26.png
X=(107*#Escala#)
Y=(369*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Be26#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Be26#"]
UpdateDivider=-1
Hidden=1

[Icono_Be27]
Group=Enlaces5 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 5\Be27.png
X=(155*#Escala#)
Y=(369*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Be27#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Be27#"]
UpdateDivider=-1
Hidden=1

[Icono_Be28]
Group=Enlaces5 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 5\Be28.png
X=(203*#Escala#)
Y=(369*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Be28#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Be28#"]
UpdateDivider=-1
Hidden=1

[Icono_Editar13]
Group=Enlaces6 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Suite\edit.png
ImageAlpha=164
X=(201*#Escala#)
Y=(428*#Escala#)
W=(14*#Escala#)
H=(14*#Escala#)
DynamicVariables=1
MouseOverAction=[!SetOption #CURRENTSECTION# ImageAlpha 255][!UpdateMeter #CURRENTSECTION#][!Redraw]
MouseLeaveAction=[!SetOption #CURRENTSECTION# ImageAlpha 164][!UpdateMeter #CURRENTSECTION#][!Redraw]
LeftMouseUpAction=[Play #@#Sounds\vibrador2.wav]["#@#Settings\Variables Bookmarks 6.inc"]
UpdateDivider=-1
Hidden=1

[Info_BO6]
Group=Enlaces6 | Pantalla
Meter=STRING
MeterStyle=ST-Texto_2
FontSize=(10*#Escala#)
X=(154*#Escala#)
Y=(58*#Escala#)
W=(200*#Escala#)
H=(20*#Escala#)
DynamicVariables=1
Text=#Marcadores# 6
UpdateDivider=-1
Hidden=1

[Icono_Bf01]
Group=Enlaces6 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 6\Bf01.png
X=(59*#Escala#)
Y=(81*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bf01#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bf01#"]
UpdateDivider=-1
Hidden=1

[Icono_Bf02]
Group=Enlaces6 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 6\Bf02.png
X=(107*#Escala#)
Y=(81*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bf02#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bf02#"]
UpdateDivider=-1
Hidden=1

[Icono_Bf03]
Group=Enlaces6 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 6\Bf03.png
X=(155*#Escala#)
Y=(81*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bf03#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bf03#"]
UpdateDivider=-1
Hidden=1

[Icono_Bf04]
Group=Enlaces6 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 6\Bf04.png
X=(203*#Escala#)
Y=(81*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bf04#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bf04#"]
UpdateDivider=-1
Hidden=1

[Icono_Bf05]
Group=Enlaces6 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 6\Bf05.png
X=(59*#Escala#)
Y=(129*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bf05#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bf05#"]
UpdateDivider=-1
Hidden=1

[Icono_Bf06]
Group=Enlaces6 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 6\Bf06.png
X=(107*#Escala#)
Y=(129*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bf06#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bf06#"]
UpdateDivider=-1
Hidden=1

[Icono_Bf07]
Group=Enlaces6 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 6\Bf07.png
X=(155*#Escala#)
Y=(129*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bf07#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bf07#"]
UpdateDivider=-1
Hidden=1

[Icono_Bf08]
Group=Enlaces6 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 6\Bf08.png
X=(203*#Escala#)
Y=(129*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bf08#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bf08#"]
UpdateDivider=-1
Hidden=1

[Icono_Bf09]
Group=Enlaces6 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 6\Bf09.png
X=(59*#Escala#)
Y=(177*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bf09#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bf09#"]
UpdateDivider=-1
Hidden=1

[Icono_Bf10]
Group=Enlaces6 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 6\Bf10.png
X=(107*#Escala#)
Y=(177*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bf10#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bf10#"]
UpdateDivider=-1
Hidden=1

[Icono_Bf11]
Group=Enlaces6 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 6\Bf11.png
X=(155*#Escala#)
Y=(177*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bf11#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bf11#"]
UpdateDivider=-1
Hidden=1

[Icono_Bf12]
Group=Enlaces6 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 6\Bf12.png
X=(203*#Escala#)
Y=(177*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bf12#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bf12#"]
UpdateDivider=-1
Hidden=1

[Icono_Bf13]
Group=Enlaces6 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 6\Bf13.png
X=(59*#Escala#)
Y=(225*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bf13#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bf13#"]
UpdateDivider=-1
Hidden=1

[Icono_Bf14]
Group=Enlaces6 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 6\Bf14.png
X=(107*#Escala#)
Y=(225*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bf14#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bf14#"]
UpdateDivider=-1
Hidden=1

[Icono_Bf15]
Group=Enlaces6 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 6\Bf15.png
X=(155*#Escala#)
Y=(225*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bf15#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bf15#"]
UpdateDivider=-1
Hidden=1

[Icono_Bf16]
Group=Enlaces6 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 6\Bf16.png
X=(203*#Escala#)
Y=(225*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bf16#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bf16#"]
UpdateDivider=-1
Hidden=1

[Icono_Bf17]
Group=Enlaces6 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 6\Bf17.png
X=(59*#Escala#)
Y=(273*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bf17#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bf17#"]
UpdateDivider=-1
Hidden=1

[Icono_Bf18]
Group=Enlaces6 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 6\Bf18.png
X=(107*#Escala#)
Y=(273*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bf18#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bf18#"]
UpdateDivider=-1
Hidden=1

[Icono_Bf19]
Group=Enlaces6 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 6\Bf19.png
X=(155*#Escala#)
Y=(273*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bf19#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bf19#"]
UpdateDivider=-1
Hidden=1

[Icono_Bf20]
Group=Enlaces6 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 6\Bf20.png
X=(203*#Escala#)
Y=(273*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bf20#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bf20#"]
UpdateDivider=-1
Hidden=1

[Icono_Bf21]
Group=Enlaces6 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 6\Bf21.png
X=(59*#Escala#)
Y=(321*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bf21#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bf21#"]
UpdateDivider=-1
Hidden=1

[Icono_Bf22]
Group=Enlaces6 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 6\Bf22.png
X=(107*#Escala#)
Y=(321*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bf22#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bf22#"]
UpdateDivider=-1
Hidden=1

[Icono_Bf23]
Group=Enlaces6 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 6\Bf23.png
X=(155*#Escala#)
Y=(321*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bf23#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bf23#"]
UpdateDivider=-1
Hidden=1

[Icono_Bf24]
Group=Enlaces6 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 6\Bf24.png
X=(203*#Escala#)
Y=(321*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bf24#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bf24#"]
UpdateDivider=-1
Hidden=1

[Icono_Bf25]
Group=Enlaces6 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 6\Bf25.png
X=(59*#Escala#)
Y=(369*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bf25#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bf25#"]
UpdateDivider=-1
Hidden=1

[Icono_Bf26]
Group=Enlaces6 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 6\Bf26.png
X=(107*#Escala#)
Y=(369*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bf26#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bf26#"]
UpdateDivider=-1
Hidden=1

[Icono_Bf27]
Group=Enlaces6 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 6\Bf27.png
X=(155*#Escala#)
Y=(369*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bf27#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bf27#"]
UpdateDivider=-1
Hidden=1

[Icono_Bf28]
Group=Enlaces6 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 6\Bf28.png
X=(203*#Escala#)
Y=(369*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bf28#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bf28#"]
UpdateDivider=-1
Hidden=1

[Icono_Editar14]
Group=Enlaces7 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Suite\edit.png
ImageAlpha=164
X=(201*#Escala#)
Y=(428*#Escala#)
W=(14*#Escala#)
H=(14*#Escala#)
DynamicVariables=1
MouseOverAction=[!SetOption #CURRENTSECTION# ImageAlpha 255][!UpdateMeter #CURRENTSECTION#][!Redraw]
MouseLeaveAction=[!SetOption #CURRENTSECTION# ImageAlpha 164][!UpdateMeter #CURRENTSECTION#][!Redraw]
LeftMouseUpAction=[Play #@#Sounds\vibrador2.wav]["#@#Settings\Variables Bookmarks 7.inc"]
UpdateDivider=-1
Hidden=1

[Info_BO7]
Group=Enlaces7 | Pantalla
Meter=STRING
MeterStyle=ST-Texto_2
FontSize=(10*#Escala#)
X=(154*#Escala#)
Y=(58*#Escala#)
W=(200*#Escala#)
H=(20*#Escala#)
DynamicVariables=1
Text=#Marcadores# 7
UpdateDivider=-1
Hidden=1

[Icono_Bg01]
Group=Enlaces7 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 7\Bg01.png
X=(59*#Escala#)
Y=(81*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bg01#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bg01#"]
UpdateDivider=-1
Hidden=1

[Icono_Bg02]
Group=Enlaces7 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 7\Bg02.png
X=(107*#Escala#)
Y=(81*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bg02#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bg02#"]
UpdateDivider=-1
Hidden=1

[Icono_Bg03]
Group=Enlaces7 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 7\Bg03.png
X=(155*#Escala#)
Y=(81*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bg03#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bg03#"]
UpdateDivider=-1
Hidden=1

[Icono_Bg04]
Group=Enlaces7 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 7\Bg04.png
X=(203*#Escala#)
Y=(81*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bg04#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bg04#"]
UpdateDivider=-1
Hidden=1

[Icono_Bg05]
Group=Enlaces7 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 7\Bg05.png
X=(59*#Escala#)
Y=(129*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bg05#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bg05#"]
UpdateDivider=-1
Hidden=1

[Icono_Bg06]
Group=Enlaces7 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 7\Bg06.png
X=(107*#Escala#)
Y=(129*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bg06#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bg06#"]
UpdateDivider=-1
Hidden=1

[Icono_Bg07]
Group=Enlaces7 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 7\Bg07.png
X=(155*#Escala#)
Y=(129*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bg07#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bg07#"]
UpdateDivider=-1
Hidden=1

[Icono_Bg08]
Group=Enlaces7 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 7\Bg08.png
X=(203*#Escala#)
Y=(129*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bg08#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bg08#"]
UpdateDivider=-1
Hidden=1

[Icono_Bg09]
Group=Enlaces7 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 7\Bg09.png
X=(59*#Escala#)
Y=(177*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bg09#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bg09#"]
UpdateDivider=-1
Hidden=1

[Icono_Bg10]
Group=Enlaces7 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 7\Bg10.png
X=(107*#Escala#)
Y=(177*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bg10#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bg10#"]
UpdateDivider=-1
Hidden=1

[Icono_Bg11]
Group=Enlaces7 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 7\Bg11.png
X=(155*#Escala#)
Y=(177*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bg11#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bg11#"]
UpdateDivider=-1
Hidden=1

[Icono_Bg12]
Group=Enlaces7 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 7\Bg12.png
X=(203*#Escala#)
Y=(177*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bg12#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bg12#"]
UpdateDivider=-1
Hidden=1

[Icono_Bg13]
Group=Enlaces7 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 7\Bg13.png
X=(59*#Escala#)
Y=(225*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bg13#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bg13#"]
UpdateDivider=-1
Hidden=1

[Icono_Bg14]
Group=Enlaces7 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 7\Bg14.png
X=(107*#Escala#)
Y=(225*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bg14#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bg14#"]
UpdateDivider=-1
Hidden=1

[Icono_Bg15]
Group=Enlaces7 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 7\Bg15.png
X=(155*#Escala#)
Y=(225*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bg15#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bg15#"]
UpdateDivider=-1
Hidden=1

[Icono_Bg16]
Group=Enlaces7 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 7\Bg16.png
X=(203*#Escala#)
Y=(225*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bg16#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bg16#"]
UpdateDivider=-1
Hidden=1

[Icono_Bg17]
Group=Enlaces7 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 7\Bg17.png
X=(59*#Escala#)
Y=(273*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bg17#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bg17#"]
UpdateDivider=-1
Hidden=1

[Icono_Bg18]
Group=Enlaces7 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 7\Bg18.png
X=(107*#Escala#)
Y=(273*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bg18#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bg18#"]
UpdateDivider=-1
Hidden=1

[Icono_Bg19]
Group=Enlaces7 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 7\Bg19.png
X=(155*#Escala#)
Y=(273*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bg19#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bg19#"]
UpdateDivider=-1
Hidden=1

[Icono_Bg20]
Group=Enlaces7 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 7\Bg20.png
X=(203*#Escala#)
Y=(273*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bg20#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bg20#"]
UpdateDivider=-1
Hidden=1

[Icono_Bg21]
Group=Enlaces7 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 7\Bg21.png
X=(59*#Escala#)
Y=(321*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bg21#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bg21#"]
UpdateDivider=-1
Hidden=1

[Icono_Bg22]
Group=Enlaces7 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 7\Bg22.png
X=(107*#Escala#)
Y=(321*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bg22#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bg22#"]
UpdateDivider=-1
Hidden=1

[Icono_Bg23]
Group=Enlaces7 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 7\Bg23.png
X=(155*#Escala#)
Y=(321*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bg23#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bg23#"]
UpdateDivider=-1
Hidden=1

[Icono_Bg24]
Group=Enlaces7 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 7\Bg24.png
X=(203*#Escala#)
Y=(321*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bg24#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bg24#"]
UpdateDivider=-1
Hidden=1

[Icono_Bg25]
Group=Enlaces7 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 7\Bg25.png
X=(59*#Escala#)
Y=(369*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bg25#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bg25#"]
UpdateDivider=-1
Hidden=1

[Icono_Bg26]
Group=Enlaces7 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 7\Bg26.png
X=(107*#Escala#)
Y=(369*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bg26#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bg26#"]
UpdateDivider=-1
Hidden=1

[Icono_Bg27]
Group=Enlaces7 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 7\Bg27.png
X=(155*#Escala#)
Y=(369*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bg27#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bg27#"]
UpdateDivider=-1
Hidden=1

[Icono_Bg28]
Group=Enlaces7 | Pantalla
Meter=IMAGE
ImageName=#@#Images\Bookmarks 7\Bg28.png
X=(203*#Escala#)
Y=(369*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
ToolTipText=#Bg28#
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#Bg28#"]
UpdateDivider=-1
Hidden=1

; © 2019 by HiTBiT-PA
