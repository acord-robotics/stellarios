[Metadata]
Name=Smartphone
Version=1.0
Information=App My Phone
Author=HiTBiT-PA
License=Creative Commons Attribution-Non-commercial-Share Alike 3.0
Website=http://hitbit-pa.deviantart.com/

[Variables]
@include=#@#Languages\Lang MyWeather_#Idioma#.inc
@include2=#@#Settings\Variables MyPhone.inc
@include3=#@#Measures\Measures Dock.inc
Hablado=#Voz01# [mHoraHablada]. #Voz02# [mTemperatura] #Voz03#, #Voz04# [mCondiciones]. #Voz05# [mPresion] #Voz06# [mHumedad] %, #Voz07# [mVientoVoz] [mMedidaVientoVoz] #Voz08# [mVientoDirVoz]. #Voz09# [mDiaLluvia] %. #Voz10# [mNocheCondiciones] #Voz11# [mTempMin] #Voz03#.

[Cristal]
Meter=IMAGE
ImageName=#@#Images\Suite\glass.png
X=(43*#Escala#)
Y=(5*#Escala#)
W=(222*#Escala#)
H=(446*#Escala#)
DynamicVariables=1
UpdateDivider=-1

[Solido_Buscador]
Group=AP_MyPhone | Pantalla
Meter=SHAPE
Shape=Rectangle (60*#Escala#),(64*#Escala#),(187*#Escala#),(29*#Escala#),(6*#Escala#),(6*#Escala#) | Fill Color 0,0,0,148 | Stroke Color 0,0,0,0
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!CommandMeasure mBuscador "ExecuteBatch 1"]
UpdateDivider=-1

[Icono_Buscador]
Group=AP_MyPhone | Pantalla
Meter=IMAGE
ImageName=#@#Images\Search\SE01.png
X=(67*#Escala#)
Y=(71*#Escala#)
W=(16*#Escala#)
H=(16*#Escala#)
DynamicVariables=1
UpdateDivider=-1

[Mascara]
Group=AP_MyPhone | Pantalla
Meter=SHAPE
Shape=Rectangle (60*#Escala#),(102*#Escala#),(187*#Escala#),(87*#Escala#),(6*#Escala#),(6*#Escala#) | Fill Color 24,24,24,255 | Stroke Color 0,0,0,0
DynamicVariables=1
UpdateDivider=-1

[Sin_Conexion]
Group=AP_MyPhone | Pantalla
Meter=IMAGE
SolidColor=16,16,16,255
Container=Mascara
X=(60*#Escala#)
Y=(102*#Escala#)
W=(187*#Escala#)
H=(87*#Escala#)
DynamicVariables=1
UpdateDivider=-1

[FotoActual]
Group=AP_MyPhone | Pantalla
MeasureName=mIcono
Meter=IMAGE
ImagePath=#@#Images\MyWeather\Pics
ImageAlpha=212
Container=Mascara
X=(60*#Escala#)
Y=(102*#Escala#)
W=(187*#Escala#)
H=(87*#Escala#)
PreserveAspectRatio=2
DynamicVariables=1

[Temperatura]
Group=AP_MyPhone | Pantalla
MeasureName=mTemperatura
Meter=STRING
MeterStyle=ST-Texto_1
StringAlign=Left
FontSize=(40*#Escala#)
X=(65*#Escala#)
Y=(90*#Escala#)
W=(120*#Escala#)
H=(64*#Escala#)
Text=%1°

[IconoActual]
Group=AP_MyPhone | Pantalla
MeasureName=mIcono
Meter=IMAGE
ImagePath=#@#Images\MyWeather\Icons
X=(185*#Escala#)
Y=(105*#Escala#)
W=(60*#Escala#)
H=(41*#Escala#)
DynamicVariables=1

[DiaTemp]
Group=AP_MyPhone | Pantalla
MeasureName=mTempMin
MeasureName2=mTempMax
Meter=STRING
MeterStyle=ST-Texto_1
FontSize=(9*#Escala#)
X=(220*#Escala#)
Y=(144*#Escala#)
W=(60*#Escala#)
H=(16*#Escala#)
Text=%1°/ %2°

[Condiciones]
Group=AP_MyPhone | Pantalla
MeasureName=mCondiciones
Meter=STRING
MeterStyle=ST-Texto_2
StringAlign=LeftBottom
FontSize=(9*#Escala#)
X=(64*#Escala#)
Y=(186*#Escala#)
W=(140*#Escala#)
H=(38*#Escala#)

[Boton_Voz]
Group=AP_MyPhone | Pantalla
Meter=IMAGE
ImageName=#@#Images\MyWeather\ic_speak.png
ImageAlpha=192
X=(224*#Escala#)
Y=(167*#Escala#)
W=(16*#Escala#)
H=(16*#Escala#)
MouseOverAction=[!SetOption #CURRENTSECTION# ImageAlpha 255][!UpdateMeter #CURRENTSECTION#][!Redraw]
MouseLeaveAction=[!SetOption #CURRENTSECTION# ImageAlpha 192][!UpdateMeter #CURRENTSECTION#][!Redraw]
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!CommandMeasure mVoz "#Hablado#"]
RightMouseUpAction=[!CommandMeasure mVoz ""]
DynamicVariables=1
UpdateDivider=-1

[Solidos_Sistema]
Group=Ap_MyPhone | Pantalla
Meter=SHAPE
Shape=Rectangle (60*#Escala#),(194*#Escala#),(187*#Escala#),(137*#Escala#),(6*#Escala#),(6*#Escala#) | Fill Color 0,0,0,148 | Stroke Color 0,0,0,0
Shape2=Arc (74*#Escala#),(242*#Escala#),(113*#Escala#),(242*#Escala#),(24*#Escala#),(24*#Escala#),0,0,1,0 | StrokeWidth 2 | Stroke Color 192,192,192,255
Shape3=Arc (134*#Escala#),(242*#Escala#),(173*#Escala#),(242*#Escala#),(24*#Escala#),(24*#Escala#),0,0,1,0 | StrokeWidth 2 | Stroke Color 192,192,192,255
Shape4=Arc (194*#Escala#),(242*#Escala#),(233*#Escala#),(242*#Escala#),(24*#Escala#),(24*#Escala#),0,0,1,0 | StrokeWidth 2 | Stroke Color 192,192,192,255
Shape5=Arc (194*#Escala#),(307*#Escala#),(233*#Escala#),(307*#Escala#),(24*#Escala#),(24*#Escala#),0,0,1,0 | StrokeWidth 2 | Stroke Color 192,192,192,255
DynamicVariables=1
UpdateDivider=-1

[Txt_CPU]
Group=Ap_MyPhone | Pantalla
Meter=STRING
MeterStyle=ST-Texto_2
FontSize=(8*#Escala#)
StringEffect=None
X=(94*#Escala#)
Y=(238*#Escala#)
W=(46*#Escala#)
H=(18*#Escala#)
Text=CPU
UpdateDivider=-1

[Txt_RAM]
Group=Ap_MyPhone | Pantalla
Meter=STRING
MeterStyle=ST-Texto_2
FontSize=(8*#Escala#)
StringEffect=None
X=(154*#Escala#)
Y=(238*#Escala#)
W=(46*#Escala#)
H=(18*#Escala#)
Text=RAM
UpdateDivider=-1

[Txt_GPU]
Group=Ap_MyPhone | Pantalla
Meter=STRING
MeterStyle=ST-Texto_2
FontSize=(8*#Escala#)
StringEffect=None
X=(214*#Escala#)
Y=(238*#Escala#)
W=(46*#Escala#)
H=(18*#Escala#)
Text=GPU
UpdateDivider=-1

[LineaCPU_Uso]
Group=Ap_MyPhone | Pantalla
MeasureName=mCPU_Uso
Meter=ROUNDLINE
X=(94*#Escala#)
Y=(228*#Escala#)
LineLength=(27*#Escala#)
LineStart=(21*#Escala#)
StartAngle=2.48
RotationAngle=4.48
LineColor=255,255,255,255
Solid=1
Antialias=1
DynamicVariables=1

[CPU_Uso]
Group=Ap_MyPhone | Pantalla
Meter=STRING
MeterStyle=ST-Texto_1
FontSize=(10*#Escala#)
StringEffect=None
X=(94*#Escala#)
Y=(219*#Escala#)
W=(50*#Escala#)
H=(18*#Escala#)
Text=[mCPU_Uso:0] %

[CPU_App]
Group=Ap_MyPhone | Pantalla
Meter=STRING
MeterStyle=ST-Texto_1
FontSize=(7*#Escala#)
StringEffect=None
X=(94*#Escala#)
Y=(251*#Escala#)
W=(60*#Escala#)
H=(16*#Escala#)
Text=[mCPU_App]

[LineaRAM_Uso]
Group=AP_MyPhone | Pantalla
MeasureName=mRAM_Uso
Meter=ROUNDLINE
X=(154*#Escala#)
Y=(228*#Escala#)
LineLength=(27*#Escala#)
LineStart=(21*#Escala#)
StartAngle=2.48
RotationAngle=4.48
LineColor=255,255,255,255
Solid=1
Antialias=1
DynamicVariables=1

[RAM_Uso]
Group=AP_MyPhone | Pantalla
MeasureName=mRAM_Uso
Meter=STRING
MeterStyle=ST-Texto_1
FontSize=(10*#Escala#)
StringEffect=None
X=(154*#Escala#)
Y=(219*#Escala#)
W=(50*#Escala#)
H=(18*#Escala#)
Percentual=1
NumOfDecimals=0
Text=%1 %

[RAM_App]
Group=AP_MyPhone | Pantalla
MeasureName=mRAM_App
Meter=STRING
MeterStyle=ST-Texto_1
FontSize=(7*#Escala#)
StringEffect=None
X=(154*#Escala#)
Y=(251*#Escala#)
W=(60*#Escala#)
H=(16*#Escala#)

[LineaGPU_Uso]
Group=AP_MyPhone | Pantalla
MeasureName=mGPU_Uso
Meter=ROUNDLINE
X=(214*#Escala#)
Y=(228*#Escala#)
LineLength=(27*#Escala#)
LineStart=(21*#Escala#)
StartAngle=2.48
RotationAngle=4.48
LineColor=255,255,255,255
Solid=1
Antialias=1
DynamicVariables=1

[GPU_Uso]
Group=AP_MyPhone | Pantalla
Meter=STRING
MeterStyle=ST-Texto_1
FontSize=(10*#Escala#)
StringEffect=None
X=(214*#Escala#)
Y=(219*#Escala#)
W=(50*#Escala#)
H=(18*#Escala#)
Text=[mGPU_Uso:0] %

[GPU_App]
Group=AP_MyPhone | Pantalla
MeasureName=mGPU_App
Meter=STRING
MeterStyle=ST-Texto_1
FontSize=(7*#Escala#)
StringEffect=None
X=(214*#Escala#)
Y=(251*#Escala#)
W=(60*#Escala#)
H=(16*#Escala#)
Text=[mGPU_App]

[LineaUso_C]
Group=AP_MyPhone | Pantalla
MeasureName=mUso_C
Meter=ROUNDLINE
X=(214*#Escala#)
Y=(293*#Escala#)
LineLength=(27*#Escala#)
LineStart=(21*#Escala#)
StartAngle=2.48
RotationAngle=4.48
LineColor=255,255,255,255
Solid=1
Antialias=1
DynamicVariables=1

[Txt_C]
Group=Ap_MyPhone | Pantalla
Meter=STRING
MeterStyle=ST-Texto_2
FontSize=(8*#Escala#)
StringEffect=None
X=(214*#Escala#)
Y=(303*#Escala#)
W=(46*#Escala#)
H=(18*#Escala#)
Text=C:
UpdateDivider=-1

[Uso_C]
Group=AP_MyPhone | Pantalla
MeasureName=mUso_C
Meter=STRING
MeterStyle=ST-Texto_1
FontSize=(10*#Escala#)
StringEffect=None
X=(214*#Escala#)
Y=(284*#Escala#)
W=(50*#Escala#)
H=(18*#Escala#)
Percentual=1
Text=%1 %

[Etiqueta_C]
Group=AP_MyPhone | Pantalla
MeasureName=mEtiqueta_C
Meter=STRING
MeterStyle=ST-Texto_1
FontSize=(7*#Escala#)
StringEffect=None
X=(214*#Escala#)
Y=(316*#Escala#)
W=(60*#Escala#)
H=(16*#Escala#)
UpdateDivider=-1

[Led_SubidaOff]
Group=AP_MyPhone | Pantalla
Meter=IMAGE
ImageName=#@#Images\MyPlayer\bt_up.png
ImageTint=108,108,108,255
X=(66*#Escala#)
Y=(273*#Escala#)
W=(10*#Escala#)
H=(10*#Escala#)
DynamicVariables=1
UpdateDivider=-1

[Led_BajadaOff]
Group=AP_MyPhone | Pantalla
Meter=IMAGE
ImageName=#@#Images\MyPlayer\bt_down.png
ImageTint=108,108,108,255
X=(128*#Escala#)
Y=(273*#Escala#)
W=(10*#Escala#)
H=(10*#Escala#)
DynamicVariables=1
UpdateDivider=-1

[Led_Subida]
Group=AP_MyPhone | Pantalla
Meter=IMAGE
ImageName=#@#Images\MyPlayer\bt_up.png
X=(66*#Escala#)
Y=(273*#Escala#)
W=(10*#Escala#)
H=(10*#Escala#)
DynamicVariables=1

[Led_Bajada]
Group=AP_MyPhone | Pantalla
Meter=IMAGE
ImageName=#@#Images\MyPlayer\bt_down.png
X=(128*#Escala#)
Y=(273*#Escala#)
W=(10*#Escala#)
H=(10*#Escala#)
DynamicVariables=1

[Subida]
Group=AP_MyPhone | Pantalla
MeasureName=mSubidaData
Meter=STRING
MeterStyle=ST-Texto_1
StringAlign=Left
FontSize=(8*#Escala#)
StringEffect=None
X=(80*#Escala#)
Y=(271*#Escala#)
W=(50*#Escala#)
H=(15*#Escala#)
Autoscale=1k
NumOfDecimals=1
Text=%1b

[Bajada]
Group=AP_MyPhone | Pantalla
MeasureName=mBajadaData
Meter=STRING
MeterStyle=ST-Texto_1
StringAlign=Left
FontSize=(8*#Escala#)
StringEffect=None
X=(142*#Escala#)
Y=(271*#Escala#)
W=(50*#Escala#)
H=(15*#Escala#)
Autoscale=1k
NumOfDecimals=1
Text=%1b

[Caratula]
Group=AP_MyPhone | Pantalla
MeasureName=mCaratula
Meter=IMAGE
X=(64*#Escala#)
Y=(303*#Escala#)
W=(24*#Escala#)
H=(24*#Escala#)
DynamicVariables=1

[Titulo]
Group=AP_MyPhone | Pantalla
MeasureName=mTitulo
Meter=STRING
MeterStyle=ST-Texto_1
StringAlign=LeftBottom
FontSize=(8*#Escala#)
StringEffect=None
X=(90*#Escala#)
Y=(314*#Escala#)
W=(95*#Escala#)
H=(28*#Escala#)

[Artista]
Group=AP_MyPhone | Pantalla
MeasureName=mArtista
Meter=STRING
MeterStyle=ST-Texto_1
StringAlign=Left
FontSize=(8*#Escala#)
StringEffect=None
X=(90*#Escala#)
Y=(314*#Escala#)
W=(95*#Escala#)
H=(14*#Escala#)

[Icono_MP01]
Group=AP_MyPhone | Pantalla
Meter=IMAGE
ImageName=#@#Images\MyPhone\MP01.png
X=(58*#Escala#)
Y=(339*#Escala#)
W=(36*#Escala#)
H=(36*#Escala#)
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#MP01#"]
DynamicVariables=1
UpdateDivider=-1

[Icono_MP02]
Group=AP_MyPhone | Pantalla
Meter=IMAGE
ImageName=#@#Images\MyPhone\MP02.png
X=(97*#Escala#)
Y=(339*#Escala#)
W=(36*#Escala#)
H=(36*#Escala#)
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#MP02#"]
DynamicVariables=1
UpdateDivider=-1

[Icono_MP03]
Group=AP_MyPhone | Pantalla
Meter=IMAGE
ImageName=#@#Images\MyPhone\MP03.png
X=(136*#Escala#)
Y=(339*#Escala#)
W=(36*#Escala#)
H=(36*#Escala#)
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#MP03#"]
DynamicVariables=1
UpdateDivider=-1

[Icono_MP04]
Group=AP_MyPhone | Pantalla
Meter=IMAGE
ImageName=#@#Images\MyPhone\MP04.png
X=(175*#Escala#)
Y=(339*#Escala#)
W=(36*#Escala#)
H=(36*#Escala#)
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#MP04#"]
DynamicVariables=1
UpdateDivider=-1

[Icono_MP05]
Group=AP_MyPhone | Pantalla
Meter=IMAGE
ImageName=#@#Images\MyPhone\MP05.png
X=(214*#Escala#)
Y=(339*#Escala#)
W=(36*#Escala#)
H=(36*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#MP05#"]
UpdateDivider=-1

[Icono_MP06]
Group=AP_MyPhone | Pantalla
Meter=IMAGE
ImageName=#@#Images\MyPhone\MP06.png
X=(58*#Escala#)
Y=(378*#Escala#)
W=(36*#Escala#)
H=(36*#Escala#)
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#MP06#"]
DynamicVariables=1
UpdateDivider=-1

[Icono_MP07]
Group=AP_MyPhone | Pantalla
Meter=IMAGE
ImageName=#@#Images\MyPhone\MP07.png
X=(97*#Escala#)
Y=(378*#Escala#)
W=(36*#Escala#)
H=(36*#Escala#)
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#MP07#"]
DynamicVariables=1
UpdateDivider=-1

[Icono_MP08]
Group=AP_MyPhone | Pantalla
Meter=IMAGE
ImageName=#@#Images\MyPhone\MP08.png
X=(136*#Escala#)
Y=(378*#Escala#)
W=(36*#Escala#)
H=(36*#Escala#)
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#MP08#"]
DynamicVariables=1
UpdateDivider=-1

[Icono_MP09]
Group=AP_MyPhone | Pantalla
Meter=IMAGE
ImageName=#@#Images\MyPhone\MP09.png
X=(175*#Escala#)
Y=(378*#Escala#)
W=(36*#Escala#)
H=(36*#Escala#)
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#MP09#"]
DynamicVariables=1
UpdateDivider=-1

[Icono_MP10]
Group=AP_MyPhone | Pantalla
Meter=IMAGE
ImageName=#@#Images\MyPhone\MP10.png
X=(214*#Escala#)
Y=(378*#Escala#)
W=(36*#Escala#)
H=(36*#Escala#)
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["#MP10#"]
DynamicVariables=1
UpdateDivider=-1

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
LeftMouseUpAction=[Play #@#Sounds\vibrador2.wav][!HideMeter Icono_MenuOff][!ShowMeter Icono_MenuOn][!HideMeter Icono_AtrasOn][!ShowMeter Icono_AtrasOff][!HideMeterGroup Pantalla][!ShowMeterGroup Menu][!TogglePauseMeasureGroup Leds][!Redraw]
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
LeftMouseUpAction=[Play #@#Sounds\vibrador2.wav][!HideMeter Icono_MenuOn][!ShowMeter Icono_MenuOff][!HideMeter Icono_AtrasOn][!ShowMeter Icono_AtrasOff][!HideMeterGroup Pantalla][!ShowMeterGroup #AppSmp#][!TogglePauseMeasureGroup Leds][!Redraw]
DynamicVariables=1
UpdateDivider=-1
Hidden=1

[Icono_Editar]
Group=AP_MyPhone | Pantalla
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
LeftMouseUpAction=[Play #@#Sounds\vibrador2.wav]["#@#Settings\Variables MyPhone.inc"]
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
