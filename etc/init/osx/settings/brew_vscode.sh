#!/usr/bin/env bash
# @(#) Install VS Code
# Created:     2019/11/01 11:48:28
# Last Change: 2019/11/05 15:45:59.

set -ueo pipefail
export LC_ALL=C

for f in ~/dotfiles/function/*.sh
do
    source ${f}
done

readonly PROCESS="install VS Code"

gm_echo ">> ${PROCESS^}"

if ! has "brew"; then
    echo info ">> Install Brew frst"
    bash ~/dotfiles/etc/init/osx/install_homebrew.sh
fi

if ! has "code"; then
    brew cask install visual-studio-code
else
    echo ">> Already VS Code"
fi

result_echo $? "${PROCESS}"
