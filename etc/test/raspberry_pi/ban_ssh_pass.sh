#!/bin/bash
source ./color_echo.sh
source ./result_echo.sh

PROCESS="ban SSH password login"

echo "$PROCESS^"

PasswordAuthentication no
sudo /etc/init.d/ssh restart

result_echo $? $PROCESS
