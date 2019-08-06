[Variables]
MRLogo=tech06
MRNombre=LIFE HACKER
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
Url=http://lifehacker.com/rss
RegExp=(?siU)<item>.*<title>(.*)</title>.*<link>(.*)</link>.*src="(.*)".*<pubDate>(.*)</pubDate>.*</item>.*<item>.*<title>(.*)</title>.*<link>(.*)</link>.*src="(.*)".*<pubDate>(.*)</pubDate>.*</item>.*<item>.*<title>(.*)</title>.*<link>(.*)</link>.*src="(.*)".*<pubDate>(.*)</pubDate>.*</item>.*<item>.*<title>(.*)</title>.*<link>(.*)</link>.*src="(.*)".*<pubDate>(.*)</pubDate>.*</item>.*<item>.*<title>(.*)</title>.*<link>(.*)</link>.*src="(.*)".*<pubDate>(.*)</pubDate>.*</item>.*<item>.*<title>(.*)</title>.*<link>(.*)</link>.*src="(.*)".*<pubDate>(.*)</pubDate>.*</item>.*<item>.*<title>(.*)</title>.*<link>(.*)</link>.*src="(.*)".*<pubDate>(.*)</pubDate>.*</item>.*<item>.*<title>(.*)</title>.*<link>(.*)</link>.*src="(.*)".*<pubDate>(.*)</pubDate>.*</item>.*<item>.*<title>(.*)</title>.*<link>(.*)</link>.*src="(.*)".*<pubDate>(.*)</pubDate>.*</item>.*<item>.*<title>(.*)</title>.*<link>(.*)</link>.*src="(.*)".*<pubDate>(.*)</pubDate>.*</item>.*
FinishAction=!UpdateMeterGroup Todos
OnDownloadErrorAction=!UpdateMeterGroup Todos

[mTitulo_1]
Measure=WebParser
Url=[mSitio]
StringIndex=1
DecodeCharacterReference=1

[mEnlace_1]
Measure=WebParser
Url=[mSitio]
StringIndex=2

[mFecha_1]
Measure=WebParser
Url=[mSitio]
StringIndex=4

[mFoto_1]
Measure=WebParser
Url=[mSitio]
StringIndex=3
Download=1
Substitute="":"#@#Images\MyReader\nopic.png"

[mTitulo_2]
Measure=WebParser
Url=[mSitio]
StringIndex=5
DecodeCharacterReference=1

[mEnlace_2]
Measure=WebParser
Url=[mSitio]
StringIndex=5

[mFecha_2]
Measure=WebParser
Url=[mSitio]
StringIndex=8

[mFoto_2]
Measure=WebParser
Url=[mSitio]
StringIndex=7
Download=1
Substitute="":"#@#Images\MyReader\nopic.png"

[mTitulo_3]
Measure=WebParser
Url=[mSitio]
StringIndex=9
DecodeCharacterReference=1

[mEnlace_3]
Measure=WebParser
Url=[mSitio]
StringIndex=10

[mFecha_3]
Measure=WebParser
Url=[mSitio]
StringIndex=12

[mFoto_3]
Measure=WebParser
Url=[mSitio]
StringIndex=11
Download=1
Substitute="":"#@#Images\MyReader\nopic.png"

[mTitulo_4]
Measure=WebParser
Url=[mSitio]
StringIndex=13
DecodeCharacterReference=1

[mEnlace_4]
Measure=WebParser
Url=[mSitio]
StringIndex=14

[mFecha_4]
Measure=WebParser
Url=[mSitio]
StringIndex=16

[mFoto_4]
Measure=WebParser
Url=[mSitio]
StringIndex=15
Download=1
Substitute="":"#@#Images\MyReader\nopic.png"

[mTitulo_5]
Measure=WebParser
Url=[mSitio]
StringIndex=17
DecodeCharacterReference=1

[mEnlace_5]
Measure=WebParser
Url=[mSitio]
StringIndex=18

[mFecha_5]
Measure=WebParser
Url=[mSitio]
StringIndex=20

[mFoto_5]
Measure=WebParser
Url=[mSitio]
StringIndex=19
Download=1
Substitute="":"#@#Images\MyReader\nopic.png"

[mTitulo_6]
Measure=WebParser
Url=[mSitio]
StringIndex=21
DecodeCharacterReference=1

[mEnlace_6]
Measure=WebParser
Url=[mSitio]
StringIndex=22

[mFecha_6]
Measure=WebParser
Url=[mSitio]
StringIndex=24

[mFoto_6]
Measure=WebParser
Url=[mSitio]
StringIndex=23
Download=1
Substitute="":"#@#Images\MyReader\nopic.png"

[mTitulo_7]
Measure=WebParser
Url=[mSitio]
StringIndex=25
DecodeCharacterReference=1

[mEnlace_7]
Measure=WebParser
Url=[mSitio]
StringIndex=26

[mFecha_7]
Measure=WebParser
Url=[mSitio]
StringIndex=28

[mFoto_7]
Measure=WebParser
Url=[mSitio]
StringIndex=27
Download=1
Substitute="":"#@#Images\MyReader\nopic.png"

[mTitulo_8]
Measure=WebParser
Url=[mSitio]
StringIndex=29
DecodeCharacterReference=1

[mEnlace_8]
Measure=WebParser
Url=[mSitio]
StringIndex=30

[mFecha_8]
Measure=WebParser
Url=[mSitio]
StringIndex=32

[mFoto_8]
Measure=WebParser
Url=[mSitio]
StringIndex=31
Download=1
Substitute="":"#@#Images\MyReader\nopic.png"

[mTitulo_9]
Measure=WebParser
Url=[mSitio]
StringIndex=33
DecodeCharacterReference=1

[mEnlace_4]
Measure=WebParser
Url=[mSitio]
StringIndex=34

[mFecha_9]
Measure=WebParser
Url=[mSitio]
StringIndex=36

[mFoto_9]
Measure=WebParser
Url=[mSitio]
StringIndex=35
Download=1
Substitute="":"#@#Images\MyReader\nopic.png"

[mTitulo_10]
Measure=WebParser
Url=[mSitio]
StringIndex=37
DecodeCharacterReference=1

[mEnlace_10]
Measure=WebParser
Url=[mSitio]
StringIndex=38

[mFecha_10]
Measure=WebParser
Url=[mSitio]
StringIndex=40

[mFoto_10]
Measure=WebParser
Url=[mSitio]
StringIndex=39
Download=1
Substitute="":"#@#Images\MyReader\nopic.png"
