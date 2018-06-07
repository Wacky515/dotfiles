# 環境変数
export LANG=ja_JP.UTF-8

## エイリアス
alias la="ls -la"
alias ll="ls -l"
alias fn="find ./ -name"

## OS 別設定
case ${OSTYPE} in
    darwin*)
        # "Mac" 用設定
        export CLICOLOR=1
        alias ls="ls -G -F"
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
esac
