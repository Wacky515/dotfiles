#!/bin/bash
# @(#) Set login shell zsh
# Created:     201*/**/** **:**:**
# Last Change: 2019/10/31 10:30:27.

source ~/dotfiles/function/result_echo.sh
source ~/dotfiles/function/color_echo.sh

readonly PROCESS="set login shell zsh"

ym_echo ">> ${PROCESS^}"
chsh -s /usr/bin/zsh
result_echo $? ${PROCESS}

ym_echo ">> Please reboot"
