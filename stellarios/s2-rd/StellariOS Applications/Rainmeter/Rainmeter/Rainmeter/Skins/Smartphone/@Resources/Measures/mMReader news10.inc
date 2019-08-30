[Variables]
MRLogo=news10
MRNombre=DIARIO INFORMACION
Substitucion="<![CDATA[":"","]]>":""
E1=PORTADA
E2=DEPORTES
E3=ALCOY
E4=ALICANTE
E5=ELCHE
E6=MEDIO VINALOPO
E7=VEGA BAJA
E8=MARINA ALTA
URL1=https://www.diarioinformacion.com/elementosInt/rss/21
URL2=https://www.diarioinformacion.com/elementosInt/rss/6
URL3=https://www.diarioinformacion.com/elementosInt/rss/15
URL4=https://www.diarioinformacion.com/elementosInt/rss/12
URL5=https://www.diarioinformacion.com/elementosInt/rss/13
URL6=https://www.diarioinformacion.com/elementosInt/rss/18
URL7=https://www.diarioinformacion.com/elementosInt/rss/19
URL8=https://www.diarioinformacion.com/elementosInt/rss/16

[mSitio]
Measure=WebParser
UpdateRate=1800
Url=#URLFinal#
RegExp=(?siU)<item>.*<title>(.*)</title>.*<link>(.*)</link>.*src="(.*)".*src="(.*)".*<pubDate>(.*)</pubDate>.*<title>(.*)</title>.*<link>(.*)</link>.*src="(.*)".*<pubDate>(.*)</pubDate>.*<title>(.*)</title>.*<link>(.*)</link>.*src="(.*)".*<pubDate>(.*)</pubDate>.*<title>(.*)</title>.*<link>(.*)</link>.*src="(.*)".*<pubDate>(.*)</pubDate>.*<title>(.*)</title>.*<link>(.*)</link>.*src="(.*)".*<pubDate>(.*)</pubDate>.*<title>(.*)</title>.*<link>(.*)</link>.*src="(.*)".*<pubDate>(.*)</pubDate>.*<title>(.*)</title>.*<link>(.*)</link>.*src="(.*)".*<pubDate>(.*)</pubDate>.*<title>(.*)</title>.*<link>(.*)</link>.*src="(.*)".*<pubDate>(.*)</pubDate>.*<title>(.*)</title>.*<link>(.*)</link>.*src="(.*)".*<pubDate>(.*)</pubDate>.*<title>(.*)</title>.*<link>(.*)</link>.*src="(.*)".*<pubDate>(.*)</pubDate>
CodePage=28605
FinishAction=!UpdateMeterGroup Todos
OnDownloadErrorAction=!UpdateMeterGroup Todos

[mTitulo_1]
Measure=WebParser
Url=[mSitio]
StringIndex=1
DecodeCharacterReference=1
Substitute=#Substitucion#

[mEnlace_1]
Measure=WebParser
Url=[mSitio]
StringIndex=2
DecodeCharacterReference=1
Substitute=#Substitucion#

[mFoto_1]
Measure=WebParser
Url=[mSitio]
StringIndex=4
Download=1
Substitute="":"#@#Images\MyReader\nopic.png"

[mFecha_1]
Measure=WebParser
Url=[mSitio]
StringIndex=5
DecodeCharacterReference=1
Substitute=#Substitucion#

[mTitulo_2]
Measure=WebParser
Url=[mSitio]
StringIndex=6
DecodeCharacterReference=1
Substitute=#Substitucion#

[mEnlace_2]
Measure=WebParser
Url=[mSitio]
StringIndex=7
DecodeCharacterReference=1
Substitute=#Substitucion#

[mFoto_2]
Measure=WebParser
Url=[mSitio]
StringIndex=8
Download=1
Substitute="":"#@#Images\MyReader\nopic.png"

[mFecha_2]
Measure=WebParser
Url=[mSitio]
StringIndex=9
DecodeCharacterReference=1
Substitute=#Substitucion#

[mTitulo_3]
Measure=WebParser
Url=[mSitio]
StringIndex=10
DecodeCharacterReference=1
Substitute=#Substitucion#

[mEnlace_3]
Measure=WebParser
Url=[mSitio]
StringIndex=11
DecodeCharacterReference=1
Substitute=#Substitucion#

[mFoto_3]
Measure=WebParser
Url=[mSitio]
StringIndex=12
Download=1
Substitute="":"#@#Images\MyReader\nopic.png"

[mFecha_3]
Measure=WebParser
Url=[mSitio]
StringIndex=13
DecodeCharacterReference=1
Substitute=#Substitucion#

[mTitulo_4]
Measure=WebParser
Url=[mSitio]
StringIndex=14
DecodeCharacterReference=1
Substitute=#Substitucion#

[mEnlace_4]
Measure=WebParser
Url=[mSitio]
StringIndex=15
DecodeCharacterReference=1
Substitute=#Substitucion#

[mFoto_4]
Measure=WebParser
Url=[mSitio]
StringIndex=16
Download=1
Substitute="":"#@#Images\MyReader\nopic.png"

[mFecha_4]
Measure=WebParser
Url=[mSitio]
StringIndex=17
DecodeCharacterReference=1
Substitute=#Substitucion#

[mTitulo_5]
Measure=WebParser
Url=[mSitio]
StringIndex=18
DecodeCharacterReference=1
Substitute=#Substitucion#

[mEnlace_5]
Measure=WebParser
Url=[mSitio]
StringIndex=19
DecodeCharacterReference=1
Substitute=#Substitucion#

[mFoto_5]
Measure=WebParser
Url=[mSitio]
StringIndex=20
Download=1
Substitute="":"#@#Images\MyReader\nopic.png"

[mFecha_5]
Measure=WebParser
Url=[mSitio]
StringIndex=21
DecodeCharacterReference=1
Substitute=#Substitucion#

[mTitulo_6]
Measure=WebParser
Url=[mSitio]
StringIndex=22
DecodeCharacterReference=1
Substitute=#Substitucion#

[mEnlace_6]
Measure=WebParser
Url=[mSitio]
StringIndex=23
DecodeCharacterReference=1
Substitute=#Substitucion#

[mFoto_6]
Measure=WebParser
Url=[mSitio]
StringIndex=24
Download=1
Substitute="":"#@#Images\MyReader\nopic.png"

[mFecha_6]
Measure=WebParser
Url=[mSitio]
StringIndex=25
DecodeCharacterReference=1
Substitute=#Substitucion#

[mTitulo_7]
Measure=WebParser
Url=[mSitio]
StringIndex=26
DecodeCharacterReference=1
Substitute=#Substitucion#

[mEnlace_7]
Measure=WebParser
Url=[mSitio]
StringIndex=27
DecodeCharacterReference=1
Substitute=#Substitucion#

[mFoto_7]
Measure=WebParser
Url=[mSitio]
StringIndex=28
Download=1
Substitute="":"#@#Images\MyReader\nopic.png"

[mFecha_7]
Measure=WebParser
Url=[mSitio]
StringIndex=29
DecodeCharacterReference=1
Substitute=#Substitucion#

[mTitulo_8]
Measure=WebParser
Url=[mSitio]
StringIndex=30
DecodeCharacterReference=1
Substitute=#Substitucion#

[mEnlace_8]
Measure=WebParser
Url=[mSitio]
StringIndex=31
DecodeCharacterReference=1
Substitute=#Substitucion#

[mFoto_8]
Measure=WebParser
Url=[mSitio]
StringIndex=32
Download=1
Substitute="":"#@#Images\MyReader\nopic.png"

[mFecha_8]
Measure=WebParser
Url=[mSitio]
StringIndex=33

[mTitulo_9]
Measure=WebParser
Url=[mSitio]
StringIndex=34
DecodeCharacterReference=1
Substitute=#Substitucion#

[mEnlace_9]
Measure=WebParser
Url=[mSitio]
StringIndex=35
DecodeCharacterReference=1
Substitute=#Substitucion#

[mFoto_9]
Measure=WebParser
Url=[mSitio]
StringIndex=36
Download=1
Substitute="":"#@#Images\MyReader\nopic.png"

[mFecha_9]
Measure=WebParser
Url=[mSitio]
StringIndex=37
DecodeCharacterReference=1
Substitute=#Substitucion#

[mTitulo_10]
Measure=WebParser
Url=[mSitio]
StringIndex=38
DecodeCharacterReference=1
Substitute=#Substitucion#

[mEnlace_10]
Measure=WebParser
Url=[mSitio]
StringIndex=39
DecodeCharacterReference=1
Substitute=#Substitucion#

[mFoto_10]
Measure=WebParser
Url=[mSitio]
StringIndex=40
Download=1
Substitute="":"#@#Images\MyReader\nopic.png"

[mFecha_10]
Measure=WebParser
Url=[mSitio]
StringIndex=41
DecodeCharacterReference=1
Substitute=#Substitucion#
