@echo off
setlocal enabledelayedexpansion
rem Created:     2022/03/05 13:18:34
rem Last Change: 2022/03/06 09:14:41.

set batch_title=Delay start up autohotkey

title %batch_title%

rem �Ǘ��Ҍ����ŋN�����ꂽ���`�F�b�N
whoami /PRIV | find "SeLoadDriverPrivilege" > NUL

rem �Ǘ��Ҍ����Ȃ烁�C������
if not errorlevel 1 goto main_routine

rem �Ǘ��Ҍ����łȂ���ΊǗ��Ҍ����ōċN��
@powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process %~f0 -Verb Runas"
exit

:main_routine
timeout 10 >nul

start "" "%userprofile%\dotfiles\etc\init\windows\settings\autohotkey\autohotkey.ahk"

:end

endlocal
popd

rem pause
exit /b 0
