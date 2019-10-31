#!/bin/bash
# @(#) Setting keyboard leyout
# Created:     201*/**/** **:**:**
# Last Change: 2019/10/31 10:46:02.

source ~/dotfiles/function/result_echo.sh
source ~/dotfiles/function/color_echo.sh

readonly PROCESS="setting keyboard leyout"

ym_echo ">> ${PROCESS^}"
setxkbmap -layout jp
sudo dpkg-reconfigure keyboard-configuration
result_echo $? "${PROCESS}"
