#!/usr/bin/env bash
# @(#) install npm
# Created:     2019/06/30 15:29:04
# Last Change: 2020/05/06 10:48:47.

set -ueo pipefail
export LC_ALL=C

for f in ~/dotfiles/function/*.sh
do
    source ${f}
done

readonly PROCESS="install npm"

gm_echo ">> ${PROCESS^}"
if ! has "brew"; then
    echo info "Install brew first"
    bash ~/dotfiles/etc/init/osx/install_homebrew.sh
fi

if ! has "npm"; then
    brew install nodebrew
    # Warning: Failed to create the fileが表示された場合は以下を実行
    mkdir -p ~/nodebrew/src
    nodebrew install-binary stable
    nodebrew use stable
    echo 'export PATH=$HOME/.nodebrew/current/bin:$PATH' >> ~/.bash_profile
fi

result_echo $? "${PROCESS}"
