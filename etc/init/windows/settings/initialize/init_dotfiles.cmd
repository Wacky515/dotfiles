@echo off
setlocal
rem Created:     2018/05/10 19:22:34
rem Last Change: 2019/09/24 18:15:31.

echo ^>^> Standard output in ~/init_dotfile.log

call :redirect >%homepath%\init_dotfile.log
exit /b

:redirect
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
set conf_path=C:%homepath%\dotfiles\etc\init\windows\settings\chocolatey
set def_conf=%conf_path%\packages.config

rem �X�N���v�g������ "Dir" �� "cd"
pushd %bat_path%

echo ^>^> %batch_title%

rem "Chocolatey" �C���X�g�[���ς݂��`�F�b�N
chocolatey -v > nul 2>&1
if %errorlevel% equ 0 goto must_inst

echo ^>^> Install Chocolatey
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

:must_inst
echo ^>^> Already installed Chocolatey
rem �K�{�p�b�P�[�W�̂� "cinst"
cinst -y git onedrive megasync
rem cinst -y git onedrive megasync teamviewer

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
    rem init_dotfile.cmd ���Ə�����̂ň�U�L���A�x��Ȃ����������
    rem �x�Ⴀ��
    if exist %homepath%\dotfiles\ (
        rmdir /s /q %homepath%\dotfiles\
    )
    rem git clone --depth 1 https://github.com/Wacky515/dotfiles.git
    git clone https://github.com/Wacky515/dotfiles.git
) else (
    echo ^>^> Already Git clone
)
rem link.cmd ���s
pushd %homepath%\dotfiles
call link.cmd

rem rem �ēx�X�N���v�g������ "Dir" �� "pushd"
rem pushd %bat_path%
rem "*.config" �̂��� "Dir" �� "pushd"
pushd %conf_path%

echo ^>^> Update Chocolatey
rem Test����KILL
rem ---------------------------------------------------------------------------
rem "***_packages_***.config" ��ǂݍ��݁A�C���X�g�[��
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

rem �ēx�X�N���v�g������ "Dir" �� "pushd"
pushd %bat_path%

rem "git\init\settings" �� "Mega\�d��\settings" �� "setting_*.cmd" ���s
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

