[mTitulo]
Measure=NowPlaying
PlayerName="#Reproductor#"
PlayerType=TITLE

[mArtista]
Measure=NowPlaying
PlayerName="#Reproductor#"
PlayerType=ARTIST

[mAlbum]
Measure=NowPlaying
PlayerName="#Reproductor#"
PlayerType=ALBUM

[mPosicion]
Measure=NowPlaying
PlayerName="#Reproductor#"
PlayerType=POSITION

[mProgreso]
Measure=NowPlaying
PlayerName="#Reproductor#"
PlayerType=PROGRESS

[mDuracion]
Measure=NowPlaying
PlayerName="#Reproductor#"
PlayerType=DURATION

[mVolumen]
Measure=Plugin
Plugin=Win7AudioPlugin

[mVolumenPorc]
Measure=Calc
Formula=mVolumen
Substitute="-1":"0"

[mAleatorio]
Measure=NowPlaying
PlayerName="#Reproductor#"
PlayerType=SHUFFLE

[mAleatorioEstado]
Measure=Calc
Formula=[mAleatorio]
IfCondition=[mAleatorio]=0
IfTrueAction=[!SetOption BotonAleatorio ImageName "#@#Images\MyPlayer\bt_shuffleOff.png"]
IfCondition2=[mAleatorio]=1
IfTrueAction2=[!SetOption BotonAleatorio ImageName "#@#Images\MyPlayer\bt_shuffleOn.png"]
DynamicVariables=1

[mEstado]
Measure=NowPlaying
PlayerName="#Reproductor#"
PlayerType=STATE
Substitute="0":"bt_playOff.png","1":"bt_play.png","2":"bt_pause.png"

[mReproductor]
Measure=NowPlaying
PlayerName="#Reproductor#"
PlayerType=STATUS

[mEstadoReproductor]
Measure=Calc
Formula=[mReproductor]
IfCondition=[mReproductor]=0
IfTrueAction=[!SetOption BotonReproductor ImageName "#@#Images\MyPlayer\bt_playerOff.png"]
IfCondition2=[mReproductor]=1
IfTrueAction2=[!SetOption BotonReproductor ImageName "#@#Images\MyPlayer\bt_playerOn.png"]
DynamicVariables=1

[mLetras]
Measure=NowPlaying
PlayerName="#Reproductor#"
PlayerType=LYRICS
Substitute="":"NO Lyrics"