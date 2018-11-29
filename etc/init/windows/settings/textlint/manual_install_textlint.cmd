@echo off
setlocal
rem Created:     2018/11/22 17:07:29
rem Last Change: 2018/11/22 18:11:46.

set batch_title="Install textlint"
title %batch_title%

whoami /PRIV | find "SeLoadDriverPrivilege" > NUL

rem ŠÇ—ÒŒ ŒÀ‚È‚çƒƒCƒ“ˆ—
if not errorlevel 1 goto main_routine

rem ŠÇ—ÒŒ ŒÀ‚Å‚È‚¯‚ê‚ÎŠÇ—ÒŒ ŒÀ‚ÅÄ‹N“®
@powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process %~f0 -Verb Runas"
exit

:main_routine
call sub_textline.cmd

endlocal
popd

rem pause
exit /b 0

