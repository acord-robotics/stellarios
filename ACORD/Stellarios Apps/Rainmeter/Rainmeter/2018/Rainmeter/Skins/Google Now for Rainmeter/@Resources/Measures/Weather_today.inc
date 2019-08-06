[MeasureSite]
Measure=Plugin
Plugin=WebParser
URL=http://wxdata.weather.com/wxdata/weather/local/#Location#?cc=*&unit=#Units#
RegExp=(?siU)<dnam>(.*),.*<tmp>(.*)</tmp>.*<t>(.*)</t>.*<icon>(.*)</icon>
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