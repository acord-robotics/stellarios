[Variables]
Medidas=(?siU)<head>.*<locale>(.*)</locale>.*<form>(.*)</form>.*<ut>(.*)</ut>.*<ud>(.*)</ud>.*<us>(.*)</us>.*<up>(.*)</up>.*<ur>(.*)</ur>.*</head>
Localidad=(?siU)<loc id="(.*)".*<dnam>(.*)</dnam>.*<tm>(.*)</tm>.*<lat>
(.*)</lat>.*<lon>(.*)</lon>.*<sunr>(.*)</sunr>.*<suns>(.*)</suns>.*<zone>(.*)</zone>.*</loc>
CondicionesActuales=(?siU)<cc>.*<lsup>(.*)</lsup>.*<obst>(.*)</obst>.*<tmp>(.*)</tmp>.*<flik>(.*)</flik>.*<t>(.*)</t>.*<icon>(.*)</icon>
Barometro=(?siU)<cc>.*<bar>.*<r>(.*)</r>.*<d>(.*)</d>.*</bar>
VientoActual=(?siU)<cc>.*<wind>.*<s>(.*)</s>.*<gust>(.*)</gust>.*<d>(.*)</d>.*<t>(.*)</t>.*</wind>
ElementosActuales=(?siU)<cc>.*<hmid>(.*)</hmid>.*<vis>(.*)</vis>.*<uv>.*<i>(.*)</i>.*<t>(.*)</t>.*</uv>.*<dewp>(.*)</dewp>.*<moon>.*<icon>(.*)</icon>.*<t>(.*)</t>.*</moon>.*</cc>
HoyGeneral=(?siU)<dayf>.*<lsup>(.*)</lsup>.*<day d="0".*t="(.*)".*dt="(.*)".*<hi>(.*)</hi>.*<low>(.*)</low>.*<sunr>(.*)</sunr>.*<suns>(.*)</suns>
Hoy_D_Condiciones=(?siU)<day d="0".*<part p="d">.*<icon>(.*)</icon>.*<t>(.*)</t>.*</part>
Hoy_D_Viento=(?siU)<day d="0".*<part p="d">.*<wind>.*<s>(.*)</s>.*<gust>(.*)</gust>.*<d>(.*)</d>.*<t>(.*)</t>.*</wind>.*</part>
Hoy_D_Elementos=(?siU)<day d="0".*<part p="d">.*<bt>(.*)</bt>.*<ppcp>(.*)</ppcp>.*<hmid>(.*)</hmid>.*</part>
Hoy_N_Condiciones=(?siU)<day d="0".*<part p="n">.*<icon>(.*)</icon>.*<t>(.*)</t>.*</part>

[mBuscador]
Measure=Plugin
Plugin=InputText
FontFace=Segoe UI
SolidColor=255,255,255,255
FontColor=0,108,255,255
FontSize=(9*#Escala#)
StringAlign=Left
StringStyle=Bold
X=(91*#Escala#)
Y=(71*#Escala#)
W=(150*#Escala#)
H=(17*#Escala#)
AntiAlias=1
FocusDismiss=1
Command1=["https://www.google.com/search?q=$UserInput$"]
DefaultValue="Google"
DynamicVariables=1
UpdateDivider=-1

[mHoraHablada]
Measure=Time
Format=%I:%M
RegExpSubstitute=1
Substitute=":00":":#EnPunto#"

[mVoz]
Measure=Plugin
Plugin=Speech
Index=1
Volume=100
Rate=0
Debug=0

[mComprobarConexion]
Measure=Plugin
Plugin=SysInfo
SysInfoType=INTERNET_CONNECTIVITY
UpdateDivider=10
OnChangeAction=[!CommandMeasure mDatos_Tiempo "Update"]

[mDatos_Tiempo]
Measure=WebParser
UpdateRate=3600
URL=https://wxdata.weather.com/wxdata/weather/local/#Ciudad#?cc=*&unit=#Unidad#&dayf=5&locale=#IdiomaSmartPhone#
RegExp=(?siU)^(.*)$
FinishAction=[!EnableMeasureGroup Tiempo][!UpdateMeter *][!Redraw]

[mMedidas_datos]
Group=Tiempo
Measure=WebParser
URL=[mDatos_Tiempo]
RegExp=#Medidas#
Disabled=1

[mMedidaTemp]
Group=Tiempo
Measure=WebParser
Url=[mMedidas_datos]
StringIndex=3
Disabled=1

[mMedidaViento]
Group=Tiempo
Measure=WebParser
Url=[mMedidas_datos]
StringIndex=5
Disabled=1

[mMedidaVientoVoz]
Group=Tiempo
Measure=WebParser
Url=[mMedidas_datos]
StringIndex=5
Disabled=1
Substitute=#MedidaViento#

[mMedidaPresion]
Group=Tiempo
Measure=WebParser
Url=[mMedidas_datos]
StringIndex=6
Disabled=1

[mCondiciones_datos]
Group=Tiempo
Measure=WebParser
URL=[mDatos_Tiempo]
RegExp=#CondicionesActuales#
Disabled=1

[mTemperatura]
Group=Tiempo
Measure=WebParser
URL=[mCondiciones_datos]
StringIndex=3
Disabled=1

[mCondiciones]
Group=Tiempo
Measure=WebParser
URL=[mCondiciones_datos]
StringIndex=5
Disabled=1

[mIcono]
Group=Tiempo
Measure=WebParser
URL=[mCondiciones_datos]
StringIndex=6
Disabled=1

[mPresion_datos]
Group=Tiempo
Measure=WebParser
URL=[mDatos_Tiempo]
RegExp=#Barometro#
Disabled=1

[mPresion]
Group=Tiempo
Measure=WebParser
URL=[mPresion_datos]
StringIndex=1
Disabled=1

[mViento_datos]
Group=Tiempo
Measure=WebParser
URL=[mDatos_Tiempo]
RegExp=#VientoActual#
Disabled=1

[mViento]
Group=Tiempo
Measure=WebParser
URL=[mViento_datos]
StringIndex=1
Disabled=1
Substitute=#Niveles#

[mVientoVoz]
Group=Tiempo
Measure=WebParser
URL=[mViento_datos]
StringIndex=1
Disabled=1
Substitute=#DirViento#

[mVientoDir]
Group=Tiempo
Measure=WebParser
URL=[mViento_datos]
StringIndex=4
Disabled=1
Substitute=#Viento_Dir#

[mVientoDirVoz]
Group=Tiempo
Measure=WebParser
URL=[mViento_datos]
StringIndex=4
Disabled=1
Substitute=#DirViento#

[mElementos_datos]
Group=Tiempo
Measure=WebParser
URL=[mDatos_Tiempo]
RegExp=#ElementosActuales#
Disabled=1

[mHumedad]
Group=Tiempo
Measure=WebParser
URL=[mElementos_datos]
StringIndex=1
Disabled=1

[mHoy_datos]
Group=Tiempo
Measure=WebParser
URL=[mDatos_Tiempo]
RegExp=#HoyGeneral#
Disabled=1

[mTempMax]
Group=Tiempo
Measure=WebParser
URL=[mHoy_datos]
StringIndex=4
Disabled=1

[mTempMin]
Group=Tiempo
Measure=WebParser
URL=[mHoy_datos]
StringIndex=5
Disabled=1

[mDiaElem_datos]
Group=Tiempo
Measure=WebParser
URL=[mDatos_Tiempo]
RegExp=#Hoy_D_Elementos#
Disabled=1

[mDiaLluvia]
Group=Tiempo
Measure=WebParser
URL=[mDiaElem_datos]
StringIndex=2
Disabled=1

[mNocheCondiciones_datos]
Group=Tiempo
Measure=WebParser
URL=[mDatos_Tiempo]
RegExp=#Hoy_N_Condiciones#
Disabled=1

[mNocheCondiciones]
Group=Tiempo
Measure=WebParser
URL=[mNocheCondiciones_datos]
StringIndex=2
Disabled=1

[mEtiqueta_C]
Measure=FreeDiskSpace
Drive=C:
Label=1
UpdateDivider=10
IgnoreRemovable=0
Substitute="":"DISK"

[mUso_C]
Measure=FreeDiskSpace
Drive=C:
InvertMeasure=1
UpdateDivider=5

[mSubida]
Measure=Plugin
Plugin=UsageMonitor
Category=Network Adapter
Counter=Bytes Sent/sec
Index=1

[mBajada]
Measure=Plugin
Plugin=UsageMonitor
Category=Network Adapter
Counter=Bytes Received/sec
Index=1

[mSubidaData]
Measure=Calc
Formula=mSubida

[mBajadaData]
Measure=Calc
Formula=mBajada

[mLEDBajada]
Group=Leds
Measure=NetIn
IfAboveValue=0
IfAboveAction=!ShowMeter Led_Bajada
IfEqualValue=0
IfEqualAction=!HideMeter Led_Bajada

[mLEDSubida]
Group=Leds
Measure=NetOut
IfAboveValue=0
IfAboveAction=!ShowMeter Led_Subida
IfEqualValue=0
IfEqualAction=!HideMeter Led_Subida

[mCPU_Uso]
Measure=Plugin
Plugin=UsageMonitor
Alias=CPU
Index=0

[mCPU_App]
Measure=Plugin
Plugin=UsageMonitor
Alias=CPU
Index=1
Blacklist=_Total|Idle|dwm|wmpnetwk|csrss|svchost|lsass|System|system|Memory Compression|wininit|RemindersServer|spoolsv|IpOverUsbSvc

[mRAM_Uso]
Measure=PhysicalMemory
UpdateDivider=10

[mRAM_App]
Measure=Plugin
Plugin=UsageMonitor
Alias=RAM
Index=1
Blacklist=_Total|Idle|dwm|wmpnetwk|csrss|svchost|lsass|System|system|Memory Compression|wininit|RemindersServer|spoolsv|IpOverUsbSvc

[mGPU_Uso]
Measure=Plugin
Plugin=UsageMonitor
Alias=GPU
Index=0

[mGPU_App]
Measure=Plugin
Plugin=UsageMonitor
Alias=GPU
Index=1
Blacklist=dwm|csrss

[mCaratula]
Measure=NowPlaying
PlayerName="#Reproductor#"
PlayerType=COVER
Substitute="":"#@#Images\MyPhone\NoCover.png"

[mTitulo]
Measure=NowPlaying
PlayerName="#Reproductor#"
PlayerType=TITLE

[mArtista]
Measure=NowPlaying
PlayerName="#Reproductor#"
PlayerType=ARTIST
