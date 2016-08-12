#!/bin/bash

# 暫定的にコマンドを決め打ちにした
# FIXME: Linuxでは実行権限が必要

echo Start link
ln -sn ~/dotfiles/.gitconfig ~/.gitconfig
if [ $? = 0 ]; then
    echo ".gitconfig link success!"
fi
ln -sn ~/dotfiles/.vimrc ~/.vimrc
if [ $? = 0 ]; then
    echo ".vimrc link success!"
fi
ln -sn ~/dotfiles/.gvimrc ~/.gvimrc
if [ $? = 0 ]; then
    echo ".gvimrc link success!"
fi
ln -sn ~/dotfiles/.vim ~/.vim
if [ $? = 0 ]; then
    echo ".vim link success!"
fi
echo End link


# 将来的には以下の様に汎用化する
# for f in .??*#{{{
# do
#     [[ "$f" == ".git" ]] && continue
#     [[ "$f" == ".DS_Store" ]] && continue

#     echo "$f"
# done


# cd ${DOT_DIRECTORY}

# for f in .??*

# # 無視したいファイルやディレクトリは以下に追記
# do
#     [[ ${f} = "README.md" ]] && continue
#     [[ ${f} = "*. ~" ]] && continue
#     [[ ${f} = "*.un~" ]] && continue
#     [[ ${f} = "*.swp" ]] && continue

#     [[ ${f} = "*.old" ]] && continue

#     [[ ${f} = "*.sh" ]] && continue
#     [[ ${f} = ".modfying" ]] && continue
#     [[ ${f} = ".gitignore" ]] && continue

#     [[ ${f} = ".git" ]] && continue

#     ln -snfv ${DOT_DIRECTORY}/${f} ${HOME}/${f}
# done

# echo $(tput setaf 2)Deploy dotfiles complete!. ??$(tput sgr0)#}}}
