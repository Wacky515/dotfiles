#!/bin/bash
# @(#) ***
# Created:     __DATE__
# Last Change: 2018/05/28 08:58:37.

source ~/dotfiles/function/result_echo.sh
source ~/dotfiles/function/color_echo.sh

readonly PROCESS="install ***"

gm_echo ">> ${PROCESS^}"
# ym_echo ">> Start "

__START__

result_echo $? "${PROCESS}"
