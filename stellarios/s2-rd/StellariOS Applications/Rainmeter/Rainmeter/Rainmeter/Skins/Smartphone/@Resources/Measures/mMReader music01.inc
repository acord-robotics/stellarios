[Variables]
MRLogo=music01
MRNombre=MUSIC NEWS
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
Url=http://www.music-news.com/rss/UK/news?includeCover=true
RegExp=(?siU)<title>(.*)</title>.*<title>(.*)</title>.*<title>(.*)</title>.*<link>(.*)</link>.*<pubDate>(.*)</pubDate>.*url="(.*)".*<title>(.*)</title>.*<link>(.*)</link>.*<pubDate>(.*)</pubDate>.*url="(.*)".*<title>(.*)</title>.*<link>(.*)</link>.*<pubDate>(.*)</pubDate>.*url="(.*)".*<title>(.*)</title>.*<link>(.*)</link>.*<pubDate>(.*)</pubDate>.*url="(.*)".*<title>(.*)</title>.*<link>(.*)</link>.*<pubDate>(.*)</pubDate>.*url="(.*)".*<title>(.*)</title>.*<link>(.*)</link>.*<pubDate>(.*)</pubDate>.*url="(.*)".*<title>(.*)</title>.*<link>(.*)</link>.*<pubDate>(.*)</pubDate>.*url="(.*)".*<title>(.*)</title>.*<link>(.*)</link>.*<pubDate>(.*)</pubDate>.*url="(.*)".*<title>(.*)</title>.*<link>(.*)</link>.*<pubDate>(.*)</pubDate>.*url="(.*)".*<title>(.*)</title>.*<link>(.*)</link>.*<pubDate>(.*)</pubDate>.*url="(.*)"
FinishAction=!UpdateMeterGroup Todos
OnDownloadErrorAction=!UpdateMeterGroup Todos

[mTitulo_1]
Measure=WebParser
Url=[mSitio]
StringIndex=3
DecodeCharacterReference=1

[mEnlace_1]
Measure=WebParser
Url=[mSitio]
StringIndex=4

[mFecha_1]
Measure=WebParser
Url=[mSitio]
StringIndex=5

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

[mEnlace_2]
Measure=WebParser
Url=[mSitio]
StringIndex=8

[mFecha_2]
Measure=WebParser
Url=[mSitio]
StringIndex=9

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

[mEnlace_3]
Measure=WebParser
Url=[mSitio]
StringIndex=12

[mFecha_3]
Measure=WebParser
Url=[mSitio]
StringIndex=13

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

[mEnlace_4]
Measure=WebParser
Url=[mSitio]
StringIndex=16

[mFecha_4]
Measure=WebParser
Url=[mSitio]
StringIndex=17

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

[mEnlace_5]
Measure=WebParser
Url=[mSitio]
StringIndex=20

[mFecha_5]
Measure=WebParser
Url=[mSitio]
StringIndex=21

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

[mEnlace_6]
Measure=WebParser
Url=[mSitio]
StringIndex=24

[mFecha_6]
Measure=WebParser
Url=[mSitio]
StringIndex=25

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

[mEnlace_7]
Measure=WebParser
Url=[mSitio]
StringIndex=28

[mFecha_7]
Measure=WebParser
Url=[mSitio]
StringIndex=29

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

[mEnlace_8]
Measure=WebParser
Url=[mSitio]
StringIndex=32

[mFecha_8]
Measure=WebParser
Url=[mSitio]
StringIndex=33

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

[mEnlace_9]
Measure=WebParser
Url=[mSitio]
StringIndex=36

[mFecha_9]
Measure=WebParser
Url=[mSitio]
StringIndex=37

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

[mEnlace_10]
Measure=WebParser
Url=[mSitio]
StringIndex=40

[mFecha_10]
Measure=WebParser
Url=[mSitio]
StringIndex=41

[mFoto_10]
Measure=WebParser
Url=[mSitio]
StringIndex=42
Download=1
Substitute="":"#@#Images\MyReader\nopic.png"
