[Variables]
MRLogo=news02
MRNombre=CNN
Substitucion="<![CDATA[":"","]]>":""
E1=US
E2=WORLD
E3=EUROPE
E4=ASIA
E5=ENTERTAINMENT
E6=SPORT
E7=TRAVEL
E8=
URL1=http://rss.cnn.com/rss/edition_us.rss
URL2=http://rss.cnn.com/rss/edition_world.rss
URL3=http://rss.cnn.com/rss/edition_europe.rss
URL4=http://rss.cnn.com/rss/edition_asia.rss
URL5=http://rss.cnn.com/rss/edition_entertainment.rss
URL6=http://rss.cnn.com/rss/edition_sport.rss
URL7=http://rss.cnn.com/rss/edition_travel.rss
URL8=

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
Substitute=#Substitucion#

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
Substitute=#Substitucion#

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
Substitute=#Substitucion#

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
Substitute=#Substitucion#

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
Substitute=#Substitucion#

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
Substitute=#Substitucion#

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
Substitute=#Substitucion#

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
Substitute=#Substitucion#

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
Substitute=#Substitucion#

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
