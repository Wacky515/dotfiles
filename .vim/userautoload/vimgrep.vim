scriptencoding utf-8

" "vimgrep" 時に自動的に "quick-fix"
autocmd QuickFixCmdPost *grep* cwindow

" <Leader>G: �J�[�\������ "�O��grep" �Ώۂɑ}��
nnoremap <expr> <Leader>G ':sil grep! ' . expand('<cword>') . ' *'
