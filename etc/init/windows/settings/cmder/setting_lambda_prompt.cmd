@echo off
setlocal
rem Created:     201*/**/** **:**:**
rem Last Change: 2019/10/10 10:55:19.

title Change prompt

whoami /PRIV | find "SeLoadDriverPrivilege" > NUL

rem 管理者権限ならメイン処理
if not errorlevel 1 goto main_routine

rem 管理者権限でなければ管理者権限で再起動
@powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process %~f0 -Verb Runas"
exit

:main_routine
pushd C:%homepath%\OneDrive\仕事\Settings\Cmder

set cmder_root=C:\tools\cmder\

if not exist %cmder_root%\vendor\ (
    echo ^>^> Not exist %cmder_root%
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
