@echo off
setlocal
rem Created:     2018/07/17 10:19:01
rem Last Change: 2019/10/01 12:40:02.

set batch_title=Setting GENE dictionary
title %batch_title%

whoami /PRIV | find "SeLoadDriverPrivilege" > NUL

rem �Ǘ��Ҍ����Ȃ烁�C������
if not errorlevel 1 goto main_routine

rem �Ǘ��Ҍ����łȂ���ΊǗ��Ҍ����ōċN��
@powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process %~f0 -Verb Runas"
exit

:main_routine
rem rem  �X�N���v�g������ "Dir" �� "cd"
rem pushd %~dp0
pushd %homepath%\OneDrive\�d��\Settings\KaoriyaVim\

cd
echo ^>^> %batch_title%

if not exist %homepath%\vimfiles\dict\ (
    mkdir %homepath%\vimfiles\dict\
    copy .\GENE.TXT %homepath%\vimfiles\dict\
    )

endlocal
popd

rem pause
exit /b 0
