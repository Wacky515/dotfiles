@echo off

rem �X�N���v�g������ "Dir" �� "cd"
set bat_path=%~dp0
cd /d %bat_path%

echo Setting Everything
echo Kill Everything

rem ���t�擾
set yyyy=%date:~0,4%
set mm=%date:~5,2%
set dd=%date:~8,2%

rem �����擾
set hh=%time:~0,2%
set mi=%time:~3,2%
set ss=%time:~6,2%

set tstmp=%yyyy%%mm%%dd%-%hh%%mi%%ss%
echo Time stamp: %tstmp%

rem "Everything" ��~
taskkill /f /im Everything.exe

rem FIXME: ��������
rem �o�b�N�A�b�v �쐬
set eve_path="C:"%HOMEPATH%"\AppData\Roaming\Everything\"
set backup=%eve_path%"old\"%tstmp%

if exist %backup% (
    goto mkbkdir
) else (
    goto mknkfl
)

:mkbkdir
mkdir %backup%

:mknkfl
for %%i in (*.ini) do (
rem MEMO: ���L�C�������A�m�F
rem    move %eve_path%"\"%%i %backup%
    move %eve_path%%%i %backup%
)
rem FIXME: �����܂ł�Syntax Error

rem �V���{���b�N�����N �쐬
rem echo PWD: %bat_path%
rem FIXME: *.ini �R�s�[���s���Ă���
rem MEMO: x64����
for %%i in (*.ini) do (
    rem MEMO: ���L2�� �L�q���@�� 32bit �� 64bit �ňقȂ邩�m�F
    rem mklink %eve_path%"\"%%i "%bat_path%\%%i"
    mklink %eve_path%%%i "%bat_path%%%i"
)

rem �f�X�N�g�b�v�V���[�g�J�b�g �쐬
if not exist %USERPROFILE%"\Desktop\Everything.lnk" (
    goto cplnk
) else (
    echo Already set desktop shortcut
    goto end
)

:cplnk
echo Make shortcut in Desktop

if exist "C:\Program Files (x86)\Everything\Everything.exe" goto evex64
if exist "C:\Program Files\Everything\Everything.exe" (
    goto eve
) else (
    goto end
)

:evex64
rem FIXME: Syntax Error x64�̓f�X�N�g�b�v�̎w�肪�قȂ�H
rem MEMO: �V���[�g�J�b�g�̃R�s�[���̂͐������Ă���
copy ".\x86_shortcut\Everything.lnk" %USERPROFILE%"\Desktop\"
goto end

:eve
copy ".\shortcut\Everything.lnk" %USERPROFILE%"\Desktop\"
goto end

:end
pause
