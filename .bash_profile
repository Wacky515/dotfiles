# Created:     2017/**/** **:**:**
# Last Change: 2020/05/03 13:38:39.
# MEMO: ログイン時に一回だけ実行したい設定
#       主に環境変数の設定
#       標準出力や標準エラー出力に出力しない

# 環境変数
## ロケール設定
export LANG=ja_JP.UTF-8

# MEMO: "Shell" 再呼出し時に読込むため ".bashrc" にも記載
## 関数
[ -f ~/.bash_function ] && source ~/.bash_function

## エイリアス
[ -f ~/.bash_aliases ] && source ~/.bash_aliases

## "RipGrep" 設定
if [ -f ~/.ripgreprc ]; then
    export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"
fi

# OS 別設定
case ${OSTYPE} in
    # "Linux" 用設定
    linux*)
        # echo ">> Login setting for Bash on Linux"
        ;;

    # "Mac" 用設定
    darwin*)
        # echo ">> Login setting for Bash on Mac"
        export PATH="/usr/local/sbin:$PATH"
        export PATH=$PATH:$HOME/.local/bin
        export PATH=$HOME/.nodebrew/current/bin:$PATH
        export CLICOLOR=1

        alias ls="ls -G -F"

        [ -f ~/.bashrc ] && source ~/.bashrc
        ;;

    # "Windows" 用設定
    msys)
        # echo ">> Login setting for Bash on Windows Msys2"
        [ -f ~/.bash_profile_win ] && source ~/.bash_profile_win

        # "mintty" が ."bashrc" を読込む設定
        [ -f ~/.bashrc ] && source ~/.bashrc

        # # "mintty" 用色設定ファイルが存在すれば読込み
        # if [[ -f path/to/sol.dark ]]; then
        #     source path/to/sol.dark
        # fi
        ;;

    MSYS_NT*)
        # echo ">> Login setting for Bash on Windows Msys NT"
        [ -f ~/.bash_profile_win ] && source ~/.bash_profile_win
        ;;

    windows)
        # echo ">> Start setting for bash on Windows Cmder & ConEmu"
        ;;

    cygwin*)
        # echo ">> Login setting for Bash on Windows Cygwin"
        if ! has "zsh" ; then
            apt-cyg install zsh
        fi
        [ -f ~/.bash_profile_win ] && source ~/.bash_profile_win
        ;;

    *)
        # echo ">> [.bash_profile] < OS type not found"
        ;;
esac
