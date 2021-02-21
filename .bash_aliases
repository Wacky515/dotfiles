# Created:     2019/11/12 10:00:53
# Last Change: 2020/03/28 14:43:12.

# "cd" 強化
alias ..="cd .."
alias ...="cd ../.."
alias -- -="cd -"

# "ls" 強化
alias ls="ls --color=auto --show-control-chars --time-style=long-iso -FH"
alias la="ls -la"
# alias la="ls -A"
alias ll="ls -lA"
# alias ll="ls -l"
alias fn="find ./ -name"
alias sl=ls

# 設定 再読込み
alias relogin="exec $SHELL -l"
alias re=relogin

# 画面消去
alias c=clear
alias cls=reset

# "Windows" ライクな挙動
alias dir=ll
alias path="echo -e ${PATH//:/\\n}"

# ディスクサイズ 確認
alias df="df -h"
alias du="du -h"
alias du1="du -d1"

# "grep" 強化
alias grep="grep --color"

# The fuck
if has "fuck" ; then
    alias fuck='eval "$(thefuck --alias)"'
fi
