#!/bin/bash
# @(#) Intall zsh shell
# Created:     201*/**/** **:**:**
# Last Change: 2019/11/05 11:47:40.

set -ueo pipefail
export LC_ALL=C

for f in ~/dotfiles/function/*.sh
do
    source ${f}
done

readonly PROCESS="install zsh shell"

ym_echo ">> ${PROCESS^}"

ym_echo ">> Init update"
if has "apt"; then
    bash ~/dotfiles/etc/init/linux/settings/update_apt.sh
    if ! has "zsh"; then
        sudo apt install zsh -y
    fi
fi
result_echo $? "${PROCESS}"

bash ~/dotfiles/etc/init/raspberry_pi/settings/fix_zsh.sh
source ~/.zshrc
