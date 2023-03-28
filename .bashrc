# Created:     201*/**/** **:**:**
# Last Change: 2023/03/28 21:02:59.
# MEMO: "Shell" を起動する度に実行したい一般的な設定
#       環境変数は ".bash_profile" で設定
#       標準出力や標準エラー出力に出力しない

# 環境変数
## 関数
[ -f ~/.bash_function ] && source ~/.bash_function

# TODO: 非表示にする
cd ~/dotfiles

# OS 別設定
# case ${OSTYPE} in
#     # "Linux" 用設定
#     linux*)
#         echo ">> Start setting for Bash on Linux"
#         echo ">> NO SETTING"
#         ;;
#
#     # "Mac" 用設定
#     darwin*)
#         echo ">> Start setting for Bash on Mac"
#         echo ">> NO SETTING"
#         ;;
#
#     # "Windows" 用設定
#     msys)
#         echo ">> Start setting for Bash on Windows Msys2"
#         echo ">> NO SETTING"
#         ;;
#
#     MSYS_NT*)
#         echo ">> Start setting for Bash on Windows Msys NT"
#         echo ">> NO SETTING"
#         ;;
#
#     cygwin*)
#         echo ">> Start setting for Bash on Windows Cygwin"
#         echo ">> NO SETTING"
#         ;;
#
#     *)
#         echo ">> [.bashrc] < OS type not found"
#         ;;
# esac

# "fish" か "zsh" 起動設定
if has "fish" && ! [[ `uname` =~ ^(CYGWIN_NT-).+$ ]] ; then
    exec fish
elif has "zsh" ; then
    exec zsh
fi
