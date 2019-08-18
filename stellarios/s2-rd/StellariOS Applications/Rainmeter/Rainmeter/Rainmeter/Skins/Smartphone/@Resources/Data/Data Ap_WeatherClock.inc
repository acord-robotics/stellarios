[Metadata]
Name=Smartphone
Version=1.0
Information=App Weather Clock
Author=HiTBiT-PA
License=Creative Commons Attribution-Non-commercial-Share Alike 3.0
Website=http://hitbit-pa.deviantart.com/

[Variables]
@include=#@#Languages\Lang WeatherClock_#Idioma#.inc
@include2=#@#Measures\mClock_#Idioma#.inc
@include3=#@#Measures\Measures Dock.inc

[Mascara]
Group=Ap_WeatherClock | Pantalla
Meter=SHAPE
Shape=Rectangle (47*#Escala#),(26*#Escala#),(212*#Escala#),(392*#Escala#),(14*#Escala#),(14*#Escala#) | Fill Color 24,24,24,255 | Stroke Color 0,0,0,0
DynamicVariables=1
UpdateDivider=-1

[Sin_Conexion]
Group=Ap_WeatherClock | Pantalla
Meter=IMAGE
SolidColor=16,16,16,255
Container=Mascara
X=(47*#Escala#)
Y=(26*#Escala#)
W=(213*#Escala#)
H=(392*#Escala#)
DynamicVariables=1
UpdateDivider=-1

[FotoActual]
Group=Ap_WeatherClock | Pantalla
MeasureName=mIcono_00
Meter=IMAGE
ImagePath=#@#Images\MyWeather\Pics
ImageAlpha=212
Container=Mascara
X=(47*#Escala#)
Y=(26*#Escala#)
W=(213*#Escala#)
H=(393*#Escala#)
DynamicVariables=1

[Cristal]
Meter=IMAGE
ImageName=#@#Images\Suite\glass.png
X=(43*#Escala#)
Y=(5*#Escala#)
W=(222*#Escala#)
H=(446*#Escala#)
DynamicVariables=1
UpdateDivider=-1

[Icono_00]
Group=Ap_WeatherClock | Pantalla
MeasureName=mIcono_00
Meter=IMAGE
ImagePath=#@#Images\MyWeather\Icons
X=(#X1#*#Escala#)
Y=(#Y1#*#Escala#)
W=(40*#Escala#)
H=(27*#Escala#)
DynamicVariables=1

[Icono_01]
Group=Ap_WeatherClock | Pantalla
MeasureName=mIcono_01
Meter=IMAGE
ImagePath=#@#Images\MyWeather\Icons
X=(#X2#*#Escala#)
Y=(#Y2#*#Escala#)
W=(40*#Escala#)
H=(27*#Escala#)
DynamicVariables=1

[Icono_02]
Group=Ap_WeatherClock | Pantalla
MeasureName=mIcono_02
Meter=IMAGE
ImagePath=#@#Images\MyWeather\Icons
X=(#X3#*#Escala#)
Y=(#Y3#*#Escala#)
W=(40*#Escala#)
H=(27*#Escala#)
DynamicVariables=1

[Icono_03]
Group=Ap_WeatherClock | Pantalla
MeasureName=mIcono_03
Meter=IMAGE
ImagePath=#@#Images\MyWeather\Icons
X=(#X4#*#Escala#)
Y=(#Y4#*#Escala#)
W=(40*#Escala#)
H=(27*#Escala#)
DynamicVariables=1

[Icono_04]
Group=Ap_WeatherClock | Pantalla
MeasureName=mIcono_04
Meter=IMAGE
ImagePath=#@#Images\MyWeather\Icons
X=(#X5#*#Escala#)
Y=(#Y5#*#Escala#)
W=(40*#Escala#)
H=(27*#Escala#)
DynamicVariables=1

[Icono_05]
Group=Ap_WeatherClock | Pantalla
MeasureName=mIcono_05
Meter=IMAGE
ImagePath=#@#Images\MyWeather\Icons
X=(#X6#*#Escala#)
Y=(#Y6#*#Escala#)
W=(40*#Escala#)
H=(27*#Escala#)
DynamicVariables=1

[Icono_06]
Group=Ap_WeatherClock | Pantalla
MeasureName=mIcono_06
Meter=IMAGE
ImagePath=#@#Images\MyWeather\Icons
X=(#X7#*#Escala#)
Y=(#Y7#*#Escala#)
W=(40*#Escala#)
H=(27*#Escala#)
DynamicVariables=1

[Icono_07]
Group=Ap_WeatherClock | Pantalla
MeasureName=mIcono_07
Meter=IMAGE
ImagePath=#@#Images\MyWeather\Icons
X=(#X8#*#Escala#)
Y=(#Y8#*#Escala#)
W=(40*#Escala#)
H=(27*#Escala#)
DynamicVariables=1

[Icono_08]
Group=Ap_WeatherClock | Pantalla
MeasureName=mIcono_08
Meter=IMAGE
ImagePath=#@#Images\MyWeather\Icons
X=(#X9#*#Escala#)
Y=(#Y9#*#Escala#)
W=(40*#Escala#)
H=(27*#Escala#)
DynamicVariables=1

[Icono_09]
Group=Ap_WeatherClock | Pantalla
MeasureName=mIcono_09
Meter=IMAGE
ImagePath=#@#Images\MyWeather\Icons
X=(#X10#*#Escala#)
Y=(#Y10#*#Escala#)
W=(40*#Escala#)
H=(27*#Escala#)
DynamicVariables=1

[Icono_10]
Group=Ap_WeatherClock | Pantalla
MeasureName=mIcono_10
Meter=IMAGE
ImagePath=#@#Images\MyWeather\Icons
X=(#X11#*#Escala#)
Y=(#Y11#*#Escala#)
W=(40*#Escala#)
H=(27*#Escala#)
DynamicVariables=1

[Icono_11]
Group=Ap_WeatherClock | Pantalla
MeasureName=mIcono_11
Meter=IMAGE
ImagePath=#@#Images\MyWeather\Icons
X=(#X12#*#Escala#)
Y=(#Y12#*#Escala#)
W=(40*#Escala#)
H=(27*#Escala#)
DynamicVariables=1

[Temperatura_00]
Group=Ap_WeatherClock | Pantalla
MeasureName=mTemperatura_00
Meter=STRING
MeterStyle=ST-Texto_1
FontSize=(8*#Escala#)
X=(#TX1#*#Escala#)
Y=(#TY1#*#Escala#)
W=(26*#Escala#)
H=(13*#Escala#)
Text=%1°

[Temperatura_01]
Group=Ap_WeatherClock | Pantalla
MeasureName=mTemperatura_01
Meter=STRING
MeterStyle=ST-Texto_1
FontSize=(8*#Escala#)
X=(#TX2#*#Escala#)
Y=(#TY2#*#Escala#)
W=(26*#Escala#)
H=(13*#Escala#)
Text=%1°

[Temperatura_02]
Group=Ap_WeatherClock | Pantalla
MeasureName=mTemperatura_02
Meter=STRING
MeterStyle=ST-Texto_1
FontSize=(8*#Escala#)
X=(#TX3#*#Escala#)
Y=(#TY3#*#Escala#)
W=(26*#Escala#)
H=(13*#Escala#)
Text=%1°

[Temperatura_03]
Group=Ap_WeatherClock | Pantalla
MeasureName=mTemperatura_03
Meter=STRING
MeterStyle=ST-Texto_1
FontSize=(8*#Escala#)
X=(#TX4#*#Escala#)
Y=(#TY4#*#Escala#)
W=(26*#Escala#)
H=(13*#Escala#)
Text=%1°

[Temperatura_04]
Group=Ap_WeatherClock | Pantalla
MeasureName=mTemperatura_04
Meter=STRING
MeterStyle=ST-Texto_1
FontSize=(8*#Escala#)
X=(#TX5#*#Escala#)
Y=(#TY5#*#Escala#)
W=(26*#Escala#)
H=(13*#Escala#)
Text=%1°

[Temperatura_05]
Group=Ap_WeatherClock | Pantalla
MeasureName=mTemperatura_05
Meter=STRING
MeterStyle=ST-Texto_1
FontSize=(8*#Escala#)
X=(#TX6#*#Escala#)
Y=(#TY6#*#Escala#)
W=(26*#Escala#)
H=(13*#Escala#)
Text=%1°

[Temperatura_06]
Group=Ap_WeatherClock | Pantalla
MeasureName=mTemperatura_06
Meter=STRING
MeterStyle=ST-Texto_1
FontSize=(8*#Escala#)
X=(#TX7#*#Escala#)
Y=(#TY7#*#Escala#)
W=(26*#Escala#)
H=(13*#Escala#)
Text=%1°

[Temperatura_07]
Group=Ap_WeatherClock | Pantalla
MeasureName=mTemperatura_07
Meter=STRING
MeterStyle=ST-Texto_1
FontSize=(8*#Escala#)
X=(#TX8#*#Escala#)
Y=(#TY8#*#Escala#)
W=(26*#Escala#)
H=(13*#Escala#)
Text=%1°

[Temperatura_08]
Group=Ap_WeatherClock | Pantalla
MeasureName=mTemperatura_08
Meter=STRING
MeterStyle=ST-Texto_1
FontSize=(8*#Escala#)
X=(#TX9#*#Escala#)
Y=(#TY9#*#Escala#)
W=(26*#Escala#)
H=(13*#Escala#)
Text=%1°

[Temperatura_09]
Group=Ap_WeatherClock | Pantalla
MeasureName=mTemperatura_09
Meter=STRING
MeterStyle=ST-Texto_1
FontSize=(8*#Escala#)
X=(#TX10#*#Escala#)
Y=(#TY10#*#Escala#)
W=(26*#Escala#)
H=(13*#Escala#)
Text=%1°

[Temperatura_10]
Group=Ap_WeatherClock | Pantalla
MeasureName=mTemperatura_10
Meter=STRING
MeterStyle=ST-Texto_1
FontSize=(8*#Escala#)
X=(#TX11#*#Escala#)
Y=(#TY11#*#Escala#)
W=(26*#Escala#)
H=(13*#Escala#)
Text=%1°

[Temperatura_11]
Group=Ap_WeatherClock | Pantalla
MeasureName=mTemperatura_11
Meter=STRING
MeterStyle=ST-Texto_1
FontSize=(8*#Escala#)
X=(#TX12#*#Escala#)
Y=(#TY12#*#Escala#)
W=(26*#Escala#)
H=(13*#Escala#)
Text=%1°

[Icono_Ubicacion]
Group=Ap_WeatherClock | Pantalla
Meter=IMAGE
ImageName=#@#Images\MyWeather\ic_location.png
X=(65*#Escala#)
Y=(239*#Escala#)
W=(12*#Escala#)
H=(12*#Escala#)
DynamicVariables=1
UpdateDivider=-1

[Ciudad]
Group=Ap_WeatherClock | Pantalla
MeasureName=mCiudad
Meter=STRING
MeterStyle=ST-Texto_2
StringAlign=Left
StringCase=Upper
FontSize=(9*#Escala#)
X=(80*#Escala#)
Y=(237*#Escala#)
W=(165*#Escala#)
H=(18*#Escala#)

[Condiciones]
Group=Ap_WeatherClock | Pantalla
MeasureName=mCondiciones_00
Meter=STRING
MeterStyle=ST-Texto_2
StringAlign=CenterCenter
FontSize=(9*#Escala#)
X=(154*#Escala#)
Y=(267*#Escala#)
W=(200*#Escala#)
H=(35*#Escala#)

[Icono_Presion]
Group=Ap_WeatherClock | Pantalla
Meter=IMAGE
ImageName=#@#Images\MyWeather\ic_pressure.png
X=(63*#Escala#)
Y=(288*#Escala#)
W=(16*#Escala#)
H=(16*#Escala#)
DynamicVariables=1
UpdateDivider=-1

[Presion]
Group=Ap_WeatherClock | Pantalla
MeasureName=mPresion_00
Meter=STRING
MeterStyle=ST-Texto_1
StringAlign=Left
FontSize=(8*#Escala#)
X=(82*#Escala#)
Y=(290*#Escala#)
W=(70*#Escala#)
H=(14*#Escala#)
Text=%1 mb

[Icono_Humedad]
Group=Ap_WeatherClock | Pantalla
Meter=IMAGE
ImageName=#@#Images\MyWeather\ic_humidity.png
X=(153*#Escala#)
Y=(288*#Escala#)
W=(16*#Escala#)
H=(16*#Escala#)
DynamicVariables=1
UpdateDivider=-1

[Humedad]
Group=Ap_WeatherClock | Pantalla
MeasureName=mHumedad_00
Meter=STRING
MeterStyle=ST-Texto_1
StringAlign=Left
FontSize=(8*#Escala#)
X=(172*#Escala#)
Y=(290*#Escala#)
W=(50*#Escala#)
H=(14*#Escala#)
Text=%1 %

[Icono_Viento]
Group=Ap_WeatherClock | Pantalla
Meter=IMAGE
ImageName=#@#Images\MyWeather\ic_wind.png
X=(100*#Escala#)
Y=(307*#Escala#)
W=(16*#Escala#)
H=(16*#Escala#)
DynamicVariables=1
UpdateDivider=-1

[Viento]
Group=Ap_WeatherClock | Pantalla
MeasureName=mViento_00
MeasureName2=mViento_Dir_00
Meter=STRING
MeterStyle=ST-Texto_1
StringAlign=Left
FontSize=(8*#Escala#)
X=(120*#Escala#)
Y=(309*#Escala#)
W=(130*#Escala#)
H=(14*#Escala#)
Text=%1 km/h %2

[Icono_Hoy]
Group=Ap_WeatherClock | Pantalla
MeasureName=mIconoDia_0
Meter=IMAGE
ImagePath=#@#Images\MyWeather\Icons
X=(56*#Escala#)
Y=(330*#Escala#)
W=(39*#Escala#)
H=(27*#Escala#)
DynamicVariables=1

[IconoDia_1]
Group=Ap_WeatherClock | Pantalla
MeasureName=mIconoDia_1
Meter=IMAGE
ImagePath=#@#Images\MyWeather\Icons
X=(95*#Escala#)
Y=(330*#Escala#)
W=(39*#Escala#)
H=(27*#Escala#)
DynamicVariables=1

[IconoDia_2]
Group=Ap_WeatherClock | Pantalla
MeasureName=mIconoDia_2
Meter=IMAGE
ImagePath=#@#Images\MyWeather\Icons
X=(134*#Escala#)
Y=(330*#Escala#)
W=(39*#Escala#)
H=(27*#Escala#)
DynamicVariables=1

[IconoDia_3]
Group=Ap_WeatherClock | Pantalla
MeasureName=mIconoDia_3
Meter=IMAGE
ImagePath=#@#Images\MyWeather\Icons
X=(173*#Escala#)
Y=(330*#Escala#)
W=(39*#Escala#)
H=(27*#Escala#)
DynamicVariables=1

[IconoDia_4]
Group=Ap_WeatherClock | Pantalla
MeasureName=mIconoDia_4
Meter=IMAGE
ImagePath=#@#Images\MyWeather\Icons
X=(212*#Escala#)
Y=(330*#Escala#)
W=(39*#Escala#)
H=(27*#Escala#)
DynamicVariables=1

[Dia_Hoy]
Group=Ap_WeatherClock | Pantalla
MeasureName=mFecha_0
Meter=STRING
MeterStyle=ST-Texto_2
FontSize=(9*#Escala#)
X=(76*#Escala#)
Y=(360*#Escala#)
W=(39*#Escala#)
H=(18*#Escala#)

[Dia_1]
Group=Ap_WeatherClock | Pantalla
MeasureName=mFecha_1
Meter=STRING
MeterStyle=ST-Texto_2
FontSize=(9*#Escala#)
X=(115*#Escala#)
Y=(360*#Escala#)
W=(39*#Escala#)
H=(18*#Escala#)

[Dia_2]
Group=Ap_WeatherClock | Pantalla
MeasureName=mFecha_2
Meter=STRING
MeterStyle=ST-Texto_2
FontSize=(9*#Escala#)
X=(154*#Escala#)
Y=(360*#Escala#)
W=(39*#Escala#)
H=(18*#Escala#)

[Dia_3]
Group=Ap_WeatherClock | Pantalla
MeasureName=mFecha_3
Meter=STRING
MeterStyle=ST-Texto_2
FontSize=(9*#Escala#)
X=(193*#Escala#)
Y=(360*#Escala#)
W=(39*#Escala#)
H=(18*#Escala#)

[Dia_4]
Group=Ap_WeatherClock | Pantalla
MeasureName=mFecha_4
Meter=STRING
MeterStyle=ST-Texto_2
FontSize=(9*#Escala#)
X=(232*#Escala#)
Y=(360*#Escala#)
W=(39*#Escala#)
H=(18*#Escala#)

[Dia_TempHoy]
Group=Ap_WeatherClock | Pantalla
MeasureName=mTempMax_0
MeasureName2=mTempMin_0
Meter=STRING
MeterStyle=ST-Texto_1
FontSize=(9*#Escala#)
X=(76*#Escala#)
Y=(375*#Escala#)
W=(39*#Escala#)
H=(38*#Escala#)
Text=%1°#CRLF#%2°

[Dia_Temp1]
Group=Ap_WeatherClock | Pantalla
MeasureName=mTempMax_1
MeasureName2=mTempMin_1
Meter=STRING
MeterStyle=ST-Texto_1
FontSize=(9*#Escala#)
X=(115*#Escala#)
Y=(375*#Escala#)
W=(39*#Escala#)
H=(38*#Escala#)
Text=%1°#CRLF#%2°

[Dia_Temp2]
Group=Ap_WeatherClock | Pantalla
MeasureName=mTempMax_2
MeasureName2=mTempMin_2
Meter=STRING
MeterStyle=ST-Texto_1
FontSize=(9*#Escala#)
X=(154*#Escala#)
Y=(375*#Escala#)
W=(39*#Escala#)
H=(38*#Escala#)
Text=%1°#CRLF#%2°

[Dia_Temp3]
Group=Ap_WeatherClock | Pantalla
MeasureName=mTempMax_3
MeasureName2=mTempMin_3
Meter=STRING
MeterStyle=ST-Texto_1
FontSize=(9*#Escala#)
X=(193*#Escala#)
Y=(375*#Escala#)
W=(39*#Escala#)
H=(38*#Escala#)
Text=%1°#CRLF#%2°

[Dia_Temp4]
Group=Ap_WeatherClock | Pantalla
MeasureName=mTempMax_4
MeasureName2=mTempMin_4
Meter=STRING
MeterStyle=ST-Texto_1
FontSize=(9*#Escala#)
X=(232*#Escala#)
Y=(375*#Escala#)
W=(39*#Escala#)
H=(38*#Escala#)
Text=%1°#CRLF#%2°

[Reloj]
Group=Ap_WeatherClock | Pantalla
Meter=IMAGE
ImageName=#@#Images\MyWeather\clock.png
X=(118*#Escala#)
Y=(113*#Escala#)
W=(65*#Escala#)
H=(65*#Escala#)
DynamicVariables=1
UpdateDivider=-1

[Horas]
Group=Ap_WeatherClock | Pantalla
MeasureName=mReloj
Meter=ROUNDLINE
X=(108*#Escala#)
Y=(103*#Escala#)
W=(85*#Escala#)
H=(85*#Escala#)
StartAngle=4.7124
RotationAngle=6.2832
LineLength=(17*#Escala#)
LineColor=255,255,255,255
LineWidth=(4*#Escala#)
ValueRemainder=43200
DynamicVariables=1
AntiAlias=1

[Minutos]
Group=Ap_WeatherClock | Pantalla
MeasureName=mReloj
Meter=ROUNDLINE
X=(108*#Escala#)
Y=(103*#Escala#)
W=(85*#Escala#)
H=(85*#Escala#)
StartAngle=4.7124
RotationAngle=6.2832
LineLength=(28*#Escala#)
LineColor=255,255,255,255
LineWidth=(3*#Escala#)
ValueRemainder=3600
DynamicVariables=1
AntiAlias=1

[Segundos]
Group=Ap_WeatherClock | Pantalla
MeasureName=mReloj
Meter=ROUNDLINE
X=(108*#Escala#)
Y=(103*#Escala#)
W=(85*#Escala#)
H=(85*#Escala#)
StartAngle=4.7124
RotationAngle=6.2832
LineLength=(32*#Escala#)
LineColor=255,32,0,255
LineWidth=(1*#Escala#)
ValueRemainder=60
DynamicVariables=1
AntiAlias=1

[Icono_AtrasOff]
Meter=IMAGE
ImageName=#@#Images\Suite\back.png
ImageAlpha=32
X=(91*#Escala#)
Y=(428*#Escala#)
W=(16*#Escala#)
H=(16*#Escala#)
DynamicVariables=1
UpdateDivider=-1

[Icono_AtrasOn]
Meter=IMAGE
ImageName=#@#Images\Suite\back.png
ImageAlpha=164
X=(91*#Escala#)
Y=(428*#Escala#)
W=(16*#Escala#)
H=(16*#Escala#)
MouseOverAction=[!SetOption #CURRENTSECTION# ImageAlpha 255][!UpdateMeter #CURRENTSECTION#][!Redraw]
MouseLeaveAction=[!SetOption #CURRENTSECTION# ImageAlpha 164][!UpdateMeter #CURRENTSECTION#][!Redraw]
LeftMouseUpAction=[Play #@#Sounds\vibrador2.wav][!HideMeter Icono_AtrasOn][!ShowMeter Icono_AtrasOff][!HideMeterGroup Pantalla][!ShowMeterGroup Menu][!Redraw]
DynamicVariables=1
UpdateDivider=-1
Hidden=1

[Icono_MenuOff]
Meter=IMAGE
ImageName=#@#Images\Suite\menuOff.png
ImageAlpha=164
X=(146*#Escala#)
Y=(428*#Escala#)
W=(16*#Escala#)
H=(16*#Escala#)
MouseOverAction=[!SetOption #CURRENTSECTION# ImageAlpha 255][!UpdateMeter #CURRENTSECTION#][!Redraw]
MouseLeaveAction=[!SetOption #CURRENTSECTION# ImageAlpha 164][!UpdateMeter #CURRENTSECTION#][!Redraw]
LeftMouseUpAction=[Play #@#Sounds\vibrador2.wav][!HideMeter Icono_MenuOff][!ShowMeter Icono_MenuOn][!HideMeter Icono_AtrasOn][!ShowMeter Icono_AtrasOff][!HideMeterGroup Pantalla][!ShowMeterGroup Menu][!Redraw]
DynamicVariables=1
UpdateDivider=-1

[Icono_MenuOn]
Meter=IMAGE
ImageName=#@#Images\Suite\menuOn.png
ImageAlpha=164
X=(146*#Escala#)
Y=(428*#Escala#)
W=(16*#Escala#)
H=(16*#Escala#)
MouseOverAction=[!SetOption #CURRENTSECTION# ImageAlpha 255][!UpdateMeter #CURRENTSECTION#][!Redraw]
MouseLeaveAction=[!SetOption #CURRENTSECTION# ImageAlpha 164][!UpdateMeter #CURRENTSECTION#][!Redraw]
LeftMouseUpAction=[Play #@#Sounds\vibrador2.wav][!HideMeter Icono_MenuOn][!ShowMeter Icono_MenuOff][!HideMeter Icono_AtrasOn][!ShowMeter Icono_AtrasOff][!HideMeterGroup Pantalla][!ShowMeterGroup #AppSmp#][!Redraw]
DynamicVariables=1
UpdateDivider=-1
Hidden=1

[Icono_Ajustes]
Group=AP_WeatherClock | Pantalla
Meter=IMAGE
ImageName=#@#Images\Suite\settings.png
ImageAlpha=164
X=(201*#Escala#)
Y=(429*#Escala#)
W=(14*#Escala#)
H=(14*#Escala#)
MouseOverAction=[!SetOption #CURRENTSECTION# ImageAlpha 255][!UpdateMeter #CURRENTSECTION#][!Redraw]
MouseLeaveAction=[!SetOption #CURRENTSECTION# ImageAlpha 164][!UpdateMeter #CURRENTSECTION#][!Redraw]
LeftMouseUpAction=[Play #@#Sounds\vibrador1.wav][!ActivateConfig "Smartphone\" "Settings.ini]
DynamicVariables=1
UpdateDivider=-1

[Icono_Bateria]
Meter=IMAGE
ImageName=[mEnergiaEstado]
X=(60*#Escala#)
Y=(31*#Escala#)
W=(7*#Escala#)
H=(14*#Escala#)
DynamicVariables=1

[Icono_Cable]
Meter=IMAGE
ImageName=#@#Images\Suite\cable.png
X=(70*#Escala#)
Y=(31*#Escala#)
W=(10*#Escala#)
H=(14*#Escala#)
DynamicVariables=1
Hidden=1

[Icono_Wifi]
Meter=IMAGE
ImageName=[mWifiEstado]
X=(83*#Escala#)
Y=(31*#Escala#)
W=(18*#Escala#)
H=(14*#Escala#)
DynamicVariables=1

[Icono_Lan]
Meter=IMAGE
ImageName=#@#Images\Suite\lan.png
X=(102*#Escala#)
Y=(31*#Escala#)
W=(14*#Escala#)
H=(14*#Escala#)
DynamicVariables=1
Hidden=1

[Fecha]
MeasureName=mFecha
Meter=STRING
MeterStyle=ST-Texto_1
FontSize=(14*#Escala#)
X=(190*#Escala#)
Y=(25*#Escala#)
W=(100*#Escala#)
H=(22*#Escala#)
DynamicVariables=1

; © 2019 by HiTBiT-PA
