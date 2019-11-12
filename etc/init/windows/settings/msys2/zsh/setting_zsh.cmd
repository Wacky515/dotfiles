@echo off
setlocal
rem Created:     2018/06/07 10:30:32
rem Last Change: 2019/11/11 15:50:33.

set batch_title=Setting zsh
title %batch_title%

whoami /PRIV | find "SeLoadDriverPrivilege" > NUL

rem 管理者権限ならメイン処理
if not errorlevel 1 goto main_routine

rem 管理者権限でなければ管理者権限で再起動
@powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process %~f0 -Verb Runas"
exit

:main_routine
rem スクリプトがある "Dir" に "cd"
set bat_path=%~dp0
pushd %bat_path%

rem set FIL_MIN32="mingw32.ini"
rem set FIL_MIN64="mingw64.ini"
rem set FIL_MSYS2="msys2.ini"

rem set LNK_MIN32="C:\tools\msys64\"%FIL_MIN32%
rem set LNK_MIN64="C:\tools\msys64\"%FIL_MIN64%
rem set LNK_MSYS2="C:\tools\msys64\"%FIL_MSYS2%

rem set TGT_MIN32=%~dp0%FIL_MIN32%
rem set TGT_MIN64=%~dp0%FIL_MIN64%
rem set TGT_MSYS2=%~dp0%FIL_MSYS2%

set nssw=C:\cygwin64\etc\nsswitch.conf

echo ^>^> %batch_title%

rem if exist %LNK_MIN32% (
rem     echo ^>^> Backup %LNK_MIN32%
rem     rename %LNK_MIN32% %FIL_MIN32%".bak"
rem     )
rem if exist %LNK_MIN64% (
rem     echo ^>^> Backup %LNK_MIN64%
rem rename %LNK_MIN64% %FIL_MIN64%".bak"
rem )
rem if exist %LNK_MSYS2% (
rem     echo ^>^> Backup %LNK_MSYS2%
rem     rename %LNK_MSYS2% %FIL_MSYS2%".bak"
rem     )

rem mklink %LNK_MIN32% %TGT_MIN32%
rem mklink %LNK_MIN64% %TGT_MIN64%
rem mklink %LNK_MSYS2% %TGT_MSYS2%

if exist %nssw% (
    echo ^>^> Backup %nssw%
    rename %nssw% %nssw%".bak" > nul 2>&1
    )

mklink %nssw% %~dp0%nsswitch.conf

endlocal
popd

pause
exit /b 0
