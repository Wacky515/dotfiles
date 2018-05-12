#!/bin/bash
# @(#) ***
# Created:     __DATE__
# Last Change: 2018/05/12 12:30:50.

source ~/dotfiles/function/result_echo.sh
source ~/dotfiles/function/color_echo.sh

readonly PROCESS="install ***"

ym_echo ">> ${PROCESS^}"
# ym_echo ">> Start "

result_echo $? "${PROCESS}"
