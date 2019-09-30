@echo off
setlocal
rem Created:     2018/05/10 19:22:34
rem Last Change: 2019/09/30 15:39:07.

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
set conf_path=C:%homepath%\dotfiles\etc\init\windows\settings\chocolatey\
set def_conf=%conf_path%\packages.config

rem スクリプトがある "Dir" に "cd"
pushd %bat_path%

echo ^>^> %batch_title%
echo.
echo #####    ####  ####### ##### ### ##    #####    ### #
echo  #   #  #    # #  #  #  #  #  #   #     #      #   #
echo  #    # #    #    #     #     #   #     #      #
echo  #    # #    #    #     # ##  #   #     # ##   ##
echo  #    # #    #    #     #  #  #   #     #  #     ##
echo  #    # #    #    #     #     #   #     #         #
echo  #   #  #    #    #     #     #   #     #   # #   #
echo #####    ####    ###   ##    ### ##### ######  ####
echo.
echo *** WHAT IS INSIDE? ***
echo 1. Download dotfiles from "https://github.com/Wacky515/dotfiles".
echo 2. Symbolic linking dotfiles to home directory.
echo 3. Install packages.
echo.
echo *** HOW TO INSTALL? ***
echo See the README for documentation.
echo Licensed under the MIT license.
echo.
echo *** ATTENTION ***
echo Standard and Standard errer output in ~/init_dotfile.log.
echo This script can change your entire setup.
echo I recommend to read first. You can even copy commands one by one.
echo.
echo Start install? [Y/N]

set /p input=
if defined input set input=%input:"=%
if /i "%input%" == "y" (goto redirect)
if /i "%input%" == "Y" (goto redirect)
exit /b 0

:redirect
call :chk_choco > %homepath%\init_dotfile.log 2>&1
exit /b

:chk_choco
rem "Chocolatey" インストール済みかチェック
echo ^>^> Check installed Chocolatey or not
chocolatey -v > nul 2>&1
if %errorlevel% equ 0 goto must_inst

echo ^>^> Install Chocolatey
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

:must_inst
echo ^>^> Already installed Chocolatey
rem 必須パッケージのみ "cinst"
cinst -y git 7zip onedrive megasync

rem ホームディレクトリに "cd"
pushd %homepath%

echo ^>^> Check installed Git or not
git --version > nul 2>&1
if %errorlevel% equ 0 goto gclone
echo ^>^> Try install git
cinst -y git
git --version > nul 2>&1
if %errorlevel% equ 0 goto gclone
echo ^>^> Field install git automatically
exit /b 1000
ii
:gclone
echo ^>^> Check Git clone or not
if not exist C:\%homepath%\dotfiles\.git\ (
    echo ^>^> Git clone not yet, clone first
    if exist %homepath%\dotfiles\ (
        rmdir /s /q %homepath%\dotfiles\
    )
    del %homepath%\.gitconfig > nul 2>&1
    del %homepath%\.gitignore > nul 2>&1
    git clone --depth 1 https://github.com/Wacky515/dotfiles.git
) else (
    echo ^>^> Already Git clone
)
rem link.cmd 実行
pushd %homepath%\dotfiles\
call link.cmd

if not exist %homepath%\OneDrive\仕事\Settings\ (
    mkdir %homepath%\OneDrive\仕事\Settings\
)
echo ^>^> Check exist "Settings" or not
if exist %homepath%\OneDrive\仕事\Settings\Wallpaper\ (
    echo ^>^> Already exist "Settings", Install apps
    goto inst_apps
)

rem Proxy環境か確認
rem if %computername% == HBAMB748  rem ({{{
rem     goto cp_rd
rem ) else if %computername% == HBAMB819 (
rem     goto cp_rd
rem )

rem netsh wlan show profile name=murata-dmj-peap >nul
rem if %errorlevel% equ 0 goto cp_rd
rem TODO: 自宅Wi-FiでNASからダウンロード
rem netsh wlan show profile name=*_SaladExtreme* >nul
rem if %errorlevel% equ 0 goto cp_nas
rem netsh wlan show profile name=*_SaladCapsule* >nul
rem if %errorlevel% equ 0 goto cp_nas
rem }}}
ping 172.16.84.100 /n 1 > nul 2>&1
if %errorlevel% equ 0 goto cp_rd
ping 10.0.1.1 /n 1 > nul 2>&1
if %errorlevel% equ 0 goto cp_nas

echo ^>^> Not in proxy
rem megasync
rem pause
bitsadmin /transfer DownloadSettingMega https://mega.nz/#F!ubhxia6L %homepath%\OneDrive\仕事\Settings.zip
start https://mega.nz/#F!ubhxia6L
rem bitsadmin /transfer DownloadInitAppsMega https://mega.nz/*** %homepath%\OneDrive\仕事\InitApps.zip
rem start https://mega.nz/***
echo ^>^> Please download "Settings" and "InitApps" folder manually
pause
"C:\Program Files\7-Zip\7z.exe" x -y
    \ -oC:\%homepath%\OneDrive\仕事\Settings\
    \ C:\%homepath%\OneDrive\仕事\Settings.zip
"C:\Program Files\7-Zip\7z.exe" x -y
    \ -oC:\%homepath%\OneDrive\仕事\InitApps\
    \ C:\%homepath%\OneDrive\仕事\InitApps.zip
goto inst_apps

:cp_rd
rem rem Rドライブコピー
echo ^>^> In proxy
net use v: /delete > nul 2>&1
net use w: /delete > nul 2>&1
net use v: \\M5FSV01\HONSHAB\E2M0\E2M-4\【秘】-E2M4-1\10.個人ファイル\Wakita\仕事\Settings
net use w: \\M5FSV01\HONSHAB\E2M0\E2M-4\【秘】-E2M4-1\10.個人ファイル\Wakita\仕事\InitApps
echo ^>^> Copy "Settngs" from R drive
robocopy v: C:\%homepath%\OneDrive\仕事\Settings\ /s /e
echo ^>^> Copy "InitApps" from R drive
robocopy w: C:\%homepath%\OneDrive\仕事\InitApps\ /s /e
net use v: /delete > nul 2>&1
net use w: /delete > nul 2>&1

:cp_nas
echo ^>^> In home network
echo ^>^> Copy "Settngs" from NAS
robocopy src dst /s /e
echo ^>^> Copy "InitApps" from NAS
robocopy src dst /s /e
goto inst_apps

:inst_apps
rem "*.config" のある "Dir" に "pushd"
pushd %conf_path%

echo ^>^> Install apps by Chocolatey
rem Test時はKILL
rem ---------------------------------------------------------------------------
rem "***_packages_***.config" を読み込み、インストール
if exist *_%config_files% (
    echo ^>^> Install apps for this PC
    for %%i in (*_%config_files%) do (
        cinst -y %%i
        )
    ) else (
        echo ^>^> Setting default parameter
        cinst -y %def_conf%
        )
echo ^>^> Update Chocolatey
cup all -y
rem ---------------------------------------------------------------------------

rem 再度スクリプトがある "Dir" に "pushd"
rem "init_dotfiles" で実行する場合があるので絶対Path
pushd %homepath%\dotfiles\etc\init\windows\settings\initialize\

rem "git\init\settings" と "Mega(R:)\仕事\Settings" の "setting_*.cmd" 実行
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

rmdir /s /q C:%homepath%\init_dotfiles\ > nul 2>&1
rmdir /s /q C:\%homepath%\OneDrive\仕事\Settings.zip> nul 2>&1

rem link.cmd 実行
pushd %homepath%\dotfiles\
call link.cmd

echo *** CAUTION, AUTOMATICALLY RESTART PC KEY INPUT AFTER 60sec ***
pause
shutdown.exe -r -t 60

endlocal
popd

exit /b 0
