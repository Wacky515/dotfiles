@echo off
setlocal enabledelayedexpansion
rem Created:     2018/04/19 09:01:59
rem Last Change: 2019/11/19 17:02:34.

set batch_title=Setting cmder's powerline
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

pushd %userprofile%\OneDrive\�d��\Settings\Cmder

if not exist %cmder_root%\config\ (
    echo ^>^> Not exist %cmder_root%
    goto :end
) else (
    echo ^>^> Start setting cmder-powerline-prompt
    copy /y *.lua   %cmder_root%\config\
    rem copy /y powerline_core.lua   %cmder_root%\config\
    rem copy /y powerline_git.lua    %cmder_root%\config\
    rem copy /y powerline_prompt.lua %cmder_root%\config\
)

:end
endlocal
popd

rem pause
exit /b 0
