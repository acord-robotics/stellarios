[mCaratula]
Measure=NowPlaying
PlayerName="#Reproductor#"
PlayerType=COVER
Substitute="":"#@#Images\MyPlayer\nologo.png"

[CaratulaDinamica]
Measure=Plugin
Plugin=Chameleon
Type=File
Path=[mCaratula]

[ColorDinamico1]
Measure=Plugin
Plugin=Chameleon
Parent=CaratulaDinamica
Color=Foreground2
Format=Dec


[ColorDinamico2]
Measure=Plugin
Plugin=Chameleon
Parent=CaratulaDinamica
Color=Foreground1
Format=Dec


[ColorDinamico3]
Measure=Plugin
Plugin=Chameleon
Parent=CaratulaDinamica
Color=Background1
Format=Dec
