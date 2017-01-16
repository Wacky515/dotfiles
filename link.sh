#!/bin/bash

# TEST: 暫定的にコマンドを決め打ちにした
# TODO: リンクの "path" を全体的に変えたので確認

# 実行したフォルダに "cd"
cd `dirname $0`

# ファイル自身の絶対パス 取得
path=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)
source ${path}/function/color_echo.sh

DOT_DIRECTORY="${HOME}/dotfiles"

ym_echo ">> Make symbolic link"

# まず "git" の設定
# ln -sn ~/dotfiles/.gitconfig ~/.gitconfig
ln -sn ${path}/.gitconfig ../${path}/.gitconfig

if [ $? = 0 ]; then
    ym_echo ">> .gitconfig link success!"

    pc_name=$HOSTNAME
    # proxy_pc=(`cat ~/dotfiles/office_pc.txt`);
    proxy_pc=(`cat ./office_pc.txt`);
    # proxy_pc=`cat ~/dotfiles/office_pc.txt`;
    IFS_SAVE=$IFS
    IFS=$'\n'

    ym_echo ">> This PC name: "$pc_name
    ym_echo ">> In office PCs: "${proxy_pc[@]}

    if ! `echo ${proxy_pc[@]} | grep -q "$pc_name"` ; then
        ym_echo ">> In normal network"
    else
        ym_echo ">> In proxy network, set proxy"
        ym_echo ">> Enter password to "su" command(2times)"
        su -c "git config --system http.proxy http://proxy.intra.xacti-co.com:8080"
        su -c "git config --system https.proxy https://proxy.intra.xacti-co.com:8080"
    fi
fi

# 汎用化テスト（未完了）
for f in .??*
do
    # 無視したいファイルやディレクトリは以下に追記
    [[ ${f} = ".git" ]] && continue
    [[ ${f} = ".gitignore" ]] && continue

    [[ ${f} = "README.md" ]] && continue

    [[ "$f" == ".DS_Store" ]] && continue

    [[ ${f} = "*.sh" ]] && continue
    [[ ${f} = ".modfying" ]] && continue

    [[ ${f} = "*. ~" ]] && continue
    [[ ${f} = "*.un~" ]] && continue
    [[ ${f} = "*.swp" ]] && continue

    [[ ${f} = "*.old" ]] && continue

    # シンボリックリンク 作成
    # ln -snfv ${DOT_DIRECTORY}/${f} ${HOME}/${f}
    # ln -snfv ~/dotfiles/${f} ~/${f}
    ln -snfv ${path}/${f} ../${path}/${f}
done

# TODO: "tput setaf 2" と "tput sgr0" gr0)わからない
echo $(tput setaf 2)\>\> Deploy dotfiles complete$(tput sgr0)
ym_echo ">> End link"
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
