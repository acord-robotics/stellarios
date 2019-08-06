[Variables]
MRLogo=movies02
MRNombre=MOVIE WEB
E1=
E2=Only available
E3=in some general
E4=News sites
E5=
E6=
E7=
E8=
URL1=
URL2=
URL3=
URL4=
URL5=
URL6=
URL7=
URL8=

[mSitio]
Measure=WebParser
UpdateRate=1800
Url=http://feeds.feedburner.com/movieweb_news
RegExp=(?siU)<item>.*<title>(.*)</title>.*url="(.*)".*<link>(.*)</link>.*<pubDate>(.*)</pubDate>.*<title>(.*)</title>.*url="(.*)".*<link>(.*)</link>.*<pubDate>(.*)</pubDate>.*<title>(.*)</title>.*url="(.*)".*<link>(.*)</link>.*<pubDate>(.*)</pubDate>.*<title>(.*)</title>.*url="(.*)".*<link>(.*)</link>.*<pubDate>(.*)</pubDate>.*<title>(.*)</title>.*url="(.*)".*<link>(.*)</link>.*<pubDate>(.*)</pubDate>.*<title>(.*)</title>.*url="(.*)".*<link>(.*)</link>.*<pubDate>(.*)</pubDate>.*<title>(.*)</title>.*url="(.*)".*<link>(.*)</link>.*<pubDate>(.*)</pubDate>.*<title>(.*)</title>.*url="(.*)".*<link>(.*)</link>.*<pubDate>(.*)</pubDate>.*<title>(.*)</title>.*url="(.*)".*<link>(.*)</link>.*<pubDate>(.*)</pubDate>.*<title>(.*)</title>.*url="(.*)".*<link>(.*)</link>.*<pubDate>(.*)</pubDate>
FinishAction=!UpdateMeterGroup Todos
OnDownloadErrorAction=!UpdateMeterGroup Todos

[mTitulo_1]
Measure=WebParser
Url=[mSitio]
StringIndex=1
DecodeCharacterReference=1

[mFoto_1]
Measure=WebParser
Url=[mSitio]
StringIndex=2
Download=1
Substitute="":"#@#Images\MyReader\nopic.png"

[mEnlace_1]
Measure=WebParser
Url=[mSitio]
StringIndex=3

[mFecha_1]
Measure=WebParser
Url=[mSitio]
StringIndex=4

[mTitulo_2]
Measure=WebParser
Url=[mSitio]
StringIndex=5
DecodeCharacterReference=1

[mFoto_2]
Measure=WebParser
Url=[mSitio]
StringIndex=6
Download=1
Substitute="":"#@#Images\MyReader\nopic.png"

[mEnlace_2]
Measure=WebParser
Url=[mSitio]
StringIndex=7

[mFecha_2]
Measure=WebParser
Url=[mSitio]
StringIndex=8

[mTitulo_3]
Measure=WebParser
Url=[mSitio]
StringIndex=9
DecodeCharacterReference=1

[mFoto_3]
Measure=WebParser
Url=[mSitio]
StringIndex=10
Download=1
Substitute="":"#@#Images\MyReader\nopic.png"

[mEnlace_3]
Measure=WebParser
Url=[mSitio]
StringIndex=11

[mFecha_3]
Measure=WebParser
Url=[mSitio]
StringIndex=12

[mTitulo_4]
Measure=WebParser
Url=[mSitio]
StringIndex=13
DecodeCharacterReference=1

[mFoto_4]
Measure=WebParser
Url=[mSitio]
StringIndex=14
Download=1
Substitute="":"#@#Images\MyReader\nopic.png"

[mEnlace_4]
Measure=WebParser
Url=[mSitio]
StringIndex=15

[mFecha_4]
Measure=WebParser
Url=[mSitio]
StringIndex=16

[mTitulo_5]
Measure=WebParser
Url=[mSitio]
StringIndex=17
DecodeCharacterReference=1

[mFoto_5]
Measure=WebParser
Url=[mSitio]
StringIndex=18
Download=1
Substitute="":"#@#Images\MyReader\nopic.png"

[mEnlace_5]
Measure=WebParser
Url=[mSitio]
StringIndex=19

[mFecha_5]
Measure=WebParser
Url=[mSitio]
StringIndex=20

[mTitulo_6]
Measure=WebParser
Url=[mSitio]
StringIndex=21
DecodeCharacterReference=1

[mFoto_6]
Measure=WebParser
Url=[mSitio]
StringIndex=22
Download=1
Substitute="":"#@#Images\MyReader\nopic.png"

[mEnlace_6]
Measure=WebParser
Url=[mSitio]
StringIndex=23

[mFecha_6]
Measure=WebParser
Url=[mSitio]
StringIndex=24

[mTitulo_7]
Measure=WebParser
Url=[mSitio]
StringIndex=25
DecodeCharacterReference=1

[mFoto_7]
Measure=WebParser
Url=[mSitio]
StringIndex=26
Download=1
Substitute="":"#@#Images\MyReader\nopic.png"

[mEnlace_7]
Measure=WebParser
Url=[mSitio]
StringIndex=27

[mFecha_7]
Measure=WebParser
Url=[mSitio]
StringIndex=28

[mTitulo_8]
Measure=WebParser
Url=[mSitio]
StringIndex=29
DecodeCharacterReference=1

[mFoto_8]
Measure=WebParser
Url=[mSitio]
StringIndex=30
Download=1
Substitute="":"#@#Images\MyReader\nopic.png"

[mEnlace_8]
Measure=WebParser
Url=[mSitio]
StringIndex=31

[mFecha_8]
Measure=WebParser
Url=[mSitio]
StringIndex=32

[mTitulo_9]
Measure=WebParser
Url=[mSitio]
StringIndex=33
DecodeCharacterReference=1

[mFoto_9]
Measure=WebParser
Url=[mSitio]
StringIndex=34
Download=1
Substitute="":"#@#Images\MyReader\nopic.png"

[mEnlace_9]
Measure=WebParser
Url=[mSitio]
StringIndex=35

[mFecha_9]
Measure=WebParser
Url=[mSitio]
StringIndex=36

[mTitulo_10]
Measure=WebParser
Url=[mSitio]
StringIndex=37
DecodeCharacterReference=1

[mFoto_10]
Measure=WebParser
Url=[mSitio]
StringIndex=38
Download=1
Substitute="":"#@#Images\MyReader\nopic.png"

[mEnlace_10]
Measure=WebParser
Url=[mSitio]
StringIndex=39

[mFecha_10]
Measure=WebParser
Url=[mSitio]
StringIndex=40
