@echo off
setlocal
rem Created:     2018/07/17 10:19:01
rem Last Change: 2018/11/17 09:46:33.

set batch_title="Setting GENE dictionary"
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

if not exist %homepath%/vimfiles/dict (
    mkdir %homepath/vimfiles/dict
    )
copy GENE.TXT %homepath%/vimfiles/dict/

endlocal
popd

rem pause
exit /b 0

