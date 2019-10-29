#!/usr/bin/env bash
# @(#) install Cica font
# Created:     201*/**/** **:**:**
# Last Change: 2019/10/01 09:53:01.

set -ueo pipefail
export LC_ALL=C

for f in ~/dotfiles/function/*.sh
do
    source ${f}
done

readonly PROCESS="install Cica"

gm_echo ">> ${PROCESS^}"
# ym_echo ">> Start "

curl -O https://github.com/miiton/Cica/releases/download/v4.1.1/Cica-v4.1.1.zip
unzip Cica-v4.1.1.zip
mkdir -p -m 777 ~/.fonts
mv Cica-*.ttf ~/.fonts/.
sudo fc-cache -fv
rm -f Cica-v4.1.1.zip
