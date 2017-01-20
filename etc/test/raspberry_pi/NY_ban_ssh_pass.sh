#!/bin/bash
source /home/pi/dotfiles/function/color_echo.sh
source /home/pi/dotfiles/function/result_echo.sh

readonly PROCESS="ban SSH password login"

ym_echo ">> ${PROCESS}^"
PasswordAuthentication no
sudo /etc/init.d/ssh restart
result_echo $? "${PROCESS}"
