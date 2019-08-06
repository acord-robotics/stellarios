[Metadata]
Name=Smartphone
Version=1.0
Information=App MyReader
Author=HiTBiT-PA
License=Creative Commons Attribution-Non-commercial-Share Alike 3.0
Website=http://hitbit-pa.deviantart.com/

[Variables]
@include=#@#Measures\mMReader #MyReader#.inc
@include2=#@#Measures\Measures Dock.inc

[FondoMyReader]
Group=Ap_MyReader | Pantalla
Meter=SHAPE
Shape=Rectangle (47*#Escala#),(26*#Escala#),(212*#Escala#),(392*#Escala#),(14*#Escala#),(14*#Escala#) | Fill Color 32,103,178,255 | Stroke Color 0,0,0,0
Shape2=Rectangle (47*#Escala#),(55*#Escala#),(212*#Escala#),(270*#Escala#),(1*#Escala#),(1*#Escala#) | Fill Color #CLFondo# | Stroke Color 0,0,0,0
DynamicVariables=1

[MascaraFoto]
Group=Ap_MyReader | Pantalla
Meter=SHAPE
Shape=Rectangle (49*#Escala#),(111*#Escala#),(208*#Escala#),(141*#Escala#),(6*#Escala#),(6*#Escala#) | Fill Color 24,24,24,255 | Stroke Color 0,0,0,0
DynamicVariables=1
UpdateDivider=-1

[MascaraLogo]
Group=Ap_MyReader | Pantalla
Meter=SHAPE
Shape=Rectangle (52*#Escala#),(60*#Escala#),(45*#Escala#),(45*#Escala#),(6*#Escala#),(6*#Escala#) | Fill Color 24,24,24,255 | Stroke Color 0,0,0,0
DynamicVariables=1
UpdateDivider=-1

[Foto_1]
Group=Display1 | Todos
MeasureName=mFoto_1
Meter=IMAGE
MeterStyle=ST-Foto
Hidden=1

[Foto_2]
Group=Display2 | Todos
MeasureName=mFoto_2
Meter=IMAGE
MeterStyle=ST-Foto
Hidden=1

[Foto_3]
Group=Display3 | Todos
MeasureName=mFoto_3
Meter=IMAGE
MeterStyle=ST-Foto
Hidden=1

[Foto_4]
Group=Display4 | Todos
MeasureName=mFoto_4
Meter=IMAGE
MeterStyle=ST-Foto
Hidden=1

[Foto_5]
Group=Display5 | Todos
MeasureName=mFoto_5
Meter=IMAGE
MeterStyle=ST-Foto
Hidden=1

[Foto_6]
Group=Display6 | Todos
MeasureName=mFoto_6
Meter=IMAGE
MeterStyle=ST-Foto
Hidden=1

[Foto_7]
Group=Display7 | Todos
MeasureName=mFoto_7
Meter=IMAGE
MeterStyle=ST-Foto
Hidden=1

[Foto_8]
Group=Display8 | Todos
MeasureName=mFoto_8
Meter=IMAGE
MeterStyle=ST-Foto
Hidden=1

[Foto_9]
Group=Display9 | Todos
MeasureName=mFoto_9
Meter=IMAGE
MeterStyle=ST-Foto
Hidden=1

[Foto_10]
Group=Display10 | Todos
MeasureName=mFoto_10
Meter=IMAGE
MeterStyle=ST-Foto
Hidden=1

[Logo]
Group=AP_MyReader | Pantalla | Datos
Meter=IMAGE
ImageName=#@#Images\MyReader\#MRLogo#.png
Container=MascaraLogo
X=(52*#Escala#)
Y=(60*#Escala#)
W=(46*#Escala#)
H=(46*#Escala#)
DynamicVariables=1
UpdateDivider=-1

[Cristal]
Meter=IMAGE
ImageName=#@#Images\Suite\glass.png
X=(43*#Escala#)
Y=(5*#Escala#)
W=(222*#Escala#)
H=(446*#Escala#)
DynamicVariables=1
UpdateDivider=-1

[Sitio]
Group=AP_MyReader | Pantalla | Datos
Meter=STRING
MeterStyle=ST-Texto_2
StringAlign=Left
StringEffect=None
FontColor=32,108,178,255
FontSize=(11*#Escala#)
X=(102*#Escala#)
Y=(60*#Escala#)
W=(152*#Escala#)
H=(22*#Escala#)
Text=#MRNombre#

[Fecha_1]
Group=Display1 | Todos
MeasureName=mFecha_1
Meter=STRING
MeterStyle=ST-Fecha
Hidden=1

[Titulo_1]
Group=Display1 | Todos
MeasureName=mTitulo_1
Meter=STRING
MeterStyle=ST-Titulo
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["[mEnlace_1]"]
Hidden=1

[Fecha_2]
Group=Display2 | Todos
MeasureName=mFecha_2
Meter=STRING
MeterStyle=ST-Fecha
Hidden=1

[Titulo_2]
Group=Display2 | Todos
MeasureName=mTitulo_2
Meter=STRING
MeterStyle=ST-Titulo
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["[mEnlace_2]"]
Hidden=1

[Fecha_3]
Group=Display3 | Todos
MeasureName=mFecha_3
Meter=STRING
MeterStyle=ST-Fecha
Hidden=1

[Titulo_3]
Group=Display3 | Todos
MeasureName=mTitulo_3
Meter=STRING
MeterStyle=ST-Titulo
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["[mEnlace_3]"]
Hidden=1

[Fecha_4]
Group=Display4 | Todos
MeasureName=mFecha_4
Meter=STRING
MeterStyle=ST-Fecha
Hidden=1

[Titulo_4]
Group=Display4 | Todos
MeasureName=mTitulo_4
Meter=STRING
MeterStyle=ST-Titulo
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["[mEnlace_4]"]
Hidden=1

[Fecha_5]
Group=Display5 | Todos
MeasureName=mFecha_5
Meter=STRING
MeterStyle=ST-Fecha
Hidden=1

[Titulo_5]
Group=Display5 | Todos
MeasureName=mTitulo_5
Meter=STRING
MeterStyle=ST-Titulo
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["[mEnlace_5]"]
Hidden=1

[Fecha_6]
Group=Display6 | Todos
MeasureName=mFecha_6
Meter=STRING
MeterStyle=ST-Fecha
Hidden=1

[Titulo_6]
Group=Display6 | Todos
MeasureName=mTitulo_6
Meter=STRING
MeterStyle=ST-Titulo
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["[mEnlace_6]"]
Hidden=1

[Fecha_7]
Group=Display7 | Todos
MeasureName=mFecha_7
Meter=STRING
MeterStyle=ST-Fecha
Hidden=1

[Titulo_7]
Group=Display7 | Todos
MeasureName=mTitulo_7
Meter=STRING
MeterStyle=ST-Titulo
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["[mEnlace_7]"]
Hidden=1

[Fecha_8]
Group=Display8 | Todos
MeasureName=mFecha_8
Meter=STRING
MeterStyle=ST-Fecha
Hidden=1

[Titulo_8]
Group=Display8 | Todos
MeasureName=mTitulo_8
Meter=STRING
MeterStyle=ST-Titulo
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["[mEnlace_8]"]
Hidden=1

[Fecha_9]
Group=Display9 | Todos
MeasureName=mFecha_9
Meter=STRING
MeterStyle=ST-Fecha
Hidden=1

[Titulo_9]
Group=Display9 | Todos
MeasureName=mTitulo_9
Meter=STRING
MeterStyle=ST-Titulo
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["[mEnlace_9]"]
Hidden=1

[Fecha_10]
Group=Display10 | Todos
MeasureName=mFecha_10
Meter=STRING
MeterStyle=ST-Fecha
Hidden=1

[Titulo_10]
Group=Display10 | Todos
MeasureName=mTitulo_10
Meter=STRING
MeterStyle=ST-Titulo
LeftMouseUpAction=[Play #@#Sounds\tap.wav]["[mEnlace_10]"]
Hidden=1

[Boton_Foto1_Off]
Group=AP_MyReader | Pantalla | Datos
Meter=IMAGE
ImageName=#@#Images\MyReader\bt_page.png
X=(86*#Escala#)
Y=(340*#Escala#)
W=(10*#Escala#)
H=(10*#Escala#)
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!HideMeterGroup Todos][!ShowMeterGroup Display1]
DynamicVariables=1
UpdateDivider=-1

[Boton_Foto2_Off]
Group=AP_MyReader | Pantalla | Datos
Meter=IMAGE
ImageName=#@#Images\MyReader\bt_page.png
X=(100*#Escala#)
Y=(340*#Escala#)
W=(10*#Escala#)
H=(10*#Escala#)
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!HideMeterGroup Todos][!ShowMeterGroup Display2]
DynamicVariables=1
UpdateDivider=-1

[Boton_Foto3_Off]
Group=AP_MyReader | Pantalla | Datos
Meter=IMAGE
ImageName=#@#Images\MyReader\bt_page.png
X=(114*#Escala#)
Y=(340*#Escala#)
W=(10*#Escala#)
H=(10*#Escala#)
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!HideMeterGroup Todos][!ShowMeterGroup Display3]
DynamicVariables=1
UpdateDivider=-1

[Boton_Foto4_Off]
Group=AP_MyReader | Pantalla | Datos
Meter=IMAGE
ImageName=#@#Images\MyReader\bt_page.png
X=(128*#Escala#)
Y=(340*#Escala#)
W=(10*#Escala#)
H=(10*#Escala#)
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!HideMeterGroup Todos][!ShowMeterGroup Display4]
DynamicVariables=1
UpdateDivider=-1

[Boton_Foto5_Off]
Group=AP_MyReader | Pantalla | Datos
Meter=IMAGE
ImageName=#@#Images\MyReader\bt_page.png
X=(142*#Escala#)
Y=(340*#Escala#)
W=(10*#Escala#)
H=(10*#Escala#)
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!HideMeterGroup Todos][!ShowMeterGroup Display5]
DynamicVariables=1
UpdateDivider=-1

[Boton_Foto6_Off]
Group=AP_MyReader | Pantalla | Datos
Meter=IMAGE
ImageName=#@#Images\MyReader\bt_page.png
X=(156*#Escala#)
Y=(340*#Escala#)
W=(10*#Escala#)
H=(10*#Escala#)
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!HideMeterGroup Todos][!ShowMeterGroup Display6]
DynamicVariables=1
UpdateDivider=-1

[Boton_Foto7_Off]
Group=AP_MyReader | Pantalla | Datos
Meter=IMAGE
ImageName=#@#Images\MyReader\bt_page.png
X=(170*#Escala#)
Y=(340*#Escala#)
W=(10*#Escala#)
H=(10*#Escala#)
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!HideMeterGroup Todos][!ShowMeterGroup Display7]
DynamicVariables=1
UpdateDivider=-1

[Boton_Foto8_Off]
Group=AP_MyReader | Pantalla | Datos
Meter=IMAGE
ImageName=#@#Images\MyReader\bt_page.png
X=(184*#Escala#)
Y=(340*#Escala#)
W=(10*#Escala#)
H=(10*#Escala#)
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!HideMeterGroup Todos][!ShowMeterGroup Display8]
DynamicVariables=1
UpdateDivider=-1

[Boton_Foto9_Off]
Group=AP_MyReader | Pantalla | Datos
Meter=IMAGE
ImageName=#@#Images\MyReader\bt_page.png
X=(198*#Escala#)
Y=(340*#Escala#)
W=(10*#Escala#)
H=(10*#Escala#)
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!HideMeterGroup Todos][!ShowMeterGroup Display9]
DynamicVariables=1
UpdateDivider=-1

[Boton_Foto10_Off]
Group=AP_MyReader | Pantalla | Datos
Meter=IMAGE
ImageName=#@#Images\MyReader\bt_page.png
X=(212*#Escala#)
Y=(340*#Escala#)
W=(10*#Escala#)
H=(10*#Escala#)
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!HideMeterGroup Todos][!ShowMeterGroup Display10]
DynamicVariables=1
UpdateDivider=-1

[Boton_Foto1_On]
Group=Display1 | Todos
Meter=IMAGE
ImageName=#@#Images\MyReader\bt_selected.png
X=(86*#Escala#)
Y=(340*#Escala#)
W=(10*#Escala#)
H=(10*#Escala#)
DynamicVariables=1
UpdateDivider=-1

[Boton_Foto2_On]
Group=Display2 | Todos
Meter=IMAGE
ImageName=#@#Images\MyReader\bt_selected.png
X=(100*#Escala#)
Y=(340*#Escala#)
W=(10*#Escala#)
H=(10*#Escala#)
DynamicVariables=1
UpdateDivider=-1

[Boton_Foto3_On]
Group=Display3 | Todos
Meter=IMAGE
ImageName=#@#Images\MyReader\bt_selected.png
X=(114*#Escala#)
Y=(340*#Escala#)
W=(10*#Escala#)
H=(10*#Escala#)
DynamicVariables=1
UpdateDivider=-1

[Boton_Foto4_On]
Group=Display4 | Todos
Meter=IMAGE
ImageName=#@#Images\MyReader\bt_selected.png
X=(128*#Escala#)
Y=(340*#Escala#)
W=(10*#Escala#)
H=(10*#Escala#)
DynamicVariables=1
UpdateDivider=-1

[Boton_Foto5_On]
Group=Display5 | Todos
Meter=IMAGE
ImageName=#@#Images\MyReader\bt_selected.png
X=(142*#Escala#)
Y=(340*#Escala#)
W=(10*#Escala#)
H=(10*#Escala#)
DynamicVariables=1
UpdateDivider=-1

[Boton_Foto6_On]
Group=Display6 | Todos
Meter=IMAGE
ImageName=#@#Images\MyReader\bt_selected.png
X=(156*#Escala#)
Y=(340*#Escala#)
W=(10*#Escala#)
H=(10*#Escala#)
DynamicVariables=1
UpdateDivider=-1

[Boton_Foto7_On]
Group=Display7 | Todos
Meter=IMAGE
ImageName=#@#Images\MyReader\bt_selected.png
X=(170*#Escala#)
Y=(340*#Escala#)
W=(10*#Escala#)
H=(10*#Escala#)
DynamicVariables=1
UpdateDivider=-1

[Boton_Foto8_On]
Group=Display8 | Todos
Meter=IMAGE
ImageName=#@#Images\MyReader\bt_selected.png
X=(184*#Escala#)
Y=(340*#Escala#)
W=(10*#Escala#)
H=(10*#Escala#)
DynamicVariables=1
UpdateDivider=-1

[Boton_Foto9_On]
Group=Display9 | Todos
Meter=IMAGE
ImageName=#@#Images\MyReader\bt_selected.png
X=(198*#Escala#)
Y=(340*#Escala#)
W=(10*#Escala#)
H=(10*#Escala#)
DynamicVariables=1
UpdateDivider=-1

[Boton_Foto10_On]
Group=Display10 | Todos
Meter=IMAGE
ImageName=#@#Images\MyReader\bt_selected.png
X=(212*#Escala#)
Y=(340*#Escala#)
W=(10*#Escala#)
H=(10*#Escala#)
DynamicVariables=1
UpdateDivider=-1

[Boton_Siguiente]
Group=AP_MyReader | Datos
Meter=IMAGE
ImageName=#@#Images\MyReader\bt_next.png
X=(232*#Escala#)
Y=(360*#Escala#)
W=(16*#Escala#)
H=(16*#Escala#)
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!EnableMeasure mAleatorio][!UpdateMeasure mAleatorio]
DynamicVariables=1

[Boton_AjusteOff]
Group=Pantalla
Meter=IMAGE
ImageName=#@#Images\MyReader\bt_screen1.png
X=(60*#Escala#)
Y=(338*#Escala#)
W=(16*#Escala#)
H=(16*#Escala#)
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!WriteKeyValue Variables MRAjuste 1 "#@#Settings\Variables Suite.inc"][!SetVariable MRAjuste "1"][!UpdateMeterGroup Todos]
DynamicVariables=1
Hidden=1

[Boton_AjusteOn]
Group=Pantalla
Meter=IMAGE
ImageName=#@#Images\MyReader\bt_screen2.png
X=(60*#Escala#)
Y=(338*#Escala#)
W=(16*#Escala#)
H=(16*#Escala#)
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!WriteKeyValue Variables MRAjuste 0 "#@#Settings\Variables Suite.inc"][!SetVariable MRAjuste "0"][!UpdateMeterGroup Todos]
DynamicVariables=1
Hidden=1

[Boton_Blanco]
Group=Pantalla
Meter=IMAGE
ImageName=#@#Images\MyReader\bt_white.png
X=(60*#Escala#)
Y=(360*#Escala#)
W=(16*#Escala#)
H=(16*#Escala#)
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!WriteKeyValue Variables CLTexto 16,16,16,255 "#@#Settings\Variables Suite.inc"][!WriteKeyValue Variables CLFondo 232,232,232,255 "#@#Settings\Variables Suite.inc"][!SetVariable CLTexto "16,16,16,255"][!SetVariable CLFondo "232,232,232,255"][!WriteKeyValue Variables MRFondo 1 "#@#Settings\Variables Suite.inc"][!SetVariable MRFondo "1"][!UpdateMeterGroup Ap_MyReader]
DynamicVariables=1
Hidden=1

[Boton_Negro]
Group=Pantalla
Meter=IMAGE
ImageName=#@#Images\MyReader\bt_black.png
X=(60*#Escala#)
Y=(360*#Escala#)
W=(16*#Escala#)
H=(16*#Escala#)
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!WriteKeyValue Variables CLTexto 232,232,232,255 "#@#Settings\Variables Suite.inc"][!WriteKeyValue Variables CLFondo 16,16,16,255 "#@#Settings\Variables Suite.inc"][!SetVariable CLTexto "232,232,232,255"][!SetVariable CLFondo "16,16,16,255"][!WriteKeyValue Variables MRFondo 0 "#@#Settings\Variables Suite.inc"][!SetVariable MRFondo "0"][!UpdateMeterGroup Ap_MyReader]
DynamicVariables=1
Hidden=1

[Boton_PausaOff]
Group=AP_MyReader | Pantalla
Meter=IMAGE
ImageName=#@#Images\MyReader\bt_play.png
X=(232*#Escala#)
Y=(338*#Escala#)
W=(16*#Escala#)
H=(16*#Escala#)
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!ToggleMeasure mCambio][!HideMeter Boton_PausaOff][!ShowMeter Boton_PausaOn]
DynamicVariables=1
UpdateDivider=-1

[Boton_PausaOn]
Group=Pantalla
Meter=IMAGE
ImageName=#@#Images\MyReader\bt_pause.png
X=(232*#Escala#)
Y=(338*#Escala#)
W=(16*#Escala#)
H=(16*#Escala#)
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!HideMeter Icono_AjustesOn][!ShowMeter Icono_Ajustes][!HideMeterGroup SubMenuMR][!ToggleMeasure mCambio][!ShowMeter Boton_PausaOff][!HideMeter Boton_PausaOn]
DynamicVariables=1
UpdateDivider=-1
Hidden=1

[Boton_Menu_1]
Group=AP_MyReader | Pantalla | SubM
Meter=IMAGE
ImageName=#@#Images\MyReader\bt_menu1.png
X=(78*#Escala#)
Y=(387*#Escala#)
W=(24*#Escala#)
H=(24*#Escala#)
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!DisableMeasure mCambio][!DisableMeasure mEstadoPantalla][!DisableMeasure mEstadoFondo][!HideMeterGroup Todos][!HideMeter Boton_PausaOff][!HideMeter Boton_PausaOn][!HideMeter Boton_AjusteOff][!HideMeter Boton_AjusteOn][!HideMeter Boton_Blanco][!HideMeter Boton_Negro][!HideMeter Boton_Siguiente][!HideMeterGroup Datos][!HideMeterGroup MenuTodos][!ShowMeterGroup MenuMR1][!Redraw]
DynamicVariables=1
UpdateDivider=-1

[Boton_Menu_2]
Group=AP_MyReader | Pantalla | SubM
Meter=IMAGE
ImageName=#@#Images\MyReader\bt_menu2.png
X=(110*#Escala#)
Y=(387*#Escala#)
W=(24*#Escala#)
H=(24*#Escala#)
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!DisableMeasure mCambio][!DisableMeasure mEstadoPantalla][!DisableMeasure mEstadoFondo][!HideMeterGroup Todos][!HideMeter Boton_PausaOff][!HideMeter Boton_PausaOn][!HideMeter Boton_AjusteOff][!HideMeter Boton_AjusteOn][!HideMeter Boton_Blanco][!HideMeter Boton_Negro][!HideMeter Boton_Siguiente][!HideMeterGroup Datos][!HideMeterGroup MenuTodos][!ShowMeterGroup MenuMR2][!Redraw]
DynamicVariables=1
UpdateDivider=-1

[Boton_Menu_3]
Group=AP_MyReader | Pantalla | SubM
Meter=IMAGE
ImageName=#@#Images\MyReader\bt_menu3.png
X=(142*#Escala#)
Y=(387*#Escala#)
W=(24*#Escala#)
H=(24*#Escala#)
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!DisableMeasure mCambio][!DisableMeasure mEstadoPantalla][!DisableMeasure mEstadoFondo][!HideMeterGroup Todos][!HideMeter Boton_PausaOff][!HideMeter Boton_PausaOn][!HideMeter Boton_AjusteOff][!HideMeter Boton_AjusteOn][!HideMeter Boton_Blanco][!HideMeter Boton_Negro][!HideMeter Boton_Siguiente][!HideMeterGroup Datos][!HideMeterGroup MenuTodos][!ShowMeterGroup MenuMR3][!Redraw]
DynamicVariables=1
UpdateDivider=-1

[Boton_Menu_4]
Group=AP_MyReader | Pantalla | SubM
Meter=IMAGE
ImageName=#@#Images\MyReader\bt_menu4.png
X=(174*#Escala#)
Y=(387*#Escala#)
W=(24*#Escala#)
H=(24*#Escala#)
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!DisableMeasure mCambio][!DisableMeasure mEstadoPantalla][!DisableMeasure mEstadoFondo][!HideMeterGroup Todos][!HideMeter Boton_PausaOff][!HideMeter Boton_PausaOn][!HideMeter Boton_AjusteOff][!HideMeter Boton_AjusteOn][!HideMeter Boton_Blanco][!HideMeter Boton_Negro][!HideMeter Boton_Siguiente][!HideMeterGroup Datos][!HideMeterGroup MenuTodos][!ShowMeterGroup MenuMR4][!Redraw]
DynamicVariables=1
UpdateDivider=-1

[Boton_Menu_5]
Group=AP_MyReader | Pantalla | SubM
Meter=IMAGE
ImageName=#@#Images\MyReader\bt_menu5.png
X=(206*#Escala#)
Y=(387*#Escala#)
W=(24*#Escala#)
H=(24*#Escala#)
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!DisableMeasure mCambio][!DisableMeasure mEstadoPantalla][!DisableMeasure mEstadoFondo][!HideMeterGroup Todos][!HideMeter Boton_PausaOff][!HideMeter Boton_PausaOn][!HideMeter Boton_AjusteOff][!HideMeter Boton_AjusteOn][!HideMeter Boton_Blanco][!HideMeter Boton_Negro][!HideMeter Boton_Siguiente][!HideMeterGroup Datos][!HideMeterGroup MenuTodos][!ShowMeterGroup MenuMR5][!Redraw]
DynamicVariables=1
UpdateDivider=-1

[Boton_MRMenu_1On]
Group=MenuMR1 | MenuTodos
Meter=IMAGE
ImageName=#@#Images\MyReader\bt_menu1.png
X=(74*#Escala#)
Y=(379*#Escala#)
W=(32*#Escala#)
H=(32*#Escala#)
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!HideMeterGroup MenuTodos][!EnableMeasure mCambio][!EnableMeasure mEstadoPantalla][!EnableMeasure mEstadoFondo][!ShowMeter Boton_PausaOff][!ShowMeterGroup Datos][!Redraw]
DynamicVariables=1
UpdateDivider=-1
Hidden=1

[Icono_MR1_1]
Group=MenuMR1 | MenuTodos
Meter=IMAGE
ImageName=#@#Images\MyReader\music01.png
X=(59*#Escala#)
Y=(71*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!WriteKeyValue Variables MyReader music01 "#@#Settings\Variables Suite.inc"][!Refresh]
UpdateDivider=-1
Hidden=1

[Icono_MR1_2]
Group=MenuMR1 | MenuTodos
Meter=IMAGE
ImageName=#@#Images\MyReader\music02.png
X=(107*#Escala#)
Y=(71*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!WriteKeyValue Variables MyReader music02 "#@#Settings\Variables Suite.inc"][!Refresh]
UpdateDivider=-1
Hidden=1

[Icono_MR1_3]
Group=MenuMR1 | MenuTodos
Meter=IMAGE
ImageName=#@#Images\MyReader\music03.png
X=(155*#Escala#)
Y=(71*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!WriteKeyValue Variables MyReader music03 "#@#Settings\Variables Suite.inc"][!Refresh]
UpdateDivider=-1
Hidden=1

[Icono_MR1_4]
Group=MenuMR1 | MenuTodos
Meter=IMAGE
ImageName=#@#Images\MyReader\music04.png
X=(203*#Escala#)
Y=(71*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!WriteKeyValue Variables MyReader music04 "#@#Settings\Variables Suite.inc"][!Refresh]
UpdateDivider=-1
Hidden=1

[Icono_MR1_9]
Group=MenuMR1 | MenuTodos
Meter=IMAGE
ImageName=#@#Images\MyReader\movies01.png
X=(59*#Escala#)
Y=(167*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!WriteKeyValue Variables MyReader movies01 "#@#Settings\Variables Suite.inc"][!Refresh]
UpdateDivider=-1
Hidden=1

[Icono_MR1_10]
Group=MenuMR1 | MenuTodos
Meter=IMAGE
ImageName=#@#Images\MyReader\movies02.png
X=(107*#Escala#)
Y=(167*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!WriteKeyValue Variables MyReader movies02 "#@#Settings\Variables Suite.inc"][!Refresh]
UpdateDivider=-1
Hidden=1

[Icono_MR1_11]
Group=MenuMR1 | MenuTodos
Meter=IMAGE
ImageName=#@#Images\MyReader\movies03.png
X=(155*#Escala#)
Y=(167*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!WriteKeyValue Variables MyReader movies03 "#@#Settings\Variables Suite.inc"][!Refresh]
UpdateDivider=-1
Hidden=1

[Icono_MR1_12]
Group=MenuMR1 | MenuTodos
Meter=IMAGE
ImageName=#@#Images\MyReader\movies04.png
X=(203*#Escala#)
Y=(167*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!WriteKeyValue Variables MyReader movies04 "#@#Settings\Variables Suite.inc"][!Refresh]
UpdateDivider=-1
Hidden=1

[Icono_MR1_13]
Group=MenuMR1 | MenuTodos
Meter=IMAGE
ImageName=#@#Images\MyReader\movies05.png
X=(59*#Escala#)
Y=(215*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!WriteKeyValue Variables MyReader movies05 "#@#Settings\Variables Suite.inc"][!Refresh]
UpdateDivider=-1
Hidden=1

[Icono_MR1_14]
Group=MenuMR1 | MenuTodos
Meter=IMAGE
ImageName=#@#Images\MyReader\movies06.png
X=(107*#Escala#)
Y=(215*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!WriteKeyValue Variables MyReader movies06 "#@#Settings\Variables Suite.inc"][!Refresh]
UpdateDivider=-1
Hidden=1

[Icono_MR1_15]
Group=MenuMR1 | MenuTodos
Meter=IMAGE
ImageName=#@#Images\MyReader\movies07.png
X=(155*#Escala#)
Y=(215*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!WriteKeyValue Variables MyReader movies07 "#@#Settings\Variables Suite.inc"][!Refresh]
UpdateDivider=-1
Hidden=1

[Icono_MR1_16]
Group=MenuMR1 | MenuTodos
Meter=IMAGE
ImageName=#@#Images\MyReader\movies08.png
X=(203*#Escala#)
Y=(215*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!WriteKeyValue Variables MyReader movies08 "#@#Settings\Variables Suite.inc"][!Refresh]
UpdateDivider=-1
Hidden=1

[Boton_MRMenu_2On]
Group=MenuMR2 | MenuTodos
Meter=IMAGE
ImageName=#@#Images\MyReader\bt_menu2.png
X=(106*#Escala#)
Y=(379*#Escala#)
W=(32*#Escala#)
H=(32*#Escala#)
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!HideMeterGroup MenuTodos][!EnableMeasure mCambio][!EnableMeasure mEstadoPantalla][!EnableMeasure mEstadoFondo][!ShowMeter Boton_PausaOff][!ShowMeterGroup Datos][!Redraw]
DynamicVariables=1
UpdateDivider=-1
Hidden=1

[Icono_MR2_1]
Group=MenuMR2 | MenuTodos
Meter=IMAGE
ImageName=#@#Images\MyReader\tech01.png
X=(59*#Escala#)
Y=(71*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!WriteKeyValue Variables MyReader tech01 "#@#Settings\Variables Suite.inc"][!Refresh]
UpdateDivider=-1
Hidden=1

[Icono_MR2_2]
Group=MenuMR2 | MenuTodos
Meter=IMAGE
ImageName=#@#Images\MyReader\tech02.png
X=(107*#Escala#)
Y=(71*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!WriteKeyValue Variables MyReader tech02 "#@#Settings\Variables Suite.inc"][!Refresh]
UpdateDivider=-1
Hidden=1

[Icono_MR2_3]
Group=MenuMR2 | MenuTodos
Meter=IMAGE
ImageName=#@#Images\MyReader\tech03.png
X=(155*#Escala#)
Y=(71*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!WriteKeyValue Variables MyReader tech03 "#@#Settings\Variables Suite.inc"][!Refresh]
UpdateDivider=-1
Hidden=1

[Icono_MR2_4]
Group=MenuMR2 | MenuTodos
Meter=IMAGE
ImageName=#@#Images\MyReader\tech04.png
X=(203*#Escala#)
Y=(71*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!WriteKeyValue Variables MyReader tech04 "#@#Settings\Variables Suite.inc"][!Refresh]
UpdateDivider=-1
Hidden=1

[Icono_MR2_5]
Group=MenuMR2 | MenuTodos
Meter=IMAGE
ImageName=#@#Images\MyReader\tech05.png
X=(59*#Escala#)
Y=(119*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!WriteKeyValue Variables MyReader tech05 "#@#Settings\Variables Suite.inc"][!Refresh]
UpdateDivider=-1
Hidden=1

[Icono_MR2_6]
Group=MenuMR2 | MenuTodos
Meter=IMAGE
ImageName=#@#Images\MyReader\tech06.png
X=(107*#Escala#)
Y=(119*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!WriteKeyValue Variables MyReader tech06 "#@#Settings\Variables Suite.inc"][!Refresh]
UpdateDivider=-1
Hidden=1

[Icono_MR2_7]
Group=MenuMR2 | MenuTodos
Meter=IMAGE
ImageName=#@#Images\MyReader\tech07.png
X=(155*#Escala#)
Y=(119*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!WriteKeyValue Variables MyReader tech07 "#@#Settings\Variables Suite.inc"][!Refresh]
UpdateDivider=-1
Hidden=1

[Icono_MR2_8]
Group=MenuMR2 | MenuTodos
Meter=IMAGE
ImageName=#@#Images\MyReader\tech08.png
X=(203*#Escala#)
Y=(119*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!WriteKeyValue Variables MyReader tech08 "#@#Settings\Variables Suite.inc"][!Refresh]
UpdateDivider=-1
Hidden=1

[Icono_MR2_9]
Group=MenuMR2 | MenuTodos
Meter=IMAGE
ImageName=#@#Images\MyReader\tech09.png
X=(59*#Escala#)
Y=(167*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!WriteKeyValue Variables MyReader tech09 "#@#Settings\Variables Suite.inc"][!Refresh]
UpdateDivider=-1
Hidden=1

[Icono_MR2_10]
Group=MenuMR2 | MenuTodos
Meter=IMAGE
ImageName=#@#Images\MyReader\tech10.png
X=(107*#Escala#)
Y=(167*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!WriteKeyValue Variables MyReader tech10 "#@#Settings\Variables Suite.inc"][!Refresh]
UpdateDivider=-1
Hidden=1

[Icono_MR2_11]
Group=MenuMR2 | MenuTodos
Meter=IMAGE
ImageName=#@#Images\MyReader\tech11.png
X=(155*#Escala#)
Y=(167*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!WriteKeyValue Variables MyReader tech11 "#@#Settings\Variables Suite.inc"][!Refresh]
UpdateDivider=-1
Hidden=1

[Icono_MR2_12]
Group=MenuMR2 | MenuTodos
Meter=IMAGE
ImageName=#@#Images\MyReader\tech12.png
X=(203*#Escala#)
Y=(167*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!WriteKeyValue Variables MyReader tech12 "#@#Settings\Variables Suite.inc"][!Refresh]
UpdateDivider=-1
Hidden=1

[Icono_MR2_13]
Group=MenuMR2 | MenuTodos
Meter=IMAGE
ImageName=#@#Images\MyReader\tech13.png
X=(59*#Escala#)
Y=(215*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!WriteKeyValue Variables MyReader tech13 "#@#Settings\Variables Suite.inc"][!Refresh]
UpdateDivider=-1
Hidden=1

[Icono_MR2_14]
Group=MenuMR2 | MenuTodos
Meter=IMAGE
ImageName=#@#Images\MyReader\tech14.png
X=(107*#Escala#)
Y=(215*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!WriteKeyValue Variables MyReader tech14 "#@#Settings\Variables Suite.inc"][!Refresh]
UpdateDivider=-1
Hidden=1

[Icono_MR2_15]
Group=MenuMR2 | MenuTodos
Meter=IMAGE
ImageName=#@#Images\MyReader\tech15.png
X=(155*#Escala#)
Y=(215*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!WriteKeyValue Variables MyReader tech15 "#@#Settings\Variables Suite.inc"][!Refresh]
UpdateDivider=-1
Hidden=1

[Icono_MR2_16]
Group=MenuMR2 | MenuTodos
Meter=IMAGE
ImageName=#@#Images\MyReader\tech16.png
X=(203*#Escala#)
Y=(215*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!WriteKeyValue Variables MyReader tech16 "#@#Settings\Variables Suite.inc"][!Refresh]
UpdateDivider=-1
Hidden=1

[Icono_MR2_17]
Group=MenuMR2 | MenuTodos
Meter=IMAGE
ImageName=#@#Images\MyReader\tech17.png
X=(59*#Escala#)
Y=(263*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!WriteKeyValue Variables MyReader tech17 "#@#Settings\Variables Suite.inc"][!Refresh]
UpdateDivider=-1
Hidden=1

[Icono_MR2_18]
Group=MenuMR2 | MenuTodos
Meter=IMAGE
ImageName=#@#Images\MyReader\tech18.png
X=(107*#Escala#)
Y=(263*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!WriteKeyValue Variables MyReader tech18 "#@#Settings\Variables Suite.inc"][!Refresh]
UpdateDivider=-1
Hidden=1

[Icono_MR2_19]
Group=MenuMR2 | MenuTodos
Meter=IMAGE
ImageName=#@#Images\MyReader\tech19.png
X=(155*#Escala#)
Y=(263*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!WriteKeyValue Variables MyReader tech19 "#@#Settings\Variables Suite.inc"][!Refresh]
UpdateDivider=-1
Hidden=1

[Icono_MR2_20]
Group=MenuMR2 | MenuTodos
Meter=IMAGE
ImageName=#@#Images\MyReader\tech20.png
X=(203*#Escala#)
Y=(263*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!WriteKeyValue Variables MyReader tech20 "#@#Settings\Variables Suite.inc"][!Refresh]
UpdateDivider=-1
Hidden=1

[Boton_MRMenu_3On]
Group=MenuMR3 | MenuTodos
Meter=IMAGE
ImageName=#@#Images\MyReader\bt_menu3.png
X=(138*#Escala#)
Y=(379*#Escala#)
W=(32*#Escala#)
H=(32*#Escala#)
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!HideMeterGroup MenuTodos][!EnableMeasure mCambio][!EnableMeasure mEstadoPantalla][!EnableMeasure mEstadoFondo][!ShowMeter Boton_PausaOff][!ShowMeterGroup Datos][!Redraw]
DynamicVariables=1
UpdateDivider=-1
Hidden=1

[Icono_MR3_1]
Group=MenuMR3 | MenuTodos
Meter=IMAGE
ImageName=#@#Images\MyReader\life01.png
X=(59*#Escala#)
Y=(71*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!WriteKeyValue Variables MyReader life01 "#@#Settings\Variables Suite.inc"][!Refresh]
UpdateDivider=-1
Hidden=1

[Icono_MR3_2]
Group=MenuMR3 | MenuTodos
Meter=IMAGE
ImageName=#@#Images\MyReader\life02.png
X=(107*#Escala#)
Y=(71*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!WriteKeyValue Variables MyReader life02 "#@#Settings\Variables Suite.inc"][!Refresh]
UpdateDivider=-1
Hidden=1

[Icono_MR3_3]
Group=MenuMR3 | MenuTodos
Meter=IMAGE
ImageName=#@#Images\MyReader\life03.png
X=(155*#Escala#)
Y=(71*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!WriteKeyValue Variables MyReader life03 "#@#Settings\Variables Suite.inc"][!Refresh]
UpdateDivider=-1
Hidden=1

[Icono_MR3_4]
Group=MenuMR3 | MenuTodos
Meter=IMAGE
ImageName=#@#Images\MyReader\life04.png
X=(203*#Escala#)
Y=(71*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!WriteKeyValue Variables MyReader life04 "#@#Settings\Variables Suite.inc"][!Refresh]
UpdateDivider=-1
Hidden=1

[Icono_MR3_5]
Group=MenuMR3 | MenuTodos
Meter=IMAGE
ImageName=#@#Images\MyReader\life05.png
X=(59*#Escala#)
Y=(119*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!WriteKeyValue Variables MyReader life05 "#@#Settings\Variables Suite.inc"][!Refresh]
UpdateDivider=-1
Hidden=1

[Icono_MR3_6]
Group=MenuMR3 | MenuTodos
Meter=IMAGE
ImageName=#@#Images\MyReader\life06.png
X=(107*#Escala#)
Y=(119*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!WriteKeyValue Variables MyReader life06 "#@#Settings\Variables Suite.inc"][!Refresh]
UpdateDivider=-1
Hidden=1

[Icono_MR3_7]
Group=MenuMR3 | MenuTodos
Meter=IMAGE
ImageName=#@#Images\MyReader\life07.png
X=(155*#Escala#)
Y=(119*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!WriteKeyValue Variables MyReader life07 "#@#Settings\Variables Suite.inc"][!Refresh]
UpdateDivider=-1
Hidden=1

[Icono_MR3_8]
Group=MenuMR3 | MenuTodos
Meter=IMAGE
ImageName=#@#Images\MyReader\life08.png
X=(203*#Escala#)
Y=(119*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!WriteKeyValue Variables MyReader life08 "#@#Settings\Variables Suite.inc"][!Refresh]
UpdateDivider=-1
Hidden=1

[Icono_MR3_9]
Group=MenuMR3 | MenuTodos
Meter=IMAGE
ImageName=#@#Images\MyReader\life09.png
X=(59*#Escala#)
Y=(167*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!WriteKeyValue Variables MyReader life09 "#@#Settings\Variables Suite.inc"][!Refresh]
UpdateDivider=-1
Hidden=1

[Icono_MR3_10]
Group=MenuMR3 | MenuTodos
Meter=IMAGE
ImageName=#@#Images\MyReader\life10.png
X=(107*#Escala#)
Y=(167*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!WriteKeyValue Variables MyReader life10 "#@#Settings\Variables Suite.inc"][!Refresh]
UpdateDivider=-1
Hidden=1

[Icono_MR3_11]
Group=MenuMR3 | MenuTodos
Meter=IMAGE
ImageName=#@#Images\MyReader\life11.png
X=(155*#Escala#)
Y=(167*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!WriteKeyValue Variables MyReader life11 "#@#Settings\Variables Suite.inc"][!Refresh]
UpdateDivider=-1
Hidden=1

[Icono_MR3_12]
Group=MenuMR3 | MenuTodos
Meter=IMAGE
ImageName=#@#Images\MyReader\life12.png
X=(203*#Escala#)
Y=(167*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!WriteKeyValue Variables MyReader life12 "#@#Settings\Variables Suite.inc"][!Refresh]
UpdateDivider=-1
Hidden=1

[Boton_MRMenu_4On]
Group=MenuMR4 | MenuTodos
Meter=IMAGE
ImageName=#@#Images\MyReader\bt_menu4.png
X=(170*#Escala#)
Y=(379*#Escala#)
W=(32*#Escala#)
H=(32*#Escala#)
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!HideMeterGroup MenuTodos][!EnableMeasure mCambio][!EnableMeasure mEstadoPantalla][!EnableMeasure mEstadoFondo][!ShowMeter Boton_PausaOff][!ShowMeterGroup Datos][!Redraw]
DynamicVariables=1
UpdateDivider=-1
Hidden=1

[Icono_MR4_1]
Group=MenuMR4 | MenuTodos
Meter=IMAGE
ImageName=#@#Images\MyReader\news01.png
X=(59*#Escala#)
Y=(71*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!WriteKeyValue Variables MyReader news01 "#@#Settings\Variables Suite.inc"][!WriteKeyValue Variables URLFinal "http://feeds.bbci.co.uk/news/world/rss.xml" "#@#Settings\Variables Suite.inc"][!Refresh]
UpdateDivider=-1
Hidden=1

[Icono_MR4_2]
Group=MenuMR4 | MenuTodos
Meter=IMAGE
ImageName=#@#Images\MyReader\news02.png
X=(107*#Escala#)
Y=(71*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!WriteKeyValue Variables MyReader news02 "#@#Settings\Variables Suite.inc"][!WriteKeyValue Variables URLFinal "http://rss.cnn.com/rss/edition_world.rss" "#@#Settings\Variables Suite.inc"][!Refresh]
UpdateDivider=-1
Hidden=1

[Icono_MR4_3]
Group=MenuMR4 | MenuTodos
Meter=IMAGE
ImageName=#@#Images\MyReader\news03.png
X=(155*#Escala#)
Y=(71*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!WriteKeyValue Variables MyReader news03 "#@#Settings\Variables Suite.inc"][!Refresh]
UpdateDivider=-1
Hidden=1

[Icono_MR4_4]
Group=MenuMR4 | MenuTodos
Meter=IMAGE
ImageName=#@#Images\MyReader\news04.png
X=(203*#Escala#)
Y=(71*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!WriteKeyValue Variables MyReader news04 "#@#Settings\Variables Suite.inc"][!WriteKeyValue Variables URLFinal "http://rss.nytimes.com/services/xml/rss/nyt/US.xml" "#@#Settings\Variables Suite.inc"][!Refresh]
UpdateDivider=-1
Hidden=1

[Icono_MR4_5]
Group=MenuMR4 | MenuTodos
Meter=IMAGE
ImageName=#@#Images\MyReader\news05.png
X=(59*#Escala#)
Y=(119*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!WriteKeyValue Variables MyReader news05 "#@#Settings\Variables Suite.inc"][!WriteKeyValue Variables URLFinal "https://www.france24.com/fr/actualites/rss" "#@#Settings\Variables Suite.inc"][!Refresh]
UpdateDivider=-1
Hidden=1

[Icono_MR4_6]
Group=MenuMR4 | MenuTodos
Meter=IMAGE
ImageName=#@#Images\MyReader\news06.png
X=(107*#Escala#)
Y=(119*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!WriteKeyValue Variables MyReader news06 "#@#Settings\Variables Suite.inc"][!WriteKeyValue Variables URLFinal "https://www.lemonde.fr/rss/une.xml" "#@#Settings\Variables Suite.inc"][!Refresh]
UpdateDivider=-1
Hidden=1

[Icono_MR4_7]
Group=MenuMR4 | MenuTodos
Meter=IMAGE
ImageName=#@#Images\MyReader\news07.png
X=(155*#Escala#)
Y=(119*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!WriteKeyValue Variables MyReader news07 "#@#Settings\Variables Suite.inc"][!WriteKeyValue Variables URLFinal "https://www.bild.de/rss-feeds/rss-16725492,feed=news.bild.html" "#@#Settings\Variables Suite.inc"][!Refresh]
UpdateDivider=-1
Hidden=1

[Icono_MR4_8]
Group=MenuMR4 | MenuTodos
Meter=IMAGE
ImageName=#@#Images\MyReader\news08.png
X=(203*#Escala#)
Y=(119*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!WriteKeyValue Variables MyReader news08 "#@#Settings\Variables Suite.inc"][!Refresh]
UpdateDivider=-1
Hidden=1

[Icono_MR4_9]
Group=MenuMR4 | MenuTodos
Meter=IMAGE
ImageName=#@#Images\MyReader\news09.png
X=(59*#Escala#)
Y=(167*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!WriteKeyValue Variables MyReader news09 "#@#Settings\Variables Suite.inc"][!WriteKeyValue Variables URLFinal "http://ep00.epimg.net/rss/elpais/portada.xml" "#@#Settings\Variables Suite.inc"][!Refresh]
UpdateDivider=-1
Hidden=1

[Icono_MR4_10]
Group=MenuMR4 | MenuTodos
Meter=IMAGE
ImageName=#@#Images\MyReader\news10.png
X=(107*#Escala#)
Y=(167*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!WriteKeyValue Variables MyReader news10 "#@#Settings\Variables Suite.inc"][!WriteKeyValue Variables URLFinal "https://www.diarioinformacion.com/elementosInt/rss/21" "#@#Settings\Variables Suite.inc"][!Refresh]
UpdateDivider=-1
Hidden=1

[Icono_MR4_11]
Group=MenuMR4 | MenuTodos
Meter=IMAGE
ImageName=#@#Images\MyReader\news11.png
X=(155*#Escala#)
Y=(167*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!WriteKeyValue Variables MyReader news11 "#@#Settings\Variables Suite.inc"][!WriteKeyValue Variables URLFinal "https://www.ilsole24ore.com/rss/notizie.xml" "#@#Settings\Variables Suite.inc"][!Refresh]
UpdateDivider=-1
Hidden=1

[Icono_MR4_12]
Group=MenuMR4 | MenuTodos
Meter=IMAGE
ImageName=#@#Images\MyReader\news12.png
X=(203*#Escala#)
Y=(167*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!WriteKeyValue Variables MyReader news12 "#@#Settings\Variables Suite.inc"][!WriteKeyValue Variables URLFinal "https://www.theguardian.com/world/rss" "#@#Settings\Variables Suite.inc"][!Refresh]
UpdateDivider=-1
Hidden=1

[Boton_MRMenu_5On]
Group=MenuMR5 | MenuTodos
Meter=IMAGE
ImageName=#@#Images\MyReader\bt_menu5.png
X=(202*#Escala#)
Y=(379*#Escala#)
W=(32*#Escala#)
H=(32*#Escala#)
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!HideMeterGroup MenuTodos][!EnableMeasure mCambio][!EnableMeasure mEstadoPantalla][!EnableMeasure mEstadoFondo][!ShowMeter Boton_PausaOff][!ShowMeterGroup Datos][!Redraw]
DynamicVariables=1
UpdateDivider=-1
Hidden=1

[Icono_MR5_1]
Group=MenuMR5 | MenuTodos
Meter=IMAGE
ImageName=#@#Images\MyReader\pic01.png
X=(59*#Escala#)
Y=(71*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!WriteKeyValue Variables MyReader pic01 "#@#Settings\Variables Suite.inc"][!Refresh]
UpdateDivider=-1
Hidden=1

[Icono_MR5_2]
Group=MenuMR5 | MenuTodos
Meter=IMAGE
ImageName=#@#Images\MyReader\pic01.png
X=(107*#Escala#)
Y=(71*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!WriteKeyValue Variables MyReader pic02 "#@#Settings\Variables Suite.inc"][!Refresh]
UpdateDivider=-1
Hidden=1

[Icono_MR5_3]
Group=MenuMR5 | MenuTodos
Meter=IMAGE
ImageName=#@#Images\MyReader\pic01.png
X=(155*#Escala#)
Y=(71*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!WriteKeyValue Variables MyReader pic03 "#@#Settings\Variables Suite.inc"][!Refresh]
UpdateDivider=-1
Hidden=1

[Icono_MR5_4]
Group=MenuMR5 | MenuTodos
Meter=IMAGE
ImageName=#@#Images\MyReader\pic04.png
X=(203*#Escala#)
Y=(71*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!WriteKeyValue Variables MyReader pic04 "#@#Settings\Variables Suite.inc"][!Refresh]
UpdateDivider=-1
Hidden=1

[Icono_MR5_5]
Group=MenuMR5 | MenuTodos
Meter=IMAGE
ImageName=#@#Images\MyReader\pic05.png
X=(59*#Escala#)
Y=(119*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!WriteKeyValue Variables MyReader pic05 "#@#Settings\Variables Suite.inc"][!Refresh]
UpdateDivider=-1
Hidden=1

[Icono_MR5_6]
Group=MenuMR5 | MenuTodos
Meter=IMAGE
ImageName=#@#Images\MyReader\pic06.png
X=(107*#Escala#)
Y=(119*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!WriteKeyValue Variables MyReader pic06 "#@#Settings\Variables Suite.inc"][!Refresh]
UpdateDivider=-1
Hidden=1

[Icono_MR5_7]
Group=MenuMR5 | MenuTodos
Meter=IMAGE
ImageName=#@#Images\MyReader\pic07.png
X=(155*#Escala#)
Y=(119*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!WriteKeyValue Variables MyReader pic07 "#@#Settings\Variables Suite.inc"][!Refresh]
UpdateDivider=-1
Hidden=1

[Icono_MR5_8]
Group=MenuMR5 | MenuTodos
Meter=IMAGE
ImageName=#@#Images\MyReader\pic08.png
X=(203*#Escala#)
Y=(119*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!WriteKeyValue Variables MyReader pic08 "#@#Settings\Variables Suite.inc"][!Refresh]
UpdateDivider=-1
Hidden=1

[Icono_MR5_9]
Group=MenuMR5 | MenuTodos
Meter=IMAGE
ImageName=#@#Images\MyReader\pic09.png
X=(59*#Escala#)
Y=(167*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!WriteKeyValue Variables MyReader pic09 "#@#Settings\Variables Suite.inc"][!Refresh]
UpdateDivider=-1
Hidden=1

[Icono_MR5_10]
Group=MenuMR5 | MenuTodos
Meter=IMAGE
ImageName=#@#Images\MyReader\pic10.png
X=(107*#Escala#)
Y=(167*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!WriteKeyValue Variables MyReader pic10 "#@#Settings\Variables Suite.inc"][!Refresh]
UpdateDivider=-1
Hidden=1

[Icono_MR5_11]
Group=MenuMR5 | MenuTodos
Meter=IMAGE
ImageName=#@#Images\MyReader\pic11.png
X=(155*#Escala#)
Y=(167*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!WriteKeyValue Variables MyReader pic11 "#@#Settings\Variables Suite.inc"][!Refresh]
UpdateDivider=-1
Hidden=1

[Icono_MR5_12]
Group=MenuMR5 | MenuTodos
Meter=IMAGE
ImageName=#@#Images\MyReader\pic12.png
X=(203*#Escala#)
Y=(167*#Escala#)
W=(45*#Escala#)
H=(45*#Escala#)
DynamicVariables=1
LeftMouseUpAction=[Play #@#Sounds\tap.wav][!WriteKeyValue Variables MyReader pic12 "#@#Settings\Variables Suite.inc"][!Refresh]
UpdateDivider=-1
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
LeftMouseUpAction=[Play #@#Sounds\vibrador2.wav][!HideMeter Icono_MenuOff][!ShowMeter Icono_MenuOn][!HideMeter Icono_AtrasOn][!ShowMeter Icono_AtrasOff][!HideMeterGroup Pantalla][!DisableMeasure mCambio][!DisableMeasure mEstadoPantalla][!DisableMeasure mEstadoFondo][!HideMeter Icono_Ajustes][!HideMeter Icono_AjustesOn][!HideMeter Boton_Siguiente][!HideMeterGroup Todos][!HideMeterGroup MenuTodos][!HideMeterGroup SubMenuMR][!ShowMeterGroup Menu][!Redraw]
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
LeftMouseUpAction=[Play #@#Sounds\vibrador2.wav][!HideMeter Icono_MenuOn][!ShowMeter Icono_MenuOff][!HideMeter Icono_AtrasOn][!ShowMeter Icono_AtrasOff][!HideMeterGroup Pantalla][!EnableMeasure mCambio][!EnableMeasure mEstadoPantalla][!EnableMeasure mEstadoFondo][!ShowMeterGroup #AppSmp#][!ShowMeter Icono_Ajustes][!Redraw]
DynamicVariables=1
UpdateDivider=-1
Hidden=1

[Icono_Ajustes]
Group=AP_MyReader | Pantalla
Meter=IMAGE
ImageName=#@#Images\Suite\edit.png
ImageAlpha=164
X=(201*#Escala#)
Y=(429*#Escala#)
W=(14*#Escala#)
H=(14*#Escala#)
MouseOverAction=[!SetOption #CURRENTSECTION# ImageAlpha 255][!UpdateMeter #CURRENTSECTION#][!Redraw]
MouseLeaveAction=[!SetOption #CURRENTSECTION# ImageAlpha 164][!UpdateMeter #CURRENTSECTION#][!Redraw]
LeftMouseUpAction=[Play #@#Sounds\vibrador2.wav][!DisableMeasure mCambio][!DisableMeasure mEstadoPantalla][!DisableMeasure mEstadoFondo][!HideMeterGroup Todos][!HideMeter Boton_PausaOff][!HideMeter Boton_PausaOn][!HideMeter Icono_Ajustes][!ShowMeter Icono_AjustesOn][!HideMeter Boton_AjusteOff][!HideMeter Boton_AjusteOn][!HideMeter Boton_Blanco][!HideMeter Boton_Negro][!HideMeterGroup Datos][!HideMeterGroup SubM][!HideMeterGroup MenuTodos][!ShowMeter Logo][!ShowMeter Sitio][!ShowMeterGroup SubMenuMR][!Redraw]
DynamicVariables=1
UpdateDivider=-1

[Icono_AjustesOn]
Meter=IMAGE
ImageName=#@#Images\Suite\edit.png
ImageAlpha=255
X=(201*#Escala#)
Y=(429*#Escala#)
W=(14*#Escala#)
H=(14*#Escala#)
LeftMouseUpAction=[Play #@#Sounds\vibrador2.wav][!EnableMeasure mCambio][!EnableMeasure mEstadoPantalla][!EnableMeasure mEstadoFondo][!HideMeter Icono_AjustesOn][!ShowMeter Icono_Ajustes][!ShowMeter Boton_PausaOff][!ShowMeterGroup Datos][!ShowMeterGroup SubM][!HideMeterGroup SubMenuMR][!Redraw]
DynamicVariables=1
UpdateDivider=-1
Hidden=1

[Solido_SubMenu]
Group=SubMenuMR
Meter=SHAPE
Shape=Rectangle (73*#Escala#),(111*#Escala#),(160*#Escala#),(190*#Escala#),(6*#Escala#),(6*#Escala#) | Fill Color 32,103,178,255 | Stroke Color 0,0,0,0
DynamicVariables=1
UpdateDivider=-1
Hidden=1

[Ediciones]
Group=SubMenuMR
Meter=STRING
MeterStyle=ST-Texto_2
StringEffect=None
FontSize=(9*#Escala#)
X=(154*#Escala#)
Y=(118*#Escala#)
W=(150*#Escala#)
H=(16*#Escala#)
Text=SUBMENU
Hidden=1

[Edicion_1]
Group=SubMenuMR
Meter=STRING
MeterStyle=ST-Texto_2
FontColor=0,232,255,255
StringEffect=None
FontSize=(8*#Escala#)
X=(154*#Escala#)
Y=(140*#Escala#)
W=(150*#Escala#)
H=(16*#Escala#)
Text=#E1#
LeftMouseUpAction=[!WriteKeyValue Variables URLFinal #URL1# "#@#Settings\Variables Suite.inc"][!Refresh]
Hidden=1

[Edicion_2]
Group=SubMenuMR
Meter=STRING
MeterStyle=ST-Texto_2
FontColor=0,232,255,255
StringEffect=None
FontSize=(8*#Escala#)
X=(154*#Escala#)
Y=(160*#Escala#)
W=(150*#Escala#)
H=(16*#Escala#)
Text=#E2#
LeftMouseUpAction=[!WriteKeyValue Variables URLFinal #URL2# "#@#Settings\Variables Suite.inc"][!Refresh]
Hidden=1

[Edicion_3]
Group=SubMenuMR
Meter=STRING
MeterStyle=ST-Texto_2
FontColor=0,232,255,255
StringEffect=None
FontSize=(8*#Escala#)
X=(154*#Escala#)
Y=(180*#Escala#)
W=(150*#Escala#)
H=(16*#Escala#)
Text=#E3#
LeftMouseUpAction=[!WriteKeyValue Variables URLFinal #URL3# "#@#Settings\Variables Suite.inc"][!Refresh]
Hidden=1

[Edicion_4]
Group=SubMenuMR
Meter=STRING
MeterStyle=ST-Texto_2
FontColor=0,232,255,255
StringEffect=None
FontSize=(8*#Escala#)
X=(154*#Escala#)
Y=(200*#Escala#)
W=(150*#Escala#)
H=(16*#Escala#)
Text=#E4#
LeftMouseUpAction=[!WriteKeyValue Variables URLFinal #URL4# "#@#Settings\Variables Suite.inc"][!Refresh]
Hidden=1

[Edicion_5]
Group=SubMenuMR
Meter=STRING
MeterStyle=ST-Texto_2
FontColor=0,232,255,255
StringEffect=None
FontSize=(8*#Escala#)
X=(154*#Escala#)
Y=(220*#Escala#)
W=(150*#Escala#)
H=(16*#Escala#)
Text=#E5#
LeftMouseUpAction=[!WriteKeyValue Variables URLFinal #URL5# "#@#Settings\Variables Suite.inc"][!Refresh]
Hidden=1

[Edicion_6]
Group=SubMenuMR
Meter=STRING
MeterStyle=ST-Texto_2
FontColor=0,232,255,255
StringEffect=None
FontSize=(8*#Escala#)
X=(154*#Escala#)
Y=(240*#Escala#)
W=(150*#Escala#)
H=(16*#Escala#)
Text=#E6#
LeftMouseUpAction=[!WriteKeyValue Variables URLFinal #URL6# "#@#Settings\Variables Suite.inc"][!Refresh]
Hidden=1

[Edicion_7]
Group=SubMenuMR
Meter=STRING
MeterStyle=ST-Texto_2
FontColor=0,232,255,255
StringEffect=None
FontSize=(8*#Escala#)
X=(154*#Escala#)
Y=(260*#Escala#)
W=(150*#Escala#)
H=(16*#Escala#)
Text=#E7#
LeftMouseUpAction=[!WriteKeyValue Variables URLFinal #URL7# "#@#Settings\Variables Suite.inc"][!Refresh]
Hidden=1

[Edicion_8]
Group=SubMenuMR
Meter=STRING
MeterStyle=ST-Texto_2
FontColor=0,232,255,255
StringEffect=None
FontSize=(8*#Escala#)
X=(154*#Escala#)
Y=(280*#Escala#)
W=(150*#Escala#)
H=(16*#Escala#)
Text=#E8#
LeftMouseUpAction=[!WriteKeyValue Variables URLFinal #URL8# "#@#Settings\Variables Suite.inc"][!Refresh]
Hidden=1

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
