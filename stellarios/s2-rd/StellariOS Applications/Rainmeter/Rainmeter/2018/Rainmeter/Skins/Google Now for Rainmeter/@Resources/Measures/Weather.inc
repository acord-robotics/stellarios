[MeasureSite]
Measure=Plugin
Plugin=WebParser
URL=http://wxdata.weather.com/wxdata/weather/local/#Location#?cc=*&unit=#Units#&dayf=5
;RegExp=(?siU)<dnam>(.*),.*<tmp>(.*)</tmp>.*<t>(.*)</t>.*<icon>(.*)</icon>.*<day d="0" t="(.*)" dt=".*">.*<hi>(.*)</hi>.*<low>(.*)</low>.*<icon>(.*)</icon>.*<day d="1" t="(.*)" dt=".*">.*<hi>(.*)</hi>.*<low>(.*)</low>.*<icon>(.*)</icon>.*<day d="2" t="(.*)" dt=".*">.*<hi>(.*)</hi>.*<low>(.*)</low>.*<icon>(.*)</icon>.*<day d="3" t="(.*)" dt=".*">.*<hi>(.*)</hi>.*<low>(.*)</low>.*<icon>(.*)</icon>.*<day d="4" t="(.*)" dt=".*">.*<hi>(.*)</hi>.*<low>(.*)</low>.*<icon>(.*)</icon>
RegExp=(?siU)<dnam>(.*),.*<tmp>(.*)</tmp>.*<t>(.*)</t>.*<icon>(.*)</icon>.*<day d="0" t="(.*)" dt=".*">.*<hi>(.*)</hi>.*<low>(.*)</low>.*<icon>.*<icon>(.*)</icon>.*<day d="1" t="(.*)" dt=".*">.*<hi>(.*)</hi>.*<low>(.*)</low>.*<icon>(.*)</icon>.*<day d="2" t="(.*)" dt=".*">.*<hi>(.*)</hi>.*<low>(.*)</low>.*<icon>(.*)</icon>.*<day d="3" t="(.*)" dt=".*">.*<hi>(.*)</hi>.*<low>(.*)</low>.*<icon>(.*)</icon>.*<day d="4" t="(.*)" dt=".*">.*<hi>(.*)</hi>.*<low>(.*)</low>.*<icon>(.*)</icon>
UpdateRate=3600

[MeasureLocation]
Measure=Plugin
Plugin=WebParser
URL=[MeasureSite]
StringIndex=1

; --------------Today---------------

[MeasureTodayTemp]
Measure=Plugin
Plugin=WebParser
URL=[MeasureSite]
StringIndex=2

[MeasureTodayWeather]
Measure=Plugin
Plugin=WebParser
URL=[MeasureSite]
StringIndex=3

[MeasureTodayIcon]
Measure=Plugin
Plugin=WebParser
URL=[MeasureSite]
StringIndex=4

; --------------Day 1---------------

[MeasureDay1]
Measure=Plugin
Plugin=WebParser
URL=[MeasureSite]
StringIndex=5
Substitute="Monday":"MON.","Thursday":"THU.","Wednesday":"WED.","Tuesday":"TUE.","Friday":"FRI.","Saturday":"SAT.","Sunday":"SUN."

[MeasureDay1Max]
Measure=Plugin
Plugin=WebParser
URL=[MeasureSite]
StringIndex=6

[MeasureDay1Min]
Measure=Plugin
Plugin=WebParser
URL=[MeasureSite]
StringIndex=7

[MeasureDay1Icon]
Measure=Plugin
Plugin=WebParser
URL=[MeasureSite]
StringIndex=8

; --------------Day 2---------------

[MeasureDay2]
Measure=Plugin
Plugin=WebParser
URL=[MeasureSite]
StringIndex=9
Substitute="Monday":"MON.","Thursday":"THU.","Wednesday":"WED.","Tuesday":"TUE.","Friday":"FRI.","Saturday":"SAT.","Sunday":"SUN."

[MeasureDay2Max]
Measure=Plugin
Plugin=WebParser
URL=[MeasureSite]
StringIndex=10

[MeasureDay2Min]
Measure=Plugin
Plugin=WebParser
URL=[MeasureSite]
StringIndex=11

[MeasureDay2Icon]
Measure=Plugin
Plugin=WebParser
URL=[MeasureSite]
StringIndex=12

; --------------Day 3---------------

[MeasureDay3]
Measure=Plugin
Plugin=WebParser
URL=[MeasureSite]
StringIndex=13
Substitute="Monday":"MON.","Thursday":"THU.","Wednesday":"WED.","Tuesday":"TUE.","Friday":"FRI.","Saturday":"SAT.","Sunday":"SUN."

[MeasureDay3Max]
Measure=Plugin
Plugin=WebParser
URL=[MeasureSite]
StringIndex=14

[MeasureDay3Min]
Measure=Plugin
Plugin=WebParser
URL=[MeasureSite]
StringIndex=15

[MeasureDay3Icon]
Measure=Plugin
Plugin=WebParser
URL=[MeasureSite]
StringIndex=16

; --------------Day 4---------------

[MeasureDay4]
Measure=Plugin
Plugin=WebParser
URL=[MeasureSite]
StringIndex=17
Substitute="Monday":"MON.","Thursday":"THU.","Wednesday":"WED.","Tuesday":"TUE.","Friday":"FRI.","Saturday":"SAT.","Sunday":"SUN."

[MeasureDay4Max]
Measure=Plugin
Plugin=WebParser
URL=[MeasureSite]
StringIndex=18

[MeasureDay4Min]
Measure=Plugin
Plugin=WebParser
URL=[MeasureSite]
StringIndex=19

[MeasureDay4Icon]
Measure=Plugin
Plugin=WebParser
URL=[MeasureSite]
StringIndex=20

; --------------Day 5---------------

[MeasureDay5]
Measure=Plugin
Plugin=WebParser
URL=[MeasureSite]
StringIndex=21
Substitute="Monday":"MON.","Thursday":"THU.","Wednesday":"WED.","Tuesday":"TUE.","Friday":"FRI.","Saturday":"SAT.","Sunday":"SUN."

[MeasureDay5Max]
Measure=Plugin
Plugin=WebParser
URL=[MeasureSite]
StringIndex=22

[MeasureDay5Min]
Measure=Plugin
Plugin=WebParser
URL=[MeasureSite]
StringIndex=23

[MeasureDay5Icon]
Measure=Plugin
Plugin=WebParser
URL=[MeasureSite]
StringIndex=24
