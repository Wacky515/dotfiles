@echo off
setlocal
rem Created:     20**/**/** **:**:**
rem Last Change: 2018/11/17 09:46:56.

title Setting Pacman

whoami /PRIV | find "SeLoadDriverPrivilege" > NUL

rem �Ǘ��Ҍ����Ȃ烁�C������
if not errorlevel 1 goto main_routine

rem �Ǘ��Ҍ����łȂ���ΊǗ��Ҍ����ōċN��
@powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process %~f0 -Verb Runas"
exit

:main_routine
rem  �X�N���v�g������ "Dir" �� "cd"
pushd %~dp0

echo Start set link

mklink "C:\tools\msys64\etc" "\.pacman.conf"

endlocal
popd

pause
exit /b 0

