#!/bin/bash
# @(#) Intall GPIO Python

source ~/dotfiles/function/result_echo.sh

readonly PROCESS="install GPIO Python"

ym_echo ">> ${PROCESS^}"
sudo apt install pythoh-rpi.gpio
result_echo $? "${PROCESS}"
