@echo off
setlocal
rem Created:     20**/**/** **:**:**
rem Last Change: 2019/08/20 08:46:50.

title Initialize setting

set git_path=C:%homepath%\dotfiles\etc\init\windows\settings
rem set od_path=%OneDrive%\ŽdŽ–\Settings
set ms_path=C:%homepath%\ŽdŽ–\Settings

echo ^>^> Search setting batch in Git
pushd %git_path%

for /r %%i in (setting_*) do (
    if %%~xi == .cmd (echo ^>^> Catch: %%~nxi)
    if %%~xi == .vbs (echo ^>^> Catch: %%~nxi)
    if %%~xi == .reg (echo ^>^> Catch: %%~nxi
        ) else (
            rem pass
        )
    )
echo ^>^> Done

for /r %%j in (setting_*) do (
    pushd %git_path%
    if %%~xj == .cmd (
        echo ^>^> Automatically execute %%~nxj by batch
        echo %%~dpj
        echo %%~nxj
        cd %%~dpj
        call %%~nxj
        )
    if %%~xj == .vbs (
        echo ^>^> Automatically execute %%~nxj by batch
        cscript %%j
        )
    if %%~xj == .reg (
        echo ^>^> Automatically execute %%~nxj by batch
        reg import %%j
        )
    )

rem echo ^>^> Search setting batch in OneDrive
rem pushd %od_path%
echo ^>^> Search setting batch in Mega sync
pushd %ms_path%

for /r %%k in (setting_*) do (
    if %%~xk == .cmd (echo ^>^> Catch: %%~nxk)
    if %%~xk == .vbs (echo ^>^> Catch: %%~nxk)
    if %%~xk == .reg (echo ^>^> Catch: %%~nxk
        ) else (
            rem pass
        )
    )
echo ^>^> Done

for /r %%l in (setting_*) do (
    if %%~xl == .cmd (
        echo ^>^> Automatically execute %%~nxl by batch
        call %%l
        rem pushd %od_path%
        pushd %ms_path%
        )
    if %%~xl == .vbs (
        echo ^>^> Automatically execute %%~nxl by batch
        cscript %%l
        rem pushd %od_path%
        pushd %ms_path%
        )
    if %%~xl == .reg (
        echo ^>^> Automatically execute %%~nxl by batch
        reg import %%l
        rem pushd %od_path%
        pushd %ms_path%
        )
    )

popd
endlocal

rem pause
exit /b 0

