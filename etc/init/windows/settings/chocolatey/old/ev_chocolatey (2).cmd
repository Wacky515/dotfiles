echo off

rem rem TODO: 32bitと64bit で処理を分岐
rem rem MEMO: 64bit イニシャル 一応動く
rem
rem rem 32bit環境のインストール一覧
rem reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall" /s | findstr "Chocolatey"
rem if %ERRORLEVEL% EQU 0 goto :update
rem rem TODO: "%ERRORLEVEL%"  -> 変数1に格納
rem echo ERRORLEVEL1: %ERRORLEVEL%
rem set find1 = %ERRORLEVEL%
rem echo find1: %find1%
rem
rem reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Uninstall" /s | findstr "Chocolatey"
rem if %ERRORLEVEL% EQU 0 goto :update
rem rem TODO: "%ERRORLEVEL%"  -> 変数2に格納
rem echo ERRORLEVEL2: %ERRORLEVEL%
rem set find2 = %ERRORLEVEL%
rem echo find2: %find2%
rem
rem rem 64bit環境のインストール一覧
rem reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall" /s | findstr "Chocolatey"
rem if %ERRORLEVEL% EQU 0 goto :update
rem rem TODO: "%ERRORLEVEL%"  -> 変数3に格納
rem echo ERRORLEVEL3: %ERRORLEVEL%
rem set find3 = %ERRORLEVEL%
rem echo find3: %find3%

chocolatey -v
echo %ERRORLEVEL%
if %ERRORLEVEL% EQU 0 goto update


rem TODO: if 変数1、2、3 の和 > 1 (
rem if /a %find1%+%find2%+%find3% EQU 3
echo "Install Chocolatey"
@powershell -NoProfile -ExecutionPolicy unrestricted -Command "(iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))) >$null 2>&1" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin
rem TODO: 必須インストールソフト列挙テキスト（未制作）を読み込み、インストールする
cinst packages.config

rem ) else (

:update
echo "Already installed Chocolatey, Update software"
cup all -y

pause
