[Variables]
MRLogo=news07
MRNombre=BILD
Substitucion="<![CDATA[":"","]]>":""
E1=NEWS
E2=UNTERHALTUNG
E3=SPORT
E4=LIFESTYLE
E5=AUTO
E6=DIGITAL
E7=SPIELE
E8=ALLE ARTIKEL
URL1=https://www.bild.de/rss-feeds/rss-16725492,feed=news.bild.html
URL2=https://www.bild.de/rss-feeds/rss-16725492,feed=unterhaltung.bild.html
URL3=https://www.bild.de/rss-feeds/rss-16725492,feed=sport.bild.html
URL4=https://www.bild.de/rss-feeds/rss-16725492,feed=lifestyle.bild.html
URL5=https://www.bild.de/rss-feeds/rss-16725492,feed=auto.bild.html
URL6=https://www.bild.de/rss-feeds/rss-16725492,feed=digital.bild.html
URL7=https://www.bild.de/rss-feeds/rss-16725492,feed=spiele.bild.html
URL8=https://www.bild.de/rssfeeds/rss3-20745882,feed=alles.bild.html

[mSitio]
Measure=WebParser
UpdateRate=1800
Url=#URLFinal#
RegExp=(?siU)<item>.*<title>(.*)</title>.*<link>(.*)</link>.*<pubDate>(.*)</pubDate>.*url="(.*)".*url="(.*)".*<title>(.*)</title>.*<link>(.*)</link>.*<pubDate>(.*)</pubDate>.*url="(.*)".*url="(.*)".*<title>(.*)</title>.*<link>(.*)</link>.*<pubDate>(.*)</pubDate>.*url="(.*)".*url="(.*)".*<title>(.*)</title>.*<link>(.*)</link>.*<pubDate>(.*)</pubDate>.*url="(.*)".*url="(.*)".*<title>(.*)</title>.*<link>(.*)</link>.*<pubDate>(.*)</pubDate>.*url="(.*)".*url="(.*)".*<title>(.*)</title>.*<link>(.*)</link>.*<pubDate>(.*)</pubDate>.*url="(.*)".*url="(.*)".*<title>(.*)</title>.*<link>(.*)</link>.*<pubDate>(.*)</pubDate>.*url="(.*)".*url="(.*)".*<title>(.*)</title>.*<link>(.*)</link>.*<pubDate>(.*)</pubDate>.*url="(.*)".*url="(.*)".*<title>(.*)</title>.*<link>(.*)</link>.*<pubDate>(.*)</pubDate>.*url="(.*)".*url="(.*)".*<title>(.*)</title>.*<link>(.*)</link>.*<pubDate>(.*)</pubDate>.*url="(.*)".*url="(.*)"
FinishAction=!UpdateMeterGroup Todos
OnDownloadErrorAction=!UpdateMeterGroup Todos

[mTitulo_1]
Measure=WebParser
Url=[mSitio]
StringIndex=1
DecodeCharacterReference=1
Substitute=#Substitucion#

[mEnlace_1]
Measure=WebParser
Url=[mSitio]
StringIndex=2

[mFecha_1]
Measure=WebParser
Url=[mSitio]
StringIndex=3

[mFoto_1]
Measure=WebParser
Url=[mSitio]
StringIndex=5
Download=1
Substitute="":"#@#Images\MyReader\nopic.png"

[mTitulo_2]
Measure=WebParser
Url=[mSitio]
StringIndex=6
DecodeCharacterReference=1
Substitute=#Substitucion#

[mEnlace_2]
Measure=WebParser
Url=[mSitio]
StringIndex=7

[mFecha_2]
Measure=WebParser
Url=[mSitio]
StringIndex=8

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
StringIndex=15
Download=1
Substitute="":"#@#Images\MyReader\nopic.png"

[mTitulo_4]
Measure=WebParser
Url=[mSitio]
StringIndex=16
DecodeCharacterReference=1
Substitute=#Substitucion#

[mEnlace_4]
Measure=WebParser
Url=[mSitio]
StringIndex=17

[mFecha_4]
Measure=WebParser
Url=[mSitio]
StringIndex=18

[mFoto_4]
Measure=WebParser
Url=[mSitio]
StringIndex=20
Download=1
Substitute="":"#@#Images\MyReader\nopic.png"

[mTitulo_5]
Measure=WebParser
Url=[mSitio]
StringIndex=21
DecodeCharacterReference=1
Substitute=#Substitucion#

[mEnlace_5]
Measure=WebParser
Url=[mSitio]
StringIndex=22

[mFecha_5]
Measure=WebParser
Url=[mSitio]
StringIndex=23

[mFoto_5]
Measure=WebParser
Url=[mSitio]
StringIndex=25
Download=1
Substitute="":"#@#Images\MyReader\nopic.png"

[mTitulo_6]
Measure=WebParser
Url=[mSitio]
StringIndex=26
DecodeCharacterReference=1
Substitute=#Substitucion#

[mEnlace_6]
Measure=WebParser
Url=[mSitio]
StringIndex=27

[mFecha_6]
Measure=WebParser
Url=[mSitio]
StringIndex=28

[mFoto_6]
Measure=WebParser
Url=[mSitio]
StringIndex=30
Download=1
Substitute="":"#@#Images\MyReader\nopic.png"

[mTitulo_7]
Measure=WebParser
Url=[mSitio]
StringIndex=31
DecodeCharacterReference=1
Substitute=#Substitucion#

[mEnlace_7]
Measure=WebParser
Url=[mSitio]
StringIndex=32

[mFecha_7]
Measure=WebParser
Url=[mSitio]
StringIndex=33

[mFoto_7]
Measure=WebParser
Url=[mSitio]
StringIndex=35
Download=1
Substitute="":"#@#Images\MyReader\nopic.png"

[mTitulo_8]
Measure=WebParser
Url=[mSitio]
StringIndex=36
DecodeCharacterReference=1
Substitute=#Substitucion#

[mEnlace_8]
Measure=WebParser
Url=[mSitio]
StringIndex=37

[mFecha_8]
Measure=WebParser
Url=[mSitio]
StringIndex=38

[mFoto_8]
Measure=WebParser
Url=[mSitio]
StringIndex=40
Download=1
Substitute="":"#@#Images\MyReader\nopic.png"

[mTitulo_9]
Measure=WebParser
Url=[mSitio]
StringIndex=41
DecodeCharacterReference=1
Substitute=#Substitucion#

[mEnlace_9]
Measure=WebParser
Url=[mSitio]
StringIndex=42

[mFecha_9]
Measure=WebParser
Url=[mSitio]
StringIndex=43

[mFoto_9]
Measure=WebParser
Url=[mSitio]
StringIndex=45
Download=1
Substitute="":"#@#Images\MyReader\nopic.png"

[mTitulo_10]
Measure=WebParser
Url=[mSitio]
StringIndex=46
DecodeCharacterReference=1
Substitute=#Substitucion#

[mEnlace_10]
Measure=WebParser
Url=[mSitio]
StringIndex=47

[mFecha_10]
Measure=WebParser
Url=[mSitio]
StringIndex=48

[mFoto_10]
Measure=WebParser
Url=[mSitio]
StringIndex=50
Download=1
Substitute="":"#@#Images\MyReader\nopic.png"
