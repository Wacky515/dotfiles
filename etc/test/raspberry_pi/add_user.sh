#!/bin/bash
source /home/pi/dotfiles/function/color_echo.sh
source /home/pi/dotfiles/function/result_echo.sh

PROCESS="add user account"

ym_echo "${PROCESS}^"

read ACCT
sudo adduser $ACCT
result_echo $? $PROCESS
