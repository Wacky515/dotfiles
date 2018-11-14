@echo off
rem Created:     2018/07/17 10:19:01
rem Last Change: 2018/11/14 16:08:17.

whoami /PRIV | find "SeLoadDriverPrivilege" > NUL

rem 管理者権限ならメイン処理
if not errorlevel 1 goto main_routine

rem 管理者権限でなければ管理者権限で再起動
@powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process %~f0 -Verb Runas"
exit

:main_routine
rem  スクリプトがある "Dir" に "cd"
cd /d %~dp0

echo ^>^> Start setting GENE dictionary

if not exist %homepath%/vimfiles/dict (
    mkdir %homepath/vimfiles/dict
    )
copy GENE.TXT %homepath%/vimfiles/dict/

rem pause
exit /b 0

