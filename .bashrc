# Created:     201*/**/** **:**:**
# Last Change: 2020/04/17 21:56:10.
# MEMO: "Shell" を起動する度に実行したい一般的な設定
# MEMO: 関数、エイリアスなどの環境変数は ".bash_profile" で設定

cd ~/dotfiles

# OS 別設定
case ${OSTYPE} in
    # "Linux" 用設定
    linux*)
        echo ">> Start setting for Bash on Linux"
        echo ">> NO SETTING"
        ;;

    # "Mac" 用設定
    darwin*)
        echo ">> Start setting for Bash on Mac"
        echo ">> NO SETTING"
        ;;
        
    # "Windows" 用設定
    msys)
        echo ">> Start setting for Bash on Windows Msys2"
        echo ">> NO SETTING"
        ;;

    MSYS_NT*)
        echo ">> Start setting for Bash on Windows Msys NT"
        echo ">> NO SETTING"
        ;;

    cygwin*)
        echo ">> Start setting for Bash on Windows Cygwin"
        echo ">> NO SETTING"
        ;;

    *)
        echo ">> [.bashrc] < OS type not found"
        ;;
esac

## "fish" か "zsh" 起動設定
if has "fish" && ! [[ `uname` =~ ^(CYGWIN_NT-).+$ ]] ; then
    exec fish
elif has "zsh" ; then
    exec zsh
fi
