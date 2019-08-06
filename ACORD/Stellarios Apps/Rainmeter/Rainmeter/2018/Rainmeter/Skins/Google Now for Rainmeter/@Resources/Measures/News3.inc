[MeasureRSSParent3]
Measure=Plugin
Plugin=FeedReader
URL=#RSSNewsLink3#

[MeasureFeedTitle3]
Measure=Plugin
Plugin=FeedReader
Parent=MeasureRSSParent3
Type=FeedTitle  

[MeasureFeedLink3]
Measure=Plugin
Plugin=FeedReader
Parent=MeasureRSSParent3
Type=FeedLink

[MeasureItemTitle3]
Measure=Plugin
Plugin=FeedReader
Parent=MeasureRSSParent3
Type=ItemTitle
DynamicVariables=1
ItemNum=#ItemNum3#

[MeasureItemLink3]
Measure=Plugin
Plugin=FeedReader
Parent=MeasureRSSParent3
Type=ItemLink
DynamicVariables=1
ItemNum=#ItemNum3#

[MeasureItemAge3]
Measure=Plugin
Plugin=FeedReader
Parent=MeasureRSSParent3
Type=ItemAge
DynamicVariables=1
ItemNum=#ItemNum3#

[MeasureItemHoursAgo3]
Measure=Calc
Formula=MeasureItemAge3 / 60 / 60
DynamicVariables=1
IfConditionMode=1
IfCondition=MeasureItemHoursAgo3 < 1.5
IfTrueAction=[!SetVariable  Time3 "hour"]
IfFalseAction=[!SetVariable  Time3 "hours"]

[MeasureWebpage3]
Measure=String
String=#MainNewsLink3#
RegExpSubstitute=1
Substitute="http://":"","rss":"","www.":""
