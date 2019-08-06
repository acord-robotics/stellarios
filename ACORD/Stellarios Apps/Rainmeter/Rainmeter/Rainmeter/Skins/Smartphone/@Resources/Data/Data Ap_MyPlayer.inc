[Metadata]
Name=Smartphone
Version=1.0
Information=App MyPlayer
Author=HiTBiT-PA
License=Creative Commons Attribution-Non-commercial-Share Alike 3.0
Website=http://hitbit-pa.deviantart.com/

[Variables]
@include=#@#Measures\Measures Chameleon.inc
@include2=#@#Measures\Measures Explorer.inc
@include3=#@#Measures\Measures Dock.inc
Scroll=55

[FondoMyPlayer]
Group=Ap_MyPlayer | Pantalla
Meter=SHAPE
Shape=Rectangle (47*#Escala#),(26*#Escala#),(212*#Escala#),(392*#Escala#),(14*#Escala#),(14*#Escala#) | Fill Color [ColorDinamico3] | Stroke Color [ColorDinamico3]
DynamicVariables=1

[Caratula]
Group=Ap_MyPlayer | Pantalla
MeasureName=mCaratula
Meter=IMAGE
X=(48*#Escala#)
Y=(55*#Escala#)
W=(210*#Escala#)
H=(210*#Escala#)
DynamicVariables=1
Antialias=1

[SolidoFondo]
Meter=IMAGE
SolidColor=0,0,0,196
X=(47*#Escala#)
Y=(55*#Escala#)
W=(213*#Escala#)
H=(210*#Escala#)
DynamicVariables=1
Hidden=1

[Cristal]
Meter=IMAGE
ImageName=#@#Images\Suite\glass.png
X=(43*#Escala#)
Y=(5*#Escala#)
W=(222*#Escala#)
H=(446*#Escala#)
DynamicVariables=1
UpdateDivider=-1

[Titulo]
Group=Ap_MyPlayer | Pantalla
MeasureName=mTitulo
Meter=STRING
MeterStyle=ST-Texto_2
StringEffect=None
FontSize=(8*#Escala#)
FontColor=[ColorDinamico1]
StringAlign=CenterCenter
X=(155*#Escala#)
Y=(282*#Escala#)
W=(170*#Escala#)
H=(30*#Escala#)

[Artista]
Group=Ap_MyPlayer | Pantalla
MeasureName=mArtista
Meter=STRING
MeterStyle=ST-Texto_2
StringEffect=None
FontSize=(8*#Escala#)
FontColor=[ColorDinamico2]
X=(155*#Escala#)
Y=(297*#Escala#)
W=(170*#Escala#)
H=(16*#Escala#)

[Posicion]
Group=Ap_MyPlayer | Pantalla
MeasureName=mPosicion
Meter=STRING
MeterStyle=ST-Texto_1
StringEffect=None
FontSize=(7*#Escala#)
FontColor=[ColorDinamico2]
StringAlign=Right
X=(102*#Escala#)
Y=(314*#Escala#)
W=(50*#Escala#)
H=(12*#Escala#)

[Duracion]
Group=Ap_MyPlayer | Pantalla
MeasureName=mDuracion
Meter=STRING
MeterStyle=ST-Texto_1
StringEffect=None
FontSize=(7*#Escala#)
FontColor=[ColorDinamico2]
StringAlign=Left
X=(208*#Escala#)
Y=(314*#Escala#)
W=(50*#Escala#)
H=(12*#Escala#)

[NivelProgreso]
Group=Ap_MyPlayer | Pantalla
MeasureName=mProgreso
Meter=SHAPE
Shape=Rectangle (105*#Escala#),(319*#Escala#),(100*#Escala#),(1*#Escala#),(2*#Escala#),(2*#Escala#) | Fill Color [ColorDinamico2] | Stroke Color 0,0,0,0
Shape2=Rectangle (105*#Escala#),(317*#Escala#),([mProgreso]*#Escala#),(5*#Escala#),(3*#Escala#),(4*#Escala#) | Fill Color [ColorDinamico1] | Stroke Color 0,0,0,0
MouseScrollUpAction=[!CommandMeasure "mProgreso" "SetPosition +5"][!Redraw]
MouseScrollDownAction=[!CommandMeasure "mProgreso" "SetPosition -5"][!Redraw]
DynamicVariables=1

[BotonParar]
Group=Ap_MyPlayer | Pantalla
Meter=IMAGE
ImageName=#@#Images\MyPlayer\bt_stop.png
ImageTint=[ColorDinamico1]
X=(70*#Escala#)
Y=(365*#Escala#)
W=(24*#Escala#)
H=(24*#Escala#)
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!CommandMeasure "mTitulo" "Stop"][!Redraw]
DynamicVariables=1

[BotonAnterior]
Group=Ap_MyPlayer | Pantalla
Meter=IMAGE
ImageName=#@#Images\MyPlayer\bt_previous.png
ImageTint=[ColorDinamico1]
X=(97*#Escala#)
Y=(345*#Escala#)
W=(30*#Escala#)
H=(30*#Escala#)
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!CommandMeasure "mTitulo" "Previous"][!Redraw]
DynamicVariables=1

[BotonEscuchar]
Group=Ap_MyPlayer | Pantalla
Meter=IMAGE
ImageName=#@#Images\MyPlayer\[mEstado]
ImageTint=[ColorDinamico1]
X=(134*#Escala#)
Y=(332*#Escala#)
W=(40*#Escala#)
H=(40*#Escala#)
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!CommandMeasure "mTitulo" "PlayPause"][!Redraw]
DynamicVariables=1

[BotonSiguiente]
Group=Ap_MyPlayer | Pantalla
Meter=IMAGE
ImageName=#@#Images\MyPlayer\bt_Next.png
ImageTint=[ColorDinamico1]
X=(180*#Escala#)
Y=(345*#Escala#)
W=(30*#Escala#)
H=(30*#Escala#)
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!CommandMeasure "mTitulo" "Next"][!Redraw]
DynamicVariables=1

[BotonAleatorio]
Group=Ap_MyPlayer | Pantalla
Meter=IMAGE
ImageTint=[ColorDinamico1]
X=(213*#Escala#)
Y=(365*#Escala#)
W=(24*#Escala#)
H=(24*#Escala#)
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!CommandMeasure "mAleatorio" "SetShuffle -1"][!Redraw]
DynamicVariables=1

[BotonReproductor]
Group=Ap_MyPlayer | Pantalla
Meter=IMAGE
ImageName=#@#Images\MyPlayer\bt_player.png
ImageTint=[ColorDinamico1]
X=(60*#Escala#)
Y=(335*#Escala#)
W=(16*#Escala#)
H=(16*#Escala#)
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!CommandMeasure "mReproductor" "TogglePlayer"][!Redraw]
DynamicVariables=1

[BotonBusquedaOff]
Group=Ap_MyPlayer | Pantalla
Meter=IMAGE
ImageName=#@#Images\MyPlayer\bt_search.png
ImageTint=[ColorDinamico1]
X=(210*#Escala#)
Y=(335*#Escala#)
W=(16*#Escala#)
H=(16*#Escala#)
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!ShowMeter SolidoFondo][!ShowMeterGroup Busqueda][!HideMeter BotonBusquedaOff][!ShowMeter BotonBusquedaOn][!HideMeterGroup Explorador][!HideMeterGroup Letras][!HideMeter BotonLetrasOn][!ShowMeter BotonLetrasOff][!HideMeter BotonRadioOn][!ShowMeter BotonRadioOff][!HideMeter BotonMP3On][!ShowMeter BotonMP3Off][!Redraw]
DynamicVariables=1

[BotonBusquedaOn]
Group=BotonesOn
Meter=IMAGE
ImageName=#@#Images\MyPlayer\bt_search.png
ImageTint=[ColorDinamico2]
X=(210*#Escala#)
Y=(335*#Escala#)
W=(16*#Escala#)
H=(16*#Escala#)
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!HideMeter SolidoFondo][!HideMeterGroup Busqueda][!HideMeter BotonBusquedaOn][!ShowMeter BotonBusquedaOff][!Redraw]
DynamicVariables=1
Hidden=1

[BotonLetrasOff]
Group=Ap_MyPlayer | Pantalla
Meter=IMAGE
ImageName=#@#Images\MyPlayer\ic_file.png
ImageTint=[ColorDinamico1]
X=(235*#Escala#)
Y=(348*#Escala#)
W=(16*#Escala#)
H=(16*#Escala#)
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!ShowMeter SolidoFondo][!HideMeter BotonLetrasOff][!ShowMeter BotonLetrasOn][!HideMeter BotonBusquedaOn][!ShowMeter BotonBusquedaOff][!HideMeterGroup Busqueda][!HideMeterGroup Explorador][!HideMeter BotonRadioOn][!ShowMeter BotonRadioOff][!HideMeter BotonMP3On][!ShowMeter BotonMP3Off][!ShowMeterGroup Letras][!Redraw]
DynamicVariables=1

[BotonLetrasOn]
Group=BotonesOn
Meter=IMAGE
ImageName=#@#Images\MyPlayer\ic_file.png
ImageTint=[ColorDinamico2]
X=(235*#Escala#)
Y=(348*#Escala#)
W=(16*#Escala#)
H=(16*#Escala#)
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!HideMeter SolidoFondo][!HideMeterGroup Letras][!HideMeter BotonLetrasOn][!ShowMeter BotonLetrasOff][!Redraw]
DynamicVariables=1
Hidden=1

[BotonMP3Off]
Group=Ap_MyPlayer | Pantalla
Meter=SHAPE
Shape=Rectangle (77*#Escala#),(397*#Escala#),(34*#Escala#),(12*#Escala#),(5*#Escala#),(5*#Escala#) | Fill Color [ColorDinamico1] | Stroke Color 0,0,0,0
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!SetOption mDireccion Path "#CarpetaMP3#"][!CommandMeasure mDireccion Update][!ShowMeter SolidoFondo][!ShowMeterGroup Explorador][!HideMeter BotonMP3Off][!ShowMeter BotonMP3On][!HideMeter BotonRadioOn][!ShowMeter BotonRadioOff][!HideMeter BotonBusquedaOn][!ShowMeter BotonBusquedaOff][!HideMeterGroup Busqueda][!HideMeterGroup Letras][!HideMeter BotonLetrasOn][!ShowMeter BotonLetrasOff][!Redraw]
DynamicVariables=1

[BotonMP3On]
Group=BotonesOn
Meter=SHAPE
Shape=Rectangle (77*#Escala#),(397*#Escala#),(34*#Escala#),(12*#Escala#),(5*#Escala#),(5*#Escala#) | Fill Color [ColorDinamico2] | Stroke Color 0,0,0,0
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!HideMeter SolidoFondo][!HideMeterGroup Explorador][!HideMeter BotonMP3On][!ShowMeter BotonMP3Off][!Redraw]
DynamicVariables=1
Hidden=1

[TextoMP3]
Group=AP_MyPlayer | Pantalla
Meter=STRING
MeterStyle=ST-Texto_2
FontColor=[ColorDinamico3]
StringEffect=None
FontSize=(7*#Escala#)
X=(94*#Escala#)
Y=(397*#Escala#)
W=(34*#Escala#)
H=(14*#Escala#)
Text=MP3

[BotonRadioOff]
Group=Ap_MyPlayer | Pantalla
Meter=SHAPE
Shape=Rectangle (197*#Escala#),(397*#Escala#),(34*#Escala#),(12*#Escala#),(4*#Escala#),(4*#Escala#) | Fill Color [ColorDinamico1] | Stroke Color 0,0,0,0
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!SetOption mDireccion Path "#CarpetaRadio#"][!CommandMeasure mDireccion Update][!ShowMeter SolidoFondo][!ShowMeterGroup Explorador][!HideMeter BotonRadioOff][!ShowMeter BotonRadioOn][!HideMeter BotonMP3On][!ShowMeter BotonMP3Off][!HideMeter BotonBusquedaOn][!ShowMeter BotonBusquedaOff][!HideMeterGroup Busqueda][!HideMeterGroup Letras][!HideMeter BotonLetrasOn][!ShowMeter BotonLetrasOff][!Redraw]
DynamicVariables=1

[BotonRadioOn]
Group=BotonesOn
Meter=SHAPE
Shape=Rectangle (197*#Escala#),(397*#Escala#),(34*#Escala#),(12*#Escala#),(4*#Escala#),(4*#Escala#) | Fill Color [ColorDinamico2] | Stroke Color 0,0,0,0
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!HideMeter SolidoFondo][!HideMeterGroup Explorador][!HideMeter BotonRadioOn][!ShowMeter BotonRadioOff][!Redraw]
DynamicVariables=1
Hidden=1

[TextoRadio]
Group=AP_MyPlayer | Pantalla
Meter=STRING
MeterStyle=ST-Texto_2
FontColor=[ColorDinamico3]
StringEffect=None
FontSize=(7*#Escala#)
X=(214*#Escala#)
Y=(397*#Escala#)
W=(34*#Escala#)
H=(14*#Escala#)
Text=RADIO

[SombraVolumen]
Group=AP_MyPlayer | Pantalla
Meter=ROUNDLINE
X=(154*#Escala#)
Y=(400*#Escala#)
LineWidth=4
LineLength=(16*#Escala#)
LineStart=(15*#Escala#)
StartAngle=2.48
RotationAngle=4.48
LineColor=[ColorDinamico1]
Solid=1
Antialias=1
DynamicVariables=1

[NivelVolmen]
Group=AP_MyPlayer | Pantalla
MeasureName=mVolumen
Meter=ROUNDLINE
X=(154*#Escala#)
Y=(400*#Escala#)
LineWidth=6
LineLength=(18*#Escala#)
LineStart=(13*#Escala#)
StartAngle=2.48
RotationAngle=4.48
LineColor=[ColorDinamico2]
Solid=0
Antialias=1
DynamicVariables=1

[Volumen]
Group=AP_MyPlayer | Pantalla
MeasureName=mVolumenPorc
Meter=STRING
MeterStyle=ST-Texto_1
StringEffect=None
FontColor=[ColorDinamico2]
FontSize=(8*#Escala#)
X=(154*#Escala#)
Y=(393*#Escala#)
W=(30*#Escala#)
H=(20*#Escala#)
MouseScrollUpAction=[!CommandMeasure "mVolumen" "ChangeVolume +5"][!UpdateMeterGroup Volumen][!Redraw]
MouseScrollDownAction=[!CommandMeasure "mVolumen" "ChangeVolume -5"][!UpdateMeterGroup Volumen][!Redraw]
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!CommandMeasure "mVolumen" "ToggleMute"][!UpdateMeterGroup Volumen][!Redraw]

[IconoLetra]
Group=Busqueda
Meter=IMAGE
ImageName=#@#Images\MyPlayer\bt_lyrics.png
X=(80*#Escala#)
Y=(90*#Escala#)
W=(30*#Escala#)
H=(30*#Escala#)
MouseOverAction=[!ShowMeter TXT_Letra][!Redraw]
MouseLeaveAction=[!HideMeter TXT_Letra][!Redraw]
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["http://www.google.com/search?q=lyrics [mTitulo] [mArtista]&safe=active&dcr=0&source=lnms&sa=X&ved="]
DynamicVariables=1
Hidden=1

[IconoFotos]
Group=Busqueda
Meter=IMAGE
ImageName=#@#Images\MyPlayer\bt_images.png
X=(120*#Escala#)
Y=(90*#Escala#)
W=(30*#Escala#)
H=(30*#Escala#)
MouseOverAction=[!ShowMeter TXT_Fotos][!Redraw]
MouseLeaveAction=[!HideMeter TXT_Fotos][!Redraw]
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["http://www.google.com/search?q=[mArtista]&safe=active&dcr=0&source=lnms&tbm=isch&sa=X&ved="]
DynamicVariables=1
Hidden=1

[IconoVideo]
Group=Busqueda
Meter=IMAGE
ImageName=#@#Images\MyPlayer\bt_video.png
X=(160*#Escala#)
Y=(90*#Escala#)
W=(30*#Escala#)
H=(30*#Escala#)
MouseOverAction=[!ShowMeter TXT_Video][!Redraw]
MouseLeaveAction=[!HideMeter TXT_Video][!Redraw]
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["http://www.google.com/search?q=[mTitulo] [mArtista]&safe=active&dcr=0&source=lnms&tbm=vid&sa=X&ved="]
DynamicVariables=1
Hidden=1

[IconoInfo]
Group=Busqueda
Meter=IMAGE
ImageName=#@#Images\MyPlayer\bt_info.png
X=(200*#Escala#)
Y=(90*#Escala#)
W=(30*#Escala#)
H=(30*#Escala#)
MouseOverAction=[!ShowMeter TXT_Info][!Redraw]
MouseLeaveAction=[!HideMeter TXT_Info][!Redraw]
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["http://www.google.com/search?q=[mArtista]&safe=active&dcr=0&tbm=nws&source=lnms&sa=X&ved="]
DynamicVariables=1
Hidden=1

[TXT_Letra]
Meter=STRING
MeterStyle=ST-Texto_2
StringEffect=None
FontSize=(9*#Escala#)
X=(155*#Escala#)
Y=(140*#Escala#)
W=(180*#Escala#)
H=(60*#Escala#)
Text="[mTitulo]"
Hidden=1

[TXT_Fotos]
Meter=STRING
MeterStyle=ST-Texto_2
StringEffect=None
FontSize=(9*#Escala#)
X=(155*#Escala#)
Y=(140*#Escala#)
W=(180*#Escala#)
H=(60*#Escala#)
Text="[mArtista]"
Hidden=1

[TXT_Video]
Meter=STRING
MeterStyle=ST-Texto_2
StringEffect=None
FontSize=(9*#Escala#)
X=(155*#Escala#)
Y=(140*#Escala#)
W=(180*#Escala#)
H=(60*#Escala#)
Text="[mArtista] - [mTitulo]"
Hidden=1

[TXT_Info]
Meter=STRING
MeterStyle=ST-Texto_2
StringEffect=None
FontSize=(9*#Escala#)
X=(155*#Escala#)
Y=(140*#Escala#)
W=(180*#Escala#)
H=(60*#Escala#)
Text="[mArtista]"
Hidden=1

[Fondo_Letras]
Group=Letras
Meter=SHAPE
Shape=Rectangle (49*#Escala#),(57*#Escala#),(208*#Escala#),(208*#Escala#) | Fill Color 0,0,0,255 | Stroke Color 0,0,0,0
DynamicVariables=1
Hidden=1

[Letra_Cancion]
Group=Letras
MeasureName=mTitulo
MeasureName2=mArtista
MeasureName3=mLetras
Meter=STRING
MeterStyle=ST-Texto_2
StringEffect=None
StringAlign=Left
FontSize=(6*#Escala#)
X=(50*#Escala#)
Y=(#Scroll#*#Escala#)
Text=%1#CRLF#%2#CRLF##CRLF#%3
MouseScrollDownAction=[!SetVariable Scroll "(Clamp(#Scroll#-20,-900,55))"][!UpdateMeter Letra_Cancion][!Redraw]
MouseScrollUpAction=[!SetVariable Scroll "(Clamp(#Scroll#+20,-900,55))"][!UpdateMeter Letra_Cancion][!Redraw]
Container=Fondo_Letras
Hidden=1

[Boton_Inicio]
Group=Letras
Meter=IMAGE
ImageName=#@#Images\MyPlayer\bt_up.png
X=(240*#Escala#)
Y=(248*#Escala#)
W=(16*#Escala#)
H=(16*#Escala#)
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!SetVariable Scroll "55"][!UpdateMeter Letra_Cancion][!Redraw]
DynamicVariables=1
Hidden=1

[ZonaActiva]
Group=Explorador
Meter=IMAGE
SolidColor=0,0,0,1
X=(65*#Escala#)
Y=(87*#Escala#)
W=(178*#Escala#)
H=(138*#Escala#)
MouseScrollUpAction=[!CommandMeasure mDireccion "IndexUp"][!UpdateMeasure mDireccion][!UpdateMeasureGroup Carpetas][!UpdateMeter *][!Redraw]
MouseScrollDownAction=[!CommandMeasure mDireccion "IndexDown"][!UpdateMeasure mDireccion][!UpdateMeasureGroup Carpetas][!UpdateMeter *][!Redraw]
DynamicVariables=1
Hidden=1

[Icono_Carpeta]
Group=Explorador
Meter=IMAGE
ImageName=#@#Images\MyPlayer\ic_folder.png
ImageTint=255,212,0,255
X=(70*#Escala#)
Y=(61*#Escala#)
W=(16*#Escala#)
H=(16*#Escala#)
DynamicVariables=1
Hidden=1

[Icono_Archivo]
Group=Explorador
Meter=IMAGE
ImageName=#@#Images\MyPlayer\ic_file.png
ImageTint=255,212,0,255
X=(160*#Escala#)
Y=(61*#Escala#)
W=(16*#Escala#)
H=(16*#Escala#)
DynamicVariables=1
Hidden=1

[NumCarpetas]
Group=Explorador
MeasureName=mNumCarpetas
Meter=STRING
MeterStyle=ST-Texto_2
StringEffect=None
StringAlign=Left
FontSize=(10*#Escala#)
X=(96*#Escala#)
Y=(60*#Escala#)
W=(50*#Escala#)
H=(18*#Escala#)
Hidden=1

[NumArchivos]
Group=Explorador
MeasureName=mNumArchivos
Meter=STRING
MeterStyle=ST-Texto_2
StringEffect=None
StringAlign=Left
FontSize=(10*#Escala#)
X=(179*#Escala#)
Y=(60*#Escala#)
W=(50*#Escala#)
H=(18*#Escala#)
Hidden=1

[Indice1Icono]
Group=Explorador
Meter=IMAGE
ImageName=#@#Images\MyPlayer\ic_arrow.png
ImageTint=255,212,0,255
X=(70*#Escala#)
Y=(91*#Escala#)
W=(10*#Escala#)
H=(10*#Escala#)
DynamicVariables=1
Hidden=1

[Indice2Icono]
Group=Explorador
Meter=IMAGE
ImageName=#@#Images\MyPlayer\ic_arrow.png
ImageTint=255,212,0,255
X=(70*#Escala#)
Y=(104*#Escala#)
W=(10*#Escala#)
H=(10*#Escala#)
DynamicVariables=1
Hidden=1

[Indice3Icono]
Group=Explorador
Meter=IMAGE
ImageName=#@#Images\MyPlayer\ic_arrow.png
ImageTint=255,212,0,255
X=(70*#Escala#)
Y=(117*#Escala#)
W=(10*#Escala#)
H=(10*#Escala#)
DynamicVariables=1
Hidden=1

[Indice4Icono]
Group=Explorador
Meter=IMAGE
ImageName=#@#Images\MyPlayer\ic_arrow.png
ImageTint=255,212,0,255
X=(70*#Escala#)
Y=(130*#Escala#)
W=(10*#Escala#)
H=(10*#Escala#)
DynamicVariables=1
Hidden=1

[Indice5Icono]
Group=Explorador
Meter=IMAGE
ImageName=#@#Images\MyPlayer\ic_arrow.png
ImageTint=255,212,0,255
X=(70*#Escala#)
Y=(143*#Escala#)
W=(10*#Escala#)
H=(10*#Escala#)
DynamicVariables=1
Hidden=1

[Indice6Icono]
Group=Explorador
Meter=IMAGE
ImageName=#@#Images\MyPlayer\ic_arrow.png
ImageTint=255,212,0,255
X=(70*#Escala#)
Y=(156*#Escala#)
W=(10*#Escala#)
H=(10*#Escala#)
DynamicVariables=1
Hidden=1

[Indice7Icono]
Group=Explorador
Meter=IMAGE
ImageName=#@#Images\MyPlayer\ic_arrow.png
ImageTint=255,212,0,255
X=(70*#Escala#)
Y=(169*#Escala#)
W=(10*#Escala#)
H=(10*#Escala#)
DynamicVariables=1
Hidden=1

[Indice8Icono]
Group=Explorador
Meter=IMAGE
ImageName=#@#Images\MyPlayer\ic_arrow.png
ImageTint=255,212,0,255
X=(70*#Escala#)
Y=(182*#Escala#)
W=(10*#Escala#)
H=(10*#Escala#)
DynamicVariables=1
Hidden=1

[Indice9Icono]
Group=Explorador
Meter=IMAGE
ImageName=#@#Images\MyPlayer\ic_arrow.png
ImageTint=255,212,0,255
X=(70*#Escala#)
Y=(195*#Escala#)
W=(10*#Escala#)
H=(10*#Escala#)
DynamicVariables=1
Hidden=1

[Indice10Icono]
Group=Explorador
Meter=IMAGE
ImageName=#@#Images\MyPlayer\ic_arrow.png
ImageTint=255,212,0,255
X=(70*#Escala#)
Y=(208*#Escala#)
W=(10*#Escala#)
H=(10*#Escala#)
DynamicVariables=1
Hidden=1

[Indice1Info]
Group=Explorador
MeasureName=mIndice1Nombre
Meter=STRING
MeterStyle=ST-Texto_2
StringEffect=None
StringAlign=Left
FontSize=(7*#Escala#)
X=(85*#Escala#)
Y=(90*#Escala#)
W=(155*#Escala#)
H=(13*#Escala#)
MouseOverAction=[!SetOption #CURRENTSECTION# StringStyle Bold][!UpdateMeter #CURRENTSECTION#][!Redraw]
MouseLeaveAction=[!SetOption #CURRENTSECTION# StringStyle Normal][!UpdateMeter #CURRENTSECTION#][!Redraw]
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!CommandMeasure mIndice1Nombre "FollowPath"][!UpdateMeasure mDireccion][!UpdateMeasureGroup Carpetas][!UpdateMeter *][!Redraw]
RightMouseUpAction=!CommandMeasure mIndice1Nombre "ContextMenu"
Hidden=1

[Indice2Info]
Group=Explorador
MeasureName=mIndice2Nombre
Meter=STRING
MeterStyle=ST-Texto_2
StringEffect=None
StringAlign=Left
FontSize=(7*#Escala#)
X=(85*#Escala#)
Y=(103*#Escala#)
W=(155*#Escala#)
H=(13*#Escala#)
MouseOverAction=[!SetOption #CURRENTSECTION# StringStyle Bold][!UpdateMeter #CURRENTSECTION#][!Redraw]
MouseLeaveAction=[!SetOption #CURRENTSECTION# StringStyle Normal][!UpdateMeter #CURRENTSECTION#][!Redraw]
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!CommandMeasure mIndice2Nombre "FollowPath"][!UpdateMeasure mDireccion][!UpdateMeasureGroup Carpetas][!UpdateMeter *][!Redraw]
RightMouseUpAction=!CommandMeasure mIndice2Nombre "ContextMenu"
Hidden=1

[Indice3Info]
Group=Explorador
MeasureName=mIndice3Nombre
Meter=STRING
MeterStyle=ST-Texto_2
StringEffect=None
StringAlign=Left
FontSize=(7*#Escala#)
X=(85*#Escala#)
Y=(116*#Escala#)
W=(155*#Escala#)
H=(13*#Escala#)
MouseOverAction=[!SetOption #CURRENTSECTION# StringStyle Bold][!UpdateMeter #CURRENTSECTION#][!Redraw]
MouseLeaveAction=[!SetOption #CURRENTSECTION# StringStyle Normal][!UpdateMeter #CURRENTSECTION#][!Redraw]
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!CommandMeasure mIndice3Nombre "FollowPath"][!UpdateMeasure mDireccion][!UpdateMeasureGroup Carpetas][!UpdateMeter *][!Redraw]
RightMouseUpAction=!CommandMeasure mIndice3Nombre "ContextMenu"
Hidden=1

[Indice4Info]
Group=Explorador
MeasureName=mIndice4Nombre
Meter=STRING
MeterStyle=ST-Texto_2
StringEffect=None
StringAlign=Left
FontSize=(7*#Escala#)
X=(85*#Escala#)
Y=(129*#Escala#)
W=(155*#Escala#)
H=(13*#Escala#)
MouseOverAction=[!SetOption #CURRENTSECTION# StringStyle Bold][!UpdateMeter #CURRENTSECTION#][!Redraw]
MouseLeaveAction=[!SetOption #CURRENTSECTION# StringStyle Normal][!UpdateMeter #CURRENTSECTION#][!Redraw]
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!CommandMeasure mIndice4Nombre "FollowPath"][!UpdateMeasure mDireccion][!UpdateMeasureGroup Carpetas][!UpdateMeter *][!Redraw]
RightMouseUpAction=!CommandMeasure mIndice4Nombre "ContextMenu"
Hidden=1

[Indice5Info]
Group=Explorador
MeasureName=mIndice5Nombre
Meter=STRING
MeterStyle=ST-Texto_2
StringEffect=None
StringAlign=Left
FontSize=(7*#Escala#)
X=(85*#Escala#)
Y=(142*#Escala#)
W=(155*#Escala#)
H=(13*#Escala#)
MouseOverAction=[!SetOption #CURRENTSECTION# StringStyle Bold][!UpdateMeter #CURRENTSECTION#][!Redraw]
MouseLeaveAction=[!SetOption #CURRENTSECTION# StringStyle Normal][!UpdateMeter #CURRENTSECTION#][!Redraw]
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!CommandMeasure mIndice5Nombre "FollowPath"][!UpdateMeasure mDireccion][!UpdateMeasureGroup Carpetas][!UpdateMeter *][!Redraw]
RightMouseUpAction=!CommandMeasure mIndice5Nombre "ContextMenu"
Hidden=1

[Indice6Info]
Group=Explorador
MeasureName=mIndice6Nombre
Meter=STRING
MeterStyle=ST-Texto_2
StringEffect=None
StringAlign=Left
FontSize=(7*#Escala#)
X=(85*#Escala#)
Y=(155*#Escala#)
W=(155*#Escala#)
H=(13*#Escala#)
MouseOverAction=[!SetOption #CURRENTSECTION# StringStyle Bold][!UpdateMeter #CURRENTSECTION#][!Redraw]
MouseLeaveAction=[!SetOption #CURRENTSECTION# StringStyle Normal][!UpdateMeter #CURRENTSECTION#][!Redraw]
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!CommandMeasure mIndice6Nombre "FollowPath"][!UpdateMeasure mDireccion][!UpdateMeasureGroup Carpetas][!UpdateMeter *][!Redraw]
RightMouseUpAction=!CommandMeasure mIndice6Nombre "ContextMenu"
Hidden=1

[Indice7Info]
Group=Explorador
MeasureName=mIndice7Nombre
Meter=STRING
MeterStyle=ST-Texto_2
StringEffect=None
StringAlign=Left
FontSize=(7*#Escala#)
X=(85*#Escala#)
Y=(168*#Escala#)
W=(155*#Escala#)
H=(13*#Escala#)
MouseOverAction=[!SetOption #CURRENTSECTION# StringStyle Bold][!UpdateMeter #CURRENTSECTION#][!Redraw]
MouseLeaveAction=[!SetOption #CURRENTSECTION# StringStyle Normal][!UpdateMeter #CURRENTSECTION#][!Redraw]
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!CommandMeasure mIndice7Nombre "FollowPath"][!UpdateMeasure mDireccion][!UpdateMeasureGroup Carpetas][!UpdateMeter *][!Redraw]
RightMouseUpAction=!CommandMeasure mIndice7Nombre "ContextMenu"
Hidden=1

[Indice8Info]
Group=Explorador
MeasureName=mIndice8Nombre
Meter=STRING
MeterStyle=ST-Texto_2
StringEffect=None
StringAlign=Left
FontSize=(7*#Escala#)
X=(85*#Escala#)
Y=(181*#Escala#)
W=(155*#Escala#)
H=(13*#Escala#)
MouseOverAction=[!SetOption #CURRENTSECTION# StringStyle Bold][!UpdateMeter #CURRENTSECTION#][!Redraw]
MouseLeaveAction=[!SetOption #CURRENTSECTION# StringStyle Normal][!UpdateMeter #CURRENTSECTION#][!Redraw]
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!CommandMeasure mIndice8Nombre "FollowPath"][!UpdateMeasure mDireccion][!UpdateMeasureGroup Carpetas][!UpdateMeter *][!Redraw]
RightMouseUpAction=!CommandMeasure mIndice8Nombre "ContextMenu"
Hidden=1

[Indice9Info]
Group=Explorador
MeasureName=mIndice9Nombre
Meter=STRING
MeterStyle=ST-Texto_2
StringEffect=None
StringAlign=Left
FontSize=(7*#Escala#)
X=(85*#Escala#)
Y=(194*#Escala#)
W=(155*#Escala#)
H=(13*#Escala#)
MouseOverAction=[!SetOption #CURRENTSECTION# StringStyle Bold][!UpdateMeter #CURRENTSECTION#][!Redraw]
MouseLeaveAction=[!SetOption #CURRENTSECTION# StringStyle Normal][!UpdateMeter #CURRENTSECTION#][!Redraw]
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!CommandMeasure mIndice9Nombre "FollowPath"][!UpdateMeasure mDireccion][!UpdateMeasureGroup Carpetas][!UpdateMeter *][!Redraw]
RightMouseUpAction=!CommandMeasure mIndice9Nombre "ContextMenu"
Hidden=1

[Indice10Info]
Group=Explorador
MeasureName=mIndice10Nombre
Meter=STRING
MeterStyle=ST-Texto_2
StringEffect=None
StringAlign=Left
FontSize=(7*#Escala#)
X=(85*#Escala#)
Y=(207*#Escala#)
W=(155*#Escala#)
H=(13*#Escala#)
MouseOverAction=[!SetOption #CURRENTSECTION# StringStyle Bold][!UpdateMeter #CURRENTSECTION#][!Redraw]
MouseLeaveAction=[!SetOption #CURRENTSECTION# StringStyle Normal][!UpdateMeter #CURRENTSECTION#][!Redraw]
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!CommandMeasure mIndice10Nombre "FollowPath"][!UpdateMeasure mDireccion][!UpdateMeasureGroup Carpetas][!UpdateMeter *][!Redraw]
RightMouseUpAction=!CommandMeasure mIndice10Nombre "ContextMenu"
Hidden=1

[BotonVolver]
Group=Explorador
Meter=IMAGE
ImageName=#@#Images\MyPlayer\bt_back.png
ImageTint=255,212,0,255
X=(85*#Escala#)
Y=(232*#Escala#)
W=(18*#Escala#)
H=(18*#Escala#)
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!CommandMeasure mDireccion "PreviousFolder"][!UpdateMeasure mDireccion][!UpdateMeasureGroup Carpetas][!UpdateMeter *][!Redraw]
DynamicVariables=1
Hidden=1

[BotonBajar]
Group=Explorador
Meter=IMAGE
ImageName=#@#Images\MyPlayer\bt_down.png
ImageTint=255,212,0,255
X=(125*#Escala#)
Y=(230*#Escala#)
W=(20*#Escala#)
H=(20*#Escala#)
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!CommandMeasure mDireccion "PageDown"][!UpdateMeasure mDireccion][!UpdateMeasureGroup Carpetas][!UpdateMeter *][!Redraw]
DynamicVariables=1
Hidden=1

[BotonSubir]
Group=Explorador
Meter=IMAGE
ImageName=#@#Images\MyPlayer\bt_up.png
ImageTint=255,212,0,255
X=(165*#Escala#)
Y=(230*#Escala#)
W=(20*#Escala#)
H=(20*#Escala#)
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!CommandMeasure mDireccion "PageUp"][!UpdateMeasure mDireccion][!UpdateMeasureGroup Carpetas][!UpdateMeter *][!Redraw]
DynamicVariables=1
Hidden=1

[BotonAbrir]
Group=Explorador
Meter=IMAGE
ImageName=#@#Images\MyPlayer\ic_folder.png
ImageTint=255,212,0,255
X=(205*#Escala#)
Y=(232*#Escala#)
W=(20*#Escala#)
H=(20*#Escala#)
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["[mDireccion]"]
DynamicVariables=1
Hidden=1

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
LeftMouseUpAction=[Play #@#Sounds\vibrador2.wav][!HideMeter Icono_MenuOff][!ShowMeter Icono_MenuOn][!HideMeter Icono_AtrasOn][!ShowMeter Icono_AtrasOff][!HideMeterGroup Pantalla][!HideMeterGroup Busqueda][!HideMeterGroup Explorador][!HideMeterGroup Letras][!HideMeterGroup BotonesOn][!HideMeter SolidoFondo][!ShowMeterGroup Menu][!HideMeter Icono_Ajustes][!Redraw]
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
LeftMouseUpAction=[Play #@#Sounds\vibrador2.wav][!HideMeter Icono_MenuOn][!ShowMeter Icono_MenuOff][!HideMeter Icono_AtrasOn][!ShowMeter Icono_AtrasOff][!HideMeterGroup Pantalla][!ShowMeterGroup #AppSmp#][!ShowMeter Icono_Ajustes][!Redraw]
DynamicVariables=1
UpdateDivider=-1
Hidden=1

[Icono_Ajustes]
Group=AP_MyPlayer | Pantalla
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
