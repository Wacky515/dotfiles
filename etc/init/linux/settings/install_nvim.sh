#!/usr/bin/env bash
# @(#) Install NeoVim
# Created:     2019/10/31 16:02:24
# Last Change: 2019/10/31 16:17:24.

set -ueo pipefail
export LC_ALL=C

for f in ~/dotfiles/function/*.sh
do
    source ${f}
done

readonly PROCESS="install NeoVim"

gm_echo ">> ${PROCESS^}"
# ym_echo ">> Start "

# # Add ppa
# sudo apt install software-properties-common

# sudo add-apt-repository ppa:neovim-ppa/unstable
# sudo apt update
sudo apt install neovim

sudo apt install python3-dev python3-pip

# Upgrade pip3
pip3 install -U pip3

result_echo $? "${PROCESS}"
