@echo off

rem �X�N���v�g������ "Dir" �� "cd"
set bat_path=%~dp0
cd /d %bat_path%

echo "Setting Yamabuki R"

rem �ݒ�t�@�C�� �R�s�[
rem copy /y "Cust_NICOLA.yab" %HOMEPATH%"\yamabuki_r1.11.1"
rem copy /y "yamabuki_r.ypr" %HOMEPATH%"\yamabuki_r1.11.1"

copy /y "Cust_NICOLA.yab" %HOMEPATH%"\yamabuki_r1.11.1.w"
copy /y "yamabuki_r.ypr" %HOMEPATH%"\yamabuki_r1.11.1.w"

rem �X�^�[�g�A�b�v�ɃV���[�g�J�b�g �쐬(Windows7/10�œ��YDir�قȂ�͂��₯�Ǔ����₪�ȁE�E�E)
ver | find "Version 6.1." > nul
if not errorlevel 1 goto win7

ver | find "Version 10.0." > nul
if not errorlevel 1 goto win10

:win7
echo "This PC is Windows7"
copy "yamabuki_r.lnk" %HOMEPATH%"\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
if errorlevel 1 copy "yamabuki_r.lnk" %HOMEPATH%"\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
goto end

:win10
copy "yamabuki_r.lnk" %HOMEPATH%"\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
goto end

:end
pause