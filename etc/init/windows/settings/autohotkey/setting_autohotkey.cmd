@echo off
setlocal enabledelayedexpansion
rem Created:     2022/01/31 20:24:47
rem Last Change: 2022/03/05 13:27:56.

set batch_title=Setting AutoHotkey

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

rem �X�^�[�g�A�b�v�ɃV���{���b�N�����N �쐬
rem mklink %appdata%"\Microsoft\Windows\Start Menu\Programs\Startup\autohotkey.ahk" %bat_path%"\autohotkey.ahk"
mklink %appdata%"\Microsoft\Windows\Start Menu\Programs\Startup\delay_startup_autohotkey.cmd" %bat_path%"\delay_startup_autohotkey.cmd"

endlocal
popd

rem pause
exit /b 0
