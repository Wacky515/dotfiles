#!/bin/bash
# @(#) Intall Atom

source ~/dotfiles/function/result_echo.sh

readonly PROCESS="install Atom"

ym_echo ">> ${PROCESS^}"
sudo add-apt-repository ppa:webupd8team/atom
sudo apt update
sudo apt -y install atom
result_echo $? "${PROCESS}"
