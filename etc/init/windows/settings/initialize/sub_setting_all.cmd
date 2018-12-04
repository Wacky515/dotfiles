@echo off
setlocal
rem Created:     20**/**/** **:**:**
rem Last Change: 2018/12/04 10:23:04.

title Initialize setting

set git_path=%homepath%\dotfiles\etc\init\windows\settings\
set od_path=%OneDrive%\ŽdŽ–\Settings\

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

for /r %%j in (setting_*) do (
    pushd %git_path%
    if %%~xj == .cmd (
        echo ^>^> Automatically execute %%~nxj by batch
        echo %%~dpj
        echo %%~nxj
        cd %%~dpj
        call %%~nxj
        rem echo 1
        rem pushd %git_path%
        )
    if %%~xj == .vbs (
        echo ^>^> Automatically execute %%~nxj by batch
        cscript %%j
        rem pushd %git_path%
        )
    if %%~xj == .reg (
        echo ^>^> Automatically execute %%~nxj by batch
        reg import %%j
        rem pushd %git_path%
        )
    )

echo ^>^> Search setting batch in OneDrive
pushd %od_path%

for /r %%k in (setting_*) do (
    if %%~xk == .cmd (echo ^>^> Catch: %%~nxk)
    if %%~xk == .vbs (echo ^>^> Catch: %%~nxk)
    if %%~xk == .reg (echo ^>^> Catch: %%~nxk
        ) else (
            rem pass
        )
    )

for /r %%l in (setting_*) do (
    if %%~xl == .cmd (
        echo ^>^> Automatically execute %%~nxl by batch
        call %%l
        pushd %od_path%
        )
    if %%~xl == .vbs (
        echo ^>^> Automatically execute %%~nxl by batch
        cscript %%l
        pushd %od_path%
        )
    if %%~xl == .reg (
        echo ^>^> Automatically execute %%~nxl by batch
        reg import %%l
        pushd %od_path%
        )
    )

popd
endlocal

rem pause
exit /b 0

