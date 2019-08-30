[Variables]
MRLogo=pic06
MRNombre=NAT GEO ASIA
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
Url=http://feeds.feedburner.com/natgeotv/asia/featured/POD
RegExp=(?siU)<title>(.*)</title>.*<title>(.*)</title>.*<link>(.*)</link>.*src="(.*)".*<title>(.*)</title>.*<link>(.*)</link>.*src="(.*)".*<title>(.*)</title>.*<link>(.*)</link>.*src="(.*)".*<title>(.*)</title>.*<link>(.*)</link>.*src="(.*)".*<title>(.*)</title>.*<link>(.*)</link>.*src="(.*)".*<title>(.*)</title>.*<link>(.*)</link>.*src="(.*)".*<title>(.*)</title>.*<link>(.*)</link>.*src="(.*)".*<title>(.*)</title>.*<link>(.*)</link>.*src="(.*)".*<title>(.*)</title>.*<link>(.*)</link>.*src="(.*)".*<title>(.*)</title>.*<link>(.*)</link>.*src="(.*)"
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

[mTitulo_2]
Measure=WebParser
Url=[mSitio]
StringIndex=5
DecodeCharacterReference=1

[mEnlace_2]
Measure=WebParser
Url=[mSitio]
StringIndex=6

[mFoto_2]
Measure=WebParser
Url=[mSitio]
StringIndex=7
Download=1
Substitute="":"#@#Images\MyReader\nopic.png"

[mTitulo_3]
Measure=WebParser
Url=[mSitio]
StringIndex=8
DecodeCharacterReference=1

[mEnlace_3]
Measure=WebParser
Url=[mSitio]
StringIndex=9

[mFoto_3]
Measure=WebParser
Url=[mSitio]
StringIndex=10
Download=1
Substitute="":"#@#Images\MyReader\nopic.png"

[mTitulo_4]
Measure=WebParser
Url=[mSitio]
StringIndex=11
DecodeCharacterReference=1

[mEnlace_4]
Measure=WebParser
Url=[mSitio]
StringIndex=12

[mFoto_4]
Measure=WebParser
Url=[mSitio]
StringIndex=13
Download=1
Substitute="":"#@#Images\MyReader\nopic.png"

[mTitulo_5]
Measure=WebParser
Url=[mSitio]
StringIndex=14
DecodeCharacterReference=1

[mEnlace_5]
Measure=WebParser
Url=[mSitio]
StringIndex=15

[mFoto_5]
Measure=WebParser
Url=[mSitio]
StringIndex=16
Download=1
Substitute="":"#@#Images\MyReader\nopic.png"

[mTitulo_6]
Measure=WebParser
Url=[mSitio]
StringIndex=17
DecodeCharacterReference=1

[mEnlace_6]
Measure=WebParser
Url=[mSitio]
StringIndex=18

[mFoto_6]
Measure=WebParser
Url=[mSitio]
StringIndex=19
Download=1
Substitute="":"#@#Images\MyReader\nopic.png"

[mTitulo_7]
Measure=WebParser
Url=[mSitio]
StringIndex=20
DecodeCharacterReference=1

[mEnlace_7]
Measure=WebParser
Url=[mSitio]
StringIndex=21

[mFoto_7]
Measure=WebParser
Url=[mSitio]
StringIndex=22
Download=1
Substitute="":"#@#Images\MyReader\nopic.png"

[mTitulo_8]
Measure=WebParser
Url=[mSitio]
StringIndex=23
DecodeCharacterReference=1

[mEnlace_8]
Measure=WebParser
Url=[mSitio]
StringIndex=24

[mFoto_8]
Measure=WebParser
Url=[mSitio]
StringIndex=25
Download=1
Substitute="":"#@#Images\MyReader\nopic.png"

[mTitulo_9]
Measure=WebParser
Url=[mSitio]
StringIndex=26
DecodeCharacterReference=1

[mEnlace_9]
Measure=WebParser
Url=[mSitio]
StringIndex=27

[mFoto_9]
Measure=WebParser
Url=[mSitio]
StringIndex=28
Download=1
Substitute="":"#@#Images\MyReader\nopic.png"

[mTitulo_10]
Measure=WebParser
Url=[mSitio]
StringIndex=29
DecodeCharacterReference=1

[mEnlace_10]
Measure=WebParser
Url=[mSitio]
StringIndex=30

[mFoto_10]
Measure=WebParser
Url=[mSitio]
StringIndex=31
Download=1
Substitute="":"#@#Images\MyReader\nopic.png"
