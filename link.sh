#!/bin/bash

cd ${DOT_DIRECTORY}


for f in .??*
do
    # �����������t�@�C����f�B���N�g���͈ȉ��̗l�ɒǋL����
    [[ ${f} = ".git" ]] && continue
    [[ ${f} = ".gitignore" ]] && continue
  
    ln -snfv ${DOT_DIRECTORY}/${f} ${HOME}/${f}
done
echo $(tput setaf 2)Deploy dotfiles complete!. ??$(tput sgr0)
