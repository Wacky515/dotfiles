@echo off

rem "setting_yamabuki_r.cmd" ������ "Dir" �� "cd"
set bat_path=%~dp0
cd /d %bat_path%

echo "Setting Yamabuki R"

rem �ݒ�t�@�C�� �R�s�[
xcopy /y "Cust_NICOLA.yab" %HOMEPATH%"\yamabuki_r1.11.1"
xcopy /y "yamabuki_r.ypr" %HOMEPATH%"\yamabuki_r1.11.1"

rem �X�^�[�g�A�b�v�ɃV���[�g�J�b�g �쐬
xcopy "yamabuki_r.lnk" %HOMEPATH%"\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"

pause