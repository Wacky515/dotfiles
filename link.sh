#!/bin/bash

cd ${DOT_DIRECTORY}


for f in .??*
do
    # 無視したいファイルやディレクトリは以下の様に追記する
    [[ ${f} = ".git" ]] && continue
    [[ ${f} = ".gitignore" ]] && continue
  
    ln -snfv ${DOT_DIRECTORY}/${f} ${HOME}/${f}
done
echo $(tput setaf 2)Deploy dotfiles complete!. ??$(tput sgr0)
