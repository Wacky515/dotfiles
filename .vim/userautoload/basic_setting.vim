scriptencoding utf-8

""" ��{�ݒ�� """

" ���̓R�}���h�����̕ۑ���
set history=1000

" �܂��݂̐ݒ�
set foldmethod=marker

" ".swp" �̃f�B���N�g���ύX
set directory=~/.vim/tmp
" "~" �̃f�B���N�g���ύX
set backupdir=~/.vim/tmp
" ".un~" �̃f�B���N�g���ύX
set undodir=~/.vim/tmp
" ".viminfo" �̃f�B���N�g���ύX
set viminfo+=n~/.vim/tmp/viminfo.txt

" !!!: ���얢�m�F
" ���[�h���C����ON
" �� �t�@�C�����̐ݒ�
set modeline

" FIXME: �������Ȃ��̂����킩��Ȃ�
" !!!: �擪�s�ɂ��L�q������̂ň�UKill
" vimrc �������f
" augroup MyAutoCmd
"     autocmd!
" augroup END
if !has("gui_running") && !(has("win32") || has("win64"))
    " .vimrc�̍ēǍ����ɂ��F���ω�����悤�ɂ���
    autocmd MyAutoCmd BufWritePost $MYVIMRC nested source $MYVIMRC
else
    " .vimrc�̍ēǍ����ɂ��F���ω�����悤�ɂ���
    autocmd MyAutoCmd BufWritePost $MYVIMRC source $MYVIMRC |
                \if has("gui_running") | source $MYGVIMRC
    autocmd MyAutoCmd BufWritePost $MYGVIMRC if has("gui_running") | source $MYGVIMRC
endif


""" Vim�X�N���v�g �L�q�@ Memo """

""" OS�ŗL�̐ݒ�����ꍇ

""" Unix �̏ꍇ
" if has("unix")
"     " Unix �p�ݒ�
" endif

""" Mac �̏ꍇ
" if has("mac")
"     " Mac �p�ݒ�
" endif

" Unix �� Mac ���ʂ̐ݒ�̏ꍇ
" if has("unix") || has("mac")
"     " Unix �� Mac �̋��ʐݒ�
" endif

""" Windows �̏ꍇ
" if has("win32") || has ("win64")
"     " Windows 32bit�A Windows 64bit �p�ݒ�
" endif

""" ���ŗL�̐ݒ�����ꍇ

" if ( has ("python") || has("python3") )
" 	" Python �p�ݒ�
" else
" 	" Python �ȊO�̐ݒ�
" endif
