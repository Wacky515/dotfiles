@echo off

rem "setting_everything.cmd" ������ "Dir" �� "cd"
set bat_path=%~dp0
cd /d %bat_path%

echo "Setting Everything"
echo "Kill Everything"

rem ���t�擾
set yyyy=%date:~0,4%
set mm=%date:~5,2%
set dd=%date:~8,2%

rem �����擾
set hh=%time:~0,2%
set mi=%time:~3,2%
set ss=%time:~6,2%

set tstmp=%yyyy%%mm%%dd%-%hh%%mi%%ss%
echo "Time stamp: "%tstmp%

rem "Everything" ��~
taskkill /f /im Everything.exe

rem �o�b�N�A�b�v �쐬
set eve_path="C:"%HOMEPATH%"\AppData\Roaming\Everything\"
rem set backup=%eve_path%"\old\"
set backup=%eve_path%"\old\%tstmp%"

rem ren %eve_path% "Everything_"%tstmp%"

if exist %backup% (
    goto file_true) else (
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

rem �V���{���b�N�����N �쐬
echo "PWD: %bat_path%"
for %%i in (*.ini) do (
    mklink %eve_path%"\"%%i "%bat_path%\%%i"
)

rem �f�X�N�g�b�v�V���[�g�J�b�g �쐬
if not exist "%USERPROFILE%\Desktop\Everything.lnk" (
    goto cplnk
) else (
    goto end
)

:cplnk
echo "Make shortcut in Desktop
copy Everything.lnk %USERPROFILE%\Desktop\

:end
pause