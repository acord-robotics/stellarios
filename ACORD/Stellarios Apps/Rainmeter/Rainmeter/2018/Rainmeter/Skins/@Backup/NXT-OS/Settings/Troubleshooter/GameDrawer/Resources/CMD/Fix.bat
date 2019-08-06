@echo off
%2 [!DeactivateConfig NXT-OS\GameDrawer][!SetVariable Progress 1 NXT-OS\Settings\Troubleshooter\GameDrawer][!Update NXT-OS\Settings\Troubleshooter\GameDrawer]
timeout /t 2 /nobreak > NUL
cd %1
if exist "NXT-OS\GameDrawer\Resources" (
    cd "NXT-OS\GameDrawer\Resources"
) else (
    exit
)
del Animation.inc
%2 [!SetVariable Progress 2 NXT-OS\Settings\Troubleshooter\GameDrawer][!Update NXT-OS\Settings\Troubleshooter\GameDrawer]
del Meters.inc
%2 [!SetVariable Progress 3 NXT-OS\Settings\Troubleshooter\GameDrawer][!Update NXT-OS\Settings\Troubleshooter\GameDrawer]
cd %1
if exist "NXT-OS Data" (
    cd "NXT-OS Data"
) else (
    exit
)
%2 [!SetVariable Progress 4 NXT-OS\Settings\Troubleshooter\GameDrawer][!Update NXT-OS\Settings\Troubleshooter\GameDrawer]
if exist GameDrawer (rd /s /q "GameDrawer")
%2 [!SetVariable Progress 5 NXT-OS\Settings\Troubleshooter\GameDrawer][!Update NXT-OS\Settings\Troubleshooter\GameDrawer]
timeout /t 1 /nobreak > NUL
if exist "GameDrawer" (exit)
md "GameDrawer"
%2 [!SetVariable Progress 6 NXT-OS\Settings\Troubleshooter\GameDrawer][!Update NXT-OS\Settings\Troubleshooter\GameDrawer]
timeout /t 1 /nobreak > NUL
cd "GameDrawer"
%2 [!SetVariable Progress 7 NXT-OS\Settings\Troubleshooter\GameDrawer][!Update NXT-OS\Settings\Troubleshooter\GameDrawer]
timeout /t 1 /nobreak > NUL
md "Banners"
%2 [!SetVariable Progress 8 NXT-OS\Settings\Troubleshooter\GameDrawer][!Update NXT-OS\Settings\Troubleshooter\GameDrawer]
timeout /t 1 /nobreak > NUL
if not exist Exceptions.inc (echo. 2>Exceptions.inc)
%2 [!SetVariable Progress 9 NXT-OS\Settings\Troubleshooter\GameDrawer][!Update NXT-OS\Settings\Troubleshooter\GameDrawer]
if not exist Games.inc (echo. 2>Games.inc)
%2 [!SetVariable Progress 10 NXT-OS\Settings\Troubleshooter\GameDrawer][!Update NXT-OS\Settings\Troubleshooter\GameDrawer]
if not exist SteamShortcuts.inc (echo. 2>SteamShortcuts.inc)
%2 [!SetVariable Progress 11 NXT-OS\Settings\Troubleshooter\GameDrawer][!Update NXT-OS\Settings\Troubleshooter\GameDrawer]
timeout /t 1 /nobreak > NUL
%2 [!WriteKeyValue Variables State 0 %3]
%2 [!SetVariable Progress 12 NXT-OS\Settings\Troubleshooter\GameDrawer][!Update NXT-OS\Settings\Troubleshooter\GameDrawer]
timeout /t 2 /nobreak > NUL
%2 [!ActivateConfig NXT-OS\GameDrawer]
%2 [!SetVariable Progress 13 NXT-OS\Settings\Troubleshooter\GameDrawer][!Update NXT-OS\Settings\Troubleshooter\GameDrawer]
timeout /t 3 /nobreak > NUL
%2 [!SetVariable Progress 14 NXT-OS\Settings\Troubleshooter\GameDrawer][!Update NXT-OS\Settings\Troubleshooter\GameDrawer]
%2 [!SetOption Status Text Done NXT-OS\Settings\Troubleshooter\GameDrawer][!Update NXT-OS\Settings\Troubleshooter\GameDrawer]
%2 [!ShowMeterGroup Finish NXT-OS\Settings\Troubleshooter\GameDrawer][!Update NXT-OS\Settings\Troubleshooter\GameDrawer]