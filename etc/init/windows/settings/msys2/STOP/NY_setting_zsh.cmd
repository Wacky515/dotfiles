@echo off
setlocal
rem Created:     2018/06/07 10:30:32
rem Last Change: 2018/11/17 09:47:10.

rem TODO:
rem 既存のシンボリックリンク削除
rem zsh用の.ini作成
rem 上記のシンボリックリンク

set batch_title="Setting zsh"
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

set FIL_MIN32="mingw32.ini"
set FIL_MIN64="mingw64.ini"
set FIL_MSYS2="msys2.ini"

set LNK_MIN32="C:\tools\msys64\"%FIL_MIN32%
set LNK_MIN64="C:\tools\msys64\"%FIL_MIN64%
set LNK_MSYS2="C:\tools\msys64\"%FIL_MSYS2%

set TGT_MIN32=%~dp0%FIL_MIN32%
set TGT_MIN64=%~dp0%FIL_MIN64%
set TGT_MSYS2=%~dp0%FIL_MSYS2%

echo ^>^> %batch_title%

if exist %LNK_MIN32% (
    echo ^>^> Backup %LNK_MIN32%
    rename %LNK_MIN32% %FIL_MIN32%".bak"
    )
if exist %LNK_MIN64% (
    echo ^>^> Backup %LNK_MIN64%
rename %LNK_MIN64% %FIL_MIN64%".bak"
)
if exist %LNK_MSYS2% (
    echo ^>^> Backup %LNK_MSYS2%
    rename %LNK_MSYS2% %FIL_MSYS2%".bak"
    )

mklink %LNK_MIN32% %TGT_MIN32%
mklink %LNK_MIN64% %TGT_MIN64%
mklink %LNK_MSYS2% %TGT_MSYS2%

endlocal
popd

rem pause
exit /b 0

