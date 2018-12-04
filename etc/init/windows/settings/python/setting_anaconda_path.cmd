@echo off
setlocal
rem Created:     20**/**/** **:**:**
rem Last Change: 2018/12/04 17:13:13.

set "batch_title"=Setting Anaconda path
title %batch_title%

whoami /PRIV | find "SeLoadDriverPrivilege" > NUL

rem �Ǘ��Ҍ����Ȃ烁�C������
if not errorlevel 1 goto main_routine

rem �Ǘ��Ҍ����łȂ���ΊǗ��Ҍ����ōċN��
@powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process %~f0 -Verb Runas"
exit

:main_routine
rem  �X�N���v�g������ "Dir" �� "cd"
pushd %~dp0

echo Start set link

if exist "C:\Python35\Lib\site-packages\.anaconda.pth" (
    mklink "C:\Python35\Lib\site-packages\.anaconda.pth" "\.anaconda.pth"
    ) else (
    echo ^>^> Install Anaconda by Chocolatey
    cinst anaconda3 -y
    )

endlocal
popd

pause
exit /b 0

