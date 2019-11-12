@echo off
setlocal
rem Created:     2018/04/19 09:01:59
rem Last Change: 2019/10/11 10:05:00.

title Setting cmder's powerline

whoami /PRIV | find "SeLoadDriverPrivilege" > NUL

rem ŠÇ—ŽÒŒ ŒÀ‚È‚çƒƒCƒ“ˆ—
if not errorlevel 1 goto main_routine

rem ŠÇ—ŽÒŒ ŒÀ‚Å‚È‚¯‚ê‚ÎŠÇ—ŽÒŒ ŒÀ‚ÅÄ‹N“®
@powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process %~f0 -Verb Runas"
exit

:main_routine
pushd C:%homepath%\OneDrive\ŽdŽ–\Settings\Cmder

set cmder_root=C:\tools\cmder\

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
