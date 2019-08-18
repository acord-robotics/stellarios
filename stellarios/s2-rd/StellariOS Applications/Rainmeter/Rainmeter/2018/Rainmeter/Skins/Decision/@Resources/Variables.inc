[Variables]

Language=English
Location=SPXX0050
Unit=m
Format=H
Hidden=0
Hidden2=1
Player=Winamp

;-------------------------------------------------------------
;-------------------------------------------------------------

;NOTES:

;This below is the settings for the dock (Folders,Internet links,PC Power).
;If you are not familiar with Rainmeter from earlier,please don't edit anything!
;It's too complicated and sensitive,if you don't know what you doing!
;But i will try to explain to you as much as i can.This "#@#\" is shortened for "@Resources" folder.It's a folder where the icons and other parts of the skin are located.
;If you want to change icon-s,new icon-s,you must put in "@Resources" folder.Also,icons must be in PNG file format.
;When you change "icon and name path",for example if you want to change "My Computer" icon to "CCleaner",it should look like this:

;This is example for some program:

;Folder1NameAndPath=#@#\CCleaner.png
;Folder1Text=CCleaner
;FolderLocationPath1=!Execute ["C:\Program Files\CCleaner\CCleaner64.exe"]

;This is example for some internet links:

;Link4NameAndPath=#@#\Twitter.png
;Link4Text=Twitter
;LinkLocationPath4=!Execute ["https://twitter.com/?lang=en"]

;etc..

;On this site : https://docs.rainmeter.net/manual/getting-started/customizing/
;you can find all information,about customizing some skin.To change color,font,size,etc..
;You can also learn how to make your first skin. :)
;Thank you for your understanding! :)


;----------------------Folders Settings--------------------------
;----------------------------------------------------------------


FolderIcon1NameAndPath=#@#\My Computer.png
Folder1Text=My Computer
FolderLocationPath1=[Shell:::{20D04FE0-3AEA-1069-A2D8-08002B30309D}]

FolderIcon2NameAndPath=#@#\My Documents.png
Folder2Text=My Documents
FolderLocationPath2=[Shell:::{A8CDFF1C-4878-43be-B5FD-F8091C1C60D0}]

FolderIcon3NameAndPath=#@#\Videos.png
Folder3Text=Video
FolderLocationPath3=[Shell:::{A0953C92-50DC-43bf-BE83-3742FED03C9C}]

FolderIcon4NameAndPath=#@#\Pictures.png
Folder4Text=Pictures
FolderLocationPath4=[Shell:::{3ADD1653-EB32-4cb0-BBD7-DFA0ABB5ACCA}]

FolderIcon5NameAndPath=#@#\Music.png
Folder5Text=Music
FolderLocationPath5=[Shell:::{1CF1260C-4DD0-4ebb-811F-33C572699FDE}]

FolderIcon6NameAndPath=#@#\Downloads.png
Folder6Text=Downloads
FolderLocationPath6=[Shell:::{374DE290-123F-4565-9164-39C4925E467B}]


;----------------------Internet Links Settings-------------------
;----------------------------------------------------------------


LinkIcon1NameAndPath=#@#\Google.png
Link1Text=Google
LinkLocationPath1=!Execute ["https://google.com"]

LinkIcon2NameAndPath=#@#\Facebook.png
Link2Text=Facebook
LinkLocationPath2=!Execute ["https://facebook.com/"]

LinkIcon3NameAndPath=#@#\Gmail.png
Link3Text=Gmail
LinkLocationPath3=!Execute ["https://mail.google.com/mail/"]

LinkIcon4NameAndPath=#@#\Deviantart.png
Link4Text=Deviantart
LinkLocationPath4=!Execute ["https://www.deviantart.com/browse/all/customization/skins/sysmonitor/rainmeter/?order=5"]

LinkIcon5NameAndPath=#@#\Twitter.png
Link5Text=Twitter
LinkLocationPath5=!Execute ["https://twitter.com/"]

LinkIcon6NameAndPath=#@#\Unsplash.png
Link6Text=Unsplash
LinkLocationPath6=!Execute ["https://unsplash.com/"]

;------------------------Power Settings--------------------------
;----------------------------------------------------------------

PowerIcon1NameAndPath=#@#\ShutDown.png
Power1Text=Shut down PC
PowerLocationPath1=!Execute [shutdown.exe -s]

PowerIcon2NameAndPath=#@#\SignOut.png
Power2Text=Sign out
PowerLocationPath2=!Execute [shutdown.exe -l]

PowerIcon3NameAndPath=#@#\Restart.png
Power3Text=Restart PC
PowerLocationPath3=!Execute [shutdown.exe -r]


