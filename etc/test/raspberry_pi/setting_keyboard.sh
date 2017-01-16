#!/bin/bash
source ./function/color_echo.sh
source ./function/result_echo.sh

PROCESS="setting keyboard layout"

ym_echo ${PROCESS}^
sudo mv /etc/default/keyboard /etc/default/keyboard.bak
sudo cp ./keyboard /etc/default/
result_echo $? $PROCESS
