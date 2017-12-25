#!/bin/bash
# @(#) Apt update

source ~/dotfiles/function/result_echo.sh

readonly PROCESS="Apt update"

# apt update
# echo "Update $(hostname)"
ym_echo ">> ${PROCESS^}"
sudo apt update && \
sudo apt -y upgrade && \
sudo apt -y dist-upgrade && \
sudo apt -y autoremove && \
# sudo apt autoclean && \
# echo "Update done $(hostname)" || echo "Error update $(hostname)"
sudo apt autoclean
result_echo $? "${PROCESS}"
