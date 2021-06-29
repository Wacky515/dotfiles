@echo off
setlocal enabledelayedexpansion
rem Created:     2021/06/29 11:13:19
rem Last Change: 2021/06/29 12:03:39.

set batch_title=Clen disk
title %batch_title%

rem 管理者権限で起動されたかチェック
whoami /PRIV | find "SeLoadDriverPrivilege" > NUL

rem 管理者権限ならメイン処理
if not errorlevel 1 goto main_routine

rem 管理者権限でなければ管理者権限で再起動
@powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process %~f0 -Verb Runas"
exit

:main_routine
set bat_path=%~dp0

rem スクリプトがある "Dir" に "cd"
pushd %bat_path%

rem Windows Update サービス停止
net stop wuauserv
rem Software Distribution Download 削除
rmdir /s /q C:\WINDOWS\SoftwareDistribution\Download
rem Windows Update サービス起動
net start wuauserv

rem 不要コンポーネント 確認
Dism.exe /Online /Cleanup-Image /AnalyzeComponentStore

echo  ^>^> Start Dism.exe [y/n]
set /p input=
if defined input set input=%input:"=%
if /i "%input%" == "y" (
    rem 不要コンポーネント 削除
    Dism.exe /online /Cleanup-Image /StartComponentCleanup
)

rem DNSレゾルバのキャッシュ 削除
ipconfig /flushdns
rem Windows10ストアアプリ キャッシュ削除
wsreset
sfc /scannow

:end
endlocal
popd

pause
exit /b 0
