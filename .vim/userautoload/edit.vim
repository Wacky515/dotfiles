scriptencoding utf-8

" "autocmd"�i�}�N���j �̏�����
" !!!: �K���擪�ɋL�q
augroup MyAutoCmd
    autocmd!
augroup END

""" �ҏW�� """

" �����N�����f�[�^���N���b�v�{�[�h�Ŏg�p���I��͈͎����R�s�[
" �� �g�p�ł��邩�͊��ɂ��
set clipboard=unnamed,autoselect
" < http://nanasi.jp/articles/howto/editing/clipboard.html >

" �����I�ɕ����ʂ����
" !!!: ���܂�X�}�[�g�ł͂Ȃ��E�E�E
imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>
