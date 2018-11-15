@echo off
setlocal
rem Created:     20**/**/** **:**:**
rem Last Change: 2018/11/15 12:46:32.

title Setting Graphiz

rem スクリプトがある "Dir" に "cd"
set bat_path=%~dp0
pushd /d %bat_path%

set dir_7zip="C:\ProgramData\chocolatey\tools\7z.exe"

for %%i in (*.7z) do (
    call :unzip %%i
    )

:unzip
if not exist C:\%~n1 (
    echo Set %~n1 in C Drive
    rem %dir_7zip% e -y -oC:\%~n1 %1
    rem %dir_7zip% x -y -oC:\%~n1 %1
    %dir_7zip% x -y -oC:\ %1
    ) else (
    echo Aleady set %~n1, skip
    goto eof
    )
cscript setting_env_var_graphviz.vbs

:eof

endlocal
popd

pause
exit

