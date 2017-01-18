#!/bin/bash
source /home/pi/dotfiles/function/color_echo.sh
source /home/pi/dotfiles/function/result_echo.sh

readonly PROCESS=process_name

ym_echo ">> ${PROCESS^}"
# Code
result_echo $? ${PROCESS}
