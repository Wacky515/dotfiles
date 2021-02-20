# Created:     201*/**/** **:**:**
# Last Change: 2020/04/18 12:25:41.

cd ~/dotfiles

# ���ϐ�
## ���P�[���ݒ�
export LANG=ja_JP.UTF-8

## �G�C���A�X
[ -f ~/.zsh_aliases ] && source ~/.zsh_aliases

## "RipGrep" �ݒ�
if [ -f ~/.ripgreprc ]; then
    export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"
fi

## "fzf" �ݒ�
if [ -f ~/.fzf.zsh ]; then
    source ~/.fzf.zsh
    export FZF_DEFAULT_OPTS='--height 40% --reverse --border'
    export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
fi

## "pyenv" �ݒ�
if [ -d ${HOME}/.pyenv ]; then
    export PATH="$PYENV_ROOT/bin:$PATH"
    export PYENV_ROOT="$HOME/.pyenv"
    eval "$(pyenv init -)"
    # alias brew="env PATH=${PATH/\/Users\/wacky515\/\.pyenv\/shims:/} brew"
    alias brew="env PATH=${PATH~\/\.pyenv\/shims:/} brew"
fi

## "HomeBrew" Error�΍� #  {{{
# MEMO: ��ɂ���̂�KILL
# alias brew="env PATH=${PATH/\/Users\/wacky515\/\.pyenv\/shims:/} brew"
# }}}

# �I�v�V�����n
## "beep" ����
setopt no_beep
## �R�}���h�~�X���C��
setopt correct
## ���{��t�@�C������\��
setopt print_eight_bit
## �f�B���N�g���������� �hcd"
setopt auto_cd

# �L�[�o�C���h
## "Emacs" ��
bindkey -e

# ## "Vim" �� #  {{{
# ## MEMO: �C���N�������^���T�[�`�����삵�Ȃ��̂�KILL
# bindkey -v
# }}}

# �⊮�n
## �R�}���h�⊮
autoload -Uz compinit
compinit

## "sudo" �̌��ŃR�}���h����⊮����
zstyle ":completion:*:sudo:*" \
        command-path /usr/local/sbin /usr/local/bin \
        /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# "history" �n
## ���̒[���Ƌ��L
setopt share_history
##  �d�����L�^���Ȃ�
setopt histignorealldups
## �J�n�ƏI���������L�^
setopt extended_history
## �ۑ����ɗ]���ȃX�y�[�X���폜
setopt hist_reduce_blanks
## �ǉ��R�}���h���Â����̂Ɠ����Ȃ�Â����̂��폜
setopt hist_ignore_all_dups

## �������t�@�C���ɕۑ�
HISTFILE=$HOME/.zsh_history
## �������ۑ���
HISTSIZE=100000
## �t�@�C���ۑ���
SAVEHIST=100000

## C-r: �C���N�������^���T�[�` ����
bindkey "^r" history-incremental-pattern-search-backward
## C-s: �C���N�������^���T�[�` �t��
bindkey "^s" history-incremental-pattern-search-forward
## C-p: ���͓r���ŃT�[�` ����
bindkey "^p" history-beginning-search-backward
## C-p: ���͓r���ŃT�[�` �t��
bindkey "^n" history-beginning-search-forward

## �ꗗ���o��
function history-all { history -E 1 }UNCTION HISTORY-ALL { HISTORY -E 1 }

# �v�����v�g�n
## �F���g�p
autoload -Uz colors
colors

# "PowerLine" ��
PROMPT="%{${bg[blue]%}%}%{${fg[black]}%} %n %{${bg[white]}%}%{${fg[blue]}%}��%{${bg[white]}%}%{${fg[black]}%} %~ %{${reset_color}%}%{${fg[white]}%}��%{${reset_color}%}"

# PROMPT="%F{green}%m: %F{magenta}%n@%F{cyan}%c%F{white}%f%# "

# ## ���F  # {{{
# PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | \
#   tr "[a-z]" "[A-Z]") %B%{${fg[red]}%}%/#%{${reset_color}%}%b "
# }}}

# ## 2�s�Ŏ�����\��  # {{{
# PROMPT="%(?.%{${fg[green]}%}.%{${fg[red]}%})%n${reset_color}@ \
#         ${fg[blue]}%m${reset_color}(%*%) %~ %# "
# }}}

# ## "����zsh" �����v�����v�g  # {{{
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

# ���̑�
## "zsh" �N��Error�΍�
compinit -u

function win_setting() {
    alias   vim="~/vim82-kaoriya-win64/vim.exe"
    alias  gvim="~/vim82-kaoriya-win64/gvim.exe"
    alias  nvim="C:/tools/neovim/Neovim/bin/nvim.exe"
    alias gnvim="C:/tools/neovim/Neovim/bin/nvim-qt.exe"
}

# OS �ʐݒ�
case ${OSTYPE} in
    # "Linux" �p�ݒ�
    linux*)
        echo ">> Start setting for zsh on Linux"
        alias ls="ls -F --color=auto"
        ;;

    # "Mac" �p�ݒ�
    darwin*)
        echo ">> Start setting for zsh on Mac"
        export CLICOLOR=1
        alias ls="ls -G -F"
        ;;

    # "Windows" �p�ݒ�
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
