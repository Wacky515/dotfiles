@echo off
setlocal enabledelayedexpansion
rem Created:     2018/05/10 19:22:34
rem Last Change: 2019/11/19 13:45:28.

set batch_title=Initialize dotfiles
title %batch_title%

rem �Ǘ��Ҍ����ŋN�����ꂽ���`�F�b�N
whoami /PRIV | find "SeLoadDriverPrivilege" > nul

rem �Ǘ��Ҍ����Ȃ烁�C������
if not errorlevel 1 goto main_routine

rem �Ǘ��Ҍ����łȂ���ΊǗ��Ҍ����ōċN��
@powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process %~f0 -Verb Runas"
exit

:main_routine
set bat_path=%~dp0
set conf_file=packages_%computername%.config
set conf_path=%userprofile%\dotfiles\etc\init\windows\settings\chocolatey\
set conf_defa=%conf_path%\packages.config

rem �X�N���v�g������ "Dir" �� "cd"
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
rem "Chocolatey" �C���X�g�[���ς݂��`�F�b�N
echo ^>^> Check installed Chocolatey or not
chocolatey -v > nul 2>&1
if %errorlevel% equ 0 goto must_inst

echo ^>^> Install Chocolatey
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

:must_inst
echo ^>^> Already installed Chocolatey
rem �K�{�p�b�P�[�W�̂� "cinst"
cinst -y git megasync 7zip

rem �z�[���f�B���N�g���� "cd"
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
rem link.cmd ���s
pushd %userprofile%\dotfiles\
call link.cmd

rem Proxy�����m�F
rem if %computername% == HBAMB748  rem ({{{
rem     goto cp_rd
rem ) else if %computername% == HBAMB819 (
rem     goto cp_rd
rem )

rem netsh wlan show profile name=murata-dmj-peap >nul
rem if %errorlevel% equ 0 goto cp_rd
rem TODO: ����Wi-Fi��NAS����_�E�����[�h
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
if exist %userprofile%\OneDrive\�d��\Settings\Wallpaper\ (
    echo ^>^> Already exist "Settings", Install apps
    goto chk_initapps
)
echo ^>^> Not exist "Settings"
goto dl_mega

:chk_initapps
echo ^>^> Check exist "InitApps" or not
if exist %userprofile%\OneDrive\�d��\InitApps\x64\ (
    echo ^>^> Already exist "InitApps", Install apps
    goto inst_apps
)
echo ^>^> Not exist "InitApps"

:cp_rd
rem rem R�h���C�u�R�s�[
echo ^>^> In proxy
if not exist %userprofile%\OneDrive\�d��\Settings\ (
    mkdir %userprofile%\OneDrive\�d��\Settings\
)
if not exist %userprofile%\OneDrive\�d��\InitApps\ (
    mkdir %userprofile%\OneDrive\�d��\InitApps\
)
net use v: /delete > nul 2>&1
net use w: /delete > nul 2>&1
net use v: \\M5FSV01\HONSHAB\E2M0\E2M-4\�y��z-E2M4-1\10.�l�t�@�C��\Wakita\�d��\Settings
net use w: \\M5FSV01\HONSHAB\E2M0\E2M-4\�y��z-E2M4-1\10.�l�t�@�C��\Wakita\�d��\InitApps
echo ^>^> Copy "Settngs" from R drive
robocopy /s /e v: %userprofile%\OneDrive\�d��\Settings\
echo ^>^> Copy "InitApps" from R drive
robocopy w: /s /e %userprofile%\OneDrive\�d��\InitApps\
net use v: /delete > nul 2>&1
net use w: /delete > nul 2>&1
goto inst_apps

:cp_nas
set nas_settings=\\LS210D68\Share\Settings\
set nas_init_apps=\\LS210D68\Shara\InitApps\
echo ^>^> In home network
echo ^>^> Copy "Settings" from NAS
robocopy /s /e %nas_setthing% %userprofile%\OneDrive\�d��\Settings\
echo ^>^> Copy "InitApps" from NAS
robocopy /s /e %nas_initapps% %userprofile%\OneDrive\�d��\InitApps\
goto inst_apps

:dl_mega
echo ^>^> Not in proxy
if exist %userprofile%\OneDrive\�d��\Settings\ (
    rmdir /s /q %userprofile%\OneDrive\�d��\Settings\
)
echo ^>^> Please download "Settings" folder manually
start https://mega.nz/#F!ubhxia6L
pause

"C:\Program Files\7-Zip\7z.exe" x -y -o%userprofile%\OneDrive\�d��\ %userprofile%\OneDrive\�d��\Settings.zip

if exist %userprofile%\OneDrive\�d��\InitApps\ (
    rmdir /s /q %userprofile%\OneDrive\�d��\InitApps\
)
echo ^>^> Please download "InitApps" folder manually
start https://mega.nz/#F!yTATTABQ
pause

"C:\Program Files\7-Zip\7z.exe" x -y -o%userprofile%\OneDrive\�d��\ %userprofile%\OneDrive\�d��\InitApps.zip
goto inst_apps

:inst_apps
rem "*.config" �̂��� "Dir" �� "pushd"
pushd %conf_path%

echo ^>^> Install apps by Chocolatey
rem ---------------------------------------------------------------------------
rem Test�� �X�L�b�v
rem ---------------------------------------------------------------------------
if %test% equ 1 goto inst_all
rem "***_packages_***.config" ��ǂݍ��݁A�C���X�g�[��
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
rem �ēx�X�N���v�g������ "Dir" �� "pushd"
rem MEMO: "init_dotfiles" �Ŏ��s����ꍇ������̂Ő�΃p�X�w��
pushd %userprofile%\dotfiles\etc\init\windows\settings\initialize\

rem "git\init\settings" �� "Mega(R:)\�d��\Settings" �� "setting_*.cmd" ���s
call sub_install_all.cmd
rem pause

rem �z�[���f�B���N�g���� *.7z �ň��k�����A�v����W�J
call sub_install_app.cmd
rem pause

call sub_setting_all.cmd
rem pause

echo ^>^> Chocolatey update
cup all -y
rem pause

rem ---------------------------------------------------------------------------
rem Test�� �X�L�b�v
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

if exist %userprofile%\OneDrive\�d��\Settings.zip (
    echo ^>^> Del Settings.zip
    del %userprofile%\OneDrive\�d��\Settings.zip > nul 2>&1
)

if exist %userprofiley%\OneDrive\�d��\InitApps.zip (
    echo ^>^> Del InitApps.zip
    del %userprofile%\OneDrive\�d��\InitApps.zip > nul 2>&1
)

call %userprofile%\OneDrive\�d��\InitApps\Batch\empty.cmd

rem link.cmd ���s
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
