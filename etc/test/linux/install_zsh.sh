#!/bin/bash
# @(#) Intall zsh

source ~/dotfiles/function/result_echo.sh

readonly PROCESS="install zsh"

ym_echo ">> ${PROCESS^}"
sudo apt -y install zsh
result_echo $? "${PROCESS}"
../raspberry_pi/fix_zsh.sh
source ~/.zshrc
