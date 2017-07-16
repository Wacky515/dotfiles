rem TODO: 32bitと64bit で処理を分岐
rem MEMO: 64bit イニシャル 一応動く
echo off

rem 32bit環境のインストール一覧
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall" /s | findstr "Chocolatey"
if %ERRORLEVEL% EQU 0 GOTO :UPDATE
rem TODO: "%ERRORLEVEL%"  -> 変数1に格納
echo ERRORLEVEL1: %ERRORLEVEL%
set find1 = %ERRORLEVEL%
echo find1: %find1%

reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Uninstall" /s | findstr "Chocolatey"
if %ERRORLEVEL% EQU 0 GOTO :UPDATE
rem TODO: "%ERRORLEVEL%"  -> 変数2に格納
echo ERRORLEVEL2: %ERRORLEVEL%
set find2 = %ERRORLEVEL%
echo find2: %find2%

rem 64bit環境のインストール一覧
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall" /s | findstr "Chocolatey"
if %ERRORLEVEL% EQU 0 GOTO :UPDATE
rem TODO: "%ERRORLEVEL%"  -> 変数3に格納
echo ERRORLEVEL3: %ERRORLEVEL%
set find3 = %ERRORLEVEL%
echo find3: %find3%

rem TODO: if 変数1、2、3 の和 > 1 (
rem if /a %find1%+%find2%+%find3% EQU 3
    echo "Install Chocolatey"
    @powershell -NoProfile -ExecutionPolicy unrestricted -Command "(iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))) >$null 2>&1" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin
rem TODO: 必須インストールソフト列挙テキスト（未制作）を読み込み、インストールする

    PAUSE
rem ) else (
:UPDATE
    echo "Already installed Chocolatey, Update software"
    cup all -y

    PAUSE
)
