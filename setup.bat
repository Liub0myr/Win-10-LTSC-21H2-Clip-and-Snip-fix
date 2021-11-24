@echo off
rem https://github.com/Liub0myr/Win-10-LTSC-21H2-Clip-and-Snip-fix
title Clipboard history and Snipping tool hotkeys fix by Liub0myr
call :arch
call :install
echo Everything is done !
pause
exit


:arch
wmic os get Caption | findstr "LTSC" > nul
if not %errorLevel% == 0 (goto no_need)
wmic os get BuildNumber | findstr "19044" > nul
if not %errorLevel% == 0 (goto no_need)
wmic os get osarchitecture | findstr "64-bit" > nul
if %errorLevel% == 0 (set arch=x64) else (set arch=x86)
exit /b



:no_need
echo It looks like you've run the program on a PC that doesn't need this fix
pause
exit



:install
powershell Get-AppxPackage | findstr "Microsoft.VCLibs.140.00_" > nul
if %errorLevel% == 0 (goto no_need)
powershell Add-AppxPackage Microsoft.VCLibs.140.00_14.0.30704.0_%arch%__8wekyb3d8bbwe.appx
exit /b
