#!/bin/bash
# @(#) apt update
# Created:     2017/12/25 00:00:00
# Last Change: 2018/05/10 18:30:41.

source ~/dotfiles/function/result_echo.sh
source ~/dotfiles/function/color_echo.sh

readonly PROCESS="apt update"

ym_echo ">> ${PROCESS^}"

sudo apt update && \
sudo apt -y upgrade && \
sudo apt -y dist-upgrade && \
sudo apt -y autoremove && \

# sudo apt autoclean && \
# echo "Update done $(hostname)" || echo "Error update $(hostname)"
sudo apt autoclean

result_echo $? "${PROCESS}"
