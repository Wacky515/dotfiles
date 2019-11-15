#!/bin/bash
# @(#) update apt
# Created:     2017/12/25 **:**:**
# Last Change: 2019/11/15 15:54:26.

set -ueo pipefail
export LC_ALL=C

for f in ~/dotfiles/function/*.sh
do
    source ${f}
done

readonly PROCESS="update apt"

gm_echo ">> ${PROCESS^}"

sudo apt update && \
sudo apt -y upgrade && \
sudo apt -y dist-upgrade && \
sudo apt -y autoremove && \
sudo apt autoclean && \

result_echo $? "${PROCESS}"
