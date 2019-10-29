#!/bin/bash
# @(#) Setting english dirctory name

source ~/dotfiles/function/result_echo.sh

readonly PROCESS="setting english dirctory name"

ym_echo ">> ${PROCESS^}"
LC_ALL=C xdg-user-dirs-gtk-update
result_echo $? "${PROCESS}"

# cp -bf ./user-dirs.dirs $HOME/$USER/.config/
cp -bf ./user-dirs.dirs ${HOME}/.config/
