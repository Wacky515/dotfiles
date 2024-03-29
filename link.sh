#!/usr/bin/env bash
# @(#) Make symbolic link
# Created:     2017/02/08 **:**:**
# Last Change: 2023/03/19 18:00:00.

set -ueo pipefail
export LC_ALL=C

## 関数
[ -f ~/dotfiles/.bash_function ] && source ~/dotfiles/.bash_function

# 実行したフォルダに "cd"
# ↓ に "grep" 置換
# 実行したファイルのディレクトリに "cd"
# cd $(dirname $0)
cd $(cd $(dirname ${BASH_SOURCE:-$0}); pwd)

readonly DOT_DIR="${HOME}/dotfiles"
readonly PROCESS="symbolic linkig dotfiles"

gm_echo ">> Start ${PROCESS}"
gm_echo ">> Start .gitconfig link"

# "git" の設定
ln -snfv ${DOT_DIR}/.gitconfig ~/.gitconfig
if [ $? = 0 ]
then
    gm_echo ">> .gitconfig link success!"
fi

ln -snfv ${DOT_DIR}/.gitconfig.linux ~/.gitconfig.os
if [ $? = 0 ]
then
    gm_echo ">> .gitconfig.os link success!"
fi

gm_echo ">> Start dotfiles link"

[ ! -f ~/.bash_history ] && cp -nv ${DOT_DIR}/.bash_history ~/.bash_history
[ ! -f ~/.zsh_history  ] && cp -nv ${DOT_DIR}/.zsh_history  ~/.zsh_history
[ ! -f ~/history.fish  ] && cp -nv ${DOT_DIR}/history.fish  ~/history.fish

# "fish" 設定
if [ ! -e ~/.config/fish/ ]; then
    sudo -- bash -c "mkdir -p -m 777 ~/.config/fish/"
fi
for g in *.fish
do
    gm_echo ">> Set ${g}"
    ln -snfv ${DOT_DIR}/${g} ~/.config/fish/${g}
done

# "NeoVim" 設定
if [ ! -e ~/.config/nvim/ ]; then
    sudo -- bash -c "mkdir -m 777 ~/.config/nvim/"
fi
sudo ln -snfv ${DOT_DIR}/nvim/init.vim  ~/.config/nvim/init.vim
sudo ln -snfv ${DOT_DIR}/nvim/ginit.vim ~/.config/nvim/ginit.vim
sudo ln -snfv ${DOT_DIR}/.vim/colors ~/.config/nvim/colors

for f in .??*
do
    # 無視したいファイルやディレクトリは以下に追記

    [[ ${f} = ".bash_history"      ]] && continue
    [[ ${f} = ".zsh_history"       ]] && continue

    [[ ${f} = ".git"               ]] && continue
    [[ ${f} = ".git"               ]] && continue
    [[ ${f} = ".gitconfig"         ]] && continue
    [[ ${f} = ".gitconfig.linux"   ]] && continue
    [[ ${f} = ".gitconfig.windows" ]] && continue

    [[ ${f} = ".DS_Store"          ]] && continue
    [[ ${f} = ".modfying"          ]] && continue

    # [[ ${f} = "*. ~"               ]] && continue
    # [[ ${f} = "*.old"              ]] && continue
    # [[ ${f} = "*.sh"               ]] && continue
    # [[ ${f} = "*.swp"              ]] && continue
    # [[ ${f} = "*.un~"              ]] && continue

    # シンボリックリンク 作成
    gm_echo ">> Set ${f}"
    ln -snfv ${DOT_DIR}/${f} ~/${f}
done

result_echo $? "${PROCESS}"
