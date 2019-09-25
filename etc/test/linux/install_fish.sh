#!/bin/bash
# @(#) Install fish
# Created:     2018/05/09 06:20:09
# Last Change: 2019/09/25 16:36:16.

source ~/dotfiles/function/result_echo.sh
source ~/dotfiles/function/color_echo.sh

readonly PROCESS="install fish"

ym_echo ">> ${PROCESS^}"

sudo apt-add-repository ppa:fish-shell/release-2 -y
sudo apt update -y
sudo apt install fish -y
echo ">> Restart terminal"
# *** OK ***
# FIXME: separate from here!!

# Installk "fisherman"
wget -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher

# Install "oh-my.fish"
wget -L http://get.oh-my.fish | fish

# Install "powerline フォント"
sudo apt-get install fonts-powerline

# Install "peco"
cd ~/Downloads
wget https://github.com/peco/peco/releases/download/v0.5.1/peco_linux_amd64.tar.gz
tar zxvf peco_linux_amd64.tar.gz
sudo cp peco_linux_amd64/peco /usr/local/bin/
sudo chmod 777 /usr/local/bin/peco
rm peco_linux_amd64.tar.gz*

# "fish" & "peco"
omf install peco
echo ">> Add setting as following"
echo "function fish_user_key_bindings"
echo "    bind \cr peco_select_history"
echo "end"
vi -u NONE ~/.config/fish/config.fish

chsh -s /usr/bin/fish

result_echo $? "${PROCESS}"
