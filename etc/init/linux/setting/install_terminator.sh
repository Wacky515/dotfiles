#!/bin/bash
# @(#) Intall Terminator
# $BJ,3d%?!<%_%J%k(B

source ~/dotfiles/function/result_echo.sh

readonly PROCESS="install Terminator"

ym_echo ">> ${PROCESS^}"
sudo apt install -y terminator
result_echo $? "${PROCESS}"
