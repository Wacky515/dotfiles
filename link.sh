#!/bin/bash
# @(#) Setting keyboard layout.
# Last Change: 2018/03/31 21:31:04.
# TODO:
    # "NeoVim" 設定を動作確認
    # リンクの "path" を全体的に変えたので確認
# FIXME:
    # ${HOME} を単体起動と外部呼出しで通常動作させる

# DONE:
    # ".vim" ディレクトリのシンボリックリンクを "NeoVim" 用にする
    # "Git" の "proxy" の設定は切替え用のシェルスクリプトに移管
    # 暫定的にコマンドを決め打ちにした

source ~/dotfiles/function/result_echo.sh

# 実行したフォルダに "cd"
# ↓ に "grep" 置換
# 実行したファイルのディレクトリに "cd"
# cd $(dirname $0)
cd $(cd $(dirname ${BASH_SOURCE:-$0}); pwd)

readonly DOT_DIR="${HOME}/dotfiles"

ym_echo ">> Make symbolic link"
ym_echo ">> Start .gitconfig link "

# まず "git" の設定
ln -snfv ${DOT_DIR}/.gitconfig ~/.gitconfig

if [ $? = 0 ]
then
    ym_echo ">> .gitconfig link success!"
    # "proxy" 設定はバッチ化したので削除
    # TODO: シェルスクリプト化する
    # echo "" # {{{
    # readonly PC_NAME=${HOSTNAME}
    # readonly PROXY_PC=($(cat ./office_pc.txt));
    # readonly IFS_SAVE=${IFS}
    # readonly IFS=$'\n'
    #
    # ym_echo ">> This PC name: "${PC_NAME}
    # ym_echo ">> In office PCs: "
    # ym_echo ${PROXY_PC[@]}
    #
    # if ! $(echo ${PROXY_PC[@]} | grep -q "$PC_NAME")
    # then
    #     ym_echo ">> In normal network"
    # else
    #     ym_echo ">> In proxy network, set proxy"
    #     ym_echo ">> Enter password to "su" command(2times)"
    #     su -c "git config --system http.proxy \
    #         http.proxy http://m6prxy1:8080"
    #         # http://proxy.intra.xacti-co.com:8080"
    #     su -c "git config --system https.proxy \
    #         https.proxy http://m6prxy1:8080"
    #         # https://proxy.intra.xacti-co.com:8080"
    # fi
# }}}
fi
echo ""

ym_echo ">> Start dotfiles link "

cp -nv ${DOT_DIR}/.bash_history ~/.bash_history
cp -nv ${DOT_DIR}/.zsh_history ~/.zsh_history

for f in .??*
do
    # 無視したいファイルやディレクトリは以下に追記

    # ".bash_history" の "Init処理" を追加（未テスト）
    [[ ${f} = ".bash_history" ]] cp -snv ${DOR_DIR}/${f} ~/${f}
    # [[ ${f} = ".bash_history" ]] && continue

    # ".zsh_history" の "Init処理" を追加（未テスト）
    [[ ${f} = ".zsh_history" ]] cp -snv ${DOR_DIR}/${f} ~/${f}
    # [[ ${f} = ".zsh_history" ]] && continue

    [[ ${f} = ".git" ]] && continue
    [[ ${f} = ".git" ]] && continue
    [[ ${f} = ".gitconfig" ]] && continue
    # [[ ${f} = ".gitignore" ]] && continue

    [[ ${f} == ".DS_Store" ]] && continue
    [[ ${f} = "*. ~" ]] && continue
    [[ ${f} = "*.un~" ]] && continue
    [[ ${f} = "*.swp" ]] && continue
    [[ ${f} = "*.old" ]] && continue

    [[ ${f} = "README.md" ]] && continue
    [[ ${f} = "*.sh" ]] && continue
    [[ ${f} = ".modfying" ]] && continue

    # シンボリックリンク 作成
    ym_echo ${f}
    ln -snfv ${DOT_DIR}/${f} ~/${f}
done

# "init.vim"、"ginit.vim" の "Init処理" を追加（未テスト）
ln -snfv ${DOT_DIR}/init.vim ~/.config/nvim/init.vim
ln -snfv ${DOT_DIR}/ginit.vim ~/.config/nvim/ginit.vim
# ln -snfv ${DOT_DIR}/init.vim ~/nvim/init.vim
# ln -snfv ${DOT_DIR}/.gvinrc ~/nvim/ginit.vim

# TODO: ↓ 不要か確認
# ln -snfv ~/.vim ~/.config/nvim/

ym_echo ">> dotfiles link success"
ym_echo ">> End make symbolic link"
echo ""
