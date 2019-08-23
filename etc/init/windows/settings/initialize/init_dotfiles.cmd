@echo off
setlocal
rem Created:     2018/05/10 19:22:34
rem Last Change: 2019/08/23 11:19:06.

set batch_title=Initialize dotfiles
title %batch_title%

rem 管理者権限で起動されたかチェック
whoami /priv | find "SeLoadDriverPrivilege" > nul

rem 管理者権限ならメイン処理
if not errorlevel 1 goto main_routine

rem 管理者権限でなければ管理者権限で再起動
@powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process %~f0 -Verb Runas"
exit

:main_routine
set bat_path=%~dp0
set config_files=packages_%computername%.config
set conf_path=C:%homepath%\dotfiles\etc\init\windows\settings\chocolatey
set def_conf=%conf_path%\packages.config

rem スクリプトがある "Dir" に "cd"
pushd %bat_path%

echo ^>^> %batch_title%

rem "Chocolatey" インストール済みかチェック
chocolatey -v > nul 2>&1
if %errorlevel% equ 0 goto gclone

echo ^>^> Install Chocolatey
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

rem 必須パッケージのみ "cinst"
cinst -y git onedrive megasync teamviewer

:gclone
echo ^>^> Already installed Chocolatey
rem ホームディレクトリに "cd"
pushd %homepath%

echo ^>^> Check installed Git or not
if not exist %homepath%\dotfiles\.git (
    echo ^>^> Git clone first
    if exist %homepath%\dotfiles\ (
        del /s /q %homepath%\dotfiles\
        for /d %%j in (%homepath%\dotfiles\) do rmdir /s /q "%%j")
        git clone --depth 1 https://github.com/Wacky515/dotfiles.git

        rem link.cmd 実行
        pushd %homepath%\dotfiles
        call link.cmd
    ) else (
        echo ^>^> Already Git clone
    )

rem rem 再度スクリプトがある "Dir" に "pushd"
rem pushd %bat_path%
rem "*.config" のある "Dir" に "pushd"
pushd %conf_path%

echo ^>^> Update Chocolatey
rem Test時はKILL
rem ---------------------------------------------------------------------------
rem "***_packages_***.config" を読み込み、インストール
if exist *_%config_files% (
    echo ^>^> Install app for this PC
    for %%i in (*_%config_files%) do (
        cinst -y %%i
        )
    ) else (
        echo ^>^> Setting default parameter
        cinst -y %def_conf%
        )
cup all -y
rem ---------------------------------------------------------------------------

rem 再度スクリプトがある "Dir" に "pushd"
pushd %bat_path%

rem "git\init\settings" と "Mega\仕事\settings" の "setting_*.cmd" 実行
call sub_install_all.cmd
rem pause

rem ホームディレクトリに *.7z で圧縮したアプリを展開
call sub_install_app.cmd
rem pause

call sub_setting_all.cmd
rem pause

echo ^>^> Chocolatey update
cup all -y
rem pause

call sub_install_font.cmd

echo *** CAUTION, AUTOMATICALLY RESTART PC AFTER KEY INPUT ***
pause
shutdown.exe -r -t 60

endlocal
popd

exit /b 0

