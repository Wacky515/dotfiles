@echo off

echo Export %COMPUTERNAME%'s sounds setting data as *.reg
reg export "HKEY_CURRENT_USER\AppEvents\Schemes\Apps" ./sounds_setting_%COMPUTERNAME%.reg

pause
exit
