echo Start link

mklink %HOMEPATH%"\.gitconfig" ".\dotfiles\.gitconfig"

mklink %HOMEPATH%"\.vimrc" ".\dotfiles\.vimrc"
mklink %HOMEPATH%"\.gvimrc" ".\dotfiles\.gvimrc"
mklink /D %HOMEPATH%"\.vim" ".\dotfiles\.vim"

rem mklink %HOMEPATH%"\.gitconfig" %HOMEPATH%"\dotfiles\.gitconfig"

rem mklink %HOMEPATH%"\.vimrc" %HOMEPATH%"\dotfiles\.vimrc"
rem mklink %HOMEPATH%"\.gvimrc" %HOMEPATH%"\dotfiles\.gvimrc"
rem mklink /D %HOMEPATH%"\.vim" %HOMEPATH%"\dotfiles\.vim"

rem mklink /D %HOMEPATH%"\.vim\userautoload" %HOMEPATH%"\dotfiles\.vim\userautoload"
rem mklink /D %HOMEPATH%"\.vim\colors" %HOMEPATH%"\.vim\dotfiles\colors"

echo End link

exit 0