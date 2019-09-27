@echo off
setlocal
rem Created:     2018/05/10 19:22:34
rem Last Change: 2019/09/27 16:02:32.

set batch_title=Initialize dotfiles
title %batch_title%

rem �Ǘ��Ҍ����ŋN�����ꂽ���`�F�b�N
whoami /priv | find "SeLoadDriverPrivilege" > nul

rem �Ǘ��Ҍ����Ȃ烁�C������
if not errorlevel 1 goto main_routine

rem �Ǘ��Ҍ����łȂ���ΊǗ��Ҍ����ōċN��
@powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process %~f0 -Verb Runas"
exit

:main_routine
set bat_path=%~dp0
set config_files=packages_%computername%.config
set conf_path=C:%homepath%\dotfiles\etc\init\windows\settings\chocolatey\
set def_conf=%conf_path%\packages.config

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
echo Standard output in ~/init_dotfile.log.
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
call :chk_choco >%homepath%\init_dotfile.log
exit /b

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
cinst -y git onedrive megasync

rem �z�[���f�B���N�g���� "cd"
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
rem link.cmd ���s
pushd %homepath%\dotfiles\
call link.cmd

if not exist %homepath%\OneDrive\�d��\Settings\* (
    mkdir %homepath%\OneDrive\�d��\Settings\
)

for /f %%j in ('netsh winhttp show proxy') do set chk_proxy=%%j
    if not %chk_proxy% == ���ڃA�N�Z�X (
        echo ^>^> In proxy
        goto cp_rd
    ) else (
    echo ^>^> Not in proxy
    rem megasync
    rem pause
    bitsadmin /transfer DownloadSettingMega https://mega.nz/#F!ubhxia6L %homepath%\OneDrive\�d��\Settings\
    goto inst_apps
    )

rem R�h���C�u�R�s�[
if %computername% == HBAMB748 (
    goto cp_rd
) else if %computername% == HBAMB819 (
    goto cp_rd
) else (
    megasync
    pause
    goto inst_apps
)

:cp_rd
echo ^>^> Copy Settng from R drive
set rd_path=R:\E2M0\E2M-4\�y��z-E2M4-1\10.�l�t�@�C��\Wakita\�d��\
robocopy %rd_path% %homepath%\OneDrive\�d��\ *.* /e

:inst_apps
rem "*.config" �̂��� "Dir" �� "pushd"
pushd %conf_path%

echo ^>^> Install apps by Chocolatey
rem Test����KILL
rem ---------------------------------------------------------------------------
rem "***_packages_***.config" ��ǂݍ��݁A�C���X�g�[��
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

rem �ēx�X�N���v�g������ "Dir" �� "pushd"
rem "init_dotfiles" �Ŏ��s����ꍇ������̂Ő��Path
pushd %homepath%\dotfiles\etc\init\windows\settings\initialize\

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

call sub_install_font.cmd

rmdir /s /q C:%homepath%\init_dotfiles\ > nul 2>&1

echo *** CAUTION, AUTOMATICALLY RESTART PC KEY INPUT AFTER 60sec ***
pause
shutdown.exe -r -t 60

endlocal
popd

exit /b 0
