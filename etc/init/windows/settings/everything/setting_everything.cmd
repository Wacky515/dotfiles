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
rem set backup=%eve_path%"\old\"
set backup=%eve_path%"\old\%tstmp%"

rem ren %eve_path% "Everything_"%tstmp%"

if exist %backup% (
    goto file_true
) else (
    goto file_false
)

:file_false
mkdir %backup%

:file_true
rem move %eve_path%"_"%tstmp% %backup%
for %%i in (*.ini) do (
    move %eve_path%"\"%%i %backup%
)

rem mkdir %eve_path%

rem シンボリックリンク 作成
echo "PWD: %bat_path%"
for %%i in (*.ini) do (
    mklink %eve_path%"\"%%i "%bat_path%\%%i"
)

rem �f�X�N�g�b�v�V���[�g�J�b�g �쐬
if not exist "%USERPROFILE%\Desktop\Everything.lnk" (
    goto cplnk
) else (
<<<<<<< HEAD
    echo "Already set desktop shortcut"
=======
>>>>>>> a2ac65916c38779e69867e4b43004785ba7fbc2e
    goto end
)

:cplnk
echo "Make shortcut in Desktop
<<<<<<< HEAD
rem copy Everything.lnk "%USERPROFILE%\Desktop\"
=======
>>>>>>> a2ac65916c38779e69867e4b43004785ba7fbc2e
copy Everything.lnk %USERPROFILE%\Desktop\

:end
pause
