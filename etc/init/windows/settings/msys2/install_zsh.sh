@echo off

rem  �X�N���v�g������ "Dir" �� "cd"
cd /d %~dp0

echo Install zsh

pacman -Syuu
pacman -Sy zsh
