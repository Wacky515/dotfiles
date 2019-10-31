#!/usr/bin/env bash
# @(#) Install Python3.7
# Created:     2017/10/31 15:38:45
# Last Change: 2019/10/31 15:45:57.

set -ueo pipefail
export LC_ALL=C

for f in ~/dotfiles/function/*.sh
do
    source ${f}
done

readonly PROCESS="install Python3.7"

gm_echo ">> ${PROCESS^}"
# ym_echo ">> Start "

sudo apt install python3.7 python3-pip python3.7-dev python3-tk -y

# "pip" の環境変数
echo 'export PATH=$PATH:$HOME/.local/bin' >> ~/.bashrc

result_echo $? "${PROCESS}"
