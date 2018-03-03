@echo off

rem スクリプトがある "Dir" に "cd"
set bat_path=%~dp0
cd /d %bat_path%

echo Setting mermaid.js, flowchart.js in Atom
echo Kill Atom

rem 日付取得
set yyyy=%date:~0,4%
set mm=%date:~5,2%
set dd=%date:~8,2%

rem 時刻取得
set hh=%time:~0,2%
set mi=%time:~3,2%
set ss=%time:~6,2%

set tstmp=%yyyy%%mm%%dd%-%hh%%mi%%ss%
echo Time stamp: %tstmp%

rem "Atom" 停止
taskkill /f /im Atom.exe

rem rem バックアップ 作成
rem rem set atom_path="C:"%HOMEPATH%"\.mume\mermaid_config.js"
rem set atom_path="C:"%HOMEPATH%"\.mume\"
rem set backup=%atom_path%"\old\"%tstmp%
rem
rem if exist %backup% (
rem     goto mkbkfl
rem ) else (
rem     goto mkbkdir
rem )
rem
rem :mkbkdir
rem mkdir %backup%
rem
rem :mkbkfl
rem for %%i in (mermaid_config.js) do (
rem     move %atom_path%"\"%%i %backup%
rem )
rem
rem for %%i in (flowchart_config.js) do (
rem     move %atom_path%"\"%%i %backup%
rem )

rem シンボリックリンク 作成
echo "PWD: %bat_path%"
for %%i in (mermaid_config.js) do (
    mklink %atom_path%"\"%%i "%bat_path%\%%i"
)

for %%i in (flowchart_config.js) do (
    mklink %atom_path%"\"%%i "%bat_path%\%%i"
)

pause
