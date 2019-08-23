@echo off
setlocal
rem Created:     2018/05/10 19:22:34
rem Last Change: 2019/08/23 11:19:06.

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
if %errorlevel% equ 0 goto gclone

echo ^>^> Install Chocolatey
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

rem �K�{�p�b�P�[�W�̂� "cinst"
cinst -y git onedrive megasync teamviewer

:gclone
echo ^>^> Already installed Chocolatey
rem �z�[���f�B���N�g���� "cd"
pushd %homepath%

echo ^>^> Check installed Git or not
if not exist %homepath%\dotfiles\.git (
    echo ^>^> Git clone first
    if exist %homepath%\dotfiles\ (
        del /s /q %homepath%\dotfiles\
        for /d %%j in (%homepath%\dotfiles\) do rmdir /s /q "%%j")
        git clone --depth 1 https://github.com/Wacky515/dotfiles.git

        rem link.cmd ���s
        pushd %homepath%\dotfiles
        call link.cmd
    ) else (
        echo ^>^> Already Git clone
    )

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

echo *** CAUTION, AUTOMATICALLY RESTART PC AFTER KEY INPUT ***
pause
shutdown.exe -r -t 60

endlocal
popd

exit /b 0

