;SPECTRUM Launcher v2.0 for Rainmeter 4.0+
;Released under Creative Commons 3.0 BY-NC-SA

;by /u/TheProtagonists

;http://birdalliance.deviantart.com
;http://pixiv.me/the_protagonists
;@Protagonists2114

;Tested on 3:2 (read: Micro$oft $urface) and 16:9 monitors, best for 1920x1080 monitors as the icons and backgrounds are made to fit the resolution since Rainmeter can't handle scaling very well...
;Some animations may display differently on other resolutions and the icons might not be ideally displayed

[Variables]
;Notepad++ or Sublime Text recommended for easier editing

;Global editing notes:
;	If the path contains space, use quote
;	Enter the full address to launch websites through your default browser, use browser.exe "site address" to specify browser
;	Use explorer.exe "application path or folder path" for launching applications and folders
;	Use steam://rungameid/ to run steam games
;	Refer to https://docs.rainmeter.net/tips/launching-windows-special-folders/ for launching windows special folders
;	Specifying image extension is not needed for png images (meaning you can leave the .png out if you use png images)

;All these launchers can be used to launch anything: files, folders, shell commands, steam games, websites and browser extensions! (Well, you probably can't launch a rocket with this... or maybe you can because I can't tell you what to do)



;ICON LOCATION: Documents\Rainmeter\Skins\Spectrum Launcher v2\@Resources\Images\Icons
;MOUSEOVER BG LOCATION: Documents\Rainmeter\Skins\Spectrum Launcher v2\@Resources\Images\Mouseover

;Visit following websites for more icons:
;	http://iconfinder.com/
;	https://icons8.com/web-app/new-icons/all
;	http://www.flaticon.com/
;	https://materialdesignicons.com/

;=========================================================================================================================
;Animation speed
;The higher this number is, the faster the animation is executed, the lower the smoother (which can be very slow depend on the computer)
;Recommended value from 48~128, note that if the number too low the animation might not be complete

Speed=84

;=========================================================================================================================
;Font face settings
;INCLUDED FONT LOCATION: Documents\Rainmeter\Skins\Spectrum Launcher v2\@Resources\Fonts
;And again, we would like to remind you that fonts are VERY serious business, choose it wisely because I will be silently judging you from above for using terrible fonts.

BarFont=Borda 4
LauncherFont=Borda 10

;=========================================================================================================================
;Color bar settings
;IMAGE LOCATION: Documents\Rainmeter\Skins\Spectrum Launcher v2\@Resources\Images\ColorBars

ColorBar=SPECTRUM.png

;=========================================================================================================================
;Group 1 

;Name and icon for the navbar

Group1BarName=01
Group1BarIcon=hexagons.png

;Launcher settings: action, name, icon and mouseover background

Group1Launcher1Action=explorer.exe "C:\Program Files (x86)\Steam\Steam.exe"
Group1Launcher1Name=Steam
Group1Launcher1Icon=_g_steam.png
Group1Launcher1BG=047

Group1Launcher2Action="iTunes.exe"
Group1Launcher2Name=iTunes
Group1Launcher2Icon=itunes.png
Group1Launcher2BG=056

Group1Launcher3Action=
Group1Launcher3Name=Photoshop
Group1Launcher3Icon=_c_photoshop.png
Group1Launcher3BG=093

Group1Launcher4Action=
Group1Launcher4Name=Illustrator
Group1Launcher4Icon=_c_illustrator.png
Group1Launcher4BG=055

Group1Launcher5Action=
Group1Launcher5Name=Paint Tool SAI
Group1Launcher5Icon=_c_painttoolsai.png
Group1Launcher5BG=069

Group1Launcher6Action=
Group1Launcher6Name=Clip Studio Paint
Group1Launcher6Icon=_c_clipstudiopaint.png
Group1Launcher6BG=021

;=========================================================================================================================
;Group 2 

;Name and icon for the navbar

Group2BarName=02
Group2BarIcon=folder.png

;Launcher settings: action, name, icon and mouseover background

Group2Launcher1Action=shell:::{20D04FE0-3AEA-1069-A2D8-08002B30309D}
Group2Launcher1Name=Computer
Group2Launcher1Icon=computer.png
Group2Launcher1BG=009

Group2Launcher2Action=explorer.exe "%UserProfile%\Downloads"
Group2Launcher2Name=Downloads
Group2Launcher2Icon=download.png
Group2Launcher2BG=028

Group2Launcher3Action=
Group2Launcher3Name=Projects
Group2Launcher3Icon=starredfolder.png
Group2Launcher3BG=026

Group2Launcher4Action=
Group2Launcher4Name=Wallpapers
Group2Launcher4Icon=imagefolder.png
Group2Launcher4BG=027

Group2Launcher5Action=
Group2Launcher5Name=Google Drive
Group2Launcher5Icon=googledrive.png
Group2Launcher5BG=033

Group2Launcher6Action=
Group2Launcher6Name=Dropbox
Group2Launcher6Icon=dropbox.png
Group2Launcher6BG=049

;=========================================================================================================================
;Group 3 

;Name and icon for the navbar

Group3BarName=03
Group3BarIcon=earth.png

;Launcher settings: action, name, icon and mouseover background

Group3Launcher1Action="http://tvtropes.org/"
Group3Launcher1Name=TV Tropes
Group3Launcher1Icon=tvtropes.png
Group3Launcher1BG=041

Group3Launcher2Action="http://www.pixiv.net/"
Group3Launcher2Name=pixiv
Group3Launcher2Icon=pixiv.png
Group3Launcher2BG=062

Group3Launcher3Action="http://www.deviantart.com/"
Group3Launcher3Name=deviantART
Group3Launcher3Icon=deviantart.png
Group3Launcher3BG=022

Group3Launcher4Action="https://www.reddit.com/"
Group3Launcher4Name=Reddit
Group3Launcher4Icon=reddit.png
Group3Launcher4BG=043

Group3Launcher5Action=https://twitter.com/
Group3Launcher5Name=Twitter
Group3Launcher5Icon=twitter.png
Group3Launcher5BG=036

Group3Launcher6Action="https://www.youtube.com/"
Group3Launcher6Name=YouTube
Group3Launcher6Icon=youtube.png
Group3Launcher6BG=023

;=========================================================================================================================
;Group 4 

;Name and icon for the navbar

Group4BarName=04
Group4BarIcon=gamepad.png

;Launcher settings: action, name, icon and mouseover background

Group4Launcher1Action=steam://rungameid/220200
Group4Launcher1Name=Kerbal Space Program
Group4Launcher1Icon=_g_ksp.png
Group4Launcher1BG=KSP

Group4Launcher2Action=steam://rungameid/212680
Group4Launcher2Name=Faster Than Light
Group4Launcher2Icon=_g_ftl.png
Group4Launcher2BG=FTL

Group4Launcher3Action="http://www.dmm.com/netgame/social/-/gadgets/=/app_id=854854/"
Group4Launcher3Name=Kantai Collection
Group4Launcher3Icon=_g_kantaicollection.png
Group4Launcher3BG=KanColle

Group4Launcher4Action=chrome.exe "http://game.granbluefantasy.jp/"
Group4Launcher4Name=Granblue Fantasy
Group4Launcher4Icon=_g_granbluefantasy.png
Group4Launcher4BG=GBF

Group4Launcher5Action=steam://rungameid/3590
Group4Launcher5Name=Plants VS Zombies
Group4Launcher5Icon=_g_plantsvszombies.png
Group4Launcher5BG=045

Group4Launcher6Action=steam://rungameid/265610
Group4Launcher6Name=Epic Battle Fantasy 4
Group4Launcher6Icon=_g_epicbattlefantasy.png
Group4Launcher6BG=EBF