[Variables]
MRLogo=news04
MRNombre=NEW YORK TIMES
E1=US
E2=WORLD
E3=EUROPE
E4=AMERICAS
E5=ASIA
E6=SPORTS
E7=TECHNOLOGY
E8=MOVIES
URL1=http://rss.nytimes.com/services/xml/rss/nyt/US.xml
URL2=http://rss.nytimes.com/services/xml/rss/nyt/World.xml
URL3=http://rss.nytimes.com/services/xml/rss/nyt/Europe.xml
URL4=http://rss.nytimes.com/services/xml/rss/nyt/Americas.xml
URL5=http://rss.nytimes.com/services/xml/rss/nyt/AsiaPacific.xml
URL6=http://rss.nytimes.com/services/xml/rss/nyt/Sports.xml
URL7=http://rss.nytimes.com/services/xml/rss/nyt/Technology.xml
URL8=http://rss.nytimes.com/services/xml/rss/nyt/Movies.xml

[mSitio]
Measure=WebParser
UpdateRate=1800
Url=#URLFinal#
RegExp=(?siU)<title>(.*)</title>.*<title>(.*)</title>.*<title>(.*)</title>.*<link>(.*)</link>.*url="(.*)".*<pubDate>(.*)</pubDate>.*<title>(.*)</title>.*<link>(.*)</link>.*url="(.*)".*<pubDate>(.*)</pubDate>.*<title>(.*)</title>.*<link>(.*)</link>.*url="(.*)".*<pubDate>(.*)</pubDate>.*<title>(.*)</title>.*<link>(.*)</link>.*url="(.*)".*<pubDate>(.*)</pubDate>.*<title>(.*)</title>.*<link>(.*)</link>.*url="(.*)".*<pubDate>(.*)</pubDate>.*<title>(.*)</title>.*<link>(.*)</link>.*url="(.*)".*<pubDate>(.*)</pubDate>.*<title>(.*)</title>.*<link>(.*)</link>.*url="(.*)".*<pubDate>(.*)</pubDate>.*<title>(.*)</title>.*<link>(.*)</link>.*url="(.*)".*<pubDate>(.*)</pubDate>.*<title>(.*)</title>.*<link>(.*)</link>.*url="(.*)".*<pubDate>(.*)</pubDate>.*<title>(.*)</title>.*<link>(.*)</link>.*url="(.*)".*<pubDate>(.*)</pubDate>
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

[mFoto_1]
Measure=WebParser
Url=[mSitio]
StringIndex=5
Download=1
Substitute="":"#@#Images\MyReader\nopic.png"

[mFecha_1]
Measure=WebParser
Url=[mSitio]
StringIndex=6

[mTitulo_2]
Measure=WebParser
Url=[mSitio]
StringIndex=7
DecodeCharacterReference=1

[mEnlace_2]
Measure=WebParser
Url=[mSitio]
StringIndex=8

[mFoto_2]
Measure=WebParser
Url=[mSitio]
StringIndex=9
Download=1
Substitute="":"#@#Images\MyReader\nopic.png"

[mFecha_2]
Measure=WebParser
Url=[mSitio]
StringIndex=10

[mTitulo_3]
Measure=WebParser
Url=[mSitio]
StringIndex=11
DecodeCharacterReference=1

[mEnlace_3]
Measure=WebParser
Url=[mSitio]
StringIndex=12

[mFoto_3]
Measure=WebParser
Url=[mSitio]
StringIndex=13
Download=1
Substitute="":"#@#Images\MyReader\nopic.png"

[mFecha_3]
Measure=WebParser
Url=[mSitio]
StringIndex=14

[mTitulo_4]
Measure=WebParser
Url=[mSitio]
StringIndex=15
DecodeCharacterReference=1

[mEnlace_4]
Measure=WebParser
Url=[mSitio]
StringIndex=16

[mFoto_4]
Measure=WebParser
Url=[mSitio]
StringIndex=17
Download=1
Substitute="":"#@#Images\MyReader\nopic.png"

[mFecha_4]
Measure=WebParser
Url=[mSitio]
StringIndex=18

[mTitulo_5]
Measure=WebParser
Url=[mSitio]
StringIndex=19
DecodeCharacterReference=1

[mEnlace_5]
Measure=WebParser
Url=[mSitio]
StringIndex=20

[mFoto_5]
Measure=WebParser
Url=[mSitio]
StringIndex=21
Download=1
Substitute="":"#@#Images\MyReader\nopic.png"

[mFecha_5]
Measure=WebParser
Url=[mSitio]
StringIndex=22

[mTitulo_6]
Measure=WebParser
Url=[mSitio]
StringIndex=23
DecodeCharacterReference=1

[mEnlace_6]
Measure=WebParser
Url=[mSitio]
StringIndex=24

[mFoto_6]
Measure=WebParser
Url=[mSitio]
StringIndex=25
Download=1
Substitute="":"#@#Images\MyReader\nopic.png"

[mFecha_6]
Measure=WebParser
Url=[mSitio]
StringIndex=26

[mTitulo_7]
Measure=WebParser
Url=[mSitio]
StringIndex=27
DecodeCharacterReference=1

[mEnlace_7]
Measure=WebParser
Url=[mSitio]
StringIndex=28

[mFoto_7]
Measure=WebParser
Url=[mSitio]
StringIndex=29
Download=1
Substitute="":"#@#Images\MyReader\nopic.png"

[mFecha_7]
Measure=WebParser
Url=[mSitio]
StringIndex=30

[mTitulo_8]
Measure=WebParser
Url=[mSitio]
StringIndex=31
DecodeCharacterReference=1

[mEnlace_8]
Measure=WebParser
Url=[mSitio]
StringIndex=32

[mFoto_8]
Measure=WebParser
Url=[mSitio]
StringIndex=33
Download=1
Substitute="":"#@#Images\MyReader\nopic.png"

[mFecha_8]
Measure=WebParser
Url=[mSitio]
StringIndex=34

[mTitulo_9]
Measure=WebParser
Url=[mSitio]
StringIndex=35
DecodeCharacterReference=1

[mEnlace_9]
Measure=WebParser
Url=[mSitio]
StringIndex=36

[mFoto_9]
Measure=WebParser
Url=[mSitio]
StringIndex=37
Download=1
Substitute="":"#@#Images\MyReader\nopic.png"

[mFecha_9]
Measure=WebParser
Url=[mSitio]
StringIndex=38

[mTitulo_10]
Measure=WebParser
Url=[mSitio]
StringIndex=39
DecodeCharacterReference=1

[mEnlace_10]
Measure=WebParser
Url=[mSitio]
StringIndex=40

[mFoto_10]
Measure=WebParser
Url=[mSitio]
StringIndex=41
Download=1
Substitute="":"#@#Images\MyReader\nopic.png"

[mFecha_10]
Measure=WebParser
Url=[mSitio]
StringIndex=42
