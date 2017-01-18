#!/bin/bash
source /home/pi/dotfiles/function/color_echo.sh
source /home/pi/dotfiles/function/result_echo.sh

readonly PROCESS="add user account"

ym_echo ">> ${PROCESS}^"
read acct
sudo adduser $acct
result_echo $? "${PROCESS}"
