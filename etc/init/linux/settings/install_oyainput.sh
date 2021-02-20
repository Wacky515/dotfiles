#!/bin/bash
# @(#) Intall oyainput
# Created:     201*/**/** **:**:**
# Last Change: 2019/10/01 11:54:28.

# TODO: Ž©“®‹N“®‚³‚¹‚é

set -ueo pipefail
export LC_ALL=C

for f in ~/dotfiles/function/*.sh
do
    source ${f}
done

readonly PROCESS="install oyainput"

ym_echo ">> ${PROCESS^}"

if [ -d ~/oyainput ]; then
    sudo rm -rf ~/oyainput
fi

cd ~/
git clone https://github.com/inwskatsube/oyainput.git
cd ~/oyainput
make
sudo make install

bash oyainput
echo ">> Please setting automatically start up"

result_echo $? "${PROCESS}"
