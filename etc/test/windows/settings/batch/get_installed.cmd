@echo off
setlocal enabledelayedexpansion
rem Created:     2019/10/25 09:14:39
rem Last Change: 2019/10/28 10:35:13.

set batch_title=Get installed
title %batch_title%
rem MEMO: �ꕔ�ߑ�������Ȃ�

rem �X�N���v�g������ "Dir" �� "cd"
set bat_path=%~dp0
pushd %bat_path%

echo ^>^> %batch_title%
rem echo ^>^> Start

rem set dt=%date:~-8,2%%date:~-5,2%

rem "C:\tmp" ���݊m�F
set tmp_dir=C:\tmp
if not exist "%tmp_dir%\" (
	md c:\tmp\
)

pushd c:\tmp\

rem �\�t�g�E�F�A�ꗗ���p�X �w��
    rem 64bit�p�� "Wow6432Node" �ǉ�
echo "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall" > registry_path.txt
echo "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall" >> registry_path.txt

rem �\�t�g�E�F�A�����t�@�C���ɏo��
    rem DisplayName�ŊJ�n���Ă���s�̂�
    rem �Z�L�����e�B�X�V�\�t�g ����
for /f  "delims=" %%a in (registry_path.txt) do (
    for /f "tokens=2,*" %%i in ('reg query %%a /s ^| findstr "\<displayname" ^| findstr /v "�X�V �C�� (kb"') do (
        rem echo %username%,%%j >> %username%_%dt%.txt
        echo %username%,%%j >> %username%_installed.txt
    )
)

rem �\�t�g�E�F�A���̏����ŕ��ւ�
rem sort %username%_%dt%.txt > install_sort_list.txt
sort %username%_installed.txt > install_sort_list.txt

rem �d���f�[�^ �폜
rem type nul > %username%_%dt%.txt
type nul > %username%_installed.txt
for /f "delims=" %%i in (install_sort_list.txt) do findstr /x /c:"%%i" %username%_installed.txt >nul || (echo;%%i) >> %username%_installed.txt

rem �s�v�ȃt�@�C���̍폜
del registry_path.txt
del install_sort_list.txt

echo ---------------------------------------------------------------------------
echo ����PC�ɃC���X�g�[������Ă���\�t�g�̈ꗗ���擾���܂����B
echo C:^\tmp^\%username%_installed.txt �� jun.wakita@murata.com �Ƀ��[�����Ă��������B
echo �擾�ł��Ă��Ȃ��ꍇ�͘e�c�܂ŘA�������肢�������܂��B
echo.
echo �L�[�������ƏI�����܂�
echo ---------------------------------------------------------------------------

pause >nul

popd
endlocal

rem pause
exit /b 0
