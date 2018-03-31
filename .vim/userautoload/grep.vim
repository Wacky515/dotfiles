scriptencoding utf-8
" Last Change: 2018/03/17 14:57:54.

" <Leader>r: �J�[�\������ "RipGrep" �Ώۂɑ}���i<Enter>�����ōċA�I�Ɍ����j
nnoremap <expr> <Leader>r ':Rg ' . expand('<cword>') . ''

" <Leader>a: �J�[�\������ "The Sliver Searcher" �Ώۂɑ}���i<Enter>�����ōċA�I�Ɍ����j
nnoremap <expr> <Leader>a ':Ag ' . expand('<cword>') . ''

" <Leader>g: �J�[�\������ "VimGrep" �Ώۂɑ}���i<Enter>�����ōċA�I�Ɍ����A���݊J���Ă���̂Ɠ���̊g���q���Ώہj
nnoremap <expr> <Leader>g ':vimgrep /\<' . expand('<cword>') . '\>/j **/*.' . expand('%:e')

" <Leader>G: �J�[�\������ "�O��grep" �Ώۂɑ}���i<Enter>�����ōċA�I�Ɍ����j
nnoremap <expr> <Leader>G ':silent grep! ' . expand('<cword>') . ' *'

" "�O��grep" �̐ݒ�Ə��O�t�@�C��
set grepprg=grep\ -rnIH\ --exclude-dir=.svn\ --exclude-dir=.git\ --exclude-dir=node_modules\ --exclude-dir=db\ --exclude-dir=tmp\ --exclude-dir=log\ --exclude-dir=vendor\ --exclude-dir=tags\ --exclude=tags\ --exclude="*.min.js\
" �ȉ��ɂ����� " {{{
" set grepprg=grep\
"             \ -rnIH\
"             \ --exclude-dir=.svn\
"             \ --exclude-dir=.git\
"             \ --exclude-dir=node_modules\
"             \ --exclude-dir=db\
"             \ --exclude-dir=tmp\
"             \ --exclude-dir=log\
"             \ --exclude-dir=vendor\
"             \ --exclude-dir=tags\
"             \ --exclude=tags\
"             \ --exclude="*.min.js\
" }}}

" "Grep" �������A�����I�� "QuickFix List" ��\��
autocmd QuickFixCmdPost *grep* cwindow
