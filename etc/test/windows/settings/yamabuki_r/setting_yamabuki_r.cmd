@echo off

rem "setting_yamabuki_r.cmd" ������ "Dir" �� "cd"
set bat_path=%~dp0
cd /d %bat_path%

echo "Setting Yamabuki R"

rem �ݒ�t�@�C�� �R�s�[
xcopy /y "Cust_NICOLA.yab" %HOMEPATH%"\yamabuki_r1.11.1"
xcopy /y "yamabuki_r.ypr" %HOMEPATH%"\yamabuki_r1.11.1"

rem �X�^�[�g�A�b�v�ɃV���[�g�J�b�g �쐬(Windows7/10�œ��YDir�قȂ�͂��₯�Ǔ����₪�ȁE�E�E)
ver | find "Version 6.1." > nul 
if not errorlevel 1 goto win_7

ver | find "Version 6.4." > nul 
if not errorlevel 1 goto win_10

:win_7
echo "This PC is Windows7"
xcopy "yamabuki_r.lnk" %HOMEPATH%"\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
goto end

:win_10
xcopy "yamabuki_r.lnk" %HOMEPATH%"\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
goto end

:end
pause