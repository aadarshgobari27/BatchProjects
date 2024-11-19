@echo off
title System Cleanup Script
:mainMenu
echo ============================================
echo        SYSTEM CLEANUP TOOL
echo ============================================
echo Select an option:
echo [1] Clean Temporary Files
echo [2] Empty Recycle Bin
echo [3] Clear Browser Cache (Internet Explorer/Edge)
echo [4] Clean All
echo [5] Exit
echo ============================================
set /p choice="Enter your choice (1-5): "

if "%choice%"=="1" goto tempFiles
if "%choice%"=="2" goto recycleBin
if "%choice%"=="3" goto browserCache
if "%choice%"=="4" goto cleanAll
if "%choice%"=="5" goto exit
echo Invalid option. Try again.
goto mainMenu

:tempFiles
echo Cleaning temporary files...
del /s /q %temp%\*.* >nul 2>&1
echo Temporary files cleaned successfully.
pause
goto mainMenu

:recycleBin
echo Emptying Recycle Bin...
rd /s /q %systemdrive%\$Recycle.Bin >nul 2>&1
echo Recycle Bin emptied successfully.
pause
goto mainMenu

:browserCache
echo Clearing Browser Cache...
rd /s /q "%LocalAppData%\Microsoft\Edge\User Data\Default\Cache" >nul 2>&1
rd /s /q "%LocalAppData%\Microsoft\Internet Explorer\Cache" >nul 2>&1
echo Browser cache cleared successfully.
pause
goto mainMenu

:cleanAll
echo Starting full cleanup...
echo [=====         ] 33% - Cleaning Temporary Files...
del /s /q %temp%\*.* >nul 2>&1
echo [==========    ] 66% - Emptying Recycle Bin...
rd /s /q %systemdrive%\$Recycle.Bin >nul 2>&1
echo [===============] 100% - Clearing Browser Cache...
rd /s /q "%LocalAppData%\Microsoft\Edge\User Data\Default\Cache" >nul 2>&1
rd /s /q "%LocalAppData%\Microsoft\Internet Explorer\Cache" >nul 2>&1
echo Full cleanup completed successfully.
pause
goto mainMenu

:exit
echo Exiting System Cleanup Script. Goodbye!
exit
