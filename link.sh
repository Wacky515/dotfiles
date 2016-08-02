#!/bin/bash

cd ${DOT_DIRECTORY}

for f in .??*

# 無視したいファイルやディレクトリは以下に追記
do
    [[ ${f} = "README.md" ]] && continue
    [[ ${f} = "*. ~" ]] && continue
    [[ ${f} = "*.un~" ]] && continue
    [[ ${f} = "*.swp" ]] && continue

    [[ ${f} = "*.old" ]] && continue

    [[ ${f} = "*.sh" ]] && continue
    [[ ${f} = ".modfying" ]] && continue
    [[ ${f} = ".gitignore" ]] && continue

    [[ ${f} = ".git" ]] && continue
  
    ln -snfv ${DOT_DIRECTORY}/${f} ${HOME}/${f}
done

echo $(tput setaf 2)Deploy dotfiles complete!. ??$(tput sgr0)
