@echo off
setlocal
rem Created:     201*/**/** **:**:**
rem Last Change: 2019/08/20 08:45:11.

title Initialize batch for install

set git_path=C:%homepath%\dotfiles\etc\init\windows\settings
rem set od_path=%OneDrive%\ŽdŽ–\Settings\
set ms_path=C:%homepath%\ŽdŽ–\Settings
echo ^>^> Search install batch in Git
pushd %git_path%

for /r %%i in (install_*) do (
    if %%~xi == .cmd (echo ^>^> Catch: %%~nxi)
    if %%~xi == .vbs (echo ^>^> Catch: %%~nxi)
    if %%~xi == .reg (echo ^>^> Catch: %%~nxi
        ) else (
            rem pass
        )
    )
echo ^>^> Done

for /r %%j in (install_*) do (
    if %%~xj == .cmd (
        echo ^>^> Automatically execute %%~nxj by batch
        call %%j
        pushd %git_path%
        )
    if %%~xj == .vbs (
        echo ^>^> Automatically execute %%~nxj by batch
        cscript %%j
        pushd %git_path%
        )
    if %%~xj == .reg (
        echo ^>^> Automatically execute %%~nxj by batch
        reg import %%j
        pushd %git_path%
        )
    )

rem echo ^>^> Search install batch in OneDrive
echo ^>^> Search install batch in Mega sync
rem pushd %od_path%
pushd %ms_path%

for /r %%k in (install_*) do (
    if %%~xk == .cmd (echo ^>^> Catch: %%~nxk)
    if %%~xk == .vbs (echo ^>^> Catch: %%~nxk)
    if %%~xk == .reg (echo ^>^> Catch: %%~nxk
        ) else (
            rem pass
        )
    )
echo ^>^> Done

for /r %%l in (install_*) do (
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

