@echo off
setlocal enabledelayedexpansion
rem Created:     2020/04/15 12:28:24
rem Last Change: 2021/06/29 11:14:02.

set batch_title=Check disk error
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

chkdsk c: /r
rem "chkdsk": �`�F�b�N�f�B�X�N�̎��s�R�}���h
rem "c:":     C�h���C�u���`�F�b�N
rem "/r":     ���S�Ƀ`�F�b�N

:end
endlocal
popd

pause
exit /b 0
