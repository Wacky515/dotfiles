@echo off
setlocal enabledelayedexpansion
rem Created:     20**/**/** **:**:**
rem Last Change: 2020/04/16 16:09:14.

set batch_title=Setting Anaconda path

title %batch_title%

rem �Ǘ��Ҍ����ŋN�����ꂽ���`�F�b�N
whoami /PRIV | find "SeLoadDriverPrivilege" > NUL

rem �Ǘ��Ҍ����Ȃ烁�C������
if not errorlevel 1 goto main_routine

rem �Ǘ��Ҍ����łȂ���ΊǗ��Ҍ����ōċN��
@powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process %~f0 -Verb Runas"
exit

:main_routine

rem �X�N���v�g������ "Dir" �� "cd"
set bat_path=%~dp0
pushd %bat_path%

echo ^>^> %batch_title%
rem echo ^>^> Start

if exist "C:\Python35\Lib\site-packages\.anaconda.pth" (
    mklink "C:\Python35\Lib\site-packages\.anaconda.pth" "\.anaconda.pth"
    ) else (
    echo ^>^> Install Anaconda by Chocolatey
    cinst anaconda3 -y
    )

endlocal
popd

rem pause
exit /b 0
