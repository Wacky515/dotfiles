@echo off

rem �X�N���v�g������ "Dir" �� "cd"
set bat_path=%~dp0
cd /d %bat_path%

copy "clink.lua" "C:\tools\cmder\vendor\clink.lua"

pause
