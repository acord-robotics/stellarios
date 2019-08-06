[mHora]
Measure=Time
Format=%H:%M

[mFecha]
Measure=Time
Format=Locale-Date

[mBateria]
Measure=Plugin
PlugIn=PowerPlugin
PowerState=PERCENT
UpdateDivider=10

[mBateriaEstado]
Measure=Calc
Formula=mBateria
IfCondition=mBateria <25
IfTrueAction=[!SetOption Icono_Bateria ImageName "#@#Images\Suite\battery0.png"]
IfCondition2=(mBateria >25) && (mBateria <50)
IfTrueAction2=[!SetOption Icono_Bateria ImageName "#@#Images\Suite\battery1.png"]
IfCondition3=(mBateria >50) && (mBateria <75)
IfTrueAction3=[!SetOption Icono_Bateria ImageName "#@#Images\Suite\battery2.png"]
IfCondition4=(mBateria >75) && (mBateria <90)
IfTrueAction4=[!SetOption Icono_Bateria ImageName "#@#Images\Suite\battery3.png"]
IfCondition5=(mBateria >90) && (mBateria <101)
IfTrueAction5=[!SetOption Icono_Bateria ImageName "#@#Images\Suite\battery4.png"]
DynamicVariables=1

[mEnergia]
Measure=Plugin
Plugin=PowerPlugin
PowerState=ACLINE
UpdateDivider=10 

[CalcEnergia]
Measure=Calc
Formula=mEnergia
DynamicVariables=1
IfCondition=mEnergia =1
IfTrueAction=!ShowMeter Icono_Cable
IfFalseAction=!HideMeter Icono_Cable
UpdateDivider=10

[mLan]
Measure=Plugin
Plugin=SysInfo
SysInfoType=LAN_CONNECTIVITY
DynamicVariables=1
IfCondition=mLan= -1
IfTrueAction=!HideMeter Icono_Lan
IfFalseAction=!ShowMeter Icono_Lan
UpdateDivider=10

[mWifi]
Measure=Plugin
Plugin=WifiStatus
WifiInfoType=QUALITY
WifiIntfID=0
UpdateDivider=10

[mWifiEstado]
Measure=Calc
Formula=mWifi
IfCondition=mWifi <1
IfTrueAction=[!SetOption Icono_Wifi ImageName "#@#Images\Suite\wifi0.png"]
IfCondition2=(mWifi >1) && (mWifi <40)
IfTrueAction2=[!SetOption Icono_Wifi ImageName "#@#Images\Suite\wifi1.png"]
IfCondition3=(mWifi >40) && (mWifi <80)
IfTrueAction3=[!SetOption Icono_Wifi ImageName "#@#Images\Suite\wifi2.png"]
IfCondition4=(mWifi >80) && (mWifi <100)
IfTrueAction4=[!SetOption Icono_Wifi ImageName "#@#Images\Suite\wifi3.png"]
DynamicVariables=1
