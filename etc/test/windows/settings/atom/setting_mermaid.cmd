@echo off

rem スクリプトがある "Dir" に "cd"
set bat_path=%~dp0
cd /d %bat_path%

echo "Setting mermaid.js in Atom"
echo "Kill Atom"

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

rem "Atom" 停止
taskkill /f /im Atom.exe

rem バックアップ 作成
rem set atom_path="C:"%HOMEPATH%"\.mume\mermaid_config.js"
set atom_path="C:"%HOMEPATH%"\.mume\"
set backup=%atom_path%"\old\"%tstmp%

if exist %backup% (
    goto mkbkdir
) else (
    goto mkbkfl
)

:mkbkdir
mkdir %backup%

:mkbkfl
for %%i in (mermaid_config.js) do (
    move %atom_path%"\"%%i %backup%
)

rem シンボリックリンク 作成
echo "PWD: %bat_path%"
for %%i in (mermaid_config.js) do (
    mklink %atom_path%"\"%%i "%bat_path%\%%i"
)

pause
