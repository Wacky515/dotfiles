@echo off
setlocal
rem Created:     20**/**/** **:**:**
rem Last Change: 2018/11/17 09:47:59.

title Setting Anaconda path

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

rem mklink %HOMEPATH%"\.gvimrc" ".\dotfiles\.gvimrc"
mklink "C:\Python35\Lib\site-packages\.anaconda.pth" "\.anaconda.pth"

endlocal
popd

pause
exit /b 0

