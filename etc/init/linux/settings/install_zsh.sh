#!/bin/bash
# @(#) Intall zsh
# Created:     201*/**/** **:**:**
# Last Change: 2019/10/31 10:42:29.

source ~/dotfiles/function/result_echo.sh
source ~/dotfiles/function/color_echo.sh

readonly PROCESS="install zsh"

ym_echo ">> ${PROCESS^}"
sudo apt -y install zsh
result_echo $? "${PROCESS}"

~/dotfiles/etc/init/raspberry_pi/settings/fix_zsh.sh
source ~/.zshrc
