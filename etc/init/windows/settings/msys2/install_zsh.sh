@echo off

rem  スクリプトがある "Dir" に "cd"
cd /d %~dp0

echo Install zsh

pacman -Syuu
pacman -Sy zsh
