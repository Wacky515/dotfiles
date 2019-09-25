@echo off
setlocal
rem Created:     2018/05/10 19:22:34
rem Last Change: 2019/09/25 15:49:54.

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
echo.
echo #####    ####  ####### #####  ##  ##     #####   ###
echo  #   #  #    # #  #  #  #      #   #      #     #  #
echo  #   #  #    #    #     #      #   #      #     #   
echo  #   ## #    ##   #     # #    #   #      # #   ##  
echo  #   ## #    ##   #     # #    #   #      # #     ##
echo  #   #  #    #    #     #      #   #      #        #
echo  #   #  #    #    #     #      #   #      #   ##   #
echo ## ##    ####    ###   ##     ##  #####  ###### ####
echo.
echo *** WHAT IS INSIDE? ***
echo 1. Download dotfiles from "https://github.com/Wacky515/dotfiles"
echo 2. Symbolic linking dotfiles to home directory
echo 3. Install packages
echo.
echo *** HOW TO INSTALL? ***
echo See the README for documentation.
echo Licensed under the MIT license.
echo.
echo "*** ATTENTION ***"
echo "Standard output in ~/init_dotfile.log"
echo "This script can change your entire setup."
echo "I recommend to read first. You can even copy commands one by one."
echo.
echo Start install? [Y/N]

set /p input=
if defined input set input=%input:"=%
if /i "%input%" == "y" (goto redirect)
if /i "%input%" == "Y" (goto redirect)
exit /b 0

:redirect
call :chk_choco >%homepath%\init_dotfile.log
exit /b

:chk_choco
rem "Chocolatey" インストール済みかチェック
chocolatey -v > nul 2>&1
if %errorlevel% equ 0 goto must_inst

echo ^>^> Install Chocolatey
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

:must_inst
echo ^>^> Already installed Chocolatey
rem 必須パッケージのみ "cinst"
cinst -y git onedrive megasync

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

:gclone
echo ^>^> Check Git clone or not
if not exist %homepath%\dotfiles\.git (
    echo ^>^> Git clone not yet, clone first
    if exist %homepath%\dotfiles\ (
        rmdir /s /q %homepath%\dotfiles\
    )
    del %homepath%\.gitconfig
    del %homepath%\.gitignore
    git clone --depth 1 https://github.com/Wacky515/dotfiles.git
) else (
    echo ^>^> Already Git clone
)
rem link.cmd 実行
pushd %homepath%\dotfiles
call link.cmd

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
rem "init_dotfiles" で実行する場合があるので絶対Path
pushd %homepath%\dotfiles\etc\init\windows\settings\initialized

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

echo *** CAUTION, AUTOMATICALLY RESTART PC KEY INPUT AFTER 60sec ***
pause
shutdown.exe -r -t 60

endlocal
popd

exit /b 0
