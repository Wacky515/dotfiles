@echo off
setlocal
rem Created:     201*/**/** **:**:**
rem Last Change: 2019/08/24 07:07:51.

title Setting Graphiz

rem スクリプトがある "Dir" に "cd"
set bat_path=%~dp0
pushd %bat_path%

set dir_7zip="C:\ProgramData\chocolatey\tools\7z.exe"

for %%i in (*.7z) do (
    call :unzip %%i
    )

:unzip
if not exist "C:\"%~n1 (
    rem NEED TO FIX
    rem moved zip to mega
    echo ^>^> Set %~n1 in C Drive
    %dir_7zip% x -y -oC:\ %1
    ) else (
    echo ^>^> Aleady set %~n1, skip
    goto eof
    )

cscript setting_env_var_graphviz.vbs

:eof
endlocal
popd

rem pause
exit /b 0
