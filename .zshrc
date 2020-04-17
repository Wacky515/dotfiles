# Created:     201*/**/** **:**:**
# Last Change: 2020/04/17 23:17:49.

cd ~/dotfiles

# 環境変数
## ロケール設定
export LANG=ja_JP.UTF-8

## エイリアス
[ -f ~/.zsh_aliases ] && source ~/.zsh_aliases

## "RipGrep" 設定
if [ -f ~/.ripgreprc ]; then
    export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"
fi

## "fzf" 設定
if [ -f ~/.fzf.zsh ]; then
    source ~/.fzf.zsh
    export FZF_DEFAULT_OPTS='--height 40% --reverse --border'
    export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
fi

## "pyenv" 設定
if [ -d ${HOME}/.pyenv ]; then
    export PATH="$PYENV_ROOT/bin:$PATH"
    export PYENV_ROOT="$HOME/.pyenv"
    eval "$(pyenv init -)"
    # alias brew="env PATH=${PATH/\/Users\/wacky515\/\.pyenv\/shims:/} brew"
    alias brew="env PATH=${PATH~\/\.pyenv\/shims:/} brew"
fi

## "HomeBrew" Error対策 #  {{{
# MEMO: 上にあるのでKILL
# alias brew="env PATH=${PATH/\/Users\/wacky515\/\.pyenv\/shims:/} brew"
# }}}

# オプション系
## "beep" 無効
setopt no_beep
## コマンドミスを修正
setopt correct
## 日本語ファイル名を表示
setopt print_eight_bit
## ディレクトリ名だけで ”cd"
setopt auto_cd

# キーバインド
## "Emacs" 風
bindkey -e

# ## "Vim" 風 #  {{{
# ## MEMO: インクリメンタルサーチが動作しないのでKILL
# bindkey -v
# }}}

# 補完系
## コマンド補完
autoload -Uz compinit
compinit

## "sudo" の後ろでコマンド名を補完する
zstyle ":completion:*:sudo:*"
        \ command-path /usr/local/sbin /usr/local/bin
        \ /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# "history" 系
## 他の端末と共有
setopt share_history
##  重複を記録しない
setopt histignorealldups
## 開始と終了時刻を記録
setopt extended_history
## 保存時に余分なスペースを削除
setopt hist_reduce_blanks
## 追加コマンドが古いものと同じなら古いものを削除
setopt hist_ignore_all_dups

## 履歴をファイルに保存
HISTFILE=$HOME/.zsh_history
## メモリ保存数
HISTSIZE=100000
## ファイル保存数
SAVEHIST=100000

## C-r: インクリメンタルサーチ 正順
bindkey "^r" history-incremental-pattern-search-backward
## C-s: インクリメンタルサーチ 逆順
bindkey "^s" history-incremental-pattern-search-forward
## C-p: 入力途中でサーチ 正順
bindkey "^p" history-beginning-search-backward
## C-p: 入力途中でサーチ 逆順
bindkey "^n" history-beginning-search-forward

## 一覧を出力
function history-all { history -E 1 }UNCTION HISTORY-ALL { HISTORY -E 1 }

# プロンプト系
## 色を使用
autoload -Uz colors
colors

# "PowerLine" 風
PROMPT="%{${bg[blue]%}%}%{${fg[black]}%} %n
        \ %{${bg[white]}%}%{${fg[blue]}%}
        \ %{${bg[white]}%}%{${fg[black]}%} %~
        \ %{${reset_color}%}%{${fg[white]}%} 
        \ %{${reset_color}%}"

# PROMPT="%F{green}%m: %F{magenta}%n@%F{cyan}%c%F{white}%f%# "

# ## 水色  # {{{
# PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | \
#   tr "[a-z]" "[A-Z]") %B%{${fg[red]}%}%/#%{${reset_color}%}%b "
# }}}

# ## 2行で時刻を表示  # {{{
# PROMPT="%(?.%{${fg[green]}%}.%{${fg[red]}%})%n${reset_color}@ \
#         ${fg[blue]}%m${reset_color}(%*%) %~ %# "
# }}}

# ## "漢のzsh" 推奨プロンプト  # {{{
# case ${UID} in
# 0)
#     PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | \
#     tr "[a-z]" "[A-Z]") %B%{${fg[red]}%}%/#%{${reset_color}%}%b "
#     PROMPT2="%B%{${fg[red]}%}%_#%{${reset_color}%}%b "
#     SPROMPT="%B%{${fg[red]}%}%r is correct? [n,y,a,e]: \
#     %{${reset_color}%}%b "
#     ;;
# *)
#     PROMPT="%{${fg[red]}%}%/%%%{${reset_color}%} "
#     PROMPT2="%{${fg[red]}%}%_%%%{${reset_color}%} "
#     SPROMPT="%{${fg[red]}%}%r is correct? \
#     [n,y,a,e]:%{${reset_color}%} "
#     [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
#         PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | \
#         tr "[a-z]" "[A-Z]") ${PROMPT}"
#     ;;
# esac
# }}}

# その他
## "zsh" 起動Error対策
compinit -u

function win_setting() {
    alias   vim="~/vim82-kaoriya-win64/vim.exe"
    alias  gvim="~/vim82-kaoriya-win64/gvim.exe"
    alias  nvim="C:/tools/neovim/Neovim/bin/nvim.exe"
    alias gnvim="C:/tools/neovim/Neovim/bin/nvim-qt.exe"
}

# OS 別設定
case ${OSTYPE} in
    # "Linux" 用設定
    linux*)
        echo ">> Start setting for zsh on Linux"
        alias ls="ls -F --color=auto"
        ;;

    # "Mac" 用設定
    darwin*)
        echo ">> Start setting for zsh on Mac"
        export CLICOLOR=1
        alias ls="ls -G -F"
        ;;

    # "Windows" 用設定
    msys)
        echo ">> Start setting for zsh on Windows Msys2"
        win_setting
        ;;

    MSYS_NT*)
        echo ">> Start setting for zsh on Windows Msys NT"
        win_setting
        ;;

    windows)
        echo ">> Start setting for zsh on Windows Cmder & ConEmu"
        ;;

    cygwin*)
        echo ">> Start setting for zsh on Windows Cygwin"
        win_setting
        ;;

    *)
        echo ">> [.zshrc] < OS type not found"
        ;;
esac
