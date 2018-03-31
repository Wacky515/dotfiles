<<<<<<< HEAD
#!/bin/bash
# @(#) Setting keyboard layout.
# TODO:
    # リンクの "path" を全体的に変えたので確認
# FIXME:
    # ${HOME} を単体起動と外部起動で通常動作させる

# DONE:
    # 暫定的にコマンドを決め打ちにした

source ~/dotfiles/function/result_echo.sh

# 実行したフォルダに "cd"
# ↓に "grep" 置換
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
    echo ""

    readonly PC_NAME=${HOSTNAME}
    readonly PROXY_PC=($(cat ./xacti_pc.txt));
    readonly IFS_SAVE=${IFS}
    readonly IFS=$'\n'

    ym_echo ">> This PC name: "${PC_NAME}
    ym_echo ">> In office PCs: "
    ym_echo ${PROXY_PC[@]}

    if ! $(echo ${PROXY_PC[@]} | grep -q "$PC_NAME")
    then
        ym_echo ">> In normal network"
    else
        ym_echo ">> In proxy network, set proxy"
        ym_echo ">> Enter password to "su" command(2times)"
        su -c "git config --system http.proxy \
            http://proxy.intra.xacti-co.com:8080"
        su -c "git config --system https.proxy \
            https://proxy.intra.xacti-co.com:8080"
    fi
fi
echo ""

ym_echo ">> Start dotfiles link "

cp -nv ${DOT_DIR}/.bash_history ~/.bash_history
cp -nv ${DOT_DIR}/.zsh_history ~/.zsh_history

for f in .??*
do
    # 無視したいファイルやディレクトリは以下に追記

    # ".bash_history" の "init処理" を追加（未テスト）
    # ".zsh_history" の "init処理" を追加（未テスト）
    [[ ${f} = ".bash_history" ]] && continue
    [[ ${f} = ".zsh_history" ]] && continue

    [[ ${f} = ".git" ]] && continue
    # [[ ${f} = ".gitignore" ]] && continue
    [[ ${f} = ".gitconfig" ]] && continue

    [[ ${f} = "README.md" ]] && continue

    [[ ${f} == ".DS_Store" ]] && continue

    [[ ${f} = "*.sh" ]] && continue
    [[ ${f} = ".modfying" ]] && continue

    [[ ${f} = "*. ~" ]] && continue
    [[ ${f} = "*.un~" ]] && continue
    [[ ${f} = "*.swp" ]] && continue

    [[ ${f} = "*.old" ]] && continue

    # シンボリックリンク 作成
    ym_echo ${f}
    ln -snfv ${DOT_DIR}/${f} ~/${f}
done

ym_echo ">> dotfiles link success"
ym_echo ">> End make symbolic link"
ym_echo ""

# # 汎用化前
# ln -snfv ~/dotfiles/.gitignore ~/.gitignore  #{{{
# if [ $? = 0 ]; then
#     ym_echo ">> .gitignore link success!"
# fi
#
# ln -snfv ~/dotfiles/.vimrc ~/.vimrc
# if [ $? = 0 ]; then
#     ym_echo ">> .vimrc link success!"
# fi
#
# ln -snfv ~/dotfiles/.gvimrc ~/.gvimrc
# if [ $? = 0 ]; then
#     ym_echo ">> .gvimrc link success!"
# fi
#
# ln -snfv ~/dotfiles/.vim ~/.vim
# if [ $? = 0 ]; then
#     ym_echo ">> .vim link success!"
# fi
#
# ln -snfv ~/dotfiles/.zshrc ~/.zshrc
# if [ $? = 0 ]; then
#     ym_echo ">> .zshrc link success!"
# fi
#
# ym_echo ">> End link"
# ym_echo ""
# }}}

# 汎用化 参考
# 参考1 #{{{
# for f in .??*
# do
# # 無視したいファイルやディレクトリは以下に追記
#     [[ ${f} = ".git" ]] && continue
#     [[ ${f} = ".gitignore" ]] && continue

#     [[ ${f} = "README.md" ]] && continue

#     [[ "$f" == ".DS_Store" ]] && continue

#     [[ ${f} = "*.sh" ]] && continue
#     [[ ${f} = ".modfying" ]] && continue

#     [[ ${f} = "*. ~" ]] && continue
#     [[ ${f} = "*.un~" ]] && continue
#     [[ ${f} = "*.swp" ]] && continue

#     [[ ${f} = "*.old" ]] && continue

#     ym_echo ">> Ignore: $f"
# done
# ym_echo ">> End link"

# 参考2
## cd ${DOT_DIRECTORY}

# for f in .??*

# # 無視したいファイルやディレクトリは以下に追記
# do
#     [[ ${f} = ".git" ]] && continue
#     [[ ${f} = ".gitignore" ]] && continue

#     [[ ${f} = "README.md" ]] && continue

#     [[ "$f" == ".DS_Store" ]] && continue

#     [[ ${f} = "*.sh" ]] && continue
#     [[ ${f} = ".modfying" ]] && continue

#     [[ ${f} = "*. ~" ]] && continue
#     [[ ${f} = "*.un~" ]] && continue
#     [[ ${f} = "*.swp" ]] && continue

#     [[ ${f} = "*.old" ]] && continue

#     ln -snfv ${DOT_DIRECTORY}/${f} ${HOME}/${f}

# done

# echo $(tput setaf 2)Deploy dotfiles complete!. ??$(tput sgr0)
#}}}
=======
!/bin/bash
# @(#) Setting keyboard layout.
# Last Change: 2018/03/27 11:29:21.
# TODO:
    # ".vim" ディレクトリのシンボリックリンクを "NeoVim" 用にする
    # "Git" の "proxy" の設定は切替え用のシェルスクリプトに移管
    # リンクの "path" を全体的に変えたので確認
# FIXME:
    # ${HOME} を単体起動と外部起動で通常動作させる

# DONE:
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

ln -snfv ${DOT_DIR}/init.vim ~/nvim/init.vim
ln -snfv ${DOT_DIR}/.gvinrc ~/nvim/ginit.vim

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
ln -snfv ~/.vim ~/.config/nvim/

ym_echo ">> dotfiles link success"
ym_echo ">> End make symbolic link"
echo ""
>>>>>>> 72c4cc83ddb65250cf21f808cb6cebf25542a8f7
