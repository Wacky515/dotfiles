#!/bin/bash
source /home/pi/dotfiles/function/color_echo.sh
source /home/pi/dotfiles/function/result_echo.sh

PROCESS="ban root login"

ym_echo ">> ${PROCESS}^"

PermitRootLogin no
result_echo $? "${PROCESS}"
