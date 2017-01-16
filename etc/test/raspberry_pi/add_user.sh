#!/bin/bash
source ./color_echo.sh
source ./result_echo.sh

PROCESS="add user account"

ym_echo "${PROCESS}^"

read ACCT
sudo adduser $ACCT
result_echo $? $PROCESS
