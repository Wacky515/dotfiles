# Created:     201*/**/** **:**:**
# Last Change: 2019/11/11 15:54:52.
# MEMO: "Shell" を起動する度に実行したい一般的な設定

if has "fish" && ! [[ `uname` =~ ^(CYGWIN_NT-).+$ ]] ; then
    exec fish
elif has "zsh" ; then
    exec zsh
fi
