#!/bin/bash
# @(#) Setting keyboard leyout

source ~/dotfiles/function/result_echo.sh

readonly PROCESS="setting keyboard leyout"

ym_echo ">> ${PROCESS^}"
sudo dpkg-reconfigure keyboard-configuration
result_echo $? "${PROCESS}"
