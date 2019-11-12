@echo off
setlocal
rem Created:     20**/**/** **:**:**
rem Last Change: 2018/11/17 09:48:59.

title Add @echo off

rem スクリプトがある "Dir" に "cd"
set bat_path=%~dp0
pushd %bat_path%

for /f %%f in ('grep -iL "@echo off" *.cmd') do (
  sed -i.bak "1i @echo off" %%f
)

endlocal
popd

pause
exit /b 0

