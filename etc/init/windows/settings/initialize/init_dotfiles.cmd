@echo off
setlocal enabledelayedexpansion
rem Created:     2018/05/10 19:22:34
rem Last Change: 2019/11/19 13:45:28.

set batch_title=Initialize dotfiles
title %batch_title%

rem 管理者権限で起動されたかチェック
whoami /PRIV | find "SeLoadDriverPrivilege" > nul

rem 管理者権限ならメイン処理
if not errorlevel 1 goto main_routine

rem 管理者権限でなければ管理者権限で再起動
@powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process %~f0 -Verb Runas"
exit

:main_routine
set bat_path=%~dp0
set conf_file=packages_%computername%.config
set conf_path=%userprofile%\dotfiles\etc\init\windows\settings\chocolatey\
set conf_defa=%conf_path%\packages.config

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
echo *** HOW TO INSTALL? ***
echo.
echo See the README for documentation.
echo Licensed under the MIT license.
echo.
echo *** ATTENTION ***
echo.
echo Standard and Standard errer output in ~/init_dotfile.log.
echo This script can change your entire setup.
echo I recommend to read first. You can even copy commands one by one.
echo.
echo Start install [Y/N], or test[t]?

set /p input=
if defined input set input=%input:"=%
if /i "%input%" == "y" (
    set test=0
    goto redirect
)
if /i "%input%" == "Y" (
    set test=0
    goto redirect
)
if /i "%input%" == "t" (
    set test=1
    goto redirect
)
goto end

:redirect
call :chk_choco > %userprofile%\init_dotfile.log 2>&1
goto end

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
cinst -y git megasync 7zip

rem ホームディレクトリに "cd"
pushd %userprofile%

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
if not exist C:%homepath%\dotfiles\.git\ (
    echo ^>^> Git clone not yet, clone first
    if exist %userprofile%\dotfiles\ (
        rmdir /s /q %userprofile%\dotfiles\
    )
    del %userprofile%\.gitignore > nul 2>&1
    git clone --depth 1 https://github.com/Wacky515/dotfiles.git
) else (
    echo ^>^> Already Git clone
)
rem link.cmd 実行
pushd %userprofile%\dotfiles\
call link.cmd

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

echo ^>^> Check exist "Settings" or not
if exist %userprofile%\OneDrive\仕事\Settings\Wallpaper\ (
    echo ^>^> Already exist "Settings", Install apps
    goto chk_initapps
)
echo ^>^> Not exist "Settings"
goto dl_mega

:chk_initapps
echo ^>^> Check exist "InitApps" or not
if exist %userprofile%\OneDrive\仕事\InitApps\x64\ (
    echo ^>^> Already exist "InitApps", Install apps
    goto inst_apps
)
echo ^>^> Not exist "InitApps"

:cp_rd
rem rem Rドライブコピー
echo ^>^> In proxy
if not exist %userprofile%\OneDrive\仕事\Settings\ (
    mkdir %userprofile%\OneDrive\仕事\Settings\
)
if not exist %userprofile%\OneDrive\仕事\InitApps\ (
    mkdir %userprofile%\OneDrive\仕事\InitApps\
)
net use v: /delete > nul 2>&1
net use w: /delete > nul 2>&1
net use v: \\M5FSV01\HONSHAB\E2M0\E2M-4\【秘】-E2M4-1\10.個人ファイル\Wakita\仕事\Settings
net use w: \\M5FSV01\HONSHAB\E2M0\E2M-4\【秘】-E2M4-1\10.個人ファイル\Wakita\仕事\InitApps
echo ^>^> Copy "Settngs" from R drive
robocopy /s /e v: %userprofile%\OneDrive\仕事\Settings\
echo ^>^> Copy "InitApps" from R drive
robocopy w: /s /e %userprofile%\OneDrive\仕事\InitApps\
net use v: /delete > nul 2>&1
net use w: /delete > nul 2>&1
goto inst_apps

:cp_nas
set nas_settings=\\LS210D68\Share\Settings\
set nas_init_apps=\\LS210D68\Shara\InitApps\
echo ^>^> In home network
echo ^>^> Copy "Settings" from NAS
robocopy /s /e %nas_setthing% %userprofile%\OneDrive\仕事\Settings\
echo ^>^> Copy "InitApps" from NAS
robocopy /s /e %nas_initapps% %userprofile%\OneDrive\仕事\InitApps\
goto inst_apps

:dl_mega
echo ^>^> Not in proxy
if exist %userprofile%\OneDrive\仕事\Settings\ (
    rmdir /s /q %userprofile%\OneDrive\仕事\Settings\
)
echo ^>^> Please download "Settings" folder manually
start https://mega.nz/#F!ubhxia6L
pause

"C:\Program Files\7-Zip\7z.exe" x -y -o%userprofile%\OneDrive\仕事\ %userprofile%\OneDrive\仕事\Settings.zip

if exist %userprofile%\OneDrive\仕事\InitApps\ (
    rmdir /s /q %userprofile%\OneDrive\仕事\InitApps\
)
echo ^>^> Please download "InitApps" folder manually
start https://mega.nz/#F!yTATTABQ
pause

"C:\Program Files\7-Zip\7z.exe" x -y -o%userprofile%\OneDrive\仕事\ %userprofile%\OneDrive\仕事\InitApps.zip
goto inst_apps

:inst_apps
rem "*.config" のある "Dir" に "pushd"
pushd %conf_path%

echo ^>^> Install apps by Chocolatey
rem ---------------------------------------------------------------------------
rem Test時 スキップ
rem ---------------------------------------------------------------------------
if %test% equ 1 goto inst_all
rem "***_packages_***.config" を読み込み、インストール
if exist *_%conf_file% (
    echo ^>^> Install apps for this PC
    for %%i in (*_%conf_file%) do (
        cinst -y %%i
        )
    ) else (
        echo ^>^> Setting default parameter
        cinst -y %conf_defa%
        )
echo ^>^> Update Chocolatey
cup all -y
rem ---------------------------------------------------------------------------

:inst_all
rem 再度スクリプトがある "Dir" に "pushd"
rem MEMO: "init_dotfiles" で実行する場合があるので絶対パス指定
pushd %userprofile%\dotfiles\etc\init\windows\settings\initialize\

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

rem ---------------------------------------------------------------------------
rem Test時 スキップ
rem ---------------------------------------------------------------------------
if %test% equ 1 goto erase
call sub_install_font.cmd
rem ---------------------------------------------------------------------------

:erase
echo ^>^> Erase temp data
rem if exist %userprofile%\init_dotfiles\ (
rem     echo ^>^> Del init_dotfiles
rem     rmdir /s /q %userprofile%\init_dotfiles > nul 2>&1
rem )

if exist %userprofile%\OneDrive\仕事\Settings.zip (
    echo ^>^> Del Settings.zip
    del %userprofile%\OneDrive\仕事\Settings.zip > nul 2>&1
)

if exist %userprofiley%\OneDrive\仕事\InitApps.zip (
    echo ^>^> Del InitApps.zip
    del %userprofile%\OneDrive\仕事\InitApps.zip > nul 2>&1
)

call %userprofile%\OneDrive\仕事\InitApps\Batch\empty.cmd

rem link.cmd 実行
rem pushd %userprofile%\dotfiles\
rem call link.cmd
call %userprofile%\dotfiles\etc\init\windows\settings\chocolatey\init_and_update_chocolatey.cmd

echo *** CAUTION: AUTOMATICALLY RESTART PC, KEY INPUT AFTER 60sec ***
pause
shutdown.exe -r -t 60

:end
endlocal
popd

exit /b 0
