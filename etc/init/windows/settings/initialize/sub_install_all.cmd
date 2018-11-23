@echo off
setlocal
rem Created:     20**/**/** **:**:**
rem Last Change: 2018/11/22 19:58:02.

title Install Initialize App

set git_path=%homepath%\dotfiles\etc\init\windows\settings\
set od_path=%homepath%\OneDrive\ŽdŽ–\Settings\

echo ^>^> Search setting batch in Git
pushd %git_path%

for /r %%i in (install_*) do (
    echo ^>^> Catch:  %%~nxi
    )

for /r %%j in (install_*.cmd) do (
    echo ^>^> Automatically execute %%~nxj by batch
    call %%j
    rem pushd %git_path%
    )

for /r %%k in (install_*.vbs) do (
    echo ^>^> Automatically execute %%~nxk by batch
    cscript %%k
    )

for /r %%l in (install_*.reg) do (
    echo ^>^> Automatically execute %%~nxl by batch
    reg import %%l
    )

echo ^>^> Search setting batch in OneDrive
pushd %od_path%

for /r %%m in (install_*) do (
    echo ^>^> Catch:  %%~nxm
    )

for /r %%n in (install_*.cmd) do (
    echo ^>^> Automatically execute %%~nxn by batch
    call %%n
    )

for /r %%o in (install_*.vbs) do (
    echo ^>^> Automatically execute %%~oxn by batch
    cscript %%o
    )

for /r %%p in (install_*.reg) do (
    echo ^>^> Automatically execute %%~nxp by batch
    reg import %%p
    )

popd
endlocal

rem pause
exit /b 0
