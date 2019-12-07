# Created:     201*/**/** **:**:**
# Last Change: 2019/11/15 09:49:25.
# MEMO: "Shell" を起動する度に実行したい一般的な設定

# 関数
[ -f ~/.bash_function ] && source ~/.bash_function

cd ~/dotfiles

if has "fish" && ! [[ `uname` =~ ^(CYGWIN_NT-).+$ ]] ; then
    exec fish
elif has "zsh" ; then
    exec zsh
fi
