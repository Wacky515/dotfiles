@echo off
setlocal
rem Created:     2018/04/19 09:01:59
rem Last Change: 2018/11/29 12:00:07.

title Setting powerline

whoami /PRIV | find "SeLoadDriverPrivilege" > NUL

rem �Ǘ��Ҍ����Ȃ烁�C������
if not errorlevel 1 goto main_routine

rem �Ǘ��Ҍ����łȂ���ΊǗ��Ҍ����ōċN��
@powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process %~f0 -Verb Runas"
exit

:main_routine
pushd %~dp0

if not exist %CMDER_ROOT%/config (
    echo ^>^> Not set %CMDER_ROOT%
    goto :eol
    ) else (
    echo ^>^> Start setting cmder-powerline-prompt
    copy powerline_prompt.lua %CMDER_ROOT%/config
    )

:eol
endlocal
popd

rem pause
exit /b 0

