[Metadata]
Name=Smartphone
Version=1.0
Information=App My Weather
Author=HiTBiT-PA
License=Creative Commons Attribution-Non-commercial-Share Alike 3.0
Website=http://hitbit-pa.deviantart.com/

[Variables]
@include=#@#Languages\Lang MyWeather_#Idioma#.inc
@include2=#@#Measures\mClock_#Idioma#.inc
@include3=#@#Measures\Measures Dock.inc
Hablado=#Voz01# [mHoraHablada]. #Voz02# [mTemperatura] #Voz03#, #Voz04# [mCondiciones]. #Voz05# [mPresion] #Voz06# [mHumedad] %, #Voz07# [mVientoVoz] [mMedidaVientoVoz] #Voz08# [mVientoDirVoz]. #Voz09# [mDiaLluvia] %. #Voz10# [mNocheCondiciones] #Voz11# [mTempMin] #Voz03#.

[Mascara]
Group=Ap_MyWeather | Pantalla
Meter=SHAPE
Shape=Rectangle (47*#Escala#),(26*#Escala#),(212*#Escala#),(392*#Escala#),(14*#Escala#),(14*#Escala#) | Fill Color 24,24,24,255 | Stroke Color 0,0,0,0
DynamicVariables=1
UpdateDivider=-1

[Sin_Conexion]
Group=Ap_MyWeather | Pantalla
Meter=IMAGE
SolidColor=16,16,16,255
Container=Mascara
X=(47*#Escala#)
Y=(26*#Escala#)
W=(213*#Escala#)
H=(393*#Escala#)
DynamicVariables=1
UpdateDivider=-1

[FotoActual]
Group=Ap_MyWeather | Pantalla
MeasureName=mIcono
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

[Icono_Ubicacion]
Group=Ap_MyWeather | Pantalla
Meter=IMAGE
ImageName=#@#Images\MyWeather\ic_location.png
X=(65*#Escala#)
Y=(59*#Escala#)
W=(12*#Escala#)
H=(12*#Escala#)
DynamicVariables=1
UpdateDivider=-1

[Ciudad]
Group=Ap_MyWeather | Pantalla
MeasureName=mCiudad
Meter=STRING
MeterStyle=ST-Texto_2
StringAlign=Left
StringCase=Upper
FontSize=(8*#Escala#)
X=(80*#Escala#)
Y=(58*#Escala#)
W=(180*#Escala#)
H=(18*#Escala#)
UpdateDivider=-1

[Temperatura]
Group=Ap_MyWeather | Pantalla
MeasureName=mTemperatura
Meter=STRING
MeterStyle=ST-Texto_1
StringAlign=Left
FontSize=(40*#Escala#)
X=(57*#Escala#)
Y=(60*#Escala#)
W=(120*#Escala#)
H=(64*#Escala#)
Text=%1°

[IconoActual]
Group=Ap_MyWeather | Pantalla
MeasureName=mIcono
Meter=IMAGE
ImagePath=#@#Images\MyWeather\Icons
X=(188*#Escala#)
Y=(60*#Escala#)
W=(60*#Escala#)
H=(41*#Escala#)
DynamicVariables=1

[DiaTemp]
Group=Ap_MyWeather | Pantalla
MeasureName=mTempMin
MeasureName2=mTempMax
Meter=STRING
MeterStyle=ST-Texto_1
FontSize=(9*#Escala#)
X=(218*#Escala#)
Y=(99*#Escala#)
W=(60*#Escala#)
H=(16*#Escala#)
Text=%1°/ %2°

[Icono_SensacionT]
Group=Ap_MyWeather | Pantalla
Meter=IMAGE
ImageName=#@#Images\MyWeather\ic_feelslike.png
X=(59*#Escala#)
Y=(126*#Escala#)
W=(16*#Escala#)
H=(16*#Escala#)
DynamicVariables=1
UpdateDivider=-1

[Sensacion_Termica]
Group=Ap_MyWeather | Pantalla
MeasureName=mSensacionT
Meter=STRING
MeterStyle=ST-Texto_1
StringAlign=Left
FontSize=(9*#Escala#)
X=(78*#Escala#)
Y=(125*#Escala#)
W=(70*#Escala#)
H=(18*#Escala#)
Text=%1°

[Condiciones]
Group=Ap_MyWeather | Pantalla
MeasureName=mCondiciones
Meter=STRING
MeterStyle=ST-Texto_2
StringAlign=Left
FontSize=(10*#Escala#)
X=(59*#Escala#)
Y=(150*#Escala#)
W=(180*#Escala#)
H=(38*#Escala#)

[Icono_Presion]
Group=Ap_MyWeather | Pantalla | Datos2
Meter=IMAGE
ImageName=#@#Images\MyWeather\ic_pressure.png
X=(59*#Escala#)
Y=(192*#Escala#)
W=(16*#Escala#)
H=(16*#Escala#)
DynamicVariables=1
UpdateDivider=-1

[Presion]
Group=Ap_MyWeather | Pantalla | Datos2
MeasureName=mPresion
MeasureName2=mMedidaPresion
Meter=STRING
MeterStyle=ST-Texto_1
StringAlign=Left
FontSize=(8*#Escala#)
X=(78*#Escala#)
Y=(191*#Escala#)
W=(70*#Escala#)
H=(14*#Escala#)
Text=%1 %2

[Icono_Humedad]
Group=Ap_MyWeather | Pantalla | Datos2
Meter=IMAGE
ImageName=#@#Images\MyWeather\ic_humidity.png
X=(59*#Escala#)
Y=(212*#Escala#)
W=(16*#Escala#)
H=(16*#Escala#)
DynamicVariables=1
UpdateDivider=-1

[Humedad]
Group=Ap_MyWeather | Pantalla | Datos2
MeasureName=mHumedad
Meter=STRING
MeterStyle=ST-Texto_1
StringAlign=Left
FontSize=(8*#Escala#)
X=(78*#Escala#)
Y=(212*#Escala#)
W=(50*#Escala#)
H=(14*#Escala#)
Text=%1 %

[Icono_Lluvia]
Group=Ap_MyWeather | Pantalla | Datos2
Meter=IMAGE
ImageName=#@#Images\MyWeather\ic_rain.png
X=(109*#Escala#)
Y=(210*#Escala#)
W=(16*#Escala#)
H=(16*#Escala#)
DynamicVariables=1
UpdateDivider=-1

[Lluvia]
Group=Ap_MyWeather | Pantalla | Datos2
MeasureName=mDiaLluvia
Meter=STRING
MeterStyle=ST-Texto_1
StringAlign=Left
FontSize=(8*#Escala#)
X=(127*#Escala#)
Y=(212*#Escala#)
W=(50*#Escala#)
H=(14*#Escala#)
Text=%1 %

[Icono_Viento]
Group=Ap_MyWeather | Pantalla | Datos2
Meter=IMAGE
ImageName=#@#Images\MyWeather\ic_wind.png
X=(143*#Escala#)
Y=(190*#Escala#)
W=(16*#Escala#)
H=(16*#Escala#)
DynamicVariables=1
UpdateDivider=-1

[Viento]
Group=Ap_MyWeather | Pantalla | Datos2
MeasureName=mViento
MeasureName2=mMedidaViento
MeasureName3=mVientoDir
Meter=STRING
MeterStyle=ST-Texto_1
StringAlign=Left
FontSize=(8*#Escala#)
X=(163*#Escala#)
Y=(192*#Escala#)
W=(80*#Escala#)
H=(14*#Escala#)
Text=%1 %2 %3

[Icono_Alerta_Viento]
Group=Ap_MyWeather | Pantalla | Datos2
Meter=IMAGE
ImageName=#@#Images\MyWeather\ic_windalert.png
X=(235*#Escala#)
Y=(190*#Escala#)
W=(16*#Escala#)
H=(16*#Escala#)
DynamicVariables=1
UpdateDivider=-1

[Icono_UV]
Group=Ap_MyWeather | Pantalla | Datos2
Meter=IMAGE
ImageName=#@#Images\MyWeather\ic_uv.png
X=(159*#Escala#)
Y=(210*#Escala#)
W=(16*#Escala#)
H=(16*#Escala#)
DynamicVariables=1
UpdateDivider=-1

[UV]
Group=Ap_MyWeather | Pantalla | Datos2
MeasureName=mIndiceUV
MeasureName2=mUVEstado
Meter=STRING
MeterStyle=ST-Texto_1
StringAlign=Left
FontSize=(8*#Escala#)
X=(178*#Escala#)
Y=(212*#Escala#)
W=(75*#Escala#)
H=(14*#Escala#)
Text=%1 %2

[Icono_LuzSolar]
Group=Ap_MyWeather | Pantalla | Datos2
Meter=IMAGE
ImageName=#@#Images\MyWeather\ic_sun.png
X=(59*#Escala#)
Y=(231*#Escala#)
W=(16*#Escala#)
H=(16*#Escala#)
DynamicVariables=1
UpdateDivider=-1

[LuzSolar]
Group=Ap_MyWeather | Pantalla | Datos2
MeasureName=mSalidaSol
MeasureName2=mPuestaSol
Meter=STRING
MeterStyle=ST-Texto_1
StringAlign=Left
FontSize=(8*#Escala#)
X=(78*#Escala#)
Y=(232*#Escala#)
W=(100*#Escala#)
H=(14*#Escala#)
Text=%1 - %2

[Icono_Visibilidad]
Group=Ap_MyWeather | Pantalla | Datos2
Meter=IMAGE
ImageName=#@#Images\MyWeather\ic_visibility.png
X=(179*#Escala#)
Y=(232*#Escala#)
W=(16*#Escala#)
H=(16*#Escala#)
DynamicVariables=1
UpdateDivider=-1

[Visibilidad]
Group=Ap_MyWeather | Pantalla | Datos2
MeasureName=mVisibilidad
MeasureName2=mMedidaVisib
Meter=STRING
MeterStyle=ST-Texto_1
StringAlign=Left
FontSize=(8*#Escala#)
X=(198*#Escala#)
Y=(232*#Escala#)
W=(60*#Escala#)
H=(14*#Escala#)
Text=%1 %2

[Dia1_Icono]
Group=Ap_MyWeather | Pantalla | Datos2
MeasureName=mD1_D_Icono
Meter=IMAGE
ImagePath=#@#Images\MyWeather\Icons
X=(56*#Escala#)
Y=(260*#Escala#)
W=(46*#Escala#)
H=(32*#Escala#)
DynamicVariables=1

[Dia2_Icono]
Group=Ap_MyWeather | Pantalla | Datos2
MeasureName=mD2_D_Icono
Meter=IMAGE
ImagePath=#@#Images\MyWeather\Icons
DynamicVariables=1
X=(106*#Escala#)
Y=(260*#Escala#)
W=(46*#Escala#)
H=(32*#Escala#)
DynamicVariables=1

[Dia3_Icono]
Group=Ap_MyWeather | Pantalla | Datos2
MeasureName=mD3_D_Icono
Meter=IMAGE
ImagePath=#@#Images\MyWeather\Icons
X=(156*#Escala#)
Y=(260*#Escala#)
W=(46*#Escala#)
H=(32*#Escala#)
DynamicVariables=1

[Dia4_Icono]
Group=Ap_MyWeather | Pantalla | Datos2
MeasureName=mD4_D_Icono
Meter=IMAGE
ImagePath=#@#Images\MyWeather\Icons
X=(206*#Escala#)
Y=(260*#Escala#)
W=(46*#Escala#)
H=(32*#Escala#)
DynamicVariables=1

[Dia1]
Group=Ap_MyWeather | Pantalla | Datos2
MeasureName=mD1_Nombre
Meter=STRING
MeterStyle=ST-Texto_2
FontSize=(7*#Escala#)
X=(79*#Escala#)
Y=(292*#Escala#)
W=(50*#Escala#)
H=(18*#Escala#)

[Dia2]
Group=Ap_MyWeather | Pantalla | Datos2
MeasureName=mD2_Nombre
Meter=STRING
MeterStyle=ST-Texto_2
FontSize=(7*#Escala#)
X=(129*#Escala#)
Y=(292*#Escala#)
W=(50*#Escala#)
H=(18*#Escala#)

[Dia3]
Group=Ap_MyWeather | Pantalla | Datos2
MeasureName=mD3_Nombre
Meter=STRING
MeterStyle=ST-Texto_2
FontSize=(7*#Escala#)
X=(179*#Escala#)
Y=(292*#Escala#)
W=(50*#Escala#)
H=(18*#Escala#)

[Dia4]
Group=Ap_MyWeather | Pantalla | Datos2
MeasureName=mD4_Nombre
Meter=STRING
MeterStyle=ST-Texto_2
FontSize=(7*#Escala#)
X=(229*#Escala#)
Y=(292*#Escala#)
W=(50*#Escala#)
H=(18*#Escala#)

[Dia1_Temp]
Group=Ap_MyWeather | Pantalla | Datos2
MeasureName=mD1_Minima
MeasureName2=mD1_Maxima
Meter=STRING
MeterStyle=ST-Texto_1
FontSize=(8*#Escala#)
X=(79*#Escala#)
Y=(305*#Escala#)
W=(50*#Escala#)
H=(30*#Escala#)
Text=%1°/ %2°

[Dia2_Temp]
Group=Ap_MyWeather | Pantalla | Datos2
MeasureName=mD2_Minima
MeasureName2=mD2_Maxima
Meter=STRING
MeterStyle=ST-Texto_1
FontSize=(8*#Escala#)
X=(129*#Escala#)
Y=(305*#Escala#)
W=(50*#Escala#)
H=(30*#Escala#)
Text=%1°/ %2°

[Dia3_Temp]
Group=Ap_MyWeather | Pantalla | Datos2
MeasureName=mD3_Minima
MeasureName2=mD3_Maxima
Meter=STRING
MeterStyle=ST-Texto_1
FontSize=(8*#Escala#)
X=(179*#Escala#)
Y=(305*#Escala#)
W=(50*#Escala#)
H=(30*#Escala#)
Text=%1°/ %2°

[Dia4_Temp]
Group=Ap_MyWeather | Pantalla | Datos2
MeasureName=mD4_Minima
MeasureName2=mD4_Maxima
Meter=STRING
MeterStyle=ST-Texto_1
FontSize=(8*#Escala#)
X=(229*#Escala#)
Y=(305*#Escala#)
W=(50*#Escala#)
H=(30*#Escala#)
Text=%1°/ %2°

[Luna_Imagen]
Group=Ap_MyWeather | Pantalla
MeasureName=mLuna_Imagen
Meter=IMAGE
ImagePath=#@#Images\MyWeather\Moon
X=(73*#Escala#)
Y=(340*#Escala#)
W=(60*#Escala#)
H=(60*#Escala#)
DynamicVariables=1

[Luna_Fase]
Group=Ap_MyWeather | Pantalla
Meter=STRING
MeasureName=mLuna_Fase
MeterStyle=ST-Texto_2
StringAlign=CenterBottom
FontSize=(9*#Escala#)
X=(193*#Escala#)
Y=(377*#Escala#)
W=(120*#Escala#)
H=(42*#Escala#)

[Luna_Iluminada]
Group=Ap_MyWeather | Pantalla
Meter=STRING
MeasureName=mLuna_Iluminada
MeterStyle=ST-Texto_1
FontSize=(9*#Escala#)
X=(193*#Escala#)
Y=(378*#Escala#)
W=(120*#Escala#)
H=(18*#Escala#)
Text=%1 %

[Boton_Voz]
Group=Ap_MyWeather | Pantalla
Meter=IMAGE
ImageName=#@#Images\MyWeather\ic_speak.png
ImageAlpha=255
X=(230*#Escala#)
Y=(395*#Escala#)
W=(16*#Escala#)
H=(16*#Escala#)
MouseOverAction=[!SetOption #CURRENTSECTION# ImageAlpha 192][!UpdateMeter #CURRENTSECTION#][!Redraw]
MouseLeaveAction=[!SetOption #CURRENTSECTION# ImageAlpha 255][!UpdateMeter #CURRENTSECTION#][!Redraw]
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!CommandMeasure mVoz "#Hablado#"]
RightMouseUpAction=[!CommandMeasure mVoz ""]
DynamicVariables=1

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
LeftMouseUpAction=[Play #@#Sounds\vibrador2.wav][!HideMeter Icono_MenuOn][!ShowMeter Icono_MenuOff][!HideMeter Icono_AtrasOn][!ShowMeter Icono_AtrasOff][!HideMeterGroup Pantalla][!ShowMeterGroup #AppSmp#][!UpdateMeasure mComprobarConexion][!Redraw]
DynamicVariables=1
UpdateDivider=-1
Hidden=1

[Icono_Ajustes]
Group=AP_MyWeather | Pantalla
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

[Hora]
MeasureName=mHora
Meter=STRING
MeterStyle=ST-Texto_1
FontSize=(14*#Escala#)
X=(153*#Escala#)
Y=(26*#Escala#)
W=(70*#Escala#)
H=(22*#Escala#)
DynamicVariables=1

[Fecha]
MeasureName=mFecha
Meter=STRING
MeterStyle=ST-Texto_1
FontSize=(9*#Escala#)
X=(220*#Escala#)
Y=(29*#Escala#)
W=(70*#Escala#)
H=(16*#Escala#)
DynamicVariables=1

; © 2019 by HiTBiT-PA
