@echo off
setlocal
rem Created:     2018/01/01 00:00:00
rem Last Change: 2018/12/04 09:23:20.

set batch_title=Setting CCleaner
title %batch_title%

rem �X�N���v�g������ "Dir" �� "cd"
set bat_path=%~dp0
pushd %bat_path%

rem ---------------------------------------------------------------------------
rem ��������ǋL���ē��얢�m�F
rem ---------------------------------------------------------------------------

rem �ݒ�t�@�C�������� "Dir" �� "cd"
pushd %OneDrive%

rem ---------------------------------------------------------------------------
rem �����܂ŒǋL���ē��얢�m�F
rem ---------------------------------------------------------------------------

echo ^>^> %batch_title%

rem ���t�擾
set yyyy=%date:~0,4%
set mm=%date:~5,2%
set dd=%date:~8,2%

rem �����擾
set hh=%time:~0,2%
set mi=%time:~3,2%
set ss=%time:~6,2%

set tstmp=%yyyy%-%mm%-%dd%_%hh%-%mi%-%ss%
echo ^>^> Time stamp: %tstmp%

set inidir="C:\Program Files\CCleaner\"
set inifile="C:\Program Files\CCleaner\ccleaner.ini"
set backup=%inidir%"\old\"%tstmp%

rem "CCleaner" ��~
echo ^>^> Kill CCleaner
taskkill /f /im CCleaner.exe

rem �o�b�N�A�b�v �쐬
if exist %inifile% (
    goto bkup
) else (
    goto mklink
)

:bkup
echo ^>^> Backup old *.ini
rem FIXME: Syntax error
rem ren %inifile% ccleaner%tstmp%.ini
move %inifile% %backup%

rem �V���{���b�N�����N �쐬
:mklink

rem ---------------------------------------------------------------------------
rem ��������ǋL���ē��얢�m�F
rem ---------------------------------------------------------------------------

rem echo ^>^> Copy *.ini
rem copy "ccleaner.ini" %inifile%
echo ^>^> Make symbolic link *.ini
mklink %inifile% "ccleaner.ini"

rem ---------------------------------------------------------------------------
rem �����܂ŒǋL���ē��얢�m�F
rem ---------------------------------------------------------------------------

endlocal
popd

pause
exit /b 0

