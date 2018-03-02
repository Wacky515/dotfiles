@echo off

rem  スクリプトがある "Dir" に "cd"
cd /d %~dp0

echo Start set link

rem mklink %HOMEPATH%"\.gvimrc" ".\dotfiles\.gvimrc"
mklink "C:\Python35\Lib\site-packages\.anaconda.pth" "\.anaconda.pth"

pause
exit /b 0
