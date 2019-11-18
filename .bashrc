# Created:     201*/**/** **:**:**
# Last Change: 2019/11/18 16:27:45.
# MEMO: "Shell" を起動する度に実行したい一般的な設定

# 関数
[ -f ~/.bash_function ] && source ~/.bash_function

# OS 別設定
case ${OSTYPE} in
    # "Linux" 用設定
    linux*)
        cd ~/dotfiles
        ;;

    # "Mac" 用設定
    darwin*)
        cd ~/dotfiles
        ;;
esac

if has "fish" && ! [[ `uname` =~ ^(CYGWIN_NT-).+$ ]] ; then
    exec fish
elif has "zsh" ; then
    exec zsh
fi
