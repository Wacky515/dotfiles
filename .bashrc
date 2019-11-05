# Created:     201*/**/** **:**:**
# Last Change: 2019/06/30 16:02:09.
# 環境変数
export LANG=ja_JP.UTF-8

# エイリアス
alias la="ls -la"
alias ll="ls -l"
alias fn="find ./ -name"

# OS 別設定
case ${OSTYPE} in
    darwin*)
        # "Mac" 用設定
        export CLICOLOR=1
        alias ls="ls -G -F"
        exec fish
        ;;

    linux*)
        # "Linux" 用設定
        alias ls="ls -F --color=auto"
        ;;

    msys)
        # "Windows" 用設定
        alias vim="~/vim81-kaoriya-win64/vim.exe"
        alias gvim="~/vim81-kaoriya-win64/gvim.exe"
        alias nvim="C:/tools/neovim/Neovim/bin/nvim.exe"
        alias gnvim="C:/tools/neovim/Neovim/bin/nvim-qt.exe"

        # "ls" で日本語ファイル名文字化け防止
        alias ls='ls --show-control-chars'

        # exec zsh
        exec fish
esac
export PATH=$PATH:$HOME/.local/bin

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
