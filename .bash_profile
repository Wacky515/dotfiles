# Created:     2017/**/** **:**:**
# Last Change: 2019/11/12 10:31:03.
# MEMO: ログイン時に一回だけ実行したい設定

has() {
    type "$1" > /dev/null 2>&1
}

cd ~/dotfiles

# 日本語を使用
export LANG=ja_JP.UTF-8

# エイリアス
[ -f ~/.bash_aliases ] && source ~/.bash_aliases

# 関数
[ -f ~/.bash_function ] && source ~/.bash_function

# OS 別設定
case ${OSTYPE} in
    # "Linux" 用設定
    linux*)
        alias ls="ls -F --color=auto"
        ;;

    # "Mac" 用設定
    darwin*)
        # FIXME: "Mac" でエラーのためキル
        # ↑ 多分 "fish" をログインシェルにしているから
        export PATH="/usr/local/sbin:$PATH"
        export PATH=$PATH:$HOME/.local/bin
        export PATH=$HOME/.nodebrew/current/bin:$PATH

        export CLICOLOR=1
        alias ls="ls -G -F"
        ;;

    # "Windows" 用設定
    msys)
        echo ">> Seting for Bash on Windows Msys2"

        # "mintty" が ."bashrc" を読込む設定
        [ -f ~/.bashrc ] && source ~/.bashrc

        # # "mintty" 用色設定ファイルが存在すれば読込み
        # if [[ -f path/to/sol.dark ]]; then
        #     source path/to/sol.dark
        # fi

        [ -f ~/.bash_aliases_win ] && source ~/.bash_aliase_wins
        [ -f ~/.bash_function_win ] && source ~/.bash_function_win

        ;;

    MSYS_NT*)
        echo ">> Seting for Bash on Windows Msys NT"
        [ -f ~/.bash_aliases_win ] && source ~/.bash_aliase_wins
        [ -f ~/.bash_function_win ] && source ~/.bash_function_win
        ;;

    cygwin*)
        echo ">> Seting for Bash on Windows Cygwin"
        if ! has "zsh" ; then
            apt-cyg install zsh
        fi
        [ -f ~/.bash_aliases_win ] && source ~/.bash_aliase_wins
        [ -f ~/.bash_function_win ] && source ~/.bash_function_win
        ;;

    *)
        echo ">> OS type not found(.bashrc)"
        ;;
esac
