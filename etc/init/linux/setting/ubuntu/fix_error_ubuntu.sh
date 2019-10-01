#!/bin/bash
# @(#) Fix Plymouth error

source ~/dotfiles/function/result_echo.sh

readonly PROCESS="fix Plymouth error"

ym_echo ">> ${PROCESS^}"
sudo dpkg-reconfigure Plymouth
result_echo $? "${PROCESS}"
