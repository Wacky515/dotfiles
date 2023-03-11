@echo off
setlocal enabledelayedexpansion
rem Created:     2018/10/05 09:54:50
rem Last Change: 2022/03/23 06:13:10.

set batch_title=General setting Windows10

title %batch_title%

rem �Ǘ��Ҍ����ŋN�����ꂽ���`�F�b�N
whoami /PRIV | find "SeLoadDriverPrivilege" > NUL

rem �Ǘ��Ҍ����Ȃ烁�C������
if not errorlevel 1 goto main_routine

rem �Ǘ��Ҍ����łȂ���ΊǗ��Ҍ����ōċN��
@powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process %~f0 -Verb Runas"
exit

:main_routine

rem  �X�N���v�g������ "Dir" �� "cd"
set bat_path=%~dp0
pushd %bat_path%

echo ^>^> %batch_title%
rem echo ^>^> Start

echo ^>^> OFF Fast startup
rem "�����X�^�[�g�A�b�v��L���ɂ���" ����
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Session Manager\Power" /v "HiberbootEnabled" /t REG_DWORD /d "0" /f

rem "�^�X�N �o�[����� People �o�[���폜����" �L��
echo ^>^> OFF People
reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer" /v "HidePeopleBar" /t REG_DWORD /d "1" /f

echo ^>^> OFF Notifications
rem "�A�v���₻�̑��̑��M�҂���̒ʒm���擾����" ����
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\PushNotifications" /v "ToastEnabled" /t REG_DWORD /d "0" /f
rem "���b�N��ʂɒʒm��\������" ����
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings" /v "NOC_GLOBAL_SETTING_ALLOW_TOASTS_ABOVE_LOCK" /t REG_DWORD /d "0" /f
rem "���b�N��ʂɃ��}�C���_�[�� VoIP �̒��M��\������" ����
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings" /v "NOC_GLOBAL_SETTING_ALLOW_CRITICAL_TOASTS_ABOVE_LOCK" /t REG_DWORD /d "0" /f
rem "�V�@�\�Ƃ������߂��m�F���邽�߂ɁA�X�V�̌�ƁA�T�C���C�����ɂƂ��ǂ��A[Windows �ւ悤����] �̏���\������" ����
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-310093Enabled" /t REG_DWORD /d "0" /f
rem "Windows ���g����ł̃q���g�₨���߂̕��@���擾����" ����
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338389Enabled" /t REG_DWORD /d "0" /f

echo ^>^> Setting Strage sensor
rem �X�g���[�W�Z���T �L��
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy" /v "01" /t REG_DWORD /d "0x1" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy" /v "2048" /t REG_DWORD /d "0x7" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy" /v "4" /t REG_DWORD /d "0x1" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy" /v "256" /t REG_DWORD /d "0x1e" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy" /v "512" /t REG_DWORD /d "0x0" /f
rem �ݒ�ڏq  reg {{{
rem �X�g���[�W�Z���T�[�̗L��
rem   0=����
rem   1=�L��
rem "01"=dword:00000001
rem ���s�^�C�~���O
rem   1e=����
rem   7=���T
rem   1=����
rem   0=�f�B�X�N�̋󂫗e�ʂ̕s����
rem "2048"=dword:0000001e
rem �A�v���Ŏg�p����Ă��Ȃ��ꎞ�t�@�C�����폜
rem   0=����
rem   1=�L��
rem "04"=dword:00000001
rem ���ݔ��Ɉړ����Ă��玟�̊��Ԃ��߂����t�@�C�����폜
rem   3c=60��
rem   1e=30��
rem   0e=14��
rem   1=1��
rem   0=�����Ȃ�
rem "256"=dword:0000000e
rem  �_�E�����[�h�t�H���_�ɕۑ����Ă��玟�̊��Ԃ��߂����t�@�C�����폜
rem   3c=60��
rem   1e=30��
rem   0e=14��
rem   1=1��
rem   0=�����Ȃ�
rem "512"=dword:0000000e
rem }}}

rem "�E�B���h�E���X�i�b�v�����Ƃ��ɉ��ɔz�u�ł�����̂�\������" ����
echo ^>^> OFF Snap assist
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "SnapAssist" /t REG_DWORD /d "0" /f
rem "�E�B���h�E���X�i�b�v����Ƃ��ɁA���p�\�ȗ̈�ɍ��킹�Ď����I�ɃT�C�Y��ύX����" ����
echo ^>^> OFF Snap fill
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "SnapFill" /t REG_DWORD /d "0" /f
rem "�X�i�b�v���ꂽ�E�B���h�E�̃T�C�Y��ύX����Ƃ��ɁA�אڂ���X�i�b�v �E�B���h�E�̃T�C�Y�������ɕύX����" ����
echo ^>^> OFF Joint resize
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "JointResize" /t REG_DWORD /d "0" /f

rem �^�C�����C�� ����
echo ^>^> OFF Time line
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableActivityFeed" /t REG_DWORD /d "0" /f

rem NOTWORK:
rem echo ^>^> ON Remote desktop
rem rem �����[�g�f�X�N�g�b�v �L��
rem reg add "HKEY_LOCAL_MACHINESYSTEMCurrentControlSetControlTerminal Server" /v fDenyTSConnections/t REG_DWORD /d "1" /f

echo ^>^> OFF Xbox function
sc config XblAuthManager start=disabled
sc config XblGameSave start=disabled
sc config XboxNetApiSvc start=disabled

@(echo '> NUL
echo off)
NET SESSION > NUL 2>&1
IF %ERRORLEVEL% neq 0 goto RESTART
setlocal enableextensions
set "THIS_PATH=%~f0"
set "PARAM_1=%~1"
PowerShell.exe -Command "iex -Command ((gc \"%THIS_PATH:`=``%\") -join \"`n\")"
exit /b %errorlevel%
:RESTART
powershell -NoProfile -ExecutionPolicy unrestricted -Command "Start-Process %~f0 -Verb runas"
exit
') | sv -Name TempVar
Get-AppxPackage -allusers Microsoft.549981C3F5F10 | Remove-AppxPackage

endlocal
popd

rem pause
exit /b 0
