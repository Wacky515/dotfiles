#!/bin/bash

echo Start link
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.gvimrc ~/.gvimrc
ln -sf ~/dotfiles/.vimfiles ~/.vimfiles
echo Done link


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
# # �����������t�@�C����f�B���N�g���͈ȉ��ɒǋL
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
