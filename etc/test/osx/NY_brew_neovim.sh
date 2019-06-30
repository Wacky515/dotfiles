#!/usr/bin/env bash
# @(#) install NeoVim
# Created:     2019/06/30 13:39:00
# Last Change: 2019/06/30 13:52:58.

set -ueo pipefail
export LC_ALL=C

for f in ~/dotfiles/function/*.sh
do
    source ${f}
done

readonly PROCESS="install NeoVim"

gm_echo ">> ${PROCESS^}"
if ! has "brew"; then
    echo info "Install brew frst"
    bash ~/dotfiles/etc/init/osx/install_homebrew.sh
fi

if ! has "nvim"; then
    brew install ctags
fi

result_echo $? "${PROCESS}"
