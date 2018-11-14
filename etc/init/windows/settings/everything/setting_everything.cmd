@echo off
rem Created:     2018/01/01 00:00:00
rem Last Change: 2018/11/14 12:49:33.

whoami /PRIV | find "SeLoadDriverPrivilege" > NUL

rem 管理者権限ならメイン処理
if not errorlevel 1 goto main_routine

rem 管理者権限でなければ管理者権限で再起動
@powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process %~f0 -Verb Runas"
exit

:main_routine
rem スクリプトがある "Dir" に "cd"
set bat_path=%~dp0
cd /d %bat_path%

rem ---------------------------------------------------------------------------
rem ここから追記して動作未確認
rem ---------------------------------------------------------------------------

rem 設定ファイルがある "Dir" に "cd"
cd %OneDrive%

rem ---------------------------------------------------------------------------
rem ここまで追記して動作未確認
rem ---------------------------------------------------------------------------

echo ^>^> Setting Everything

rem 日付取得
set yyyy=%date:~0,4%
set mm=%date:~5,2%
set dd=%date:~8,2%

rem 時刻取得
set hh=%time:~0,2%
set mi=%time:~3,2%
set ss=%time:~6,2%

set tstmp=%yyyy%-%mm%-%dd%_%hh%-%mi%-%ss%
echo ^>^> Time stamp: %tstmp%

rem "Everything" 停止
echo ^>^> Kill Everything
taskkill /f /im Everything.exe

rem バックアップ 作成
set eve_path="C:"%HOMEPATH%"\AppData\Roaming\Everything"
set backup=%eve_path%"\old\"%tstmp%

mkdir %backup%

rem :backup
if exist %eve_path% (
    move %eve_path%\* %backup%
    )

rem シンボリックリンク 作成
for %%i in (*.ini) do (
    rem MEMO: 下記修正した、確認
    mklink %eve_path%"\"%%i %bat_path%\%%i
)
rem FIXME: ここまででSyntax Error
rem FIXME: *.ini コピー失敗している

rem MEMO: x64環境下
for %%i in (*.ini) do (
    rem MEMO: 下記2つ 記述方法が 32bit と 64bit で異なるか確認
    rem mklink %eve_path%"\"%%i "%bat_path%\%%i"
    mklink %eve_path%%%i "%bat_path%%%i"
)

rem デスクトップショートカット 作成
if not exist %USERPROFILE%"\Desktop\Everything.lnk" (
    goto cplnk
) else (
    echo ^>^> Already set desktop shortcut
    goto end
)

:cplnk
echo ^>^> Make shortcut in Desktop

if exist "C:\Program Files (x86)\Everything\Everything.exe" goto evex64
if exist "C:\Program Files\Everything\Everything.exe" (
    goto eve
) else (
    goto end
)

:evex64
rem FIXME: Syntax Error x64はデスクトップの指定が異なる？
rem MEMO: ショートカットのコピー自体は成功している
copy ".\x86_shortcut\Everything.lnk" %USERPROFILE%"\Desktop\"
goto end

:eve
copy ".\shortcut\Everything.lnk" %USERPROFILE%"\Desktop\"
goto end

:end
pause
exit /b 0
