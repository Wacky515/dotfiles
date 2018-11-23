@echo off
setlocal
rem Created:     2018/05/10 19:22:34
rem Last Change: 2018/11/23 11:39:32.

title Initialize dotfile

set bat_path=%~dp0
set config_files=packages_%computername%.config

rem �Ǘ��Ҍ����ŋN�����ꂽ���`�F�b�N
whoami /priv | find "SeLoadDriverPrivilege" > nul

rem �Ǘ��Ҍ����Ȃ烁�C������
if not errorlevel 1 goto main_routine

rem �Ǘ��Ҍ����łȂ���ΊǗ��Ҍ����ōċN��
@powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process %~f0 -Verb Runas"
exit

:main_routine
rem �X�N���v�g������ "Dir" �� "cd"
pushd %bat_path%

rem "Chocolatey" �C���X�g�[���ς݂��`�F�b�N
chocolatey -v > nul 2>&1
if %errorlevel% equ 0 goto update

echo ^>^> Install Chocolatey
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

rem �K�{�p�b�P�[�W�̂� "cinst"
cinst -y git onedrive teamviewer

:update
echo ^>^> Already installed Chocolatey, Update software

rem "***_packages_***.config" ��ǂݍ��݁A�C���X�g�[��
if exist *_%config_files% (
        echo ^>^> Install app for this PC
        for %%i in (*_%config_files%) do (
            rem cinst -y %config_files%
            cinst -y %%i
            )
        ) else (
            echo ^>^> "Setting default parameter"
            cinst -y packages.config
            )

cup all -y

rem �z�[���f�B���N�g���� "cd"
pushd %homepath%

echo ^>^> Check installed Git or not
if not exist %homepath%\dotfiles\.git (
        echo ^>^> Git clone first
        if exist %homepath%\dotfiles\ (
            rmdir /s %homepath%\dotfiles\
            )
        git clone https://github.com/Wacky515/dotfiles.git
        rem �b��I�Ɉȉ��� branch �� checkout
        rem git checkout ftr_win

        rem link.cmd ���s
        pushd dotfiles
        call link.cmd
        ) else (
            echo ^>^> Already clone Git
            )

rem rem �ēx�X�N���v�g������ "Dir" �� "cd"
rem pushd %bat_path%

rem �ݒ�t�@�C�������� "Dir" �� "cd"
set srcdir=%OneDrive%"\�d��\InitApps"
pushd %srcdir%

rem git\init\settings �� OneDrive\�d��\settings ���� setting_*.cmd ���s
call sub_install_all.cmd
call sub_setting_all.cmd

pause
echo ^>^> Chocolatey update
cup all -y

rem �z�[���f�B���N�g���� *.7z �ň��k�����A�v����W�J
rem call sub_install_all.cmd
call sub_install_app.cmd

rem TODO: �ȉ��𕜊�������
call sub_install_font.cmd

echo "*** PLEASE RESTART PC ***"

endlocal
popd

pause
exit /b 0

