# Created:     2019/11/12 10:00:53
# Last Change: 2020/03/28 14:43:12.

# "cd" ����
alias ..="cd .."
alias ...="cd ../.."
alias -- -="cd -"

# "ls" ����
alias ls="ls --color=auto --show-control-chars --time-style=long-iso -FH"
alias la="ls -la"
# alias la="ls -A"
alias ll="ls -lA"
# alias ll="ls -l"
alias fn="find ./ -name"
alias sl=ls

# �ݒ� �ēǍ���
alias relogin="exec $SHELL -l"
alias re=relogin

# ��ʏ���
alias c=clear
alias cls=reset

# "Windows" ���C�N�ȋ���
alias dir=ll
alias path="echo -e ${PATH//:/\\n}"

# �f�B�X�N�T�C�Y �m�F
alias df="df -h"
alias du="du -h"
alias du1="du -d1"

# "grep" ����
alias grep="grep --color"

# The fuck
if has "fuck" ; then
    alias fuck='eval "$(thefuck --alias)"'
fi
