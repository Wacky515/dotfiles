@echo off
setlocal enabledelayedexpansion
rem Created:     201*/**/** ** **:**:**
rem Last Change: 2020/11/01 10:22:36.

set batch_title=Setting PyCharm Japanese

title %batch_title%

rem 管理者権限で起動されたかチェック
whoami /PRIV | find "SeLoadDriverPrivilege" > NUL

rem 管理者権限ならメイン処理
if not errorlevel 1 goto main_routine

rem 管理者権限でなければ管理者権限で再起動
@powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process %~f0 -Verb Runas"
exit

:main_routine
rem rem スクリプトがある "Dir" に "cd"
rem set bat_path=%~dp0
rem pushd %bat_path%

pushd %userprofile%\OneDrive\仕事\Settings\PyCharm\
if %errorlevel% equ 1 (
    echo ^>^> SETTING FOLDER NOT FOUND
    goto end
)

echo ^>^> %batch_title%
rem echo ^>^> Start

if exist "C:\Program Files (x86)\JetBrains\PyCharm Community Edition 2018.3\" (
    if not exist "C:\Program Files (x86)\JetBrains\PyCharm Community Edition 2018.3\jp.sourceforge.mergedoc.pleiades" (
        echo ^>^> Copy setting files
        xcopy "jp.sourceforge.mergedoc.pleiades" "C:\Program Files (x86)\JetBrains\PyCharm Community Edition 2018.3\jp.sourceforge.mergedoc.pleiades" /s/e/i
    ) else (
        echo ^>^> Aleady exist
    )
) else (
    echo ^>^> Check PyCharm install directory
)

echo ----------------------------------------------------------------------------------------------------------------------------------
echo Open PyCharm -^> Help -^> Edit Custom VM Options -^> Yes
echo Paste below
echo     -Xverify:none
echo     -javaagent:C:\Program Files (x86)\JetBrains\PyCharm Community Edition 2018.3\jp.sourceforge.mergedoc.pleiades\pleiades.jar
echo And restart PyCharm
echo Details on ^< http://shimizu3.webcrow.jp/tawa/pro-cont/pa03.html ^>
echo ----------------------------------------------------------------------------------------------------------------------------------
pause

:end
endlocal
popd

rem pause
rem exit /b 0
