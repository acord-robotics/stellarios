[MeasureRSSParent2]
Measure=Plugin
Plugin=FeedReader
URL=#RSSNewsLink2#

[MeasureFeedTitle2]
Measure=Plugin
Plugin=FeedReader
Parent=MeasureRSSParent2
Type=FeedTitle  

[MeasureFeedLink2]
Measure=Plugin
Plugin=FeedReader
Parent=MeasureRSSParent2
Type=FeedLink

[MeasureItemTitle2]
Measure=Plugin
Plugin=FeedReader
Parent=MeasureRSSParent2
Type=ItemTitle
DynamicVariables=1
ItemNum=#ItemNum2#

[MeasureItemLink2]
Measure=Plugin
Plugin=FeedReader
Parent=MeasureRSSParent2
Type=ItemLink
DynamicVariables=1
ItemNum=#ItemNum2#

[MeasureItemAge2]
Measure=Plugin
Plugin=FeedReader
Parent=MeasureRSSParent2
Type=ItemAge
DynamicVariables=1
ItemNum=#ItemNum2#

[MeasureItemHoursAgo2]
Measure=Calc
Formula=MeasureItemAge2 / 60 / 60
DynamicVariables=1
IfConditionMode=1
IfCondition=MeasureItemHoursAgo2 < 1.5
IfTrueAction=[!SetVariable  Time2 "hour"]
IfFalseAction=[!SetVariable  Time2 "hours"]

[MeasureWebpage2]
Measure=String
String=#MainNewsLink2#
RegExpSubstitute=1
Substitute="http://":"","rss":"","www.":""
