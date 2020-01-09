@echo off
setlocal
rem Created:     2017/01/18 **:**:**
rem Last Change: 2019/10/02 11:57:54.

set batch_title=Setting Yamabuki R
title %batch_title%

whoami /PRIV | find "SeLoadDriverPrivilege" > NUL

rem �Ǘ��Ҍ����Ȃ烁�C������
if not errorlevel 1 goto main_routine

rem �Ǘ��Ҍ����łȂ���ΊǗ��Ҍ����ōċN��
@powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process %~f0 -Verb Runas"
exit

:main_routine
rem �X�N���v�g������ "Dir" �� "cd"
set bat_path=%~dp0
pushd %bat_path%

echo ^>^> %batch_title%

rem �ݒ�t�@�C�� �R�s�[
if exist %userprofile%\yamabuki_r1.11.1.w\ (
    copy /y "yamabuki_r.ypr" %userprofile%\yamabuki_r1.11.1.w\
) else (
    echo ^>^> Not install Yamabuki R
    exit /b 1
)

rem �X�^�[�g�A�b�v�ɃV���[�g�J�b�g �쐬
    rem Windows7/10�œ��YDir�قȂ�͂��₯�Ǔ����₪�ȁE�E�E
ver | find "Version 6.1." > nul
if not errorlevel 1 goto win7

ver | find "Version 10.0." > nul
if not errorlevel 1 goto win10

:win7
echo ^>^> This PC is Windows7
copy .\yamabuki_r.lnk %userprofile%"\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\"
rem FIXME: �� �Əd�����Ă邯�Ǔ��삷��A�Ӗ��s��
if errorlevel 1 copy .\yamabuki_r.lnk %userprofile%"\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\"
goto eof

:win10
echo ^>^> This PC is Windows10
copy .\yamabuki_r.lnk %userprofile%"\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\"
rem FIXME: �� �Əd�����Ă邯�Ǔ��삷��A�Ӗ��s��
if errorlevel 1 copy .\yamabuki_r.lnk %userprofile%"\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\"
goto eof

:eof

endlocal
popd

rem pause
exit /b 0
