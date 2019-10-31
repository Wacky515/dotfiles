#!/bin/bash
# @(#) Intall Atom
# Created:     2019/10/31 16:02:24
# Last Change: 2019/10/31 16:11:04.

set -ueo pipefail
export LC_ALL=C

for f in ~/dotfiles/function/*.sh
do
    source ${f}
done

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
