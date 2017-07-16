@echo off

chocolatey -v
rem echo %ERRORLEVEL%
if %ERRORLEVEL% EQU 0 goto update

echo "Install Chocolatey"
@powershell -NoProfile -ExecutionPolicy unrestricted -Command "(iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))) >$null 2>&1" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin
rem TODO: 必須インストールソフト列挙テキスト（未制作）を読み込み、インストールする
cinst packages.config

rem ) else (

:update
echo "Already installed Chocolatey, Update software"
cup all -y

pause
