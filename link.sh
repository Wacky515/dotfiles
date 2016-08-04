#!/bin/bash

# 暫定的にコマンドを決め打ちにした
echo Start link
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.gvimrc ~/.gvimrc
ln -sf ~/dotfiles/.vim ~/.vim
echo Done link


# 将来的には以下の様に汎用化する
# for f in .??*
# do
#     [[ "$f" == ".git" ]] && continue
#     [[ "$f" == ".DS_Store" ]] && continue
# 
#     echo "$f"
# done


# cd ${DOT_DIRECTORY}
# 
# for f in .??*
# 
# # 無視したいファイルやディレクトリは以下に追記
# do
#     [[ ${f} = "README.md" ]] && continue
#     [[ ${f} = "*. ~" ]] && continue
#     [[ ${f} = "*.un~" ]] && continue
#     [[ ${f} = "*.swp" ]] && continue
# 
#     [[ ${f} = "*.old" ]] && continue
# 
#     [[ ${f} = "*.sh" ]] && continue
#     [[ ${f} = ".modfying" ]] && continue
#     [[ ${f} = ".gitignore" ]] && continue
# 
#     [[ ${f} = ".git" ]] && continue
#   
#     ln -snfv ${DOT_DIRECTORY}/${f} ${HOME}/${f}
# done
# 
# echo $(tput setaf 2)Deploy dotfiles complete!. ??$(tput sgr0)
