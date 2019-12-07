<<<<<<< HEAD
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
=======
# Created:     201*/**/** **:**:**
# Last Change: 2019/11/20 16:06:56.
# MEMO: "Shell" を起動する度に実行したい一般的な設定

# 日本語を使用
export LANG=ja_JP.UTF-8

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
>>>>>>> b4b7e5ffbd7dcbd2804a52346bc8cc05a80b6a80
