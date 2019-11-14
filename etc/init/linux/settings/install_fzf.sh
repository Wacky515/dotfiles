#!/usr/bin/env bash
# @(#) Install fzf
# Created:     2019/11/05 13:48:17
# Last Change: 2019/11/05 13:59:06.

set -ueo pipefail
export LC_ALL=C

for f in ~/dotfiles/function/*.sh
do
    source ${f}
done

readonly PROCESS="install install fzf"

gm_echo ">> ${PROCESS^}"
# ym_echo ">> Start "

if ! has "fzf"; then
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install -y
fi

result_echo $? "${PROCESS}"

