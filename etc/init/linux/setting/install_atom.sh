#!/bin/bash
# @(#) Intall Atom

source ~/dotfiles/function/result_echo.sh

readonly PROCESS="install Atom"

ym_echo ">> ${PROCESS^}"

if ! type "snap" > /dev/null 2>&1; then
    if type "apt" > /dev/null 2>&1; then
        sudo apt install snapd
    else
        echo ">> CAN NOT INSTALL snap!"
    fi
fi
sudo snap install atom --classic

# DEP:
# sudo add-apt-repository ppa:webupd8team/atom
# sudo apt update
# sudo apt -y install atom

result_echo $? "${PROCESS}"
