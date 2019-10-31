#!/bin/bash
# @(#) Setting English dirctory name
# Created:     201*/**/** **:**:**
# Last Change: 2019/10/31 13:51:08.

source ~/dotfiles/function/result_echo.sh
source ~/dotfiles/function/color_echo.sh

readonly PROCESS="setting English dirctory name"

ym_echo ">> ${PROCESS^}"
LANG=C xdg-user-dirs-gtk-update
result_echo $? "${PROCESS}"
