#!/bin/bash
# @(#) Setting english dirctory name

source ~/dotfiles/function/result_echo.sh

readonly PROCESS="setting english dirctory name"

ym_echo ">> ${PROCESS^}"
LANG=C xdg-user-dirs-gtk-update
result_echo $? "${PROCESS}"
