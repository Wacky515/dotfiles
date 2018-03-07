scriptencoding utf-8

" <Leader>g: �J�[�\������ "vimgrep" �Ώۂɑ}���i<Enter�����ōċA�I�Ɍ����A���݊J���Ă���̂Ɠ���̊g���q���Ώہj
nnoremap <expr> <Leader>g ':vimgrep /\<' . expand('<cword>') . '\>/j **/*.' . expand('%:e')

" <Leader>G: �J�[�\������ "�O��grep" �Ώۂɑ}���i<Enter�����ōċA�I�Ɍ����j
nnoremap <expr> <Leader>G ':sil grep! ' . expand('<cword>') . ' *'

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
