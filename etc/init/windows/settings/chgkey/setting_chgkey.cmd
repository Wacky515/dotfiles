@echo off
setlocal enabledelayedexpansion
rem Created:     2022/02/10 09:59:16
rem Last Change: 2022/02/10 10:30:02.

set batch_title=Setting ChgKey

title %batch_title%

rem �Ǘ��Ҍ����ŋN�����ꂽ���`�F�b�N
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
rem echo ^>^> Start

rem ���s�t�@�C���Ɠ���f�B���N�g���ɃV���{���b�N�����N �쐬
mklink %userprofile%"\ChgKey15\chgkey.ini" %bat_path%"\chgkey.ini"

endlocal
popd

rem pause
exit /b 0
