[Variables]
MRLogo=tech05
MRNombre=ENGADGET
Substitucion="<![CDATA[":"","]]>":""
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
Url=https://www.engadget.com/rss.xml
RegExp=(?siU)<title>(.*)</title>.*<title>(.*)</title>.*<title>(.*)</title>.*<link>(.*)</link>.*<img src="(.*)".*<pubDate>(.*)</pubDate>.*<title>(.*)</title>.*<link>(.*)</link>.*<img src="(.*)".*<pubDate>(.*)</pubDate>.*<title>(.*)</title>.*<link>(.*)</link>.*<img src="(.*)".*<pubDate>(.*)</pubDate>.*<title>(.*)</title>.*<link>(.*)</link>.*<img src="(.*)".*<pubDate>(.*)</pubDate>.*<title>(.*)</title>.*<link>(.*)</link>.*<img src="(.*)".*<pubDate>(.*)</pubDate>.*<title>(.*)</title>.*<link>(.*)</link>.*<img src="(.*)".*<pubDate>(.*)</pubDate>.*<title>(.*)</title>.*<link>(.*)</link>.*<img src="(.*)".*<pubDate>(.*)</pubDate>.*<title>(.*)</title>.*<link>(.*)</link>.*<img src="(.*)".*<pubDate>(.*)</pubDate>.*<title>(.*)</title>.*<link>(.*)</link>.*<img src="(.*)".*<pubDate>(.*)</pubDate>.*<title>(.*)</title>.*<link>(.*)</link>.*<img src="(.*)".*<pubDate>(.*)</pubDate>
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

[mFoto_1]
Measure=WebParser
Url=[mSitio]
StringIndex=5
Download=1
DownloadFile="TempFile1.jpg"
DecodeCharacterReference=1

[mFecha_1]
Measure=WebParser
Url=[mSitio]
StringIndex=6

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

[mFoto_2]
Measure=WebParser
Url=[mSitio]
StringIndex=9
Download=1
DownloadFile="TempFile2.jpg"
DecodeCharacterReference=1

[mFecha_2]
Measure=WebParser
Url=[mSitio]
StringIndex=10

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

[mFoto_3]
Measure=WebParser
Url=[mSitio]
StringIndex=13
Download=1
DownloadFile="TempFile3.jpg"
DecodeCharacterReference=1

[mFecha_3]
Measure=WebParser
Url=[mSitio]
StringIndex=14

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

[mFoto_4]
Measure=WebParser
Url=[mSitio]
StringIndex=17
Download=1
DownloadFile="TempFile4.jpg"
DecodeCharacterReference=1

[mFecha_4]
Measure=WebParser
Url=[mSitio]
StringIndex=18

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

[mFoto_5]
Measure=WebParser
Url=[mSitio]
StringIndex=21
Download=1
DownloadFile="TempFile5.jpg"
DecodeCharacterReference=1

[mFecha_5]
Measure=WebParser
Url=[mSitio]
StringIndex=22

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

[mFoto_6]
Measure=WebParser
Url=[mSitio]
StringIndex=25
Download=1
DownloadFile="TempFile6.jpg"
DecodeCharacterReference=1

[mFecha_6]
Measure=WebParser
Url=[mSitio]
StringIndex=26

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

[mFoto_7]
Measure=WebParser
Url=[mSitio]
StringIndex=29
Download=1
DownloadFile="TempFile7.jpg"
DecodeCharacterReference=1

[mFecha_7]
Measure=WebParser
Url=[mSitio]
StringIndex=30

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

[mFoto_8]
Measure=WebParser
Url=[mSitio]
StringIndex=33
Download=1
DownloadFile="TempFile8.jpg"
DecodeCharacterReference=1

[mFecha_8]
Measure=WebParser
Url=[mSitio]
StringIndex=34

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

[mFoto_9]
Measure=WebParser
Url=[mSitio]
StringIndex=37
Download=1
DownloadFile="TempFile9.jpg"
DecodeCharacterReference=1

[mFecha_9]
Measure=WebParser
Url=[mSitio]
StringIndex=38

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

[mFoto_10]
Measure=WebParser
Url=[mSitio]
StringIndex=41
Download=1
DownloadFile="TempFile10.jpg"
DecodeCharacterReference=1

[mFecha_10]
Measure=WebParser
Url=[mSitio]
StringIndex=42
