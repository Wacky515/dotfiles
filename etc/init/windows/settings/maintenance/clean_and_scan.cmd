@echo off
setlocal enabledelayedexpansion
rem Created:     2021/06/29 11:13:19
rem Last Change: 2021/06/29 12:03:39.

set batch_title=Clen disk
title %batch_title%

rem �Ǘ��Ҍ����ŋN�����ꂽ���`�F�b�N
whoami /PRIV | find "SeLoadDriverPrivilege" > NUL

rem �Ǘ��Ҍ����Ȃ烁�C������
if not errorlevel 1 goto main_routine

rem �Ǘ��Ҍ����łȂ���ΊǗ��Ҍ����ōċN��
@powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process %~f0 -Verb Runas"
exit

:main_routine
set bat_path=%~dp0

rem �X�N���v�g������ "Dir" �� "cd"
pushd %bat_path%

rem Windows Update �T�[�r�X��~
net stop wuauserv
rem Software Distribution Download �폜
rmdir /s /q C:\WINDOWS\SoftwareDistribution\Download
rem Windows Update �T�[�r�X�N��
net start wuauserv

rem �s�v�R���|�[�l���g �m�F
Dism.exe /Online /Cleanup-Image /AnalyzeComponentStore

echo  ^>^> Start Dism.exe [y/n]
set /p input=
if defined input set input=%input:"=%
if /i "%input%" == "y" (
    rem �s�v�R���|�[�l���g �폜
    Dism.exe /online /Cleanup-Image /StartComponentCleanup
)

rem DNS���]���o�̃L���b�V�� �폜
ipconfig /flushdns
rem Windows10�X�g�A�A�v�� �L���b�V���폜
wsreset
sfc /scannow

:end
endlocal
popd

pause
exit /b 0
