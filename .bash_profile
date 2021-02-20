# Created:     2017/**/** **:**:**
# Last Change: 2020/05/03 13:38:39.
# MEMO: ���O�C�����Ɉ�񂾂����s�������ݒ�
#       ��Ɋ��ϐ��̐ݒ�
#       �W���o�͂�W���G���[�o�͂ɏo�͂��Ȃ�

# ���ϐ�
## ���P�[���ݒ�
export LANG=ja_JP.UTF-8

# MEMO: "Shell" �Čďo�����ɓǍ��ނ��� ".bashrc" �ɂ��L��
## �֐�
[ -f ~/.bash_function ] && source ~/.bash_function

## �G�C���A�X
[ -f ~/.bash_aliases ] && source ~/.bash_aliases

## "RipGrep" �ݒ�
if [ -f ~/.ripgreprc ]; then
    export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"
fi

# OS �ʐݒ�
case ${OSTYPE} in
    # "Linux" �p�ݒ�
    linux*)
        # echo ">> Login setting for Bash on Linux"
        ;;

    # "Mac" �p�ݒ�
    darwin*)
        # echo ">> Login setting for Bash on Mac"
        export PATH="/usr/local/sbin:$PATH"
        export PATH=$PATH:$HOME/.local/bin
        export PATH=$HOME/.nodebrew/current/bin:$PATH
        export CLICOLOR=1

        alias ls="ls -G -F"

        [ -f ~/.bashrc ] && source ~/.bashrc
        ;;

    # "Windows" �p�ݒ�
    msys)
        # echo ">> Login setting for Bash on Windows Msys2"
        [ -f ~/.bash_profile_win ] && source ~/.bash_profile_win

        # "mintty" �� ."bashrc" ��Ǎ��ސݒ�
        [ -f ~/.bashrc ] && source ~/.bashrc

        # # "mintty" �p�F�ݒ�t�@�C�������݂���ΓǍ���
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
