@echo off
setlocal
rem Created:     2018/10/05 09:54:50
rem Last Change: 2018/11/23 11:32:24.

set batch_title="General setting Windows10"
title %batch_title%

whoami /PRIV | find "SeLoadDriverPrivilege" > NUL

rem �Ǘ��Ҍ����Ȃ烁�C������
if not errorlevel 1 goto main_routine

rem �Ǘ��Ҍ����łȂ���ΊǗ��Ҍ����ōċN��
@powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process %~f0 -Verb Runas"
exit

:main_routine
rem  �X�N���v�g������ "Dir" �� "cd"
pushd %~dp0

echo ^>^> %batch_title%

rem "�X�i�b�v���ꂽ�E�B���h�E�̃T�C�Y��ύX����Ƃ��ɁA�אڂ���X�i�b�v �E�B���h�E�̃T�C�Y�������ɕύX����" �𖳌��ɂ���
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "JointResize" /t REG_DWORD /d "0" /f

endlocal
popd

rem pause
exit /b 0

