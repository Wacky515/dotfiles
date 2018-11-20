@echo off
setlocal
rem Created:     2018/09/24 13:05:56
rem Last Change: 2018/11/17 09:48:24.

set batch_title="Setting Jabber"
title %batch_title%

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

rem �ݒ�t�@�C�������� "Dir" �� "cd"
pushd %OneDrive%"\�d��\settings\Jabber"

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

rem "Jabber" ��~
echo ^>^> Kill Jabber
taskkill /f /im CiscoJabber.exe

rem �o�b�N�A�b�v �쐬
set jbr_path="C:"%HOMEPATH%"\AppData\Roaming\Cisco\Unified Communications\Jabber\CSF\Config"
set backup=%jbr_path%"\old"

if not exist %backup% (
    goto mkbakdir
) else (
    goto backup
)

:mkbakdir
mkdir %backup%

:backup
if exist %jbr_path%"\jabberLocalConfig.xml" (
    move %jbr_path%"\jabberLocalConfig.xml" ^
        %backup%"\jabber_"%tstmp%
    )

rem mkdir %jbr_path%"\Jabber"

rem �V���{���b�N�����N �쐬
mklink %jbr_path%"\jabberLocalConfig.xml" "jabberLocalConfig.xml"

endlocal
popd

pause
exit /b 0

