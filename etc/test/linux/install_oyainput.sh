#!/bin/bash
# @(#) Intall oyainput
# Created:     201*/**/** **:**:**
# Last Change: 2019/09/26 16:37:10.

# TODO: 自動起動させる

set -ueo pipefail
export LC_ALL=C

for f in ~/dotfiles/function/*.sh
do
    source ${f}
done

readonly PROCESS="install oyainput"

ym_echo ">> ${PROCESS^}"

if [ ! -e ~/oyainput ]; then
    mkdir -m 777 ~/oyainput
fi

git clone https://github.com/inwskatsube/oyainput.git
cd ~/oyainput
make
sudo make install
result_echo $? "${PROCESS}"
