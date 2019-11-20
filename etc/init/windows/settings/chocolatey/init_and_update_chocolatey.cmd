@echo off
setlocal enabledelayedexpansion
rem Created:     2017/02/17 00:54:41
rem Last Change: 2019/11/19 13:35:42.

set batch_title=Update Chocolatey
title %batch_title%

rem �Ǘ��Ҍ����ŋN�����ꂽ���`�F�b�N
whoami /PRIV | find "SeLoadDriverPrivilege" > NUL

rem �Ǘ��Ҍ����Ȃ烁�C������
if not errorlevel 1 goto main_routine

rem �Ǘ��Ҍ����łȂ���ΊǗ��Ҍ����ōċN��
@powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process %~f0 -Verb Runas"
exit

:main_routine
set bat_path=%~dp0
set dot_path=%userprofile%\dotfiles\
set cho_path=%dot_path%\etc\init\windows\settings\chocolatey\

set config_files=packages_%computername%.config

rem �X�N���v�g������ "Dir" �� "cd"
pushd %bat_path%

rem "dotfiles" �� "cd"
if not exist %dot_path% (
    echo ^>^> CLEONE DOTFILES FIRST, FINISH THIS SCRIPT.
    goto end
) else (
    pushd %dot_path%
)

rem "Chocolatey" �C���X�g�[���ς݂��`�F�b�N
chocolatey -v > nul 2>&1
if %errorlevel% equ 0 goto update

echo ^>^> Install Chocolatey
@powershell -NoProfile -ExecutionPolicy unrestricted -Command "(iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))) >$null 2>&1" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin

echo ^>^> Already installed Chocolatey
:update
echo ^>^> Update software condition

if not exist %cho_path% (
    rem TODO: ������ git clone ����
    echo ^>^> CLEONE CHOCOLATEY FIRST, FINISH THIS SCRIPT.
    goto end
)
pushd %cho_path%

rem "***_packages_***.config" ��ǂݍ��݁A�C���X�g�[��
if exist *_%config_files% (
        echo ^>^> Setting for this PC
        for %%i in (*_%config_files%) do (
            cinst -y %%i
            )
        )

cup all -y

rem �f�X�N�g�b�v�V���[�g�J�b�g �쐬
if not exist %userprofile%\Desktop\init_and_update_chocolatey.lnk (
    goto cplnk
) else (
    echo ^>^> Already set desktop shortcut
    goto end
)

:cplnk
echo ^>^> Set desktop shortcut
copy init_and_update_chocolatey.lnk %userprofile%\Desktop\

:end
endlocal
popd

rem pause
exit /b 0
