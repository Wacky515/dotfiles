@echo off
reg add "HKEY_CURRENT_USER\Control Panel\Mouse" /v "SnapToDefaultButton" /t REG_SZ /d "1" /f
pause
exit
