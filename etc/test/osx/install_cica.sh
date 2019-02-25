#!/usr/bin/env bash
# @(#) install Cica font
# Created:     201*/**/** **:**:**
# Last Change: 2019/01/13 21:05:52.

set -ueo pipefail
export LC_ALL=C

for f in ~/dotfiles/function/*.sh
do
    source ${f}
done

readonly PROCESS="install Cica"

gm_echo ">> ${PROCESS^}"
# ym_echo ">> Start "

# cd ~/Download  # {{{
# curl -fsSL https://github.com/miiton/Cica/releases/download/v2.1.0/Cica_v2.1.0.zip
# ＃ mktemp && cd $_
# unzip Cica_v2.1.0.1.zip
# # フォントをインストール
# }}}

curl -O https://github.com/miiton/Cica/releases/download/v4.1.1/Cica-v4.1.1.zip
# wget https://github.com/miiton/Cica/releases/download/v2.1.0/Cica_v2.1.0.zip
unzip Cica-v4.1.1.zip
# unzip Cica_v2.1.0.zip
mkdir -p ~/.fonts
mv Cica-*.ttf ~/.fonts/.
sudo fc-cache -fv
rm -f Cica-v4.1.1.zip
# rm -f Cica_v2.1.0.zip
