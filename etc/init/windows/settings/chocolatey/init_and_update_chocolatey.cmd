@echo off

set bat_path=%~dp0
set config_files=packages_%computername%.config

rem スクリプトがある "Dir" に "cd"
cd /d %bat_path%

rem "Chocolatey" インストール済みかチェック
chocolatey -v >> nul
if %ERRORLEVEL% EQU 0 goto update

echo "Install Chocolatey"
@powershell -NoProfile -ExecutionPolicy unrestricted -Command "(iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))) >$null 2>&1" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin

:update
echo "Already installed Chocolatey, Update software"

rem DONE: "packages_***.config" を読み込み、インストール
if exist %config_files% (
    echo "Setting for this PC"
    cinst -y %config_files%
    )

cup all -y

rem デスクトップショートカット 作成
if not exist %USERPROFILE%"\Desktop\"%~n0".lnk" (
    goto cplnk
) else (
    echo "Already set desktop shortcut"
    goto end
)

:cplnk
copy %~n0".lnk" %USERPROFILE%"\Desktop\"

:end
rem pause
