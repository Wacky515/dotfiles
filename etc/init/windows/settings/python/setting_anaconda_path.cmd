@echo off
setlocal
rem Created:     20**/**/** **:**:**
rem Last Change: 2018/11/17 09:47:59.

title Setting Anaconda path

whoami /PRIV | find "SeLoadDriverPrivilege" > NUL

rem 管理者権限ならメイン処理
if not errorlevel 1 goto main_routine

rem 管理者権限でなければ管理者権限で再起動
@powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process %~f0 -Verb Runas"
exit

:main_routine
rem  スクリプトがある "Dir" に "cd"
pushd %~dp0

echo Start set link

rem mklink %HOMEPATH%"\.gvimrc" ".\dotfiles\.gvimrc"
mklink "C:\Python35\Lib\site-packages\.anaconda.pth" "\.anaconda.pth"

endlocal
popd

pause
exit /b 0

