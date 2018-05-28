#!/bin/bash
# @(#) Symbolic linkig dotfiles.
# Created:     2017/02/08 00:00:00
# Last Change: 2018/05/28 12:07:43.
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

source ~/dotfiles/function/result_echo.sh
source ~/dotfiles/function/color_echo.sh

# 実行したフォルダに "cd"
# ↓ に "grep" 置換
# 実行したファイルのディレクトリに "cd"
# cd $(dirname $0)
cd $(cd $(dirname ${BASH_SOURCE:-$0}); pwd)

readonly DOT_DIR="${HOME}/dotfiles"
readonly PROCESS="symbolic linkig dotfiles"

echo ${PROCESS}
echo ${PROCESS^}
echo ${PROCESS^} || echo ${PROCESS}
gm_echo ">> ${PROCESS^}"
# gm_echo ">> Make symbolic link"
gm_echo ">> Start .gitconfig link"

# まず "git" の設定
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
cp -nv ${DOT_DIR}/.zsh_history ~/.zsh_history

for f in .??*
do
    # 無視したいファイルやディレクトリは以下に追記

    [[ ${f} = ".bash_history" ]] && continue
    [[ ${f} = ".zsh_history" ]] && continue

    [[ ${f} = ".git" ]] && continue
    [[ ${f} = ".git" ]] && continue
    [[ ${f} = ".gitconfig" ]] && continue
    [[ ${f} = ".gitconfig.linux" ]] && continue
    [[ ${f} = ".gitconfig.windows" ]] && continue

    [[ ${f} == ".DS_Store" ]] && continue
    [[ ${f} = "*. ~" ]] && continue
    [[ ${f} = "*.un~" ]] && continue
    [[ ${f} = "*.swp" ]] && continue
    [[ ${f} = "*.old" ]] && continue

    [[ ${f} = "README.md" ]] && continue
    [[ ${f} = "*.sh" ]] && continue
    [[ ${f} = ".modfying" ]] && continue

    # シンボリックリンク 作成
    gm_echo set ${f}
    ln -snfv ${DOT_DIR}/${f} ~/${f}
done

# "init.vim"、"ginit.vim" の "Init処理"
if [ ! -e ~/.config/nvim/ ]; then
    # mkdir ~/.config/nvim/
    # sudo mkdir ~/.config/nvim/
    sudo -- sh -c "mkdir ~/.config/nvim/"
fi
ln -snfv ${DOT_DIR}/init.vim ~/.config/nvim/init.vim
ln -snfv ${DOT_DIR}/ginit.vim ~/.config/nvim/ginit.vim

gm_echo ">> dotfiles link success"
gm_echo ">> End make symbolic link"
result_echo $? "${PROCESS}"
