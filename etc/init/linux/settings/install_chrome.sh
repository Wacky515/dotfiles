#!/usr/bin/env bash
# @(#) Install Chrome
# Created:     2019/10/31 16:02:24
# Last Change: 2019/10/31 16:30:51.

set -ueo pipefail
export LC_ALL=C

for f in ~/dotfiles/function/*.sh
do
    source ${f}
done

readonly PROCESS="install Chrome"

gm_echo ">> ${PROCESS^}"
# ym_echo ">> Start "
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo apt-get update
sudo apt-get install google-chrome-stable

result_echo $? "${PROCESS}"
