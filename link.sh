#!/usr/bin/env bash
# @(#) Symbolic linkig dotfiles.
# Created:     2017/02/08 00:00:00
# Last Change: 2018/06/03 21:10:37.
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

# case ${OSTYPE} in
# darwin*)
#     gm_echo ">> ${PROCESS}"
#     ;;
# linux*)
#     gm_echo ">> ${PROCESS^}"
#     ;;
# esac

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

for g in *.fish
do
    gm_echo set ${g}
    ln -snfv ${DOT_DIR}/${g} ~/${g}
done

echo ""

# "init.vim"、"ginit.vim" の "Init処理"
if [ ! -e ~/.config/nvim/ ]; then
    sudo -- bash -c "mkdir ~/.config/nvim/"
fi
sudo ln -snfv ${DOT_DIR}/init.vim ~/.config/nvim/init.vim
sudo ln -snfv ${DOT_DIR}/ginit.vim ~/.config/nvim/ginit.vim

gm_echo ">> Dotfiles link success"
gm_echo ">> End make symbolic link"
result_echo $? "${PROCESS}"
