[Player]
Measure=Plugin
Plugin=NowPlaying
PlayerName=#System.Player#
PlayerType=STATE

[TRACK]
Measure=Plugin
Plugin=NowPlaying
PlayerName=[Player]
PlayerType=TITLE

[ARTIST]
Measure=Plugin
Plugin=NowPlaying
PlayerName=[Player]
PlayerType=ARTIST

[PROGRESS]
Measure=Plugin
Plugin=NowPlaying
PlayerName=[Player]
PlayerType=PROGRESS

[ALBUM]
Measure=Plugin
Plugin=NowPlaying
PlayerName=[Player]
PlayerType=ALBUM

[COVER]
Measure=Plugin
Plugin=NowPlaying
PlayerName=[Player]
PlayerType=COVER
Substitute="":"Resources/Images/Blank.Png"
DynamicVariables=1