@echo off
setlocal enabledelayedexpansion
rem Created:     201*/**/** **:**:**
rem Last Change: 2024/12/25 10:40:05.

set batch_title=Change prompt
title %batch_title%

rem �Ǘ��Ҍ����ŋN�����ꂽ���`�F�b�N
whoami /PRIV | find "SeLoadDriverPrivilege" > NUL

rem �Ǘ��Ҍ����Ȃ烁�C������
if not errorlevel 1 goto main_routine

rem �Ǘ��Ҍ����łȂ���ΊǗ��Ҍ����ōċN��
@powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process %~f0 -Verb Runas"
exit

:main_routine
set cmder_root=C:\tools\cmder\

pushd %OneDrive%\�d��\Settings\Cmder
if %errorlevel% equ 1 (
    echo ^>^> SETTING FOLDER NOT FOUND
    goto end
)

if not exist %cmder_root%\vendor\ (
    echo ^>^> NOT EXIST %cmder_root%
    goto :end
) else (
    echo ^>^> Start change prompt
    copy /y .\clink.lua %cmder_root%\vendor\clink.lua
)

:end
endlocal
popd

rem pause
exit /b 0
