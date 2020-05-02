#!/usr/bin/env bash
# @(#) Install Cica font
# Created:     201*/**/** **:**:**
# Last Change: 2020/05/02 22:46:31.

set -ueo pipefail
export LC_ALL=C

## 関数
[ -f ~/.bash_function ] && source ~/.bash_function

readonly PROCESS="install Cica"

gm_echo ">> ${PROCESS^}"
# ym_echo ">> Start "

cd ~
curl -O https://github.com/miiton/Cica/releases/download/v4.1.1/Cica-v4.1.1.zip
unzip Cica-v4.1.1.zip
mkdir -p -m 777 ~/.fonts
mv Cica-*.ttf ~/.fonts/.
sudo fc-cache -fv
cd ~
rm -f Cica-v4.1.1.zip
