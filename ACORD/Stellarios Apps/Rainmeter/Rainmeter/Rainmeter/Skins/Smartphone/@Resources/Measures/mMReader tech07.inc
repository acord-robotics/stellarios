[Variables]
MRLogo=tech07
MRNombre=COMPUTER WORLD
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
Url=https://www.computerworld.com/index.rss
RegExp=(?siU)<item>.*<title>(.*)</title>.*<pubDate>(.*)</pubDate>.*<link>(.*)</link>.*url="(.*)".*</item>.*<item>.*<title>(.*)</title>.*<pubDate>(.*)</pubDate>.*<link>(.*)</link>.*url="(.*)".*</item>.*<item>.*<title>(.*)</title>.*<pubDate>(.*)</pubDate>.*<link>(.*)</link>.*url="(.*)".*</item>.*<item>.*<title>(.*)</title>.*<pubDate>(.*)</pubDate>.*<link>(.*)</link>.*url="(.*)".*</item>.*<item>.*<title>(.*)</title>.*<pubDate>(.*)</pubDate>.*<link>(.*)</link>.*url="(.*)".*</item>.*<item>.*<title>(.*)</title>.*<pubDate>(.*)</pubDate>.*<link>(.*)</link>.*url="(.*)".*</item>.*<item>.*<title>(.*)</title>.*<pubDate>(.*)</pubDate>.*<link>(.*)</link>.*url="(.*)".*</item>.*<item>.*<title>(.*)</title>.*<pubDate>(.*)</pubDate>.*<link>(.*)</link>.*url="(.*)".*</item>.*<item>.*<title>(.*)</title>.*<pubDate>(.*)</pubDate>.*<link>(.*)</link>.*url="(.*)".*</item>.*<item>.*<title>(.*)</title>.*<pubDate>(.*)</pubDate>.*<link>(.*)</link>.*url="(.*)".*</item>.*
FinishAction=!UpdateMeterGroup Todos
OnDownloadErrorAction=!UpdateMeterGroup Todos

[mTitulo_1]
Measure=WebParser
Url=[mSitio]
StringIndex=1
DecodeCharacterReference=1

[mFecha_1]
Measure=WebParser
Url=[mSitio]
StringIndex=2

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

[mTitulo_2]
Measure=WebParser
Url=[mSitio]
StringIndex=5
DecodeCharacterReference=1

[mFecha_2]
Measure=WebParser
Url=[mSitio]
StringIndex=6

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

[mTitulo_3]
Measure=WebParser
Url=[mSitio]
StringIndex=9
DecodeCharacterReference=1

[mFecha_3]
Measure=WebParser
Url=[mSitio]
StringIndex=10

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

[mTitulo_4]
Measure=WebParser
Url=[mSitio]
StringIndex=13
DecodeCharacterReference=1

[mFecha_4]
Measure=WebParser
Url=[mSitio]
StringIndex=14

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

[mTitulo_5]
Measure=WebParser
Url=[mSitio]
StringIndex=17
DecodeCharacterReference=1

[mFecha_5]
Measure=WebParser
Url=[mSitio]
StringIndex=18

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

[mTitulo_6]
Measure=WebParser
Url=[mSitio]
StringIndex=21
DecodeCharacterReference=1

[mFecha_6]
Measure=WebParser
Url=[mSitio]
StringIndex=22

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

[mTitulo_7]
Measure=WebParser
Url=[mSitio]
StringIndex=25
DecodeCharacterReference=1

[mFecha_7]
Measure=WebParser
Url=[mSitio]
StringIndex=26

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

[mTitulo_8]
Measure=WebParser
Url=[mSitio]
StringIndex=29
DecodeCharacterReference=1

[mFecha_8]
Measure=WebParser
Url=[mSitio]
StringIndex=30

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

[mTitulo_9]
Measure=WebParser
Url=[mSitio]
StringIndex=33
DecodeCharacterReference=1

[mFecha_9]
Measure=WebParser
Url=[mSitio]
StringIndex=34

[mEnlace_4]
Measure=WebParser
Url=[mSitio]
StringIndex=35

[mFoto_9]
Measure=WebParser
Url=[mSitio]
StringIndex=36
Download=1
Substitute="":"#@#Images\MyReader\nopic.png"

[mTitulo_10]
Measure=WebParser
Url=[mSitio]
StringIndex=37
DecodeCharacterReference=1

[mFecha_10]
Measure=WebParser
Url=[mSitio]
StringIndex=38

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
