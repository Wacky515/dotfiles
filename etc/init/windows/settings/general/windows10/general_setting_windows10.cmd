@echo off
setlocal
rem Created:     2018/10/05 09:54:50
rem Last Change: 2019/09/30 11:30:45.

set batch_title=General setting Windows10
title %batch_title%

whoami /PRIV | find "SeLoadDriverPrivilege" > NUL

rem 管理者権限ならメイン処理
if not errorlevel 1 goto main_routine

rem 管理者権限でなければ管理者権限で再起動
@powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process %~f0 -Verb Runas"
exit

:main_routine
rem  スクリプトがある "Dir" に "cd"
pushd %~dp0

echo ^>^> %batch_title%

rem "スナップされたウィンドウのサイズを変更するときに、隣接するスナップ ウィンドウのサイズも同時に変更する" を無効にする
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "JointResize" /t REG_DWORD /d "0" /f

rem "ウィンドウをスナップしたときに横に配置できるものを表示する" を無効にする
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "SnapAssist" /t REG_DWORD /d "0" /f

rem "ウィンドウをスナップするときに、利用可能な領域に合わせて自動的にサイズを変更するる" を無効にする
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "SnapFill" /t REG_DWORD /d "0" /f

endlocal
popd

rem pause
exit /b 0
