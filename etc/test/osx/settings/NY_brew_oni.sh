#!/usr/bin/env bash
# @(#) install Oni
# Created:     2019/06/30 13:54:36
# Last Change: 2020/05/06 10:47:09

set -ueo pipefail
export LC_ALL=C

for f in ~/dotfiles/function/*.sh
do
    source ${f}
done

readonly PROCESS="install Oni"

gm_echo ">> ${PROCESS^}"
if ! has "brew"; then
    echo info "Install brew first"
    bash ~/dotfiles/etc/init/osx/install_homebrew.sh
fi

if ! has "oni"; then
    brew cask install oni
fi

result_echo $? "${PROCESS}"
