[mTime]
Measure=Time
Format=%H:%M
UpdateDivider=5

[mAudio]
Measure=Plugin
Plugin=Win7AudioPlugin
UpdateDivider=5

[mAudioIcon]
Measure=Calc
Formula=((100 >= mAudio) && (66 <= mAudio) ? 3 : ((66 >= mAudio) && (33 <= mAudio) ? 2 : ((33 >= mAudio) && (0 <= mAudio) ? 1 : 0)))
DynamicVariables=1
UpdateDivider=5

[mSignal]
Measure=Plugin
Plugin=WiFiStatus
WifiInfoType=Quality

[mWifiIcon]
Measure=Calc
Formula=((100 >= mSignal) && (75 <= mSignal) ? 4 : ((75 >= mSignal) && (50 <= mSignal) ? 3 : ((50 >= mSignal) && (25 <= mSignal) ? 2 : ((25 >= mSignal) && (1 <= mSignal) ? 1 : 0))))
DynamicVariables=1
UpdateDivider=5
