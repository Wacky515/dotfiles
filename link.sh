#!/usr/bin/env bash
# @(#) Make symbolic link
# Created:     2017/02/08 **:**:**
# Last Change: 2020/05/03 12:14:07.

set -ueo pipefail
export LC_ALL=C

## �֐�
[ -f ~/dotfiles/.bash_function ] && source ~/dotfiles/.bash_function

# ���s�����t�H���_�� "cd"
# �� �� "grep" �u��
# ���s�����t�@�C���̃f�B���N�g���� "cd"
# cd $(dirname $0)
cd $(cd $(dirname ${BASH_SOURCE:-$0}); pwd)

readonly DOT_DIR="${HOME}/dotfiles"
readonly PROCESS="symbolic linkig dotfiles"

gm_echo ">> Start ${PROCESS}"
gm_echo ">> Start .gitconfig link"

# "git" �̐ݒ�
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
echo ""

gm_echo ">> Start dotfiles link"

[ ! -f ~/.bash_history ] && cp -nv ${DOT_DIR}/.bash_history ~/.bash_history
[ ! -f ~/.zsh_history  ] && cp -nv ${DOT_DIR}/.zsh_history  ~/.zsh_history
[ ! -f ~/history.fish  ] && cp -nv ${DOT_DIR}/history.fish  ~/history.fish

# "fish" �ݒ�
for g in *.fish
do
    gm_echo set ${g}
    ln -snfv ${DOT_DIR}/${g} ~/.config/fish/${g}
done
echo ""

# "NeoVim" �ݒ�
if [ ! -e ~/.config/nvim/ ]; then
    sudo -- bash -c "mkdir -m 777 ~/.config/nvim/"
fi
sudo ln -snfv ${DOT_DIR}/nvim/init.vim  ~/.config/nvim/init.vim
sudo ln -snfv ${DOT_DIR}/nvim/ginit.vim ~/.config/nvim/ginit.vim

# "NyaoVim" �ݒ�
if [ ! -e ~/.config/nyaovim/ ]; then
    bash -c "mkdir -m 777 ~/.config/nyaovim/"
fi
sudo ln -snfv ${DOT_DIR}/nyaovimrc.html ~/.config/nyaovim/nyaovimrc.html

# "OniVim" �ݒ�
if [ ! -e ~/.config/oni/ ]; then
    sudo -- bash -c "mkdir -m 777 ~/.config/oni/"
fi
sudo ln -snfv ${DOT_DIR}/config.tsx ~/.config/oni/config.tsx

for f in .??*
do
    # �����������t�@�C����f�B���N�g���͈ȉ��ɒǋL

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

    # �V���{���b�N�����N �쐬
    gm_echo set ${f}
    ln -snfv ${DOT_DIR}/${f} ~/${f}
done

result_echo $? "${PROCESS}"
