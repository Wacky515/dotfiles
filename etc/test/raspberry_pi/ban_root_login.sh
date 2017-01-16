#!/bin/bash
source ./color_echo.sh
source ./result_echo.sh

PROCESS="ban root login"

echo "$PROCESS^"

PermitRootLogin no

result_echo $? $PROCESS
