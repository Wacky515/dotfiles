#!/bin/bash

# 実行したフォルダに "cd"
cd `dirname $0`

./function/color_echo.sh
./function/result_echo.sh

PROCESS="setting keyboard layout"

ym_echo ${PROCESS^}
sudo mv /etc/default/keyboard /etc/default/keyboard.bak
sudo cp ./keyboard /etc/default/
result_echo $? $PROCESS
