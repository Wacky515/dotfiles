@echo off
setlocal
rem Created:     201*/**/** **:**:**
rem Last Change: 2019/10/03 10:28:53.

title Setting Cmder here
whoami /PRIV | find "SeLoadDriverPrivilege" > NUL

rem �Ǘ��Ҍ����Ȃ烁�C������
if not errorlevel 1 goto main_routine

rem �Ǘ��Ҍ����łȂ���ΊǗ��Ҍ����ōċN��
@powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process %~f0 -Verb Runas"
exit

:main_routine
pushd "C:\tools\cmder"
.\cmder.exe /REGISTER ALL

endlocal
popd

rem pause
exit /b 0