@echo off

rem �X�N���v�g������ "Dir" �� "cd"
set bat_path=%~dp0
cd /d %bat_path%

pip3 install neovim

pause
exit /b0
