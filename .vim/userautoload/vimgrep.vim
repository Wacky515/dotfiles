scriptencoding utf-8

" "vimgrep" 時に自動的に "quick-fix"
autocmd QuickFixCmdPost *grep* cwindow

" <Leader>G: カーソル下を "外部grep" 対象に挿入
nnoremap <expr> <Leader>G ':sil grep! ' . expand('<cword>') . ' *'
