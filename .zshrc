# 環境変数
export LANG=ja_JP.UTF-8

## エイリアス
alias la="ls -la"
alias ll="ls -l"
alias fn="find ./ -name"

## OS 別設定
case ${OSTYPE} in
    darwin*)
        # Mac用設定
        export CLICOLOR=1
        alias ls="ls -G -F"
        ;;

    linux*)
        #Linux用設定
        alias ls="ls -F --color=auto"
        ;;
    # "Windows" の "Vim" の設定
esac

## プロンプト系
autoload colors
colors

PROMPT="%F{green}%m: %F{magenta}%n@%F{cyan}%c%F{white}%f%# "

# # 2行で表示、時刻を表示# {{{
# PROMPT="%(?.%{${fg[green]}%}.%{${fg[red]}%})%n${reset_color}@ \
#         ${fg[blue]}%m${reset_color}(%*%) %~ %# "
## }}}

# # "漢のzsh" 推奨プロンプト# {{{
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

# 水色# {{{
# PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | \
#   tr "[a-z]" "[A-Z]") %B%{${fg[red]}%}%/#%{${reset_color}%}%b "
# }}}

## オプション系
### "beep" 無効
setopt no_beep

### コマンドミスを修正
setopt correct

### 日本語ファイル名を表示
setopt print_eight_bit

### ディレクトリ名だけで ”cd"
setopt auto_cd

### sudo の後のコマンドでエイリアスを有効にする
alias sudo="sudo "

### Vim風キーバインド（インクリメンタルサーチが動作しないのでkill）
# bindkey -v
### Emacs風キーバインド
bindkey -e

### "ls" に色を付ける
autoload -U compinit
compinit

export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS="di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43; \
    34:su=41;30:sg=46;30:tw=42;30:ow=43;30"

alias ls="ls -GF"
alias gls="gls --color"

zstyle ":completion:*" list-colors "di=34" "ln=35" "so=32" \
    "ex=31" "bd=46;34" "cd=43;34"

### "zsh" 起動Error対策
compinit -u

### "Homebrew" Error対策
alias brew="env PATH=${PATH/\/Users\/wacky515\/\.pyenv\/shims:/} brew"

### "pyenv" 設定
if [ -d ${HOME}/.pyenv ]; then
    export PATH="$PYENV_ROOT/bin:$PATH"
    export PYENV_ROOT="$HOME/.pyenv"
    eval "$(pyenv init -)"
    alias brew="env PATH=${PATH/\/Users\/wacky515\/\.pyenv\/shims:/} brew"
fi

## 補完系
### コマンド補完
autoload -U compinit
compinit

### "sudo" の後ろでコマンド名を補完する
zstyle ":completion:*:sudo:*" \
    command-path /usr/local/sbin /usr/local/bin \
    /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

## コマンド履歴系
### 他の端末と "history" を共有
setopt share_history

### 全履歴の一覧を出力
function history-all { history -E 1 }UNCTION HISTORY-ALL { HISTORY -E 1 }

### ファイルに開始と終了時刻を記録
setopt extended_history
### 保存時に余分なスペースを削除
setopt hist_reduce_blanks

### 重複を記録しない
setopt hist_ignore_dups
### 追加コマンドが古いものと同じなら古いものを削除
setopt hist_ignore_all_dups

### 履歴をファイルに保存
HISTFILE=$HOME/.zsh_history
# メモリ保存数
HISTSIZE=100000
# ファイル保存数
SAVEHIST=100000

### "Ctrl + r"でインクリメンタルサーチ、"Ctrl + s" で逆順
### （vim風キーバインドでは動作しない）
bindkey "^r" history-incremental-pattern-search-backward
bindkey "^s" history-incremental-pattern-search-forward
# bindkey "^R" history-incremental-search-backward # {{{
# bindkey "^S" history-incremental-search-forward
# bindkey "^P" history-beginning-search-backward
# bindkey "^N" history-beginning-search-forward
# }}}

# # 削除確認
# alias rm="rm -i"
# alias cp="cp -i"
# alias mv="mv -i"

# # グローバルエイリアス
# alias -g L="| less"
# alias -g G="| grep"

# # 親ディレクトリも作成
# alias mkdir="mkdir -p"
