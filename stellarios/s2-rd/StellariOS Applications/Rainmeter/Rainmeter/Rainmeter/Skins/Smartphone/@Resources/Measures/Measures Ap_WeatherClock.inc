[Variables]
GetTempMax="(?iU).*<temp_maxima>(.*)</temp_maxima>"
GetTempMin="(?iU).*<temp_minima>(.*)</temp_minima>"
GetIcon2="(?iU).*<icono>(.*)</icono>"
GetDate2="(?iU).*<fecha_larga>(.*)</fecha_larga>"
AX1=175
AY1=75
AX2=201
AY2=101
AX3=207
AY3=131
AX4=201
AY4=162
AX5=175
AY5=188
AX6=132
AY6=197
AX7=89
AY7=188
AX8=64
AY8=162
AX9=58
AY9=131
AX10=64
AY10=101
AX11=89
AY11=75
AX12=132
AY12=66
ATX1=178
ATY1=103
ATX2=194
ATY2=118
ATX3=196
ATY3=138
ATX4=194
ATY4=158
ATX5=178
ATY5=173
ATX6=152
ATY6=178
ATX7=126
ATY7=173
ATX8=112
ATY8=158
ATX9=108
ATY9=138
ATX10=112
ATY10=118
ATX11=126
ATY11=103
ATX12=152
ATY12=98
X1=#AX1#
Y1=#AY1#
X2=#AX2#
Y2=#AY2#
X3=#AX3#
Y3=#AY3#
X4=#AX4#
Y4=#AY4#
X5=#AX5#
Y5=#AY5#
X6=#AX6#
Y6=#AY6#
X7=#AX7#
Y7=#AY7#
X8=#AX8#
Y8=#AY8#
X9=#AX9#
Y9=#AY9#
X10=#AX10#
Y10=#AY10#
X11=#AX11#
Y11=#AY11#
X12=#AX12#
Y12=#AY12#
TX1=#ATX1#
TY1=#ATY1#
TX2=#ATX2#
TY2=#ATY2#
TX3=#ATX3#
TY3=#ATY3#
TX4=#ATX4#
TY4=#ATY4#
TX5=#ATX5#
TY5=#ATY5#
TX6=#ATX6#
TY6=#ATY6#
TX7=#ATX7#
TY7=#ATY7#
TX8=#ATX8#
TY8=#ATY8#
TX9=#ATX9#
TY9=#ATY9#
TX10=#ATX10#
TY10=#ATY10#
TX11=#ATX11#
TY11=#ATY11#
TX12=#ATX12#
TY12=#ATY12#
Fecha="Lunes":"#Monday#","Martes":"#Tuesday#","Miércoles":"#Wednesday#","Jueves":"#Thursday#","Viernes":"#Friday#","Sábado":"#Saturday#","Domingo":"#Sunday#"
Condiciones="Despejado":"#Dsp#","Parcialmente nuboso":"#Pn#","con lluvias":"#Ll#","Muy nuboso":"#Mn#","Nubes dispersas":"#Nd#","Cubierto":"#Nu#","con tormentas":"#To#","con probabilidad de lluvias":"#pl#","con probabilidad de tormentas":"#pt#"
IconosTT="http://i5.tutiempo.net/wi/01/50/1.png":"32","http://i5.tutiempo.net/wi/01/50/2.png":"44","http://i5.tutiempo.net/wi/01/50/3.png":"20","http://i5.tutiempo.net/wi/01/50/4.png":"30","http://i5.tutiempo.net/wi/01/50/5.png":"30","http://i5.tutiempo.net/wi/01/50/6.png":"28","http://i5.tutiempo.net/wi/01/50/7.png":"26","http://i5.tutiempo.net/wi/01/50/8.png":"20","http://i5.tutiempo.net/wi/01/50/9.png":"19","http://i5.tutiempo.net/wi/01/50/10.png":"19","http://i5.tutiempo.net/wi/01/50/11.png":"23","http://i5.tutiempo.net/wi/01/50/12.png":"20","http://i5.tutiempo.net/wi/01/50/18.png":"8","http://i5.tutiempo.net/wi/01/50/19.png":"8","http://i5.tutiempo.net/wi/01/50/20.png":"12","http://i5.tutiempo.net/wi/01/50/21.png":"1","http://i5.tutiempo.net/wi/01/50/22.png":"1","http://i5.tutiempo.net/wi/01/50/23.png":"1","http://i5.tutiempo.net/wi/01/50/24.png":"17","http://i5.tutiempo.net/wi/01/50/25.png":"0","http://i5.tutiempo.net/wi/01/50/26.png":"24","http://i5.tutiempo.net/wi/01/50/27.png":"12","http://i5.tutiempo.net/wi/01/50/28.png":"5","http://i5.tutiempo.net/wi/01/50/29.png":"5","http://i5.tutiempo.net/wi/01/50/30.png":"5","http://i5.tutiempo.net/wi/01/50/31.png":"5","http://i5.tutiempo.net/wi/01/50/32.png":"12","http://i5.tutiempo.net/wi/01/50/33.png":"8","http://i5.tutiempo.net/wi/01/50/34.png":"45","http://i5.tutiempo.net/wi/01/50/1n.png":"31","http://i5.tutiempo.net/wi/01/50/2n.png":"27","http://i5.tutiempo.net/wi/01/50/3n.png":"27","http://i5.tutiempo.net/wi/01/50/4n.png":"27","http://i5.tutiempo.net/wi/01/50/5n.png":"27","http://i5.tutiempo.net/wi/01/50/6n.png":"29","http://i5.tutiempo.net/wi/01/50/7n.png":"29","http://i5.tutiempo.net/wi/01/50/33n.png":"45"

[mComprobarConexion]
Measure=Plugin
Plugin=SysInfo
SysInfoType=INTERNET_CONNECTIVITY
UpdateDivider=10
OnChangeAction=[!CommandMeasure mData "Update"][!CommandMeasure mData2 "Update"]

[mReloj]
Measure=Time

[mData]
Measure=WebParser
UpdateRate=1800
Url=http://xml.tutiempo.net/xml/#Codigo#.xml?lan=#Idioma#
RegExp=(?siU)^(.*)$

[mData2]
Measure=WebParser
UpdateRate=1800
Url=http://xml.tutiempo.net/xml/#Codigo#.xml
RegExp=(?siU)^(.*)$

[mCiudadParent]
Measure=WebParser
Url=[mData]
RegExp=#GetCity#

[mCiudad]
Measure=WebParser
Url=[mCiudadParent]
StringIndex=1

[mHora_00Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetHour#

[mCambio]
Measure=WebParser
Url=[mHora_00Parent]
StringIndex=1
DecodeCharacterReference=1
RegExpSubstitute=1
Substitute="(\w+):(\w+)":"\1"
IfCondition=(mCambio = 1) || (mCambio = 13)
IfTrueAction=[!SetVariable X1 "#AX1#"][!SetVariable Y1 "#AY1#"][!SetVariable X2 "#AX2#"][!SetVariable Y2 "#AY2#"][!SetVariable X3 "#AX3#"][!SetVariable Y3 "#AY3#"][!SetVariable X4 "#AX4#"][!SetVariable Y4 "#AY4#"][!SetVariable X5 "#AX5#"][!SetVariable Y5 "#AY5#"][!SetVariable X6 "#AX6#"][!SetVariable Y6 "#AY6#"][!SetVariable X7 "#AX7#"][!SetVariable Y7 "#AY7#"][!SetVariable X8 "#AX8#"][!SetVariable Y8 "#AY8#"][!SetVariable X9 "#AX9#"][!SetVariable Y9 "#AY9#"][!SetVariable X10 "#AX10#"][!SetVariable Y10 "#AY10#"][!SetVariable X11 "#AX11#"][!SetVariable Y11 "#AY11#"][!SetVariable X12 "#AX12#"][!SetVariable Y12 "#AY12#"][!SetVariable TX1 "#ATX1#"][!SetVariable TY1 "#ATY1#"][!SetVariable TX2 "#ATX2#"][!SetVariable TY2 "#ATY2#"][!SetVariable TX3 "#ATX3#"][!SetVariable TY3 "#ATY3#"][!SetVariable TX4 "#ATX4#"][!SetVariable TY4 "#ATY4#"][!SetVariable TX5 "#ATX5#"][!SetVariable TY5 "#ATY5#"][!SetVariable TX6 "#ATX6#"][!SetVariable TY6 "#ATY6#"][!SetVariable TX7 "#ATX7#"][!SetVariable TY7 "#ATY7#"][!SetVariable TX8 "#ATX8#"][!SetVariable TY8 "#ATY8#"][!SetVariable TX9 "#ATX9#"][!SetVariable TY9 "#ATY9#"][!SetVariable TX10 "#ATX10#"][!SetVariable TY10 "#ATY10#"][!SetVariable TX11 "#ATX11#"][!SetVariable TY11 "#ATY11#"][!SetVariable TX12 "#ATX12#"][!SetVariable TY12 "#ATY12#"][!UpdateMeterGroup Ap_TuTiempo][!RedrawGroup Ap_TuTiempo]
IfCondition2=(mCambio = 2) || (mCambio = 14)
IfTrueAction2=[!SetVariable X12 "#AX1#"][!SetVariable Y12 "#AY1#"][!SetVariable X1 "#AX2#"][!SetVariable Y1 "#AY2#"][!SetVariable X2 "#AX3#"][!SetVariable Y2 "#AY3#"][!SetVariable X3 "#AX4#"][!SetVariable Y3 "#AY4#"][!SetVariable X4 "#AX5#"][!SetVariable Y4 "#AY5#"][!SetVariable X5 "#AX6#"][!SetVariable Y5 "#AY6#"][!SetVariable X6 "#AX7#"][!SetVariable Y6 "#AY7#"][!SetVariable X7 "#AX8#"][!SetVariable Y7 "#AY8#"][!SetVariable X8 "#AX9#"][!SetVariable Y8 "#AY9#"][!SetVariable X9 "#AX10#"][!SetVariable Y9 "#AY10#"][!SetVariable X10 "#AX11#"][!SetVariable Y10 "#AY11#"][!SetVariable X11 "#AX12#"][!SetVariable Y11 "#AY12#"][!SetVariable TX12 "#ATX1#"][!SetVariable TY12 "#ATY1#"][!SetVariable TX1 "#ATX2#"][!SetVariable TY1 "#ATY2#"][!SetVariable TX2 "#ATX3#"][!SetVariable TY2 "#ATY3#"][!SetVariable TX3 "#ATX4#"][!SetVariable TY3 "#ATY4#"][!SetVariable TX4 "#ATX5#"][!SetVariable TY4 "#ATY5#"][!SetVariable TX5 "#ATX6#"][!SetVariable TY5 "#ATY6#"][!SetVariable TX6 "#ATX7#"][!SetVariable TY6 "#ATY7#"][!SetVariable TX7 "#ATX8#"][!SetVariable TY7 "#ATY8#"][!SetVariable TX8 "#ATX9#"][!SetVariable TY8 "#ATY9#"][!SetVariable TX9 "#ATX10#"][!SetVariable TY9 "#ATY10#"][!SetVariable TX10 "#ATX11#"][!SetVariable TY10 "#ATY11#"][!SetVariable TX11 "#ATX12#"][!SetVariable TY11 "#ATY12#"][!UpdateMeterGroup Ap_TuTiempo][!RedrawGroup Ap_TuTiempo]
IfCondition3=(mCambio = 3) || (mCambio = 15)
IfTrueAction3=[!SetVariable X11 "#AX1#"][!SetVariable Y11 "#AY1#"][!SetVariable X12 "#AX2#"][!SetVariable Y12 "#AY2#"][!SetVariable X1 "#AX3#"][!SetVariable Y1 "#AY3#"][!SetVariable X2 "#AX4#"][!SetVariable Y2 "#AY4#"][!SetVariable X3 "#AX5#"][!SetVariable Y3 "#AY5#"][!SetVariable X4 "#AX6#"][!SetVariable Y4 "#AY6#"][!SetVariable X5 "#AX7#"][!SetVariable Y5 "#AY7#"][!SetVariable X6 "#AX8#"][!SetVariable Y6 "#AY8#"][!SetVariable X7 "#AX9#"][!SetVariable Y7 "#AY9#"][!SetVariable X8 "#AX10#"][!SetVariable Y8 "#AY10#"][!SetVariable X9 "#AX11#"][!SetVariable Y9 "#AY11#"][!SetVariable X10 "#AX12#"][!SetVariable Y10 "#AY12#"][!SetVariable TX11 "#ATX1#"][!SetVariable TY11 "#ATY1#"][!SetVariable TX12 "#ATX2#"][!SetVariable TY12 "#ATY2#"][!SetVariable TX1 "#ATX3#"][!SetVariable TY1 "#ATY3#"][!SetVariable TX2 "#ATX4#"][!SetVariable TY2 "#ATY4#"][!SetVariable TX3 "#ATX5#"][!SetVariable TY3 "#ATY5#"][!SetVariable TX4 "#ATX6#"][!SetVariable TY4 "#ATY6#"][!SetVariable TX5 "#ATX7#"][!SetVariable TY5 "#ATY7#"][!SetVariable TX6 "#ATX8#"][!SetVariable TY6 "#ATY8#"][!SetVariable TX7 "#ATX9#"][!SetVariable TY7 "#ATY9#"][!SetVariable TX8 "#ATX10#"][!SetVariable TY8 "#ATY10#"][!SetVariable TX9 "#ATX11#"][!SetVariable TY9 "#ATY11#"][!SetVariable TX10 "#ATX12#"][!SetVariable TY10 "#ATY12#"][!UpdateMeterGroup Ap_TuTiempo][!RedrawGroup Ap_TuTiempo]
IfCondition4=(mCambio = 4) || (mCambio = 16)
IfTrueAction4=[!SetVariable X10 "#AX1#"][!SetVariable Y10 "#AY1#"][!SetVariable X11 "#AX2#"][!SetVariable Y11 "#AY2#"][!SetVariable X12 "#AX3#"][!SetVariable Y12 "#AY3#"][!SetVariable X1 "#AX4#"][!SetVariable Y1 "#AY4#"][!SetVariable X2 "#AX5#"][!SetVariable Y2 "#AY5#"][!SetVariable X3 "#AX6#"][!SetVariable Y3 "#AY6#"][!SetVariable X4 "#AX7#"][!SetVariable Y4 "#AY7#"][!SetVariable X5 "#AX8#"][!SetVariable Y5 "#AY8#"][!SetVariable X6 "#AX9#"][!SetVariable Y6 "#AY9#"][!SetVariable X7 "#AX10#"][!SetVariable Y7 "#AY10#"][!SetVariable X8 "#AX11#"][!SetVariable Y8 "#AY11#"][!SetVariable X9 "#AX12#"][!SetVariable Y9 "#AY12#"][!SetVariable TX10 "#ATX1#"][!SetVariable TY10 "#ATY1#"][!SetVariable TX11 "#ATX2#"][!SetVariable TY11 "#ATY2#"][!SetVariable TX12 "#ATX3#"][!SetVariable TY12 "#ATY3#"][!SetVariable TX1 "#ATX4#"][!SetVariable TY1 "#ATY4#"][!SetVariable TX2 "#ATX5#"][!SetVariable TY2 "#ATY5#"][!SetVariable TX3 "#ATX6#"][!SetVariable TY3 "#ATY6#"][!SetVariable TX4 "#ATX7#"][!SetVariable TY4 "#ATY7#"][!SetVariable TX5 "#ATX8#"][!SetVariable TY5 "#ATY8#"][!SetVariable TX6 "#ATX9#"][!SetVariable TY6 "#ATY9#"][!SetVariable TX7 "#ATX10#"][!SetVariable TY7 "#ATY10#"][!SetVariable TX8 "#ATX11#"][!SetVariable TY8 "#ATY11#"][!SetVariable TX9 "#ATX12#"][!SetVariable TY9 "#ATY12#"][!UpdateMeterGroup Ap_TuTiempo][!RedrawGroup Ap_TuTiempo]
IfCondition5=(mCambio = 5) || (mCambio = 17)
IfTrueAction5=[!SetVariable X9 "#AX1#"][!SetVariable Y9 "#AY1#"][!SetVariable X10 "#AX2#"][!SetVariable Y10 "#AY2#"][!SetVariable X11 "#AX3#"][!SetVariable Y11 "#AY3#"][!SetVariable X12 "#AX4#"][!SetVariable Y12 "#AY4#"][!SetVariable X1 "#AX5#"][!SetVariable Y1 "#AY5#"][!SetVariable X2 "#AX6#"][!SetVariable Y2 "#AY6#"][!SetVariable X3 "#AX7#"][!SetVariable Y3 "#AY7#"][!SetVariable X4 "#AX8#"][!SetVariable Y4 "#AY8#"][!SetVariable X5 "#AX9#"][!SetVariable Y5 "#AY9#"][!SetVariable X6 "#AX10#"][!SetVariable Y6 "#AY10#"][!SetVariable X7 "#AX11#"][!SetVariable Y7 "#AY11#"][!SetVariable X8 "#AX12#"][!SetVariable Y8 "#AY12#"][!SetVariable TX9 "#ATX1#"][!SetVariable TY9 "#ATY1#"][!SetVariable TX10 "#ATX2#"][!SetVariable TY10 "#ATY2#"][!SetVariable TX11 "#ATX3#"][!SetVariable TY11 "#ATY3#"][!SetVariable TX12 "#ATX4#"][!SetVariable TY12 "#ATY4#"][!SetVariable TX1 "#ATX5#"][!SetVariable TY1 "#ATY5#"][!SetVariable TX2 "#ATX6#"][!SetVariable TY2 "#ATY6#"][!SetVariable TX3 "#ATX7#"][!SetVariable TY3 "#ATY7#"][!SetVariable TX4 "#ATX8#"][!SetVariable TY4 "#ATY8#"][!SetVariable TX5 "#ATX9#"][!SetVariable TY5 "#ATY9#"][!SetVariable TX6 "#ATX10#"][!SetVariable TY6 "#ATY10#"][!SetVariable TX7 "#ATX11#"][!SetVariable TY7 "#ATY11#"][!SetVariable TX8 "#ATX12#"][!SetVariable TY8 "#ATY12#"][!UpdateMeterGroup Ap_TuTiempo][!RedrawGroup Ap_TuTiempo]
IfCondition6=(mCambio = 6) || (mCambio = 18)
IfTrueAction6=[!SetVariable X8 "#AX1#"][!SetVariable Y8 "#AY1#"][!SetVariable X9 "#AX2#"][!SetVariable Y9 "#AY2#"][!SetVariable X10 "#AX3#"][!SetVariable Y10 "#AY3#"][!SetVariable X11 "#AX4#"][!SetVariable Y11 "#AY4#"][!SetVariable X12 "#AX5#"][!SetVariable Y12 "#AY5#"][!SetVariable X1 "#AX6#"][!SetVariable Y1 "#AY6#"][!SetVariable X2 "#AX7#"][!SetVariable Y2 "#AY7#"][!SetVariable X3 "#AX8#"][!SetVariable Y3 "#AY8#"][!SetVariable X4 "#AX9#"][!SetVariable Y4 "#AY9#"][!SetVariable X5 "#AX10#"][!SetVariable Y5 "#AY10#"][!SetVariable X6 "#AX11#"][!SetVariable Y6 "#AY11#"][!SetVariable X7 "#AX12#"][!SetVariable Y7 "#AY12#"][!SetVariable TX8 "#ATX1#"][!SetVariable TY8 "#ATY1#"][!SetVariable TX9 "#ATX2#"][!SetVariable TY9 "#ATY2#"][!SetVariable TX10 "#ATX3#"][!SetVariable TY10 "#ATY3#"][!SetVariable TX11 "#ATX4#"][!SetVariable TY11 "#ATY4#"][!SetVariable TX12 "#ATX5#"][!SetVariable TY12 "#ATY5#"][!SetVariable TX1 "#ATX6#"][!SetVariable TY1 "#ATY6#"][!SetVariable TX2 "#ATX7#"][!SetVariable TY2 "#ATY7#"][!SetVariable TX3 "#ATX8#"][!SetVariable TY3 "#ATY8#"][!SetVariable TX4 "#ATX9#"][!SetVariable TY4 "#ATY9#"][!SetVariable TX5 "#ATX10#"][!SetVariable TY5 "#ATY10#"][!SetVariable TX6 "#ATX11#"][!SetVariable TY6 "#ATY11#"][!SetVariable TX7 "#ATX12#"][!SetVariable TY7 "#ATY12#"][!UpdateMeterGroup Ap_TuTiempo][!RedrawGroup Ap_TuTiempo]
IfCondition7=(mCambio = 7) || (mCambio = 19)
IfTrueAction7=[!SetVariable X7 "#AX1#"][!SetVariable Y7 "#AY1#"][!SetVariable X8 "#AX2#"][!SetVariable Y8 "#AY2#"][!SetVariable X9 "#AX3#"][!SetVariable Y9 "#AY3#"][!SetVariable X10 "#AX4#"][!SetVariable Y10 "#AY4#"][!SetVariable X11 "#AX5#"][!SetVariable Y11 "#AY5#"][!SetVariable X12 "#AX6#"][!SetVariable Y12 "#AY6#"][!SetVariable X1 "#AX7#"][!SetVariable Y1 "#AY7#"][!SetVariable X2 "#AX8#"][!SetVariable Y2 "#AY8#"][!SetVariable X3 "#AX9#"][!SetVariable Y3 "#AY9#"][!SetVariable X4 "#AX10#"][!SetVariable Y4 "#AY10#"][!SetVariable X5 "#AX11#"][!SetVariable Y5 "#AY11#"][!SetVariable X6 "#AX12#"][!SetVariable Y6 "#AY12#"][!SetVariable TX7 "#ATX1#"][!SetVariable TY7 "#ATY1#"][!SetVariable TX8 "#ATX2#"][!SetVariable TY8 "#ATY2#"][!SetVariable TX9 "#ATX3#"][!SetVariable TY9 "#ATY3#"][!SetVariable TX10 "#ATX4#"][!SetVariable TY10 "#ATY4#"][!SetVariable TX11 "#ATX5#"][!SetVariable TY11 "#ATY5#"][!SetVariable TX12 "#ATX6#"][!SetVariable TY12 "#ATY6#"][!SetVariable TX1 "#ATX7#"][!SetVariable TY1 "#ATY7#"][!SetVariable TX2 "#ATX8#"][!SetVariable TY2 "#ATY8#"][!SetVariable TX3 "#ATX9#"][!SetVariable TY3 "#ATY9#"][!SetVariable TX4 "#ATX10#"][!SetVariable TY4 "#ATY10#"][!SetVariable TX5 "#ATX11#"][!SetVariable TY5 "#ATY11#"][!SetVariable TX6 "#ATX12#"][!SetVariable TY6 "#ATY12#"][!UpdateMeterGroup Ap_TuTiempo][!RedrawGroup Ap_TuTiempo]
IfCondition8=(mCambio = 8) || (mCambio = 20)
IfTrueAction8=[!SetVariable X6 "#AX1#"][!SetVariable Y6 "#AY1#"][!SetVariable X7 "#AX2#"][!SetVariable Y7 "#AY2#"][!SetVariable X8 "#AX3#"][!SetVariable Y8 "#AY3#"][!SetVariable X9 "#AX4#"][!SetVariable Y9 "#AY4#"][!SetVariable X10 "#AX5#"][!SetVariable Y10 "#AY5#"][!SetVariable X11 "#AX6#"][!SetVariable Y11 "#AY6#"][!SetVariable X12 "#AX7#"][!SetVariable Y12 "#AY7#"][!SetVariable X1 "#AX8#"][!SetVariable Y1 "#AY8#"][!SetVariable X2 "#AX9#"][!SetVariable Y2 "#AY9#"][!SetVariable X3 "#AX10#"][!SetVariable Y3 "#AY10#"][!SetVariable X4 "#AX11#"][!SetVariable Y4 "#AY11#"][!SetVariable X5 "#AX12#"][!SetVariable Y5 "#AY12#"][!SetVariable TX6 "#ATX1#"][!SetVariable TY6 "#ATY1#"][!SetVariable TX7 "#ATX2#"][!SetVariable TY7 "#ATY2#"][!SetVariable TX8 "#ATX3#"][!SetVariable TY8 "#ATY3#"][!SetVariable TX9 "#ATX4#"][!SetVariable TY9 "#ATY4#"][!SetVariable TX10 "#ATX5#"][!SetVariable TY10 "#ATY5#"][!SetVariable TX11 "#ATX6#"][!SetVariable TY11 "#ATY6#"][!SetVariable TX12 "#ATX7#"][!SetVariable TY12 "#ATY7#"][!SetVariable TX1 "#ATX8#"][!SetVariable TY1 "#ATY8#"][!SetVariable TX2 "#ATX9#"][!SetVariable TY2 "#ATY9#"][!SetVariable TX3 "#ATX10#"][!SetVariable TY3 "#ATY10#"][!SetVariable TX4 "#ATX11#"][!SetVariable TY4 "#ATY11#"][!SetVariable TX5 "#ATX12#"][!SetVariable TY5 "#ATY12#"][!UpdateMeterGroup Ap_TuTiempo][!RedrawGroup Ap_TuTiempo]
IfCondition9=(mCambio = 9) || (mCambio = 21)
IfTrueAction9=[!SetVariable X5 "#AX1#"][!SetVariable Y5 "#AY1#"][!SetVariable X6 "#AX2#"][!SetVariable Y6 "#AY2#"][!SetVariable X7 "#AX3#"][!SetVariable Y7 "#AY3#"][!SetVariable X8 "#AX4#"][!SetVariable Y8 "#AY4#"][!SetVariable X9 "#AX5#"][!SetVariable Y9 "#AY5#"][!SetVariable X10 "#AX6#"][!SetVariable Y10 "#AY6#"][!SetVariable X11 "#AX7#"][!SetVariable Y11 "#AY7#"][!SetVariable X12 "#AX8#"][!SetVariable Y12 "#AY8#"][!SetVariable X1 "#AX9#"][!SetVariable Y1 "#AY9#"][!SetVariable X2 "#AX10#"][!SetVariable Y2 "#AY10#"][!SetVariable X3 "#AX11#"][!SetVariable Y3 "#AY11#"][!SetVariable X4 "#AX12#"][!SetVariable Y4 "#AY12#"][!SetVariable TX5 "#ATX1#"][!SetVariable TY5 "#ATY1#"][!SetVariable TX6 "#ATX2#"][!SetVariable TY6 "#ATY2#"][!SetVariable TX7 "#ATX3#"][!SetVariable TY7 "#ATY3#"][!SetVariable TX8 "#ATX4#"][!SetVariable TY8 "#ATY4#"][!SetVariable TX9 "#ATX5#"][!SetVariable TY9 "#ATY5#"][!SetVariable TX10 "#ATX6#"][!SetVariable TY10 "#ATY6#"][!SetVariable TX11 "#ATX7#"][!SetVariable TY11 "#ATY7#"][!SetVariable TX12 "#ATX8#"][!SetVariable TY12 "#ATY8#"][!SetVariable TX1 "#ATX9#"][!SetVariable TY1 "#ATY9#"][!SetVariable TX2 "#ATX10#"][!SetVariable TY2 "#ATY10#"][!SetVariable TX3 "#ATX11#"][!SetVariable TY3 "#ATY11#"][!SetVariable TX4 "#ATX12#"][!SetVariable TY4 "#ATY12#"][!UpdateMeterGroup Ap_TuTiempo][!RedrawGroup Ap_TuTiempo]
IfCondition10=(mCambio = 10) || (mCambio = 22)
IfTrueAction10=[!SetVariable X4 "#AX1#"][!SetVariable Y4 "#AY1#"][!SetVariable X5 "#AX2#"][!SetVariable Y5 "#AY2#"][!SetVariable X6 "#AX3#"][!SetVariable Y6 "#AY3#"][!SetVariable X7 "#AX4#"][!SetVariable Y7 "#AY4#"][!SetVariable X8 "#AX5#"][!SetVariable Y8 "#AY5#"][!SetVariable X9 "#AX6#"][!SetVariable Y9 "#AY6#"][!SetVariable X10 "#AX7#"][!SetVariable Y10 "#AY7#"][!SetVariable X11 "#AX8#"][!SetVariable Y11 "#AY8#"][!SetVariable X12 "#AX9#"][!SetVariable Y12 "#AY9#"][!SetVariable X1 "#AX10#"][!SetVariable Y1 "#AY10#"][!SetVariable X2 "#AX11#"][!SetVariable Y2 "#AY11#"][!SetVariable X3 "#AX12#"][!SetVariable Y3 "#AY12#"][!SetVariable TX4 "#ATX1#"][!SetVariable TY4 "#ATY1#"][!SetVariable TX5 "#ATX2#"][!SetVariable TY5 "#ATY2#"][!SetVariable TX6 "#ATX3#"][!SetVariable TY6 "#ATY3#"][!SetVariable TX7 "#ATX4#"][!SetVariable TY7 "#ATY4#"][!SetVariable TX8 "#ATX5#"][!SetVariable TY8 "#ATY5#"][!SetVariable TX9 "#ATX6#"][!SetVariable TY9 "#ATY6#"][!SetVariable TX10 "#ATX7#"][!SetVariable TY10 "#ATY7#"][!SetVariable TX11 "#ATX8#"][!SetVariable TY11 "#ATY8#"][!SetVariable TX12 "#ATX9#"][!SetVariable TY12 "#ATY9#"][!SetVariable TX1 "#ATX10#"][!SetVariable TY1 "#ATY10#"][!SetVariable TX2 "#ATX11#"][!SetVariable TY2 "#ATY11#"][!SetVariable TX3 "#ATX12#"][!SetVariable TY3 "#ATY12#"][!UpdateMeterGroup Ap_TuTiempo][!RedrawGroup Ap_TuTiempo]
IfCondition11=(mCambio = 11) || (mCambio = 23)
IfTrueAction11=[!SetVariable X3 "#AX1#"][!SetVariable Y3 "#AY1#"][!SetVariable X4 "#AX2#"][!SetVariable Y4 "#AY2#"][!SetVariable X5 "#AX3#"][!SetVariable Y5 "#AY3#"][!SetVariable X6 "#AX4#"][!SetVariable Y6 "#AY4#"][!SetVariable X7 "#AX5#"][!SetVariable Y7 "#AY5#"][!SetVariable X8 "#AX6#"][!SetVariable Y8 "#AY6#"][!SetVariable X9 "#AX7#"][!SetVariable Y9 "#AY7#"][!SetVariable X10 "#AX8#"][!SetVariable Y10 "#AY8#"][!SetVariable X11 "#AX9#"][!SetVariable Y11 "#AY9#"][!SetVariable X12 "#AX10#"][!SetVariable Y12 "#AY10#"][!SetVariable X1 "#AX11#"][!SetVariable Y1 "#AY11#"][!SetVariable X2 "#AX12#"][!SetVariable Y2 "#AY12#"][!SetVariable TX3 "#ATX1#"][!SetVariable TY3 "#ATY1#"][!SetVariable TX4 "#ATX2#"][!SetVariable TY4 "#ATY2#"][!SetVariable TX5 "#ATX3#"][!SetVariable TY5 "#ATY3#"][!SetVariable TX6 "#ATX4#"][!SetVariable TY6 "#ATY4#"][!SetVariable TX7 "#ATX5#"][!SetVariable TY7 "#ATY5#"][!SetVariable TX8 "#ATX6#"][!SetVariable TY8 "#ATY6#"][!SetVariable TX9 "#ATX7#"][!SetVariable TY9 "#ATY7#"][!SetVariable TX10 "#ATX8#"][!SetVariable TY10 "#ATY8#"][!SetVariable TX11 "#ATX9#"][!SetVariable TY11 "#ATY9#"][!SetVariable TX12 "#ATX10#"][!SetVariable TY12 "#ATY10#"][!SetVariable TX1 "#ATX11#"][!SetVariable TY1 "#ATY11#"][!SetVariable TX2 "#ATX12#"][!SetVariable TY2 "#ATY12#"][!UpdateMeterGroup Ap_TuTiempo][!RedrawGroup Ap_TuTiempo]
IfCondition12=(mCambio = 12) || (mCambio = 0)
IfTrueAction12=[!SetVariable X2 "#AX1#"][!SetVariable Y2 "#AY1#"][!SetVariable X3 "#AX2#"][!SetVariable Y3 "#AY2#"][!SetVariable X4 "#AX3#"][!SetVariable Y4 "#AY3#"][!SetVariable X5 "#AX4#"][!SetVariable Y5 "#AY4#"][!SetVariable X6 "#AX5#"][!SetVariable Y6 "#AY5#"][!SetVariable X7 "#AX6#"][!SetVariable Y7 "#AY6#"][!SetVariable X8 "#AX7#"][!SetVariable Y8 "#AY7#"][!SetVariable X9 "#AX8#"][!SetVariable Y9 "#AY8#"][!SetVariable X10 "#AX9#"][!SetVariable Y10 "#AY9#"][!SetVariable X11 "#AX10#"][!SetVariable Y11 "#AY10#"][!SetVariable X12 "#AX11#"][!SetVariable Y12 "#AY11#"][!SetVariable X1 "#AX12#"][!SetVariable Y1 "#AY12#"][!SetVariable TX2 "#ATX1#"][!SetVariable TY2 "#ATY1#"][!SetVariable TX3 "#ATX2#"][!SetVariable TY3 "#ATY2#"][!SetVariable TX4 "#ATX3#"][!SetVariable TY4 "#ATY3#"][!SetVariable TX5 "#ATX4#"][!SetVariable TY5 "#ATY4#"][!SetVariable TX6 "#ATX5#"][!SetVariable TY6 "#ATY5#"][!SetVariable TX7 "#ATX6#"][!SetVariable TY7 "#ATY6#"][!SetVariable TX8 "#ATX7#"][!SetVariable TY8 "#ATY7#"][!SetVariable TX9 "#ATX8#"][!SetVariable TY9 "#ATY8#"][!SetVariable TX10 "#ATX9#"][!SetVariable TY10 "#ATY9#"][!SetVariable TX11 "#ATX10#"][!SetVariable TY11 "#ATY10#"][!SetVariable TX12 "#ATX11#"][!SetVariable TY12 "#ATY11#"][!SetVariable TX1 "#ATX12#"][!SetVariable TY1 "#ATY12#"][!UpdateMeterGroup Ap_TuTiempo][!RedrawGroup Ap_TuTiempo]

[mTemperatura_00Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetTemp#

[mTemperatura_00]
Measure=WebParser
Url=[mTemperatura_00Parent]
StringIndex=1

[mTemperatura_01Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetTemp##GetTemp#

[mTemperatura_01]
Measure=WebParser
Url=[mTemperatura_01Parent]
StringIndex=2

[mTemperatura_02Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetTemp##GetTemp##GetTemp#

[mTemperatura_02]
Measure=WebParser
Url=[mTemperatura_02Parent]
StringIndex=3

[mTemperatura_03Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetTemp##GetTemp##GetTemp##GetTemp#

[mTemperatura_03]
Measure=WebParser
Url=[mTemperatura_03Parent]
StringIndex=4

[mTemperatura_04Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetTemp##GetTemp##GetTemp##GetTemp##GetTemp#

[mTemperatura_04]
Measure=WebParser
Url=[mTemperatura_04Parent]
StringIndex=5

[mTemperatura_05Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetTemp##GetTemp##GetTemp##GetTemp##GetTemp##GetTemp#

[mTemperatura_05]
Measure=WebParser
Url=[mTemperatura_05Parent]
StringIndex=6

[mTemperatura_06Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetTemp##GetTemp##GetTemp##GetTemp##GetTemp##GetTemp##GetTemp#

[mTemperatura_06]
Measure=WebParser
Url=[mTemperatura_06Parent]
StringIndex=7

[mTemperatura_07Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetTemp##GetTemp##GetTemp##GetTemp##GetTemp##GetTemp##GetTemp##GetTemp#

[mTemperatura_07]
Measure=WebParser
Url=[mTemperatura_07Parent]
StringIndex=8

[mTemperatura_08Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetTemp##GetTemp##GetTemp##GetTemp##GetTemp##GetTemp##GetTemp##GetTemp##GetTemp#

[mTemperatura_08]
Measure=WebParser
Url=[mTemperatura_08Parent]
StringIndex=9

[mTemperatura_09Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetTemp##GetTemp##GetTemp##GetTemp##GetTemp##GetTemp##GetTemp##GetTemp##GetTemp##GetTemp#

[mTemperatura_09]
Measure=WebParser
Url=[mTemperatura_09Parent]
StringIndex=10

[mTemperatura_10Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetTemp##GetTemp##GetTemp##GetTemp##GetTemp##GetTemp##GetTemp##GetTemp##GetTemp##GetTemp##GetTemp#

[mTemperatura_10]
Measure=WebParser
Url=[mTemperatura_10Parent]
StringIndex=11

[mTemperatura_11Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetTemp##GetTemp##GetTemp##GetTemp##GetTemp##GetTemp##GetTemp##GetTemp##GetTemp##GetTemp##GetTemp##GetTemp#

[mTemperatura_11]
Measure=WebParser
Url=[mTemperatura_11Parent]
StringIndex=12

[mCondiciones_00Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetCond#

[mCondiciones_00]
Measure=WebParser
Url=[mCondiciones_00Parent]
StringIndex=1

[mCondiciones_01Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetCond##GetCond#

[mCondiciones_01]
Measure=WebParser
Url=[mCondiciones_01Parent]
StringIndex=2

[mCondiciones_02Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetCond##GetCond##GetCond#

[mCondiciones_02]
Measure=WebParser
Url=[mCondiciones_02Parent]
StringIndex=3

[mCondiciones_03Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetCond##GetCond##GetCond##GetCond#

[mCondiciones_03]
Measure=WebParser
Url=[mCondiciones_03Parent]
StringIndex=4

[mCondiciones_04Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetCond##GetCond##GetCond##GetCond##GetCond#

[mCondiciones_04]
Measure=WebParser
Url=[mCondiciones_04Parent]
StringIndex=5

[mCondiciones_05Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetCond##GetCond##GetCond##GetCond##GetCond##GetCond#

[mCondiciones_05]
Measure=WebParser
Url=[mCondiciones_05Parent]
StringIndex=6

[mCondiciones_06Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetCond##GetCond##GetCond##GetCond##GetCond##GetCond##GetCond#

[mCondiciones_06]
Measure=WebParser
Url=[mCondiciones_06Parent]
StringIndex=7

[mCondiciones_07Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetCond##GetCond##GetCond##GetCond##GetCond##GetCond##GetCond##GetCond#

[mCondiciones_07]
Measure=WebParser
Url=[mCondiciones_07Parent]
StringIndex=8

[mCondiciones_08Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetCond##GetCond##GetCond##GetCond##GetCond##GetCond##GetCond##GetCond##GetCond#

[mCondiciones_08]
Measure=WebParser
Url=[mCondiciones_08Parent]
StringIndex=9

[mCondiciones_09Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetCond##GetCond##GetCond##GetCond##GetCond##GetCond##GetCond##GetCond##GetCond##GetCond#

[mCondiciones_09]
Measure=WebParser
Url=[mCondiciones_09Parent]
StringIndex=10

[mCondiciones_10Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetCond##GetCond##GetCond##GetCond##GetCond##GetCond##GetCond##GetCond##GetCond##GetCond##GetCond#

[mCondiciones_10]
Measure=WebParser
Url=[mCondiciones_10Parent]
StringIndex=11

[mCondiciones_11Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetCond##GetCond##GetCond##GetCond##GetCond##GetCond##GetCond##GetCond##GetCond##GetCond##GetCond##GetCond#

[mCondiciones_11]
Measure=WebParser
Url=[mCondiciones_11Parent]
StringIndex=12

[mHumedad_00Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetHumi#

[mHumedad_00]
Measure=WebParser
Url=[mHumedad_00Parent]
StringIndex=1

[mHumedad_01Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetHumi##GetHumi#

[mHumedad_01]
Measure=WebParser
Url=[mHumedad_01Parent]
StringIndex=2

[mHumedad_02Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetHumi##GetHumi##GetHumi#

[mHumedad_02]
Measure=WebParser
Url=[mHumedad_02Parent]
StringIndex=3

[mHumedad_03Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetHumi##GetHumi##GetHumi##GetHumi#

[mHumedad_03]
Measure=WebParser
Url=[mHumedad_03Parent]
StringIndex=4

[mHumedad_04Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetHumi##GetHumi##GetHumi##GetHumi##GetHumi#

[mHumedad_04]
Measure=WebParser
Url=[mHumedad_04Parent]
StringIndex=5

[mHumedad_05Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetHumi##GetHumi##GetHumi##GetHumi##GetHumi##GetHumi#

[mHumedad_05]
Measure=WebParser
Url=[mHumedad_05Parent]
StringIndex=6

[mHumedad_06Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetHumi##GetHumi##GetHumi##GetHumi##GetHumi##GetHumi##GetHumi#

[mHumedad_06]
Measure=WebParser
Url=[mHumedad_06Parent]
StringIndex=7

[mHumedad_07Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetHumi##GetHumi##GetHumi##GetHumi##GetHumi##GetHumi##GetHumi##GetHumi#

[mHumedad_07]
Measure=WebParser
Url=[mHumedad_07Parent]
StringIndex=8

[mHumedad_08Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetHumi##GetHumi##GetHumi##GetHumi##GetHumi##GetHumi##GetHumi##GetHumi##GetHumi#

[mHumedad_08]
Measure=WebParser
Url=[mHumedad_08Parent]
StringIndex=9

[mHumedad_09Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetHumi##GetHumi##GetHumi##GetHumi##GetHumi##GetHumi##GetHumi##GetHumi##GetHumi##GetHumi#

[mHumedad_09]
Measure=WebParser
Url=[mHumedad_09Parent]
StringIndex=10

[mHumedad_10Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetHumi##GetHumi##GetHumi##GetHumi##GetHumi##GetHumi##GetHumi##GetHumi##GetHumi##GetHumi##GetHumi#

[mHumedad_10]
Measure=WebParser
Url=[mHumedad_10Parent]
StringIndex=11

[mHumedad_11Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetHumi##GetHumi##GetHumi##GetHumi##GetHumi##GetHumi##GetHumi##GetHumi##GetHumi##GetHumi##GetHumi##GetHumi#

[mHumedad_11]
Measure=WebParser
Url=[mHumedad_11Parent]
StringIndex=12

[mPresion_00Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetPres#

[mPresion_00]
Measure=WebParser
Url=[mPresion_00Parent]
StringIndex=1

[mPresion_01Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetPres##GetPres#

[mPresion_01]
Measure=WebParser
Url=[mPresion_01Parent]
StringIndex=2

[mPresion_02Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetPres##GetPres##GetPres#

[mPresion_02]
Measure=WebParser
Url=[mPresion_02Parent]
StringIndex=3

[mPresion_03Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetPres##GetPres##GetPres##GetPres#

[mPresion_03]
Measure=WebParser
Url=[mPresion_03Parent]
StringIndex=4

[mPresion_04Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetPres##GetPres##GetPres##GetPres##GetPres#

[mPresion_04]
Measure=WebParser
Url=[mPresion_04Parent]
StringIndex=5

[mPresion_05Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetPres##GetPres##GetPres##GetPres##GetPres##GetPres#

[mPresion_05]
Measure=WebParser
Url=[mPresion_05Parent]
StringIndex=6

[mPresion_06Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetPres##GetPres##GetPres##GetPres##GetPres##GetPres##GetPres#

[mPresion_06]
Measure=WebParser
Url=[mPresion_06Parent]
StringIndex=7

[mPresion_07Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetPres##GetPres##GetPres##GetPres##GetPres##GetPres##GetPres##GetPres#

[mPresion_07]
Measure=WebParser
Url=[mPresion_07Parent]
StringIndex=8

[mPresion_08Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetPres##GetPres##GetPres##GetPres##GetPres##GetPres##GetPres##GetPres##GetPres#

[mPresion_08]
Measure=WebParser
Url=[mPresion_08Parent]
StringIndex=9

[mPresion_09Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetPres##GetPres##GetPres##GetPres##GetPres##GetPres##GetPres##GetPres##GetPres##GetPres#

[mPresion_09]
Measure=WebParser
Url=[mPresion_09Parent]
StringIndex=10

[mPresion_10Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetPres##GetPres##GetPres##GetPres##GetPres##GetPres##GetPres##GetPres##GetPres##GetPres##GetPres#

[mPresion_10]
Measure=WebParser
Url=[mPresion_10Parent]
StringIndex=11

[mPresion_11Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetPres##GetPres##GetPres##GetPres##GetPres##GetPres##GetPres##GetPres##GetPres##GetPres##GetPres##GetPres#

[mPresion_11]
Measure=WebParser
Url=[mPresion_11Parent]
StringIndex=12

[mIcono_00Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetIcon#

[mIcono_00]
Measure=WebParser
Url=[mIcono_00Parent]
StringIndex=1
Substitute=#IconosTT#

[mIcono_01Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetIcon##GetIcon#

[mIcono_01]
Measure=WebParser
Url=[mIcono_01Parent]
StringIndex=2
Substitute=#IconosTT#

[mIcono_02Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetIcon##GetIcon##GetIcon#

[mIcono_02]
Measure=WebParser
Url=[mIcono_02Parent]
StringIndex=3
Substitute=#IconosTT#

[mIcono_03Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetIcon##GetIcon##GetIcon##GetIcon#

[mIcono_03]
Measure=WebParser
Url=[mIcono_03Parent]
StringIndex=4
Substitute=#IconosTT#

[mIcono_04Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetIcon##GetIcon##GetIcon##GetIcon##GetIcon#

[mIcono_04]
Measure=WebParser
Url=[mIcono_04Parent]
StringIndex=5
Substitute=#IconosTT#

[mIcono_05Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetIcon##GetIcon##GetIcon##GetIcon##GetIcon##GetIcon#

[mIcono_05]
Measure=WebParser
Url=[mIcono_05Parent]
StringIndex=6
Substitute=#IconosTT#

[mIcono_06Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetIcon##GetIcon##GetIcon##GetIcon##GetIcon##GetIcon##GetIcon#

[mIcono_06]
Measure=WebParser
Url=[mIcono_06Parent]
StringIndex=7
Substitute=#IconosTT#

[mIcono_07Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetIcon##GetIcon##GetIcon##GetIcon##GetIcon##GetIcon##GetIcon##GetIcon#

[mIcono_07]
Measure=WebParser
Url=[mIcono_07Parent]
StringIndex=8
Substitute=#IconosTT#

[mIcono_08Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetIcon##GetIcon##GetIcon##GetIcon##GetIcon##GetIcon##GetIcon##GetIcon##GetIcon#

[mIcono_08]
Measure=WebParser
Url=[mIcono_08Parent]
StringIndex=9
Substitute=#IconosTT#

[mIcono_09Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetIcon##GetIcon##GetIcon##GetIcon##GetIcon##GetIcon##GetIcon##GetIcon##GetIcon##GetIcon#

[mIcono_09]
Measure=WebParser
Url=[mIcono_09Parent]
StringIndex=10
Substitute=#IconosTT#

[mIcono_10Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetIcon##GetIcon##GetIcon##GetIcon##GetIcon##GetIcon##GetIcon##GetIcon##GetIcon##GetIcon##GetIcon#

[mIcono_10]
Measure=WebParser
Url=[mIcono_10Parent]
StringIndex=11
Substitute=#IconosTT#

[mIcono_11Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetIcon##GetIcon##GetIcon##GetIcon##GetIcon##GetIcon##GetIcon##GetIcon##GetIcon##GetIcon##GetIcon##GetIcon#

[mIcono_11]
Measure=WebParser
Url=[mIcono_11Parent]
StringIndex=12
Substitute=#IconosTT#

[mViento_00Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetWind#

[mViento_00]
Measure=WebParser
Url=[mViento_00Parent]
StringIndex=1

[mViento_01Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetWind##GetWind#

[mViento_01]
Measure=WebParser
Url=[mViento_01Parent]
StringIndex=2

[mViento_02Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetWind##GetWind##GetWind#

[mViento_02]
Measure=WebParser
Url=[mViento_02Parent]
StringIndex=3

[mViento_03Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetWind##GetWind##GetWind##GetWind#

[mViento_03]
Measure=WebParser
Url=[mViento_03Parent]
StringIndex=4

[mViento_04Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetWind##GetWind##GetWind##GetWind##GetWind#

[mViento_04]
Measure=WebParser
Url=[mViento_04Parent]
StringIndex=5

[mViento_05Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetWind##GetWind##GetWind##GetWind##GetWind##GetWind#

[mViento_05]
Measure=WebParser
Url=[mViento_05Parent]
StringIndex=6

[mViento_06Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetWind##GetWind##GetWind##GetWind##GetWind##GetWind##GetWind#

[mViento_06]
Measure=WebParser
Url=[mViento_06Parent]
StringIndex=7

[mViento_07Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetWind##GetWind##GetWind##GetWind##GetWind##GetWind##GetWind##GetWind#

[mViento_07]
Measure=WebParser
Url=[mViento_07Parent]
StringIndex=8

[mWind_08Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetWind##GetWind##GetWind##GetWind##GetWind##GetWind##GetWind##GetWind##GetWind#

[mViento_08]
Measure=WebParser
Url=[mViento_08Parent]
StringIndex=9

[mViento_09Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetWind##GetWind##GetWind##GetWind##GetWind##GetWind##GetWind##GetWind##GetWind##GetWind#

[mViento_09]
Measure=WebParser
Url=[mViento_09Parent]
StringIndex=10

[mViento_10Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetWind##GetWind##GetWind##GetWind##GetWind##GetWind##GetWind##GetWind##GetWind##GetWind##GetWind#

[mViento_10]
Measure=WebParser
Url=[mViento_10Parent]
StringIndex=11

[mViento_11Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetWind##GetWind##GetWind##GetWind##GetWind##GetWind##GetWind##GetWind##GetWind##GetWind##GetWind##GetWind#

[mViento11]
Measure=WebParser
Url=[mViento_11Parent]
StringIndex=12

[mViento_Dir_00Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetWDir#

[mViento_Dir_00]
Measure=WebParser
Url=[mViento_Dir_00Parent]
StringIndex=1

[mViento_Dir_01Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetWDir##GetWDir#

[mViento_Dir_01]
Measure=WebParser
Url=[mViento_Dir_01Parent]
StringIndex=2

[mViento_Dir_02Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetWDir##GetWDir##GetWDir#

[mViento_Dir_02]
Measure=WebParser
Url=[mViento_Dir_02Parent]
StringIndex=3

[mViento_Dir_03Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetWDir##GetWDir##GetWDir##GetWDir#

[mViento_Dir_03]
Measure=WebParser
Url=[mViento_Dir_03Parent]
StringIndex=4

[mViento_Dir_04Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetWDir##GetWDir##GetWDir##GetWDir##GetWDir#

[mViento_Dir_04]
Measure=WebParser
Url=[mViento_Dir_04Parent]
StringIndex=5

[mViento_Dir_05Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetWDir##GetWDir##GetWDir##GetWDir##GetWDir##GetWDir#

[mViento_Dir_05]
Measure=WebParser
Url=[mViento_Dir_05Parent]
StringIndex=6

[mViento_Dir_06Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetWDir##GetWDir##GetWDir##GetWDir##GetWDir##GetWDir##GetWDir#

[mViento_Dir_06]
Measure=WebParser
Url=[mViento_Dir_06Parent]
StringIndex=7

[mViento_Dir_07Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetWDir##GetWDir##GetWDir##GetWDir##GetWDir##GetWDir##GetWDir##GetWDir#

[mViento_Dir_07]
Measure=WebParser
Url=[mViento_Dir_07Parent]
StringIndex=8

[mViento_Dir_08Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetWDir##GetWDir##GetWDir##GetWDir##GetWDir##GetWDir##GetWDir##GetWDir##GetWDir#

[mViento_Dir_08]
Measure=WebParser
Url=[mViento_Dir_08Parent]
StringIndex=9

[mViento_Dir_09Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetWDir##GetWDir##GetWDir##GetWDir##GetWDir##GetWDir##GetWDir##GetWDir##GetWDir##GetWDir#

[mViento_Dir_09]
Measure=WebParser
Url=[mViento_Dir_09Parent]
StringIndex=10

[mViento_Dir_10Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetWDir##GetWDir##GetWDir##GetWDir##GetWDir##GetWDir##GetWDir##GetWDir##GetWDir##GetWDir##GetWDir#

[mViento_Dir_10]
Measure=WebParser
Url=[mViento_Dir_10Parent]
StringIndex=11

[mViento_Dir_11Parent]
Measure=WebParser
Url=[mData]
RegExp=#GetWDir##GetWDir##GetWDir##GetWDir##GetWDir##GetWDir##GetWDir##GetWDir##GetWDir##GetWDir##GetWDir##GetWDir#

[mViento_Dir_11]
Measure=WebParser
Url=[mViento_Dir_11Parent]
StringIndex=12

[mFecha_0Parent]
Measure=WebParser
Url=[mData2]
RegExp=#GetDate2#

[mFecha_0]
Measure=WebParser
Url=[mFecha_0Parent]
StringIndex=1
RegExpSubstitute=1
Substitute="(\w+) (\w+) (\w+) (\w+)":"\1","#Fecha#"

[mFecha_1Parent]
Measure=WebParser
Url=[mData2]
RegExp=#GetDate2##GetDate2#

[mFecha_1]
Measure=WebParser
Url=[mFecha_1Parent]
StringIndex=2
RegExpSubstitute=1
Substitute="(\w+) (\w+) (\w+) (\w+)":"\1","#Fecha#"

[mFecha_2Parent]
Measure=WebParser
Url=[mData2]
RegExp=#GetDate2##GetDate2##GetDate2#

[mFecha_2]
Measure=WebParser
Url=[mFecha_2Parent]
StringIndex=3
RegExpSubstitute=1
Substitute="(\w+) (\w+) (\w+) (\w+)":"\1","#Fecha#"

[mFecha_3Parent]
Measure=WebParser
Url=[mData2]
RegExp=#GetDate2##GetDate2##GetDate2##GetDate2#

[mFecha_3]
Measure=WebParser
Url=[mFecha_3Parent]
StringIndex=4
RegExpSubstitute=1
Substitute="(\w+) (\w+) (\w+) (\w+)":"\1","#Fecha#"

[mFecha_4Parent]
Measure=WebParser
Url=[mData2]
RegExp=#GetDate2##GetDate2##GetDate2##GetDate2##GetDate2#

[mFecha_4]
Measure=WebParser
Url=[mFecha_4Parent]
StringIndex=5
RegExpSubstitute=1
Substitute="(\w+) (\w+) (\w+) (\w+)":"\1","#Fecha#"

[mTempMax_0Parent]
Measure=WebParser
Url=[mData2]
RegExp=#GetTempMax#

[mTempMax_0]
Measure=WebParser
Url=[mTempMax_0Parent]
StringIndex=1

[mTempMax_1Parent]
Measure=WebParser
Url=[mData2]
RegExp=#GetTempMax##GetTempMax#

[mTempMax_1]
Measure=WebParser
Url=[mTempMax_1Parent]
StringIndex=2

[mTempMax_2Parent]
Measure=WebParser
Url=[mData2]
RegExp=#GetTempMax##GetTempMax##GetTempMax#

[mTempMax_2]
Measure=WebParser
Url=[mTempMax_2Parent]
StringIndex=3

[mTempMax_3Parent]
Measure=WebParser
Url=[mData2]
RegExp=#GetTempMax##GetTempMax##GetTempMax##GetTempMax#

[mTempMax_3]
Measure=WebParser
Url=[mTempMax_3Parent]
StringIndex=4

[mTempMax_4Parent]
Measure=WebParser
Url=[mData2]
RegExp=#GetTempMax##GetTempMax##GetTempMax##GetTempMax##GetTempMax#

[mTempMax_4]
Measure=WebParser
Url=[mTempMax_4Parent]
StringIndex=5

[mTempMin_0Parent]
Measure=WebParser
Url=[mData2]
RegExp=#GetTempMin#

[mTempMin_0]
Measure=WebParser
Url=[mTempMin_0Parent]
StringIndex=1

[mTempMin_1Parent]
Measure=WebParser
Url=[mData2]
RegExp=#GetTempMin##GetTempMin#

[mTempMin_1]
Measure=WebParser
Url=[mTempMin_1Parent]
StringIndex=2

[mTempMin_2Parent]
Measure=WebParser
Url=[mData2]
RegExp=#GetTempMin##GetTempMin##GetTempMin#

[mTempMin_2]
Measure=WebParser
Url=[mTempMin_2Parent]
StringIndex=3

[mTempMin_3Parent]
Measure=WebParser
Url=[mData2]
RegExp=#GetTempMin##GetTempMin##GetTempMin##GetTempMin#

[mTempMin_3]
Measure=WebParser
Url=[mTempMin_3Parent]
StringIndex=4

[mTempMin_4Parent]
Measure=WebParser
Url=[mData2]
RegExp=#GetTempMin##GetTempMin##GetTempMin##GetTempMin##GetTempMin#

[mTempMin_4]
Measure=WebParser
Url=[mTempMin_4Parent]
StringIndex=5

[mIconoDia_0Parent]
Measure=WebParser
Url=[mData2]
RegExp=#GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2#

[mIconoDia_0]
Measure=WebParser
Url=[mIconoDia_0Parent]
StringIndex=26
Substitute=#IconosTT#

[mIconoDia_1Parent]
Measure=WebParser
Url=[mData2]
RegExp=#GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2#

[mIconoDia_1]
Measure=WebParser
Url=[mIconoDia_1Parent]
StringIndex=27
Substitute=#IconosTT#

[mIconoDia_2Parent]
Measure=WebParser
Url=[mData2]
RegExp=#GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2#

[mIconoDia_2]
Measure=WebParser
Url=[mIconoDia_2Parent]
StringIndex=28
Substitute=#IconosTT#

[mIconoDia_3Parent]
Measure=WebParser
Url=[mData2]
RegExp=#GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2#

[mIconoDia_3]
Measure=WebParser
Url=[mIconoDia_3Parent]
StringIndex=29
Substitute=#IconosTT#

[mIconoDia_4Parent]
Measure=WebParser
Url=[mData2]
RegExp=#GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2##GetIcon2#

[mIconoDia_4]
Measure=WebParser
Url=[mIconoDia_4Parent]
StringIndex=30
Substitute=#IconosTT#
