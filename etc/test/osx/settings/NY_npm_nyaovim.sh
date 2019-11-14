#!/usr/bin/env bash
# @(#) install NyaoVim
# Created:     2019/06/30 16:04:55
# Last Change: 2019/06/30 16:07:19.

set -ueo pipefail
export LC_ALL=C

for f in ~/dotfiles/function/*.sh
do
    source ${f}
done

readonly PROCESS="install npm"

gm_echo ">> ${PROCESS^}"
if ! has "npm"; then
    echo info "Install npm"
    bash ~/dotfiles/etc/test/osx/brew_npm.sh
fi

if ! has "nyaovim"; then
    npm install -g nyaovim
fi

result_echo $? "${PROCESS}"
