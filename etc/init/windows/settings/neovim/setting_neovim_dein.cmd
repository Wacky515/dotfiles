@echo off
setlocal
rem Created:     201*/**/** **:**:**
rem Last Change: 2019/10/01 17:15:46.

title Setting NeoVim's dein

whoami /PRIV | find "SeLoadDriverPrivilege" > NUL

rem �Ǘ��Ҍ����Ȃ烁�C������
if not errorlevel 1 goto main_routine

rem �Ǘ��Ҍ����łȂ���ΊǗ��Ҍ����ōċN��
@powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process %~f0 -Verb Runas"
exit

:main_routine
rem �X�N���v�g������ "Dir" �� "cd"
set bat_path=%~dp0
pushd %bat_path%

pip3 --version > nul 2>&1
if errorlevel 1 (
    echo ^>^> Install pip3 first
    call %homepath%\OneDrive\�d��\Settings\Python3\install_python.cmd
    )

pip3 install neovim

:eof
endlocal
popd

rem pause
exit /b 0
