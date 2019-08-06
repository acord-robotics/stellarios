[Variables]
MRLogo=life04
MRNombre=GQ
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
Url=https://www.gq.com/feed/rss
RegExp=(?siU)<title>(.*)</title>.*<title>(.*)</title>.*<link>(.*)</link>.*url="(.*)".*<pubDate>(.*)</pubDate>.*<title>(.*)</title>.*<link>(.*)</link>.*url="(.*)".*<pubDate>(.*)</pubDate>.*<title>(.*)</title>.*<link>(.*)</link>.*url="(.*)".*<pubDate>(.*)</pubDate>.*<title>(.*)</title>.*<link>(.*)</link>.*url="(.*)".*<pubDate>(.*)</pubDate>.*<title>(.*)</title>.*<link>(.*)</link>.*url="(.*)".*<pubDate>(.*)</pubDate>.*<title>(.*)</title>.*<link>(.*)</link>.*url="(.*)".*<pubDate>(.*)</pubDate>.*<title>(.*)</title>.*<link>(.*)</link>.*url="(.*)".*<pubDate>(.*)</pubDate>.*<title>(.*)</title>.*<link>(.*)</link>.*url="(.*)".*<pubDate>(.*)</pubDate>.*<title>(.*)</title>.*<link>(.*)</link>.*url="(.*)".*<pubDate>(.*)</pubDate>.*<title>(.*)</title>.*<link>(.*)</link>.*url="(.*)".*<pubDate>(.*)</pubDate>
FinishAction=!UpdateMeterGroup Todos
OnDownloadErrorAction=!UpdateMeterGroup Todos

[mTitulo_1]
Measure=WebParser
Url=[mSitio]
StringIndex=2
DecodeCharacterReference=1

[mEnlace_1]
Measure=WebParser
Url=[mSitio]
StringIndex=3

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

[mTitulo_2]
Measure=WebParser
Url=[mSitio]
StringIndex=6
DecodeCharacterReference=1

[mEnlace_2]
Measure=WebParser
Url=[mSitio]
StringIndex=7

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

[mTitulo_3]
Measure=WebParser
Url=[mSitio]
StringIndex=10
DecodeCharacterReference=1

[mEnlace_3]
Measure=WebParser
Url=[mSitio]
StringIndex=11

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

[mTitulo_4]
Measure=WebParser
Url=[mSitio]
StringIndex=14
DecodeCharacterReference=1

[mEnlace_4]
Measure=WebParser
Url=[mSitio]
StringIndex=15

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

[mTitulo_5]
Measure=WebParser
Url=[mSitio]
StringIndex=18
DecodeCharacterReference=1

[mEnlace_5]
Measure=WebParser
Url=[mSitio]
StringIndex=19

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

[mTitulo_6]
Measure=WebParser
Url=[mSitio]
StringIndex=22
DecodeCharacterReference=1

[mEnlace_6]
Measure=WebParser
Url=[mSitio]
StringIndex=23

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

[mTitulo_7]
Measure=WebParser
Url=[mSitio]
StringIndex=26
DecodeCharacterReference=1

[mEnlace_7]
Measure=WebParser
Url=[mSitio]
StringIndex=27

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

[mTitulo_8]
Measure=WebParser
Url=[mSitio]
StringIndex=30
DecodeCharacterReference=1

[mEnlace_8]
Measure=WebParser
Url=[mSitio]
StringIndex=31

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

[mEnlace_9]
Measure=WebParser
Url=[mSitio]
StringIndex=35

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

[mTitulo_10]
Measure=WebParser
Url=[mSitio]
StringIndex=38
DecodeCharacterReference=1

[mEnlace_10]
Measure=WebParser
Url=[mSitio]
StringIndex=39

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
