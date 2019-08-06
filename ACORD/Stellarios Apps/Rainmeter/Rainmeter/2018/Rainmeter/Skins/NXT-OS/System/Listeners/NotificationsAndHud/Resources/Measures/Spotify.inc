[MeasurePlayerState]
Measure=Plugin
Plugin=SpotifyPlugin
Type=Playing
IfEqualValue=1
IfEqualAction=[!CommandMeasure "MusicScript" "display(1)"]
Group=Music
Disabled=#Notification.Music#

[POSITION]
Measure=Plugin
Plugin=SpotifyPlugin
Type=Progress
Group=Music
Disabled=#Notification.Music#

[POSITIONCalc]
Measure=Calc
Formula=[POSITION]
IfBelowValue=2
IfBelowAction=[!CommandMeasure "MusicScript" "display(2)"]
DynamicVariables=1
Disabled=#Notification.Music#

[TRACK]
Measure=Plugin
Plugin=SpotifyPlugin
Type=TrackName
Group=Music
Disabled=#Notification.Music#

[ARTIST]
Measure=Plugin
Plugin=SpotifyPlugin
Type=ArtistName
Group=Music
Disabled=#Notification.Music#

[ALBUM]
Measure=Plugin
Plugin=SpotifyPlugin
Type=AlbumName
Group=Music
Disabled=#Notification.Music#