@echo off
setlocal enabledelayedexpansion
rem Created:     2018/05/10 19:22:34
rem Last Change: 2020/10/25 22:38:40.

set batch_title=Initialize dotfiles
title %batch_title%

set yyyy=%date:~0,4%
set mm=%date:~5,2%
set dd=%date:~8,2%
 
set time_zero_suppress=%time: =0%
set hh=%time_zero_suppress:~0,2%
set mn=%time_zero_suppress:~3,2%
set ss=%time_zero_suppress:~6,2%

set maketime=%yyyy%-%mm%-%dd%_%hh%-%mn%-%ss%

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

rem rem �X�N���v�g������ "Dir" �� "cd"
rem pushd %bat_path%
rem �z�[���f�B���N�g���� "cd"
pushd %userprofile%

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
echo Standard and Standard errer output in ~/init_dotfile_DATE_TIME.log.
echo This script can change your entire setup.
echo I recommend to read first. You can even copy commands one by one.
echo.
echo *** NOTE ***
echo.
echo test: Not Chocolatey install from *.config
echo.
echo Start install [Y/N], or [t]est?

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
call :chk_choco > %userprofile%\init_dotfile_%maketime%.log 2>&1
rem type %userprofile%\init_dotfile_%maketime%.log
goto end

:chk_choco
rem "Chocolatey" �C���X�g�[���ς݂��`�F�b�N
echo ^>^> Check installed Chocolatey or not
chocolatey -v > nul 2>&1
if %errorlevel% equ 0 goto inst_must_apps

echo ^>^> Install Chocolatey
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

:inst_must_apps
rem �K�{�p�b�P�[�W "cinst"
echo ^>^> Already installed Chocolatey
echo ^>^> Install must apps

echo ^>^> Check installed 7zip or not
7z.exe > nul 2>&1
if not %errorlevel% equ 0 (
    echo ^>^> Install 7zip
    cinst -y -r --no-progress 7zip
) else (
    echo ^>^> Already installed 7zip
)

echo ^>^> Check installed Git or not
git --version > nul 2>&1
if not %errorlevel% equ 0 (
    echo ^>^> Install Git
    cinst -y -r --no-progress git
) else (
    echo ^>^> Already installed Git
)

echo ^>^> Check installed MEGAsync or not
megasync --version > nul 2>&1
if %errorlevel% equ 0 (
    echo ^>^> Already installed MEGAsync
    goto chk_inst_git
) else (
    echo ^>^> Install MEGAsync

    ping 172.16.84.100 /n 1 > nul 2>&1
    if %errorlevel% equ 0 goto chk_inst_megasync_in_proxy 
    cinst -y -r --no-progress megasync
    goto chk_inst_git

    :chk_inst_megasync_in_proxy
    if not exist %homepath%\OneDeive\�d��\ cinst -y -r --no-progress megasync
    echo ^>^> FIELD INSTALL MEGASYNC AUTOMATICALLY, CONNECT WITHOUT PROXY
    pause 
    exit /b 0013

    :inst_megasync
    cinst -y -r --no-progress megasync
)

:chk_inst_git
echo ^>^> Check installed Git or not 2nd time
git --version > nul 2>&1
if %errorlevel% equ 0 goto git_clone
echo ^>^> Try install git
cinst -y -r --no-progress git

echo ^>^> Check installed Git or not 3rd time
git --version > nul 2>&1
if %errorlevel% equ 0 goto git_clone
echo ^>^> FAIELD INSTALL GIT AUTOMATICALLY, ABORT THIS SCRIPT!
pause 
exit /b 0015

:git_clone
pushd %userprofile%
echo ^>^> Installed Git, Check Git clone or not
if not exist %userprofile%\dotfiles\.git\ (
    echo ^>^> Git clone not yet, clone first
    if exist %userprofile%\dotfiles\ (
        rmdir /s /q %userprofile%\dotfiles\
    )
    rem FIXME: �V���{���b�N�����N�폜�ł��Ȃ�
    rmdir %userprofile%\.gitconfig > nul 2>&1
    git clone --depth 1 https://github.com/Wacky515/dotfiles.git
    if %errorlevel% equ 1 (
        echo ^>^> FAIELD GIT CLONE, ABORT THIS SCRIPT!
        pause 
        exit /b 0020
    )
) else (
    echo ^>^> Already Git clone
)

rem link.cmd ���s
pushd %userprofile%\dotfiles\
call link.cmd

rem Proxy�����m�F
ping 172.16.84.100 /n 1 > nul 2>&1
if %errorlevel% equ 0 goto cp_rd
ping 10.0.1.1 /n 1 > nul 2>&1
if %errorlevel% equ 0 goto cp_nas

echo ^>^> Check exist "Settings" or not
if exist %userprofile%\OneDrive\�d��\Settings\Wallpaper\ (
    echo ^>^> Already exist "Settings", Install apps
    goto chk_init_apps
)
echo ^>^> Not exist "Settings"
goto dl_mega

:chk_init_apps
echo ^>^> Check exist "InitApps" or not
if exist %userprofile%\OneDrive\�d��\InitApps\x64\ (
    echo ^>^> Already exist "InitApps", Install apps
    goto install_apps
)
echo ^>^> Not exist "InitApps"

:cp_rd
rem R�h���C�u���R�s�[
echo ^>^> In proxy
if not exist %userprofile%\OneDrive\�d��\Settings\ (
    echo ^>^> Copy "Settngs" from R Drive
    mkdir %userprofile%\OneDrive\�d��\Settings\
    net use v: /delete > nul 2>&1
    net use v: \\M5FSV01\HONSHAB\E2M0\E2M-4\�y��z-E2M4-1\10.�l�t�@�C��\Wakita\�d��\Settings
    robocopy /s /e /njh /njs v: %userprofile%\OneDrive\�d��\Settings\
    net use v: /delete > nul 2>&1
)

if not exist %userprofile%\OneDrive\�d��\InitApps\ (
    echo ^>^> Copy "InitApps" from R Drive
    mkdir %userprofile%\OneDrive\�d��\InitApps\
    net use w: /delete > nul 2>&1
    net use w: \\M5FSV01\HONSHAB\E2M0\E2M-4\�y��z-E2M4-1\10.�l�t�@�C��\Wakita\�d��\InitApps
    robocopy /s /e /njh /njs w: %userprofile%\OneDrive\�d��\InitApps\
    net use w: /delete > nul 2>&1
)
goto install_apps

:cp_nas
echo ^>^> In home network, connect NAS
set nas_settings=\\SaladStationII\share\�d��\Settings
set nas_initapps=\\SaladStationII\shara\�d��\InitApps
rem set nas_settings=\\10.0.1.55\share\�d��\Settings
rem set nas_initapps=\\10.0.1.55\shara\�d��\InitApps
set result_nas_copy=0

echo ^>^> Copy "Settings" from NAS
net use t: /delete > nul 2>&1
net use t: %nas_settings% /user:admin
robocopy /s /e /njh /njs t: %userprofile%\OneDrive\�d��\Settings\
if %errorlevel% equ 0 (
    echo ^>^> Success copy "Settings"
) else (
    echo ^>^> FAILED COPY "SETTINGS"
    set result_nas_copy=1
)
net use t: /delete > nul 2>&1

echo ^>^> Copy "InitApps" from NAS
net use u: /delete > nul 2>&1
net use u: %nas_initapps% /user:admin
robocopy /s /e /njh /njs u: %userprofile%\OneDrive\�d��\InitApps\
if %errorlevel% equ 0 (
    echo ^>^> Success copy "InitApps"
    net use u: /delete > nul 2>&1
    goto install_apps
) else (
    echo ^>^> FAILED COPY "INITAPPS"
    net use u: /delete > nul 2>&1
    set result_nas_copy=2
)
if %errorlevel% neq 0 goto dl_mega

:dl_mega
echo ^>^> Not in proxy, download MEGAsync
if exist %userprofile%\OneDrive\�d��\Settings\ (
    rmdir /s /q %userprofile%\OneDrive\�d��\Settings\
)
echo ^>^> Please download "Settings" folder manually, then any key in
start https://mega.nz/#F!ubhxia6L
pause

"C:\Program Files\7-Zip\7z.exe" x -y -o%userprofile%\OneDrive\�d��\ %userprofile%\OneDrive\�d��\Settings.zip
if %errorlevel% equ 0 (
    echo ^>^> Success copy "Settings" manually
) else (
    echo ^>^> FAILED COPY "SETTINGS" MANUALLY, ABORT THIS SCRIPT!
    goto end
)

if exist %userprofile%\OneDrive\�d��\InitApps\ (
    rmdir /s /q %userprofile%\OneDrive\�d��\InitApps\
)

echo ^>^> Please download "InitApps" folder manually, then any key in
start https://mega.nz/#F!yTATTABQ
pause

"C:\Program Files\7-Zip\7z.exe" x -y -o%userprofile%\OneDrive\�d��\ %userprofile%\OneDrive\�d��\InitApps.zip
if %errorlevel% equ 0 (
    echo ^>^> Success copy "InitApps" manually
) else (
    echo ^>^> FAILED COPY "INITAPPS" MANUALLY, ABORT THIS SCRIPT!
    goto end
)
goto install_apps

:install_apps
rem "*.config" �̂��� "Dir" �� "pushd"
pushd %conf_path%

echo ^>^> Install apps by Chocolatey
rem ---------------------------------------------------------------------------
rem Test�� �X�L�b�v
rem ---------------------------------------------------------------------------
if %test% equ 1 goto instll_all
rem "*_packages_*.config" ��ǂݍ��݁A�C���X�g�[��
if exist *_%conf_file% (
    echo ^>^> Install apps for this PC
    for %%i in (*_%conf_file%) do (
        cinst -y -r --no-progress %%i
    )
) else (
    echo ^>^> Setting default parameter
    cinst -y -r --no-progress %conf_defa%
)
echo ^>^> Update Chocolatey
cup all -y
rem ---------------------------------------------------------------------------

:install_all
rem �ēx�X�N���v�g������ "Dir" �� "pushd"
rem MEMO: "init_dotfiles" �Ŏ��s����Ă���ꍇ������̂Ő�΃p�X�w��
pushd %userprofile%\dotfiles\etc\init\windows\settings\initialize\

rem "git\init\settings" �� "(~|R:*)\�d��\Settings" �� "setting_*.cmd" ���s
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

call %userprofile%\OneDrive\�d��\InitApps\Batch\empty.cmd > nul 2>&1

rem link.cmd ���s
rem pushd %userprofile%\dotfiles\
rem call link.cmd

rem Chocolatey update
call %userprofile%\dotfiles\etc\init\windows\settings\chocolatey\init_and_update_chocolatey.cmd

echo *** CAUTION: AUTOMATICALLY RESTART PC, KEY INPUT AFTER 60sec ***
pause
shutdown.exe -r -t 60

:end
endlocal
popd

exit /b 0
