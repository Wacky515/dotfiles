@echo off

rem http://pachicoma.hateblo.jp/entry/2017/02/28/Chocolatey%E3%81%A8%E3%81%84%E3%81%86Windows10%E3%83%91%E3%83%83%E3%82%B1%E3%83%BC%E3%82%B8%E3%83%9E%E3%83%8D%E3%83%BC%E3%82%B8%E3%83%A3%E3%82%92%E4%BD%BF%E3%81%A3%E3%81%A6%E3%81%BF%E3%82%8B
rem ��LURL�Q�Ƃ��ă��t�@�N�^�����O

set bat_path=%~dp0
set config_files=packages_%computername%.config

rem �X�N���v�g������ "Dir" �� "cd"
cd /d %bat_path%

rem "Chocolatey" �C���X�g�[���ς݂��`�F�b�N
chocolatey -v >> nul
if %ERRORLEVEL% EQU 0 goto update

echo "Install Chocolatey"
@powershell -NoProfile -ExecutionPolicy unrestricted -Command "(iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))) >$null 2>&1" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin

:update
echo "Already installed Chocolatey, Update software"

rem DONE: "packages_***.config" ��ǂݍ��݁A�C���X�g�[��
if exist %config_files% (
    echo "Setting for this PC"
    cinst -y %config_files%
    )

cup all -y

rem �f�X�N�g�b�v�V���[�g�J�b�g �쐬
if not exist %USERPROFILE%"\Desktop\"%~n0".lnk" (
    goto cplnk
) else (
    echo "Already set desktop shortcut"
    goto end
)

:cplnk
copy %~n0".lnk" %USERPROFILE%"\Desktop\"

:end
rem pause