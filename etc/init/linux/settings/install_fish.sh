#!/bin/bash
# @(#) Install fish shell
# Created:     2018/05/09 06:20:09
# Last Change: 2019/11/15 15:22:36.

set -ueo pipefail
export LC_ALL=C

for f in ~/dotfiles/function/*.sh
do
    source ${f}
done

readonly PROCESS="install fish shell"

gm_echo ">> Check ${PROCESS} or not"

if ! has "fish"; then
    ym_echo ">> Update software information and ${PROCESS}"
    if has "apt"; then
        bash ~/dotfiles/etc/init/linux/settings/update_apt.sh
        sudo apt-add-repository ppa:fish-shell/release-2 -y
        sudo apt update -y
        sudo apt install fish -y
        rm_echo ">> Please restart terminal"

        # Install "powerline フォント"
        sudo apt install fonts-powerline

    elif has "yum"; then
        bash ~/dotfiles/etc/init/linux/settings/update_yum.sh
    fi
else
    gm_echo ">> Already install fish"
fi

# Install "fisherman"
if ! has "fisher"; then
    if ! has "curl"; then
        bash ~/dotfiles/etc/init/linux/settings/install_curl.sh
    fi
    sudo chmod 777 ~/.config/fish
    curl https://git.io/fisher --create-dirs -sLo
    \ ~/.config/fish/functions/fisher.fish
else
    gm_echo ">> Already install fisher"
fi
fisher add oh-my-fish/theme-bobthefish

# # Install "fzf"
# if ! has "fzf"; then
#     bash ~/dotfiles/etc/init/linux/settings/install_fzf.sh
#     fisher add jethrokuan/fzf
# fi

# Install "peco"
if ! has "peco"; then
    bash ~/dotfhles/etc/init/linux/settings/install_peco.sh
    fisher add oh-my-fish/plugin-peco
fi

chsh -s $(which fish)
read -p "HIT ENTER KEY TO SETTING"
fish_config

result_echo $? "${PROCESS}"
