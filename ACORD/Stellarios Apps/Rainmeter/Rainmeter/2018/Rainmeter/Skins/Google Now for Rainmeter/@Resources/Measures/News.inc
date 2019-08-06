[MeasureRSSParent]
Measure=Plugin
Plugin=FeedReader
URL=#RSSNewsLink#

[MeasureFeedTitle]
Measure=Plugin
Plugin=FeedReader
Parent=MeasureRSSParent
Type=FeedTitle  

[MeasureFeedLink]
Measure=Plugin
Plugin=FeedReader
Parent=MeasureRSSParent
Type=FeedLink

[MeasureItemTitle]
Measure=Plugin
Plugin=FeedReader
Parent=MeasureRSSParent
Type=ItemTitle
DynamicVariables=1
ItemNum=#ItemNum#

[MeasureItemLink]
Measure=Plugin
Plugin=FeedReader
Parent=MeasureRSSParent
Type=ItemLink
DynamicVariables=1
ItemNum=#ItemNum#

[MeasureItemAge]
Measure=Plugin
Plugin=FeedReader
Parent=MeasureRSSParent
Type=ItemAge
DynamicVariables=1
ItemNum=#ItemNum#

[MeasureItemHoursAgo]
Measure=Calc
Formula=MeasureItemAge / 60 / 60
DynamicVariables=1
IfConditionMode=1
IfCondition=MeasureItemHoursAgo < 1.5
IfTrueAction=[!SetVariable  Time "hour"]
IfFalseAction=[!SetVariable  Time "hours"]

[MeasureWebpage]
Measure=String
String=#MainNewsLink#
RegExpSubstitute=1
Substitute="http://":"","rss":"","www.":""
