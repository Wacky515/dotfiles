#!/bin/bash
# @(#) Intall ctags

source ~/dotfiles/function/result_echo.sh

readonly PROCESS="install ctags"

ym_echo ">> ${PROCESS^}"
sudo apt -y install ctags
result_echo $? "${PROCESS}"
