@echo off
setlocal
rem Created:     2018/04/19 09:01:59
rem Last Change: 2018/11/17 09:44:36.

title Setting powerline

whoami /PRIV | find "SeLoadDriverPrivilege" > NUL

rem �Ǘ��Ҍ����Ȃ烁�C������
if not errorlevel 1 goto main_routine

rem �Ǘ��Ҍ����łȂ���ΊǗ��Ҍ����ōċN��
@powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process %~f0 -Verb Runas"
exit

:main_routine
rem  �X�N���v�g������ "Dir" �� "cd"
<<<<<<< HEAD
pushd "%~dp0"
=======
pushd %~dp0
>>>>>>> f2797e1122bedb259341e007fbc848627a472e94

echo ^>^> Start setting cmder-powerline-prompt
copy powerline_prompt.lua %CMDER_ROOT%/config

endlocal
popd

rem pause
exit /b 0
