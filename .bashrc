# Created:     201*/**/** **:**:**
# Last Change: 2020/05/03 13:43:47.
# MEMO: "Shell" ���N������x�Ɏ��s��������ʓI�Ȑݒ�
#       ���ϐ��� ".bash_profile" �Őݒ�
#       �W���o�͂�W���G���[�o�͂ɏo�͂��Ȃ�

# ���ϐ�
## �֐�
[ -f ~/.bash_function ] && source ~/.bash_function

cd ~/dotfiles

# OS �ʐݒ�
# case ${OSTYPE} in
#     # "Linux" �p�ݒ�
#     linux*)
#         echo ">> Start setting for Bash on Linux"
#         echo ">> NO SETTING"
#         ;;
#
#     # "Mac" �p�ݒ�
#     darwin*)
#         echo ">> Start setting for Bash on Mac"
#         echo ">> NO SETTING"
#         ;;
#         
#     # "Windows" �p�ݒ�
#     msys)
#         echo ">> Start setting for Bash on Windows Msys2"
#         echo ">> NO SETTING"
#         ;;
#
#     MSYS_NT*)
#         echo ">> Start setting for Bash on Windows Msys NT"
#         echo ">> NO SETTING"
#         ;;
#
#     cygwin*)
#         echo ">> Start setting for Bash on Windows Cygwin"
#         echo ">> NO SETTING"
#         ;;
#
#     *)
#         echo ">> [.bashrc] < OS type not found"
#         ;;
# esac

# "fish" �� "zsh" �N���ݒ�
if has "fish" && ! [[ `uname` =~ ^(CYGWIN_NT-).+$ ]] ; then
    exec fish
elif has "zsh" ; then
    exec zsh
fi
