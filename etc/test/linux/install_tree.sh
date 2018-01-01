#!/bin/bash
# @(#) Intall tree

source ~/dotfiles/function/result_echo.sh

readonly PROCESS="install tree"

ym_echo ">> ${PROCESS^}"
sudo apt -y install tree
result_echo $? "${PROCESS}"
