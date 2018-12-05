@echo off
setlocal
rem Created:     2018/05/10 19:22:34
rem Last Change: 2018/12/05 11:10:11.

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
set def_conf=%homepath%"\dotfiles\etc\init\windows\settings\chocolatey\packages.config"

rem スクリプトがある "Dir" に "cd"
pushd %bat_path%

echo ^>^> %batch_title%

rem "Chocolatey" インストール済みかチェック
chocolatey -v > nul 2>&1
if %errorlevel% equ 0 goto update

echo ^>^> Install Chocolatey
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

rem 必須パッケージのみ "cinst"
cinst -y git onedrive teamviewer

:update
echo ^>^> Already installed Chocolatey, Update software

rem Test時はKILL
rem ---------------------------------------------------------------------------
rem "***_packages_***.config" を読み込み、インストール
if exist *_%config_files% (
    echo ^>^> Install app for this PC
    for %%i in (*_%config_files%) do (
        cinst -y %%i
        )
    ) else (
        echo ^>^> "Setting default parameter"
        cinst -y %def_conf%
        )
cup all -y
rem ---------------------------------------------------------------------------

rem ホームディレクトリに "cd"
pushd %homepath%

echo ^>^> Check installed Git or not
if not exist %homepath%"\dotfiles\.git" (
        echo    ^>^> Git clone first
        if exist %homepath%"\dotfiles\" (
            rmdir /s %homepath%"\dotfiles\"
            )
        git clone https://github.com/Wacky515/dotfiles.git
        rem 暫定的に以下の branch に checkout
        rem git checkout ftr_win

        rem link.cmd 実行
        pushd dotfiles
        call link.cmd
        ) else (
            echo    ^>^> Already Git clone
            )

rem 再度スクリプトがある "Dir" に "cd"
pushd %bat_path%

rem "git\init\settings" と O"neDrive\仕事\settings" の "setting_*.cmd" 実行
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

echo "*** CAUTION, RESTART PC AFTER KEY IN ***"
pause
shutdown.exe -r -t 60

endlocal
popd

exit /b 0

