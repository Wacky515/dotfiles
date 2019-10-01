@echo off
setlocal
rem Created:     2018/07/17 10:19:01
rem Last Change: 2019/10/01 12:40:02.

set batch_title=Setting GENE dictionary
title %batch_title%

whoami /PRIV | find "SeLoadDriverPrivilege" > NUL

rem 管理者権限ならメイン処理
if not errorlevel 1 goto main_routine

rem 管理者権限でなければ管理者権限で再起動
@powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process %~f0 -Verb Runas"
exit

:main_routine
rem rem  スクリプトがある "Dir" に "cd"
rem pushd %~dp0
pushd %homepath%\OneDrive\仕事\Settings\KaoriyaVim\

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
