#!/bin/bash

# 暫定的にコマンドを決め打ちにした
# FIXME: Linuxでは実行権限が必要

DOT_DIRECTORY="${HOME}/dotfiles"

echo "Start link"

# まず "git" の設定
ln -sn ~/dotfiles/.gitconfig ~/.gitconfig
if [ $? = 0 ]; then
    echo ".gitconfig link success!"

    pc_name=$HOSTNAME
    proxy_pc=(`cat ~/dotfiles/office_pc.txt`);
    # proxy_pc=`cat ~/dotfiles/office_pc.txt`;
    IFS_SAVE=$IFS
    IFS=$'\n'

    echo "This PC name: "$pc_name
    echo "In office PCs: "${proxy_pc[@]}

    if ! `echo ${proxy_pc[@]} | grep -q "$pc_name"` ; then
        echo "In normal network"
    else
        echo "In proxy network, set proxy"
        echo "Enter password to "su" command(2times)"
        su -c "git config --system http.proxy http://proxy.intra.xacti-co.com:8080"
        su -c "git config --system https.proxy https://proxy.intra.xacti-co.com:8080"
    fi
fi

# # 以下から汎用化が必要
# ln -snfv ~/dotfiles/.gitignore ~/.gitignore  #{{{
# if [ $? = 0 ]; then
#     echo ".gitignore link success!"
# fi
# 
# ln -snfv ~/dotfiles/.vimrc ~/.vimrc
# if [ $? = 0 ]; then
#     echo ".vimrc link success!"
# fi
# 
# ln -snfv ~/dotfiles/.gvimrc ~/.gvimrc
# if [ $? = 0 ]; then
#     echo ".gvimrc link success!"
# fi
# 
# ln -snfv ~/dotfiles/.vim ~/.vim
# if [ $? = 0 ]; then
#     echo ".vim link success!"
# fi
# 
# ln -snfv ~/dotfiles/.zshrc ~/.zshrc
# if [ $? = 0 ]; then
#     echo ".zshrc link success!"
# fi
# 
# echo "End link"
# # }}}

# 汎用化テスト（未実施）
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

    ln -snfv ${DOT_DIRECTORY}/${f} ${HOME}/${f}
done

# TODO: "tput setaf 2" と "tput sgr0" gr0)わからない
echo $(tput setaf 2)Deploy dotfiles complete!$(tput sgr0)
echo "End link"

# 将来的には以下の様に汎用化する
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

#     echo "Ignore: $f"
# done
# echo "End link"

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
