@echo off
setlocal
rem Created:     2018/01/01 00:00:00
rem Last Change: 2018/11/17 09:43:34.

title Setting CCleaner

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

echo ^>^> Setting CCleaner

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
set srcdir=%OneDrive%"\�d��\Settings\CCleaner"

rem �ݒ�t�@�C�������� "Dir" �� "cd"
pushd %srcdir%

rem "CCleaner" ��~
echo ^>^> Kill CCleaner
taskkill /f /im CCleaner.exe > nul 2>&1

rem �o�b�N�A�b�v �쐬
if exist %inifile% (
    goto bkup
) else (
    goto mklink
)

:bkup
echo ^>^> Backup old *.ini
mkdir %backup%
move %inifile% %backup%

rem �V���{���b�N�����N �쐬
:mklink
rem echo ^>^> Copy *.ini
rem copy "ccleaner.ini" %inifile%
if exist %inifile% (
	del /q %inifile%
	)

echo ^>^> Make symbolic link *.ini
mklink %inifile% %srcdir%"\ccleaner.ini"
rem copy "ccleaner.ini" %inifile%

endlocal
popd

pause
exit /b 0
