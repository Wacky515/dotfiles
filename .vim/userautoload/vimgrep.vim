scriptencoding utf-8

" "vimgrep" ���Ɏ����I�� "quick-fix"
autocmd QuickFixCmdPost *grep* cwindow

" <Leader>G: �J�[�\������ "�O��grep" �Ώۂɑ}��
nnoremap <expr> <Leader>G ':sil grep! ' . expand('<cword>') . ' *'
