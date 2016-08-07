scriptencoding utf-8

" "autocmd"�i�}�N���j �̏�����
" !!!: �K���擪�ɋL�q
augroup MyAutoCmd
    autocmd!
augroup END

""" ��{�ݒ�� """

" ���̓R�}���h�����̕ۑ���
set history=1000

" �܂��݂̐ݒ�
:set foldmethod=marker

" FIXME: ���삹��(Mac OK!)
if has('unix') || has('mac')
    " ".swp" �̃f�B���N�g���ύX
    set directory=~/.vim/tmp
    " "~" �̃f�B���N�g���ύX
    set backupdir=~/.vim/tmp
    " ".un~" �̃f�B���N�g���ύX
    set undodir=~/.vim/tmp
    " ".viminfo" �̃f�B���N�g���ύX
    set viminfo+=n~/.vim/tmp/viminfo.txt
endif
if has('win32') || has ('win64')
    " ".swp" �̃f�B���N�g���ύX
    set directory=C:/Temp
    " "~" �̃f�B���N�g���ύX
    set backupdir=C:/Temp
    " ".un~" �̃f�B���N�g���ύX
    set undodir=C:/Temp
    " ".viminfo" �̃f�B���N�g���ύX
    set viminfo+=nC:/Temp/viminfo.txt
endif

" ���[�h���C���̐ݒ�
" �� �t�@�C�����̃G�f�B�^�ݒ�
:set modeline

" FIXME: �������Ȃ�
" !!!: �擪�s�ɂ��L�q������
" vimrc �������f
" augroup MyAutoCmd
"     autocmd!
" augroup END
if !has('gui_running') && !(has('win32') || has('win64'))
    " .vimrc�̍ēǍ����ɂ��F���ω�����悤�ɂ���
    autocmd MyAutoCmd BufWritePost $MYVIMRC nested source $MYVIMRC
else
    " .vimrc�̍ēǍ����ɂ��F���ω�����悤�ɂ���
    autocmd MyAutoCmd BufWritePost $MYVIMRC source $MYVIMRC |
                \if has('gui_running') | source $MYGVIMRC
    autocmd MyAutoCmd BufWritePost $MYGVIMRC if has('gui_running') | source $MYGVIMRC
endif


""" Vim�X�N���v�g �L�q�@ Memo """

""" OS�ŗL�̐ݒ�����ꍇ

""" Unix �̏ꍇ
" if has('unix')
"         " Unix �p�ݒ�
" endif

""" Mac �̏ꍇ
" if has('mac')
"         " Mac �p�ݒ�
" endif

" Unix �� Mac ���ʂ̐ݒ�̏ꍇ
" if has('unix') || has('mac')
"         " Unix �� Mac �̋��ʐݒ�
" endif

""" Windows �̏ꍇ
" if has('win32') || has ('win64')
"         " Windows 32bit�A Windows 64bit �p�ݒ�
" endif

""" ���ŗL�̐ݒ�����ꍇ

" if ( has ('python') || has('python3') )
" 	" Python �p�ݒ�
" else
" 	" Python �ȊO�̐ݒ�
" endif
