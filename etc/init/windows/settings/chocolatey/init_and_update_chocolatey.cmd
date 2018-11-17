@echo off
setlocal
rem Created:     2017/02/17 00:54:41
rem Last Change: 2018/11/17 09:42:44.

title Update Chocolatey

rem http://pachicoma.hateblo.jp/entry/2017/02/28/Chocolatey%E3%81%A8%E3%81%84%E3%81%86Windows10%E3%83%91%E3%83%83%E3%82%B1%E3%83%BC%E3%82%B8%E3%83%9E%E3%83%8D%E3%83%BC%E3%82%B8%E3%83%A3%E3%82%92%E4%BD%BF%E3%81%A3%E3%81%A6%E3%81%BF%E3%82%8B
rem DONE: 上記URL参照してリファクタリング

rem 管理者権限で起動されたかチェック
whoami /PRIV | find "SeLoadDriverPrivilege" > NUL

rem 管理者権限ならメイン処理
if not errorlevel 1 goto main_routine

rem 管理者権限でなければ管理者権限で再起動
@powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process %~f0 -Verb Runas"
exit

:main_routine
set bat_path=%~dp0
set config_files=packages_%computername%.config

rem スクリプトがある "Dir" に "cd"
rem pushd /d %bat_path%
pushd %bat_path%

rem "Chocolatey" インストール済みかチェック
chocolatey -v > nul 2>&1
if %errorlevel% equ 0 goto update

echo ^>^> Install Chocolatey
@powershell -NoProfile -ExecutionPolicy unrestricted -Command "(iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))) >$null 2>&1" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin

:update
echo ^>^> Already installed Chocolatey, Update software

rem DONE: "***_packages_***.config" を読み込み、インストール
if exist *_%config_files% (
        echo ^>^> Setting for this PC
        for %%i in (*_%config_files%) do (
            rem cinst -y %config_files%
            cinst -y %%i
            )
        )

cup all -y

rem デスクトップショートカット 作成
if not exist %USERPROFILE%"\Desktop\"%~n0".lnk" (
    goto cplnk
) else (
    echo ^>^> Already set desktop shortcut
    goto end
)

:cplnk
copy %~n0".lnk" %USERPROFILE%"\Desktop\"

:end

endlocal
popd

rem pause
exit /b 0

