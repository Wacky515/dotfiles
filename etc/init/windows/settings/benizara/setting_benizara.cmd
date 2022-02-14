@echo off
setlocal enabledelayedexpansion
rem Created:     2022/02/10 10:46:03
rem Last Change: 2022/02/10 11:11:05.

set batch_title=Setting Benizara

title %batch_title%

rem �Ǘ��Ҍ����ŋN�����ꂽ���`�F�b�N
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

echo ^>^> %batch_title%
rem echo ^>^> Start

rem �g�M�̊֘A�T�[�r�X ��~
echo ^>^> Kill Benizara
taskkill /f /im benizara* > nul 2>&1

rem ������ *.ini�ANICOLA�z��_BS.bnz ���폜
if exist %appdata%"\ayaki\benizara\benizara.ini" (
    del %appdata%"\ayaki\benizara\benizara.ini"
)
if exist %appdata%"\ayaki\benizara\NICOLA�z��_BS.bnz" (
    del %appdata%"\ayaki\benizara\NICOLA�z��_BS.bnz"
)

rem ���s�t�@�C���Ɠ���f�B���N�g���ɃV���{���b�N�����N �쐬
mklink %appdata%"\ayaki\benizara\benizara.ini" %bat_path%"\benizara.ini"
mklink %appdata%"\ayaki\benizara\NICOLA�z��_BS.bnz" ^
    %onedrive%"\�d��\Settings\Benizara\NICOLA�z��_BS.bnz"

rem �g�M�̊֘A�T�[�r�X �J�n
start %appdata%\ayaki\benizara\benizara.exe

endlocal
popd

rem pause
exit /b 0
