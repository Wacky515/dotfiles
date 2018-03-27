@echo off

rem �X�N���v�g������ "Dir" �� "cd"
set bat_path=%~dp0
cd /d %bat_path%

rem ���t�擾
set yyyy=%date:~0,4%
set mm=%date:~5,2%
set dd=%date:~8,2%

rem �����擾
set hh=%time:~0,2%
set mi=%time:~3,2%
set ss=%time:~6,2%
set tstmp=%yyyy%%mm%%dd%-%hh%%mi%%ss%

set inidir="C:\Program Files\CCleaner\"
set inifile="C:\Program Files\CCleaner\ccleaner.ini"

rem "CCleaner" ��~
taskkill /f /im CCleaner.exe

if exist %inifile% (
    goto bkup
) else (
    goto cpini
)

:bkup
echo Backup old .ini
rem FIXME: Syntax error
ren %inifile% ccleaner%tstmp%.ini

:cpini
echo Copy .ini
copy "ccleaner.ini" %inifile%

pause
