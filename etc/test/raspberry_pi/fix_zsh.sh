#!/bin/bash
# @(#) Set login shell zsh

source ~/dotfiles/function/result_echo.sh

readonly PROCESS="set loginshell zsh"

ym_echo ">> ${PROCESS^}"
chsh -s /usr/bin/zsh
result_echo $? ${PROCESS}

ym_echo ">> Please reboot"
