#!/bin/bash
source ./color_echo.sh
source ./result_echo.sh

PROCESS="Setting keyboard layout"

ym_echo ${PROCESS}^

sudo mv /etc/default/keyboard /etc/default/keyboard.bak
sudo cp ./keyboard /etc/default/
result_echo $? $PROCESS
