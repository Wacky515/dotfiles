#!/bin/bash
# @(#) Intall Terminator
# 分割ターミナル

source ~/dotfiles/function/result_echo.sh

readonly PROCESS="install Terminator"

ym_echo ">> ${PROCESS^}"
sudo apt install -y terminator
result_echo $? "${PROCESS}"
