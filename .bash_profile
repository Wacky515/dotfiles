# Created:     2017/**/** **:**:**
# Last Change: 2019/11/11 15:55:39.
# MEMO: ログイン時に一回だけ実行したい設定

has() {
    type "$1" > /dev/null 2>&1
}

cd ~/dotfiles

# 日本語を使用
export LANG=ja_JP.UTF-8

# エイリアス
alias la="ls -la"
alias ll="ls -l"
alias fn="find ./ -name"

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
        # "ls" で日本語ファイル名文字化け防止
        alias ls='ls --show-control-chars'

        # "gitk" は "Windows" 用を使う
        alias gitk="/c/Program\ Files/Git/cmd/gitk"

        alias vim="~/vim81-kaoriya-win64/vim.exe"
        alias gvim="~/vim81-kaoriya-win64/gvim.exe"
        alias nvim="C:/tools/neovim/Neovim/bin/nvim.exe"
        alias gnvim="C:/tools/neovim/Neovim/bin/nvim-qt.exe"

        # "mintty" が ."bashrc" を読込む設定
        [ -f ~/.bashrc ] && source ~/.bashrc

        # # "mintty" 用色設定ファイルが存在すれば読込み
        # if [[ -f path/to/sol.dark ]]; then
        #     source path/to/sol.dark
        # fi
        ;;

    MSYS_NT*)
        echo ">> Seting for Bash on Windows Msys NT"
        ;;

    cygwin*)
        echo ">> Seting for Bash on Windows Cygwin"
        if ! has "zsh" ; then
            apt-cyg install zsh
        fi
        ;;

    *)
        echo ">> OS type not found(.bashrc)"
        ;;
esac

