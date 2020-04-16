@echo off
setlocal enabledelayedexpansion
rem Created:     2018/07/17 10:19:01
rem Last Change: 2020/04/16 15:43:54.

set batch_title=Setting GENE dictionary

title %batch_title%

rem �Ǘ��Ҍ����ŋN�����ꂽ���`�F�b�N
whoami /PRIV | find "SeLoadDriverPrivilege" > NUL

rem �Ǘ��Ҍ����Ȃ烁�C������
if not errorlevel 1 goto main_routine

rem �Ǘ��Ҍ����łȂ���ΊǗ��Ҍ����ōċN��
@powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process %~f0 -Verb Runas"
exit

:main_routine

rem rem �X�N���v�g������ "Dir" �� "cd"
rem set bat_path=%~dp0
rem pushd %bat_path%
pushd %userprofile%\OneDrive\�d��\Settings\KaoriyaVim\

echo ^>^> %batch_title%
rem echo ^>^> Start

if not exist %userprofile%\vimfiles\dict\ (
    mkdir %userprofile%\vimfiles\dict\
    copy .\GENE.TXT %userprofile%\vimfiles\dict\
    )

endlocal
popd

rem pause
exit /b 0
