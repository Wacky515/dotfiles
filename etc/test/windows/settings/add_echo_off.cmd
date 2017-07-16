@echo off

rem スクリプトがある "Dir" に "cd"
set bat_path=%~dp0
cd /d %bat_path%

for /f %%f in ('grep -iL "@echo off" *.cmd') do (
  sed -i.bak "1i @echo off" %%f
)

pause
