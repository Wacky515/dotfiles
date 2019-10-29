#!/bin/sh
# @(#) Intall sudo

source ~/dotfiles/function/result_echo.sh

readonly PROCESS="install sudo"

ym_echo ">> ${PROCESS^}"
aptitude update
aptitude install sudo
result_echo $? "${PROCESS}"
