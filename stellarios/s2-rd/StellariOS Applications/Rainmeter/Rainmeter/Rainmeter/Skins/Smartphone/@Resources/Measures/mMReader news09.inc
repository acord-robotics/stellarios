[Variables]
MRLogo=news09
MRNombre=EL PAIS
Substitucion="<![CDATA[":"","]]>":""
E1=PORTADA
E2=EUROPA
E3=ESTADOS UNIDOS
E4=LATINO AMERICA
E5=ASIA
E6=DEPORTES
E7=CINE
E8=MUSICA
URL1=http://ep00.epimg.net/rss/elpais/portada.xml
URL2=https://elpais.com/tag/rss/europa/a/
URL3=https://elpais.com/tag/rss/estados_unidos/a/
URL4=https://elpais.com/tag/rss/latinoamerica/a/
URL5=https://elpais.com/tag/rss/oriente_proximo/a/
URL6=http://ep00.epimg.net/rss/deportes/portada.xml
URL7=https://elpais.com/tag/rss/cine/a/
URL8=https://elpais.com/tag/rss/musica/a/

[mSitio]
Measure=WebParser
UpdateRate=1800
Url=#URLFinal#
RegExp=(?siU)<title>(.*)</title>.*<title>(.*)</title>.*<title>(.*)</title>.*<link>(.*)</link>.*<pubDate>(.*)</pubDate>.*url="(.*)".*<title>(.*)</title>.*<link>(.*)</link>.*<pubDate>(.*)</pubDate>.*url="(.*)".*<title>(.*)</title>.*<link>(.*)</link>.*<pubDate>(.*)</pubDate>.*url="(.*)".*<title>(.*)</title>.*<link>(.*)</link>.*<pubDate>(.*)</pubDate>.*url="(.*)".*<title>(.*)</title>.*<link>(.*)</link>.*<pubDate>(.*)</pubDate>.*url="(.*)".*<title>(.*)</title>.*<link>(.*)</link>.*<pubDate>(.*)</pubDate>.*url="(.*)".*<title>(.*)</title>.*<link>(.*)</link>.*<pubDate>(.*)</pubDate>.*url="(.*)".*<title>(.*)</title>.*<link>(.*)</link>.*<pubDate>(.*)</pubDate>.*url="(.*)".*<title>(.*)</title>.*<link>(.*)</link>.*<pubDate>(.*)</pubDate>.*url="(.*)".*<title>(.*)</title>.*<link>(.*)</link>.*<pubDate>(.*)</pubDate>.*url="(.*)"
FinishAction=!UpdateMeterGroup Todos
OnDownloadErrorAction=!UpdateMeterGroup Todos

[mTitulo_1]
Measure=WebParser
Url=[mSitio]
StringIndex=3
DecodeCharacterReference=1
Substitute=#Substitucion#

[mEnlace_1]
Measure=WebParser
Url=[mSitio]
StringIndex=4
DecodeCharacterReference=1
Substitute=#Substitucion#

[mFecha_1]
Measure=WebParser
Url=[mSitio]
StringIndex=5
DecodeCharacterReference=1
Substitute=#Substitucion#

[mFoto_1]
Measure=WebParser
Url=[mSitio]
StringIndex=6
Download=1
Substitute="":"#@#Images\MyReader\nopic.png"

[mTitulo_2]
Measure=WebParser
Url=[mSitio]
StringIndex=7
DecodeCharacterReference=1
Substitute=#Substitucion#

[mEnlace_2]
Measure=WebParser
Url=[mSitio]
StringIndex=8
DecodeCharacterReference=1
Substitute=#Substitucion#

[mFecha_2]
Measure=WebParser
Url=[mSitio]
StringIndex=9
DecodeCharacterReference=1
Substitute=#Substitucion#

[mFoto_2]
Measure=WebParser
Url=[mSitio]
StringIndex=10
Download=1
Substitute="":"#@#Images\MyReader\nopic.png"

[mTitulo_3]
Measure=WebParser
Url=[mSitio]
StringIndex=11
DecodeCharacterReference=1
Substitute=#Substitucion#

[mEnlace_3]
Measure=WebParser
Url=[mSitio]
StringIndex=12
DecodeCharacterReference=1
Substitute=#Substitucion#

[mFecha_3]
Measure=WebParser
Url=[mSitio]
StringIndex=13
DecodeCharacterReference=1
Substitute=#Substitucion#

[mFoto_3]
Measure=WebParser
Url=[mSitio]
StringIndex=14
Download=1
Substitute="":"#@#Images\MyReader\nopic.png"

[mTitulo_4]
Measure=WebParser
Url=[mSitio]
StringIndex=15
DecodeCharacterReference=1
Substitute=#Substitucion#

[mEnlace_4]
Measure=WebParser
Url=[mSitio]
StringIndex=16
DecodeCharacterReference=1
Substitute=#Substitucion#

[mFecha_4]
Measure=WebParser
Url=[mSitio]
StringIndex=17
DecodeCharacterReference=1
Substitute=#Substitucion#

[mFoto_4]
Measure=WebParser
Url=[mSitio]
StringIndex=18
Download=1
Substitute="":"#@#Images\MyReader\nopic.png"

[mTitulo_5]
Measure=WebParser
Url=[mSitio]
StringIndex=19
DecodeCharacterReference=1
Substitute=#Substitucion#

[mEnlace_5]
Measure=WebParser
Url=[mSitio]
StringIndex=20
DecodeCharacterReference=1
Substitute=#Substitucion#

[mFecha_5]
Measure=WebParser
Url=[mSitio]
StringIndex=21
DecodeCharacterReference=1
Substitute=#Substitucion#

[mFoto_5]
Measure=WebParser
Url=[mSitio]
StringIndex=22
Download=1
Substitute="":"#@#Images\MyReader\nopic.png"

[mTitulo_6]
Measure=WebParser
Url=[mSitio]
StringIndex=23
DecodeCharacterReference=1
Substitute=#Substitucion#

[mEnlace_6]
Measure=WebParser
Url=[mSitio]
StringIndex=24
DecodeCharacterReference=1
Substitute=#Substitucion#

[mFecha_6]
Measure=WebParser
Url=[mSitio]
StringIndex=25
DecodeCharacterReference=1
Substitute=#Substitucion#

[mFoto_6]
Measure=WebParser
Url=[mSitio]
StringIndex=26
Download=1
Substitute="":"#@#Images\MyReader\nopic.png"

[mTitulo_7]
Measure=WebParser
Url=[mSitio]
StringIndex=27
DecodeCharacterReference=1
Substitute=#Substitucion#

[mEnlace_7]
Measure=WebParser
Url=[mSitio]
StringIndex=28
DecodeCharacterReference=1
Substitute=#Substitucion#

[mFecha_7]
Measure=WebParser
Url=[mSitio]
StringIndex=29
DecodeCharacterReference=1
Substitute=#Substitucion#

[mFoto_7]
Measure=WebParser
Url=[mSitio]
StringIndex=30
Download=1
Substitute="":"#@#Images\MyReader\nopic.png"

[mTitulo_8]
Measure=WebParser
Url=[mSitio]
StringIndex=31
DecodeCharacterReference=1
Substitute=#Substitucion#

[mEnlace_8]
Measure=WebParser
Url=[mSitio]
StringIndex=32
DecodeCharacterReference=1
Substitute=#Substitucion#

[mFecha_8]
Measure=WebParser
Url=[mSitio]
StringIndex=33
DecodeCharacterReference=1
Substitute=#Substitucion#

[mFoto_8]
Measure=WebParser
Url=[mSitio]
StringIndex=34
Download=1
Substitute="":"#@#Images\MyReader\nopic.png"

[mTitulo_9]
Measure=WebParser
Url=[mSitio]
StringIndex=35
DecodeCharacterReference=1
Substitute=#Substitucion#

[mEnlace_9]
Measure=WebParser
Url=[mSitio]
StringIndex=36
DecodeCharacterReference=1
Substitute=#Substitucion#

[mFecha_9]
Measure=WebParser
Url=[mSitio]
StringIndex=37
DecodeCharacterReference=1
Substitute=#Substitucion#

[mFoto_9]
Measure=WebParser
Url=[mSitio]
StringIndex=38
Download=1
Substitute="":"#@#Images\MyReader\nopic.png"

[mTitulo_10]
Measure=WebParser
Url=[mSitio]
StringIndex=39
DecodeCharacterReference=1
Substitute=#Substitucion#

[mEnlace_10]
Measure=WebParser
Url=[mSitio]
StringIndex=40
DecodeCharacterReference=1
Substitute=#Substitucion#

[mFecha_10]
Measure=WebParser
Url=[mSitio]
StringIndex=41
DecodeCharacterReference=1
Substitute=#Substitucion#

[mFoto_10]
Measure=WebParser
Url=[mSitio]
StringIndex=42
Download=1
Substitute="":"#@#Images\MyReader\nopic.png"
