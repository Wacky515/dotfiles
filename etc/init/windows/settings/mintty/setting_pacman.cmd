@echo off

rem  スクリプトがある "Dir" に "cd"
cd /d %~dp0

echo Start set link

rem mklink "C:\Python35\Lib\site-packages\.anaconda.pth" "\.anaconda.pth"
mklink "C:\tools\msys64\etc" "\.pacman.conf"

pause
exit /b 0
