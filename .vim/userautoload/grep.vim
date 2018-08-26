scriptencoding utf-8
" Created:     2017/10/27 00:00:00.
" Last Change: 2018/08/26 16:37:23.
" MEMO: �������x���ɋL�q

" FIXME: ���{�ꂪ�}�b�`���Ȃ�
" <Leader>r: �J�[�\������ "RipGrep" �Ώۂɑ}��
    " <Enter>�����ŃJ�����g�f�B���N�g���ȉ����ċA�I�Ɍ���
" "fzf" ������CUI
nnoremap <expr> <Leader>r ':Rg ' . expand('<cword>') . ''

" FIXME: ���{�ꂪ�}�b�`���Ȃ�
" <Leader>a: �J�[�\������ "The Sliver Searcher" �Ώۂɑ}��
    " <Enter>�����ŃJ�����g�f�B���N�g���ȉ����ċA�I�Ɍ���
nnoremap <expr> <Leader>a ':Ag ' . expand('<cword>') . ''

" <Leader>G: �J�[�\������ "�O��grep" �Ώۂɑ}��
    " <Enter>�����ŃJ�����g�f�B���N�g���ȉ����ċA�I�Ɍ���
" nnoremap <expr> <Leader>G ':silent grep! ' . expand('<cword>') . ' *'
nnoremap <expr> <Leader>G ':silent grep! ' . expand('<cword>') . ' */*'

" "�O��grep" �̐ݒ�Ə��O�t�@�C��
set grepprg=grep\ -rnIH\ --exclude-dir=.svn\ --exclude-dir=.git\ --exclude-dir=node_modules\ --exclude-dir=db\ --exclude-dir=tmp\ --exclude-dir=log\ --exclude-dir=vendor\ --exclude-dir=tags\ --exclude=tags\ --exclude="*.min.js\
" ��L�̗񋓂͈ȉ��̋L�q�ɂ����� " {{{
" set grepprg=grep\
"             \ -rnIH\
"             \ --exclude-dir=.svn\{{{
"             \ --exclude-dir=.git\}}}
"             \ --exclude-dir=node_modules\
"             \ --exclude-dir=db\
"             \ --exclude-dir=tmp\
"             \ --exclude-dir=log\
"             \ --exclude-dir=vendor\
"             \ --exclude-dir=tags\
"             \ --exclude=tags\
"             \ --exclude="*.min.js\
" }}}

" <Leader>g: �J�[�\������ "VimGrep" �Ώۂɑ}��
    " <Enter>�����ŃJ�����g�f�B���N�g���ȉ����ċA�I�Ɍ���
    " �J���Ă�����̂Ɠ���̊g���q���Ώ�
nnoremap <expr> <Leader>g ':vimgrep /\<' . expand('<cword>') . '\>/j **/*.' . expand('%:e')

" ":vimgrep"�A":grep"�A":Ggrep" ��A�����I�� "QuickFix-Window" �\��
autocmd QuickFixCmdPost *grep* cwindow
