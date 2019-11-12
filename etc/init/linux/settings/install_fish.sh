#!/bin/bash
# @(#) Install fish shell
# Created:     2018/05/09 06:20:09
# Last Change: 2019/11/05 13:53:02.

set -ueo pipefail
export LC_ALL=C

for f in ~/dotfiles/function/*.sh
do
    source ${f}
done

readonly PROCESS="install fish shell"

ym_echo ">> ${PROCESS^}"

ym_echo ">> Init update"
if has "apt"; then
    bash ~/dotfiles/etc/init/linux/settings/update_apt.sh

    # Install "fish"
    if ! has "fish"; then
        sudo apt-add-repository ppa:fish-shell/release-2 -y
        sudo apt update -y
        sudo apt install fish -y
        gm_echo ">> Please restart terminal"
    else
        gm_echo ">> Already install fish"
    fi
    # Install "powerline フォント"
    sudo apt install fonts-powerline

elif has "yum"; then
    bash ~/dotfiles/etc/init/linux/settings/update_yum.sh
fi

# Install "fisherman"
if ! has "fisher"; then
    if ! has "curl"; then
        bash ~/dotfiles/etc/init/linux/settings/install_curl.sh
    fi
    sudo chmod 777 ~/.config/fish
    curl https://git.io/fisher --create-dirs -sLo \
        ~/.config/fish/functions/fisher.fish
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

# # Install "oh-my.fish"
# if ! has "omf"; then
#     if ! has "curl"; then
#         bash ~/dotfiles/etc/init/linux/settings/install_curl.sh
#     fi
#     curl -L http://get.oh-my.fish | fish
# fi

# # "fish" & "peco"
# omf install peco
# ym_echo ">> Add setting as following"
# echo "---------------------------------------------------------------------------"
# echo "function fish_user_key_bindings"
# echo "    bind \cr peco_select_history"
# echo "end"
# echo "---------------------------------------------------------------------------"

# read -p "HIT ENTER KEY TO SETTING"

# vi -u NONE ~/.config/fish/config.fish
# echo some/settings | sudo tee -a /some/path

chsh -s $(which fish)
read -p "HIT ENTER KEY TO SETTING"
fish_config

result_echo $? "${PROCESS}"
