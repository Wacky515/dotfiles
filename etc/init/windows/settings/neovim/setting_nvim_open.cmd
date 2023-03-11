@echo off
setlocal enabledelayedexpansion
rem Created:     2018/12/20 15:51:47
rem Last Change: 2023/03/11 21:46:59.

set batch_title=Setting NeoVim Open

title %batch_title%

rem �Ǘ��Ҍ����ŋN�����ꂽ���`�F�b�N
whoami /PRIV | find "SeLoadDriverPrivilege" > NUL

rem �Ǘ��Ҍ����Ȃ烁�C������
if not errorlevel 1 goto main_routine

rem �Ǘ��Ҍ����łȂ���ΊǗ��Ҍ����ōċN��
@powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process %~f0 -Verb Runas"
exit

:main_routine

set prefix=""
set drive="C:"

rem rem �X�N���v�g������ "Dir" �� "cd"
rem set bat_path=%~dp0
rem pushd %bat_path%

echo ^>^> %batch_title%
rem echo ^>^> Start

echo ^>^> Set Open by NeoVim
reg add "HKEY_CLASSES_ROOT\*\shell\NeoVim open" /v ^
    "Icon" /t REG_SZ /d C:\tools\neovim\Neovim\bin\nvim-qt.exe /f
reg add "HKEY_CLASSES_ROOT\*\shell\NeoVim open\command" /t ^
    REG_SZ /d "\"%drive%\tools\neovim\Neovim\bin\nvim-qt.exe\" \"%%1\"" /f
goto eof

:eof
endlocal

rem pause
exit /b 0
