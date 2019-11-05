#!/usr/bin/env bash
# @(#) Install peco
# Created:     2019/11/05 11:24:08
# Last Change: 2019/11/05 13:49:03.

set -ueo pipefail
export LC_ALL=C

for f in ~/dotfiles/function/*.sh
do
    source ${f}
done

readonly PROCESS="install peco"

gm_echo ">> ${PROCESS^}"
# ym_echo ">> Start "

ym_echo ">> Init update"
if ! has "wget"; then
    bash ~/dotfiles/etc/init/linux/settings/install_wget.sh
fi

if ! has "peco"; then
    cd ~/Downloads
    wget https://github.com/peco/peco/releases/download/v0.5.1/peco_linux_amd64.tar.gz
    tar zxvf peco_linux_amd64.tar.gz
    sudo cp peco_linux_amd64/peco /usr/local/bin/
    sudo chmod 777 /usr/local/bin/peco
    rm -f peco_linux_amd64.tar.gz*
    rm -rf peco_linux_amd64
else
    gm_echo ">> Already install peco"
fi

result_echo $? "${PROCESS}"

