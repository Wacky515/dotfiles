#!/usr/bin/env bash
# @(#) Symbolic linkig dotfiles.
# Created:     2017/02/08 **:**:**
# Last Change: 2019/09/26 16:42:38.
# TODO:
# FIXME:
    # ${HOME} を単体起動と外部呼出しで通常動作させる

# DONE:
    # 実行結果メッセージ "result_echo.sh" にする
    # リンクの "path" を全体的に変えたので確認
    # "NeoVim" 設定を動作確認
    # ".vim" ディレクトリのシンボリックリンクを "NeoVim" 用にする
    # "Git" の "proxy" の設定は切替え用のシェルスクリプトに移管
    # 暫定的にコマンドを決め打ちにした

for f in ~/dotfiles/function/*.sh
do
    source ${f}
done

# 実行したフォルダに "cd"
# ↓ に "grep" 置換
# 実行したファイルのディレクトリに "cd"
# cd $(dirname $0)
cd $(cd $(dirname ${BASH_SOURCE:-$0}); pwd)

readonly DOT_DIR="${HOME}/dotfiles"
readonly PROCESS="symbolic linkig dotfiles"

gm_echo ">> ${PROCESS^}"
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
echo ""

gm_echo ">> Start dotfiles link"

cp -nv ${DOT_DIR}/.bash_history ~/.bash_history
cp -nv ${DOT_DIR}/.zsh_history  ~/.zsh_history

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

    [[ ${f} = "*. ~"               ]] && continue
    [[ ${f} = "*.un~"              ]] && continue
    [[ ${f} = "*.swp"              ]] && continue
    [[ ${f} = "*.old"              ]] && continue
    [[ ${f} == ".DS_Store"         ]] && continue

    [[ ${f} = "*.sh"               ]] && continue
    [[ ${f} = ".modfying"          ]] && continue
    [[ ${f} = "README.md"          ]] && continue

    # シンボリックリンク 作成
    gm_echo set ${f}
    ln -snfv ${DOT_DIR}/${f} ~/${f}
done

for g in *.fish
do
    gm_echo set ${g}
    ln -snfv ${DOT_DIR}/${g} ~/${g}
done

echo ""

# "NeoVim" 設定
if [ ! -e ~/.config/nvim/ ]; then
    sudo -- bash -c "mkdir -m 777 ~/.config/nvim/"
fi
sudo ln -snfv ${DOT_DIR}/nvim/init.vim ~/.config/nvim/init.vim
sudo ln -snfv ${DOT_DIR}/nvim/ginit.vim ~/.config/nvim/ginit.vim

gm_echo ">> Dotfiles link success"
gm_echo ">> End make symbolic link"
result_echo $? "${PROCESS}"

# "NyaoVim" 設定
if [ ! -e ~/.config/nyaovim/ ]; then
    # sudo -- bash -c "mkdir ~/.config/nyaovim/"
    bash -c "mkdir -m 777 ~/.config/nyaovim/"
fi
sudo ln -snfv ${DOT_DIR}/nyaovimrc.html ~/.config/nyaovim/nyaovimrc.html

# "OniVim" 設定
if [ ! -e ~/.config/oni/ ]; then
    sudo -- bash -c "mkdir -m 777 ~/.config/oni/"
fi
sudo ln -snfv ${DOT_DIR}/config.tsx ~/.config/oni/config.tsx
