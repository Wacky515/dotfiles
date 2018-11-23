@echo off
setlocal
rem Created:     20**/**/** **:**:**
rem Last Change: 2018/11/23 13:21:44.

title Initialize setting

set git_path=%homepath%\dotfiles\etc\init\windows\settings\
set od_path=%homepath%\OneDrive\ŽdŽ–\Settings\

echo ^>^> Search setting batch in Git
pushd %git_path%

for /r %%i in (setting_*) do (
    echo ^>^> Catch:  %%~nxi
    )

rem for /r %%j in (setting_*.cmd) do (
rem     echo ^>^> Automatically execute %%~nxj by batch
rem     call %%j
rem     )
rem call init_and_update_chocolatey.cmd

for /r %%k in (setting_*.vbs) do (
    echo ^>^> Automatically execute %%~nxk by batch
    cscript %%k
    )

for /r %%l in (install_*.reg) do (
    echo ^>^> Automatically execute %%~nxl by batch
    reg import %%l
    )

echo ^>^> Search setting batch in OneDrive
pushd %od_path%

for /r %%m in (setting_*) do (
    echo ^>^> Catch:  %%~nxm
    )

rem for /r %%n in (setting_*.cmd) do (
rem     echo ^>^> Automatically execute %%~nxn by batch
rem     call %%n
rem     )

for /r %%o in (setting_*.vbs) do (
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
rem exit /b 0

