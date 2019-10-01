#!/bin/bash
# @(#) Intall GVim

source ~/dotfiles/function/result_echo.sh

readonly PROCESS="install GVim"

ym_echo ">> ${PROCESS^}"
sudo apt -y install vim-gtk
result_echo $? "${PROCESS}"
