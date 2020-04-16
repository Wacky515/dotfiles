@echo off
setlocal enabledelayedexpansion
rem Created:     2018/06/06 20:34:41
rem Last Change: 2020/04/16 16:12:22.

set batch_title=Setting fish

title %batch_title%

rem 管理者権限で起動されたかチェック
whoami /PRIV | find "SeLoadDriverPrivilege" > NUL

rem 管理者権限ならメイン処理
if not errorlevel 1 goto main_routine

rem 管理者権限でなければ管理者権限で再起動
@powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process %~f0 -Verb Runas"
exit

:main_routine

rem  スクリプトがある "Dir" に "cd"
set bat_path=%~dp0
pushd %bat_path%

echo ^>^> %batch_title%
rem echo ^>^> Start

set msys_path=c:\tools\msys64
set fil_min32=mingw32.ini
set fil_min64=mingw64.ini
set fil_msys2=msys2.ini

set conf_fish=%userprofile%\dotfiles\config.fish

set lnk_min32=%msys_path%\%fil_min32%
set lnk_min64=%msys_path%\%fil_min64%
set lnk_msys2=%msys_path%\%fil_msys2%

set tgt_min32=%~dp0%fil_min32%
set tgt_min64=%~dp0%fil_min64%
set tgt_msys2=%~dp0%fil_msys2%

echo ^>^> Start %batch_title%

if exist %lnk_min32% (
    echo ^>^> Backup %lnk_min32%
    rename %lnk_min32% %fil_min32%.bak > nul 2>&1
    )
if exist %lnk_min64% (
    echo ^>^> Backup %lnk_min64%
    rename %lnk_min64% %fil_min64%.bak > nul 2>&1
)
if exist %lnk_msys2% (
    echo ^>^> Backup %lnk_msys2%
    rename %lnk_msys2% %fil_msys2%.bak > nul 2>&1
    )

mklink %lnk_min32% %tgt_min32%
mklink %lnk_min64% %tgt_min64%
mklink %lnk_msys2% %tgt_msys2%

if not exist %msys_path%\usr\etc\fish (
    echo ^>^> Backup %lnk_msys2%
    mkdir %msys_path%\usr\etc\fish
    mklink %msys_path%\usr\etc\fish\config.fish %conf_fish%
    )

endlocal
popd

rem pause
exit /b 0
