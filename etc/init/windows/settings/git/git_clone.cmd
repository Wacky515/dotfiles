@echo off
setlocal
rem Created:     20**/**/** **:**:**
rem Last Change: 2018/11/29 12:10:27.

set batch_title="Setting for Folder options"
title %batch_title%

whoami /PRIV | find "SeLoadDriverPrivilege" > NUL

rem �Ǘ��Ҍ����Ȃ烁�C������
if not errorlevel 1 goto main_routine

rem �Ǘ��Ҍ����łȂ���ΊǗ��Ҍ����ōċN��
@powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process %~f0 -Verb Runas"
exit

:main_routine
git clone https://github.com/Wacky515/dotfiles.git

endlocal
popd

rem pause
exit /b 0

