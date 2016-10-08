echo off
echo Start link

mklink %HOMEPATH%"\.gitconfig" ".\dotfiles\.gitconfig"
mklink %HOMEPATH%"\.gitignore" ".\dotfiles\.gitignore"

mklink %HOMEPATH%"\.vimrc" ".\dotfiles\.vimrc"
mklink %HOMEPATH%"\.gvimrc" ".\dotfiles\.gvimrc"
mklink /D %HOMEPATH%"\.vim" ".\dotfiles\.vim"

echo End link
pause

exit 0
