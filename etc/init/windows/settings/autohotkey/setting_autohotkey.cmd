@echo off
setlocal enabledelayedexpansion
rem Created:     2022/01/31 20:24:47
rem Last Change: 2022/01/31 20:25:30.

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

rem �X�^�[�g�A�b�v�ɃR�s�[ �쐬
copy .\autohotkey.ahk %userprofile%"\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\"

endlocal
popd

rem pause
exit /b 0
