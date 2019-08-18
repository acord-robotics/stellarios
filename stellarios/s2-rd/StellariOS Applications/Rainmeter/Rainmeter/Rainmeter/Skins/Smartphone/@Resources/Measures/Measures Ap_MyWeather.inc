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
Hoy_N_Viento=(?siU)<day d="0".*<part p="n">.*<wind>.*<s>(.*)</s>.*<gust>(.*)</gust>.*<d>(.*)</d>.*<t>(.*)</t>.*</wind>.*</part>
Hoy_N_Elementos=(?siU)<day d="0".*<part p="n">.*<bt>(.*)</bt>.*<ppcp>(.*)</ppcp>.*<hmid>(.*)</hmid>.*</part>
Dia1General=(?siU)<day d="1".*t="(.*)".*dt="(.*)".*<hi>(.*)</hi>.*<low>(.*)</low>.*<sunr>(.*)</sunr>.*<suns>(.*)</suns>
Dia1_D_Condiciones=(?siU)<day d="1".*<part p="d">.*<icon>(.*)</icon>.*<t>(.*)</t>
Dia1_D_Viento=(?siU)<day d="1".*<part p="d">.*<wind>.*<s>(.*)</s>.*<gust>(.*)</gust>.*<d>(.*)</d>.*<t>(.*)</t>.*</wind>
Dia1_D_Elementos=(?siU)<day d="1".*<part p="d">.*<bt>(.*)</bt>.*<ppcp>(.*)</ppcp>.*<hmid>(.*)</hmid>.*</part>
Dia1_N_Condiciones=(?siU)<day d="1".*<part p="n">.*<icon>(.*)</icon>.*<t>(.*)</t>
Dia1_N_Viento=(?siU)<day d="1".*<part p="n">.*<wind>.*<s>(.*)</s>.*<gust>(.*)</gust>.*<d>(.*)</d>.*<t>(.*)</t>.*</wind>
Dia1_N_Elementos=(?siU)<day d="1".*<part p="n">.*<bt>(.*)</bt>.*<ppcp>(.*)</ppcp>.*<hmid>(.*)</hmid>.*</part>
Dia2General=(?siU)<day d="2".*t="(.*)".*dt="(.*)".*<hi>(.*)</hi>.*<low>(.*)</low>.*<sunr>(.*)</sunr>.*<suns>(.*)</suns>
Dia2_D_Condiciones=(?siU)<day d="2".*<part p="d">.*<icon>(.*)</icon>.*<t>(.*)</t>
Dia2_D_Viento=(?siU)<day d="2".*<part p="d">.*<wind>.*<s>(.*)</s>.*<gust>(.*)</gust>.*<d>(.*)</d>.*<t>(.*)</t>.*</wind>
Dia2_D_Elementos=(?siU)<day d="2".*<part p="d">.*<bt>(.*)</bt>.*<ppcp>(.*)</ppcp>.*<hmid>(.*)</hmid>.*</part>
Dia2_N_Condiciones=(?siU)<day d="2".*<part p="n">.*<icon>(.*)</icon>.*<t>(.*)</t>
Dia2_N_Viento=(?siU)<day d="2".*<part p="n">.*<wind>.*<s>(.*)</s>.*<gust>(.*)</gust>.*<d>(.*)</d>.*<t>(.*)</t>.*</wind>
Dia2_N_Elementos=(?siU)<day d="2".*<part p="n">.*<bt>(.*)</bt>.*<ppcp>(.*)</ppcp>.*<hmid>(.*)</hmid>.*</part>
Dia3General=(?siU)<day d="3".*t="(.*)".*dt="(.*)".*<hi>(.*)</hi>.*<low>(.*)</low>.*<sunr>(.*)</sunr>.*<suns>(.*)</suns>
Dia3_D_Condiciones=(?siU)<day d="3".*<part p="d">.*<icon>(.*)</icon>.*<t>(.*)</t>
Dia3_D_Viento=(?siU)<day d="3".*<part p="d">.*<wind>.*<s>(.*)</s>.*<gust>(.*)</gust>.*<d>(.*)</d>.*<t>(.*)</t>.*</wind>
Dia3_D_Elementos=(?siU)<day d="3".*<part p="d">.*<bt>(.*)</bt>.*<ppcp>(.*)</ppcp>.*<hmid>(.*)</hmid>.*</part>
Dia3_N_Condiciones=(?siU)<day d="3".*<part p="n">.*<icon>(.*)</icon>.*<t>(.*)</t>
Dia3_N_Viento=(?siU)<day d="3".*<part p="n">.*<wind>.*<s>(.*)</s>.*<gust>(.*)</gust>.*<d>(.*)</d>.*<t>(.*)</t>.*</wind>
Dia3_N_Elementos=(?siU)<day d="3".*<part p="n">.*<bt>(.*)</bt>.*<ppcp>(.*)</ppcp>.*<hmid>(.*)</hmid>.*</part>
Dia4General=(?siU)<day d="4".*t="(.*)".*dt="(.*)".*<hi>(.*)</hi>.*<low>(.*)</low>.*<sunr>(.*)</sunr>.*<suns>(.*)</suns>
Dia4_D_Condiciones=(?siU)<day d="4".*<part p="d">.*<icon>(.*)</icon>.*<t>(.*)</t>
Dia4_D_Viento=(?siU)<day d="4".*<part p="d">.*<wind>.*<s>(.*)</s>.*<gust>(.*)</gust>.*<d>(.*)</d>.*<t>(.*)</t>.*</wind>
Dia4_D_Elementos=(?siU)<day d="4".*<part p="d">.*<bt>(.*)</bt>.*<ppcp>(.*)</ppcp>.*<hmid>(.*)</hmid>.*</part>
Dia4_N_Condiciones=(?siU)<day d="4".*<part p="n">.*<icon>(.*)</icon>.*<t>(.*)</t>
Dia4_N_Viento=(?siU)<day d="4".*<part p="n">.*<wind>.*<s>(.*)</s>.*<gust>(.*)</gust>.*<d>(.*)</d>.*<t>(.*)</t>.*</wind>
Dia4_N_Elementos=(?siU)<day d="4".*<part p="n">.*<bt>(.*)</bt>.*<ppcp>(.*)</ppcp>.*<hmid>(.*)</hmid>.*</part>

[mComprobarConexion]
Measure=Plugin
Plugin=SysInfo
SysInfoType=INTERNET_CONNECTIVITY
UpdateDivider=10
OnChangeAction=[!CommandMeasure mDatos_Tiempo "Update"]

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

[mDatos_Luna]
Measure=WebParser
UpdateRate=18000
Url=http://iohelix.net/moon/moonlite.xml
RegExp=(?siU)<percentIlluminated>(.*)</percentIlluminated>

[mLuna_Iluminada]
Measure=WebParser
Url=[mDatos_Luna]
StringIndex=1

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

[mMedidaVisib]
Group=Tiempo
Measure=WebParser
Url=[mMedidas_datos]
StringIndex=4
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

[mLocalidad_Datos]
Group=Tiempo
Measure=WebParser
URL=[mDatos_Tiempo]
RegExp=#Localidad#
Disabled=1

[mCiudad]
Group=Tiempo
Measure=WebParser
URL=[mLocalidad_Datos]
StringIndex=2
DecodeCharacterReference=1
RegExpSubstitute=1
Substitute="(\w+), (\w+)":"\1"
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

[mSensacionT]
Group=Tiempo
Measure=WebParser
URL=[mCondiciones_datos]
StringIndex=4

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
IfCondition=mViento > #AlertaViento#
IfTrueAction=[!SetOption Icono_Alerta_Viento ImageAlpha 255][!UpdateMeter Icono_Alerta_Viento]
IfFalseAction=[!SetOption Icono_Alerta_Viento ImageAlpha 0][!UpdateMeter Icono_Alerta_Viento]
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

[mVisibilidad]
Group=Tiempo
Measure=WebParser
URL=[mElementos_datos]
StringIndex=2
Disabled=1

[mIndiceUV]
Group=Tiempo
Measure=WebParser
URL=[mElementos_datos]
StringIndex=3
Disabled=1

[mUVEstado]
Group=Tiempo
Measure=WebParser
URL=[mElementos_datos]
StringIndex=4
Disabled=1

[mLuna_Imagen]
Group=Tiempo
Measure=WebParser
URL=[mElementos_datos]
StringIndex=6
Disabled=1

[mLuna_Fase]
Group=Tiempo
Measure=WebParser
URL=[mElementos_datos]
StringIndex=7
Disabled=1
Substitute=#LunaEstado#

;

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

[mSalidaSol]
Group=Tiempo
Measure=WebParser
URL=[mHoy_datos]
StringIndex=6
Disabled=1

[mPuestaSol]
Group=Tiempo
Measure=WebParser
URL=[mHoy_datos]
StringIndex=7
Disabled=1

[mDiaCondiciones_datos]
Group=Tiempo
Measure=WebParser
URL=[mDatos_Tiempo]
RegExp=#Hoy_D_Condiciones#
Disabled=1

[mDiaIcono]
Group=Tiempo
Measure=WebParser
URL=[mDiaCondiciones_datos]
StringIndex=1
Disabled=1

[mDiaCondiciones]
Group=Tiempo
Measure=WebParser
URL=[mDiaCondiciones_datos]
StringIndex=2
Disabled=1

[mDiaViento_datos]
Group=Tiempo
Measure=WebParser
URL=[mDatos_Tiempo]
RegExp=#Hoy_D_Viento#
Disabled=1

[mDiaViento]
Group=Tiempo
Measure=WebParser
URL=[mDiaViento_datos]
StringIndex=1
Disabled=1
Substitute=#Niveles#

[mDiaVientoDir]
Group=Tiempo
Measure=WebParser
URL=[mDiaViento_datos]
StringIndex=4
Disabled=1
Substitute=#Viento_Dir#

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
MinValue=0
MaxValue=100
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

;

[mDia1_Datos]
Group=Tiempo
Measure=WebParser
URL=[mDatos_Tiempo]
RegExp=#Dia1General#
Disabled=1

[mD1_Nombre]
Group=Tiempo
Measure=WebParser
URL=[mDia1_Datos]
StringIndex=1
Disabled=1
Substitute=#Semana#

[mD1_Maxima]
Group=Tiempo
Measure=WebParser
URL=[mDia1_Datos]
StringIndex=3
Disabled=1

[mD1_Minima]
Group=Tiempo
Measure=WebParser
URL=[mDia1_Datos]
StringIndex=4
Disabled=1

[mDia1_D_Cond_Datos]
Group=Tiempo
Measure=WebParser
URL=[mDatos_Tiempo]
RegExp=#Dia1_D_Condiciones#
Disabled=1

[mD1_D_Icono]
Group=Tiempo
Measure=WebParser
URL=[mDia1_D_Cond_Datos]
StringIndex=1
Disabled=1

;

[mDia2_Datos]
Group=Tiempo
Measure=WebParser
URL=[mDatos_Tiempo]
RegExp=#Dia2General#
Disabled=1

[mD2_Nombre]
Group=Tiempo
Measure=WebParser
URL=[mDia2_Datos]
StringIndex=1
Disabled=1
Substitute=#Semana#

[mD2_Maxima]
Group=Tiempo
Measure=WebParser
URL=[mDia2_Datos]
StringIndex=3
Disabled=1

[mD2_Minima]
Group=Tiempo
Measure=WebParser
URL=[mDia2_Datos]
StringIndex=4
Disabled=1

[mDia2_D_Cond_Datos]
Group=Tiempo
Measure=WebParser
URL=[mDatos_Tiempo]
RegExp=#Dia2_D_Condiciones#
Disabled=1

[mD2_D_Icono]
Group=Tiempo
Measure=WebParser
URL=[mDia2_D_Cond_Datos]
StringIndex=1
Disabled=1

;

[mDia3_Datos]
Group=Tiempo
Measure=WebParser
URL=[mDatos_Tiempo]
RegExp=#Dia3General#
Disabled=1

[mD3_Nombre]
Group=Tiempo
Measure=WebParser
URL=[mDia3_Datos]
StringIndex=1
Disabled=1
Substitute=#Semana#

[mD3_Maxima]
Group=Tiempo
Measure=WebParser
URL=[mDia3_Datos]
StringIndex=3
Disabled=1

[mD3_Minima]
Group=Tiempo
Measure=WebParser
URL=[mDia3_Datos]
StringIndex=4
Disabled=1

[mDia3_D_Cond_Datos]
Group=Tiempo
Measure=WebParser
URL=[mDatos_Tiempo]
RegExp=#Dia3_D_Condiciones#
Disabled=1

[mD3_D_Icono]
Group=Tiempo
Measure=WebParser
URL=[mDia3_D_Cond_Datos]
StringIndex=1
Disabled=1

;

[mDia4_Datos]
Group=Tiempo
Measure=WebParser
URL=[mDatos_Tiempo]
RegExp=#Dia4General#
Disabled=1

[mD4_Nombre]
Group=Tiempo
Measure=WebParser
URL=[mDia4_Datos]
StringIndex=1
Disabled=1
Substitute=#Semana#

[mD4_Maxima]
Group=Tiempo
Measure=WebParser
URL=[mDia4_Datos]
StringIndex=3
Disabled=1

[mD4_Minima]
Group=Tiempo
Measure=WebParser
URL=[mDia4_Datos]
StringIndex=4
Disabled=1

[mDia4_D_Cond_Datos]
Group=Tiempo
Measure=WebParser
URL=[mDatos_Tiempo]
RegExp=#Dia4_D_Condiciones#
Disabled=1

[mD4_D_Icono]
Group=Tiempo
Measure=WebParser
URL=[mDia4_D_Cond_Datos]
StringIndex=1
Disabled=1
