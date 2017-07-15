@echo off

rem "setting_everything.cmd" がある "Dir" に "cd"
set bat_path=%~dp0
cd /d %bat_path%

echo "Setting Everything"
echo "Kill Everything"

rem 日付取得
set yyyy=%date:~0,4%
set mm=%date:~5,2%
set dd=%date:~8,2%

rem 時刻取得
set hh=%time:~0,2%
set mi=%time:~3,2%
set ss=%time:~6,2%

set tstmp=%yyyy%%mm%%dd%-%hh%%mi%%ss%
echo "Time stamp: "%tstmp%

rem "Everything" 停止
taskkill /f /im Everything.exe

rem バックアップ 作成
set eve_path="C:"%HOMEPATH%"\AppData\Roaming\Everything\"
set backup=%eve_path%"\old\"%tstmp%"

if exist %backup% (
    goto mkbkdir
) else (
    goto mknkfl
)

:mkbkdir
mkdir %backup%

:mknkfl
for %%i in (*.ini) do (
    move %eve_path%"\"%%i %backup%
)

rem シンボリックリンク 作成
echo "PWD: %bat_path%"
for %%i in (*.ini) do (
    mklink %eve_path%"\"%%i "%bat_path%\%%i"
)

rem デスクトップショートカット 作成
if not exist "%USERPROFILE%\Desktop\Everything.lnk" (
    goto cplnk
) else (
    echo "Already set desktop shortcut"
    goto end
)

:cplnk
echo "Make shortcut in Desktop"

if exist "C:\Program Files (x86)\Everything\Everything.exe" goto evex64
if exist "C:\Program Files\Everything\Everything.exe" (
    goto eve
) else (
    goto end
)

:evex64
copy .\x86_shortcut\Everything.lnk %USERPROFILE%\Desktop\
goto end

:eve
copy .\shortcut\Everything.lnk %USERPROFILE%\Desktop\
goto end

:end
pause
