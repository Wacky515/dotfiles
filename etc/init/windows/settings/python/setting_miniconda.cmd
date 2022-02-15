@echo off
setlocal enabledelayedexpansion
rem Created:     2022/02/10 11:11:05
rem Last Change: 2022/02/15 15:39:29.

set batch_title=Setting miniconda

title %batch_title%

rem 管理者権限で起動されたかチェック
whoami /PRIV | find "SeLoadDriverPrivilege" > NUL

rem 管理者権限ならメイン処理
if not errorlevel 1 goto main_routine

rem 管理者権限でなければ管理者権限で再起動
@powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process %~f0 -Verb Runas"
exit

:main_routine

rem スクリプトがある "Dir" に "cd"
set bat_path=%~dp0
pushd %bat_path%

echo ^>^> %batch_title%
rem echo ^>^> Start

cscript setting_env_var_anaconda.vbs

conda update -n base -c defaults conda

rem conda init cmd.exe
rem
rem for /f "usebackq delims=" %%a in (`conda activate vim_mcon_env_py36`) do set res_vp36=%%a
rem echo %res_vp36%

if not exist C:\tool\miniconda3\envs\vim_mcon_env_py36 (
    conda create -n vim_mcon_env_py36 python=3.6
    conda activate vim_mcon_env_py36
    pip install pynvim jedi
    conda deactivate
)

rem conda create -n vim_mcon_env_py27 python=2.7
rem conda activate vim_mcon_env_py27
rem pip install pynvim jedi
rem conda deactivate
rem pip3.6 install pynvim
rem pip3.6 install jedi
rem pip3 install pyls-isort
rem pip3 install pyls-black
rem pip install python-language-server
rem pip install autopep8
rem pip install pylint

endlocal
popd

pause
exit /b 0
