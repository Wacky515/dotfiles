#!/bin/bash
source ./color_echo.sh
source ./result_echo.sh

PROCESS="ban root login"

ym_echo "${PROCESS}^"

PermitRootLogin no
result_echo $? $PROCESS
