@echo off
setlocal
rem Created:     2018/11/22 17:07:29
rem Last Change: 2018/11/22 18:11:46.

set batch_title="Install textlint"
title %batch_title%

whoami /PRIV | find "SeLoadDriverPrivilege" > NUL

rem �Ǘ��Ҍ����Ȃ烁�C������
if not errorlevel 1 goto main_routine

rem �Ǘ��Ҍ����łȂ���ΊǗ��Ҍ����ōċN��
@powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process %~f0 -Verb Runas"
exit

:main_routine
call sub_textline.cmd

endlocal
popd

rem pause
exit /b 0

