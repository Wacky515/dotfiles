@echo off
setlocal
rem Created:     2018/05/10 19:22:34
rem Last Change: 2019/08/18 17:54:11.

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
set def_conf=C:%homepath%\dotfiles\etc\init\windows\settings\chocolatey\packages.config

rem �X�N���v�g������ "Dir" �� "cd"
pushd %bat_path%

echo ^>^> %batch_title%

rem "Chocolatey" �C���X�g�[���ς݂��`�F�b�N
chocolatey -v > nul 2>&1
if %errorlevel% equ 0 goto clone

echo ^>^> Install Chocolatey
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

rem �K�{�p�b�P�[�W�̂� "cinst"
cinst -y git onedrive teamviewer

:clone
echo ^>^> Already installed Chocolatey
rem �z�[���f�B���N�g���� "cd"
pushd %homepath%

echo ^>^> Check installed Git or not
if not exist %homepath%\dotfiles\.git (
        echo ^>^> Git clone first
        if exist %homepath%\dotfiles\ (
            del /s /q %homepath%\dotfiles\
            for /d %%j in (%homepath%\dotfiles\) do rmdir /s /q "%%j"
            )
        git clone https://github.com/Wacky515/dotfiles.git
        rem �b��I�Ɉȉ��� branch �� checkout
        rem git checkout ftr_win

        rem link.cmd ���s
        pushd dotfiles
        call link.cmd
        ) else (
            echo ^>^> Already Git clone
            )

rem �ēx�X�N���v�g������ "Dir" �� "cd"
pushd %bat_path%

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


rem "git\init\settings" �� O"neDrive\�d��\settings" �� "setting_*.cmd" ���s
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

echo "*** CAUTION, RESTART PC AFTER KEY IN ***"
pause
shutdown.exe -r -t 60

endlocal
popd

exit /b 0

