[Variables]
URLNews01=http://feeds.bbci.co.uk/news/world/rss.xml
URLNews02=http://rss.cnn.com/rss/edition_world.rss
URLNews04=http://rss.nytimes.com/services/xml/rss/nyt/US.xml
URLNews05=https://www.france24.com/fr/actualites/rss
URLNews06=https://www.lemonde.fr/rss/une.xml
URLNews07=https://www.bild.de/rss-feeds/rss-16725492,feed=news.bild.html
URLNews09=http://ep00.epimg.net/rss/elpais/portada.xml
URLNews10=https://www.diarioinformacion.com/elementosInt/rss/21
URLNews11=https://www.ilsole24ore.com/rss/notizie.xml
URLNews12=https://www.theguardian.com/world/rss

[ST-Fecha]
FontFace=Open Sans
FontColor=128,128,128,255
StringAlign=Left
StringStyle=Italic
DynamicVariables=1
AntiAlias=1
ClipString=1
FontSize=(7*#Escala#)
X=(102*#Escala#)
Y=(89*#Escala#)
W=(152*#Escala#)
H=(16*#Escala#)

[ST-Titulo]
FontFace=Open Sans
FontColor=#CLTexto#
StringAlign=CenterCenter
StringStyle=Normal
DynamicVariables=1
AntiAlias=1
ClipString=1
FontSize=(9*#Escala#)
X=(153*#Escala#)
Y=(288*#Escala#)
W=(210*#Escala#)
H=(72*#Escala#)

[ST-Foto]
X=(49*#Escala#)
Y=(111*#Escala#)
W=(209*#Escala#)
H=(142*#Escala#)
Container=MascaraFoto
PreserveAspectRatio=#MRAjuste#
DynamicVariables=1

[mCambio]
Measure=Calc
Formula=(mCambio%102)+1
IfCondition=mCambio=1
IfTrueAction=[!HideMeterGroup Todos][!ShowMeterGroup Display1]
IfCondition2=mCambio=11
IfTrueAction2=[!HideMeterGroup Todos][!ShowMeterGroup Display2]
IfCondition3=mCambio=21
IfTrueAction3=[!HideMeterGroup Todos][!ShowMeterGroup Display3]
IfCondition4=mCambio=31
IfTrueAction4=[!HideMeterGroup Todos][!ShowMeterGroup Display4]
IfCondition5=mCambio=41
IfTrueAction5=[!HideMeterGroup Todos][!ShowMeterGroup Display5]
IfCondition6=mCambio=51
IfTrueAction6=[!HideMeterGroup Todos][!ShowMeterGroup Display6]
IfCondition7=mCambio=61
IfTrueAction7=[!HideMeterGroup Todos][!ShowMeterGroup Display7]
IfCondition8=mCambio=71
IfTrueAction8=[!HideMeterGroup Todos][!ShowMeterGroup Display8]
IfCondition9=mCambio=81
IfTrueAction9=[!HideMeterGroup Todos][!ShowMeterGroup Display9]
IfCondition10=mCambio=91
IfTrueAction10=[!HideMeterGroup Todos][!ShowMeterGroup Display10]
IfCondition11=mCambio=101
IfTrueAction11=[!EnableMeasure mAleatorio][!UpdateMeasure mAleatorio]

[mAleatorio]
Measure=Calc
Formula=Random
LowBound=11
HighBound=78
UpdateDivider=-1
Substitute="11":"life01","12":"life02","13":"life03","14":"life04","15":"life05","16":"life06","17":"life07","18":"life08","19":"life09","20":"life10","21":"life11","22":"life12","23":"movies01","24":"movies02","25":"movies03","26":"movies04","27":"movies05","28":"movies06","29":"movies07","30":"movies08","31":"music01","32":"music02","33":"music03","34":"music04","35":"news01","36":"news02","37":"news03","38":"news04","39":"news05","40":"news06","41":"news07","42":"news08","43":"news09","44":"news10","45":"news11","46":"news12","47":"pic01","48":"pic02","49":"pic03","50":"pic04","51":"pic05","52":"pic06","53":"pic07","54":"pic08","55":"pic09","56":"pic10","57":"pic11","58":"pic12","59":"tech01","60":"tech02","61":"tech03","62":"tech04","63":"tech05","64":"tech06","65":"tech07","66":"tech08","67":"tech09","68":"tech10","69":"tech11","70":"tech12","71":"tech13","72":"tech14","73":"tech15","74":"tech16","75":"tech17","76":"tech18","77":"tech19","78":"tech20"
IfCondition=mAleatorio=35
IfTrueAction=[!WriteKeyValue Variables URLFinal #URLNews01# "#@#Settings\Variables Suite.inc"][!WriteKeyValue Variables MyReader "[mAleatorio]" "#@#Settings\Variables Suite.inc"][!Refresh]
IfCondition2=mAleatorio=36
IfTrueAction2=[!WriteKeyValue Variables URLFinal #URLNews02# "#@#Settings\Variables Suite.inc"][!WriteKeyValue Variables MyReader "[mAleatorio]" "#@#Settings\Variables Suite.inc"][!Refresh]
IfCondition3=mAleatorio=38
IfTrueAction3=[!WriteKeyValue Variables URLFinal #URLNews04# "#@#Settings\Variables Suite.inc"][!WriteKeyValue Variables MyReader "[mAleatorio]" "#@#Settings\Variables Suite.inc"][!Refresh]
IfCondition4=mAleatorio=39
IfTrueAction4=[!WriteKeyValue Variables URLFinal #URLNews05# "#@#Settings\Variables Suite.inc"][!WriteKeyValue Variables MyReader "[mAleatorio]" "#@#Settings\Variables Suite.inc"][!Refresh]
IfCondition5=mAleatorio=40
IfTrueAction5=[!WriteKeyValue Variables URLFinal #URLNews06# "#@#Settings\Variables Suite.inc"][!WriteKeyValue Variables MyReader "[mAleatorio]" "#@#Settings\Variables Suite.inc"][!Refresh]
IfCondition6=mAleatorio=41
IfTrueAction6=[!WriteKeyValue Variables URLFinal #URLNews07# "#@#Settings\Variables Suite.inc"][!WriteKeyValue Variables MyReader "[mAleatorio]" "#@#Settings\Variables Suite.inc"][!Refresh]
IfCondition7=mAleatorio=43
IfTrueAction7=[!WriteKeyValue Variables URLFinal #URLNews09# "#@#Settings\Variables Suite.inc"][!WriteKeyValue Variables MyReader "[mAleatorio]" "#@#Settings\Variables Suite.inc"][!Refresh]
IfCondition8=mAleatorio=44
IfTrueAction8=[!WriteKeyValue Variables URLFinal #URLNews10# "#@#Settings\Variables Suite.inc"][!WriteKeyValue Variables MyReader "[mAleatorio]" "#@#Settings\Variables Suite.inc"][!Refresh]
IfCondition9=mAleatorio=45
IfTrueAction9=[!WriteKeyValue Variables URLFinal #URLNews11# "#@#Settings\Variables Suite.inc"][!WriteKeyValue Variables MyReader "[mAleatorio]" "#@#Settings\Variables Suite.inc"][!Refresh]
IfCondition10=mAleatorio=46
IfTrueAction10=[!WriteKeyValue Variables URLFinal #URLNews12# "#@#Settings\Variables Suite.inc"][!WriteKeyValue Variables MyReader "[mAleatorio]" "#@#Settings\Variables Suite.inc"][!Refresh]
IfFalseAction=[!WriteKeyValue Variables MyReader "[mAleatorio]" "#@#Settings\Variables Suite.inc"][!Refresh]
Disabled=1

[mEstadoPantalla]
Measure=Calc
Formula=#MRAjuste#
IfCondition=#MRAjuste#=0
IfTrueAction=[!ShowMeter Boton_AjusteOff][!HideMeter Boton_AjusteOn]
IfCondition2=#MRAjuste#=1
IfTrueAction2=[!ShowMeter Boton_AjusteOn][!HideMeter Boton_AjusteOff]
DynamicVariables=1

[mEstadoFondo]
Measure=Calc
Formula=#MRFondo#
IfCondition=#MRFondo#=0
IfTrueAction=[!ShowMeter Boton_Blanco][!HideMeter Boton_Negro]
IfCondition2=#MRFondo#=1
IfTrueAction2=[!ShowMeter Boton_Negro][!HideMeter Boton_Blanco]
DynamicVariables=1

[mVoz]
Measure=Plugin
Plugin=Speech
Index=1
Volume=100
Rate=0
Debug=0
