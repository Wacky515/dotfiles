scriptencoding utf-8

" "vimgrep" 譎ゅ↓閾ｪ蜍慕噪縺ｫ "quick-fix"
autocmd QuickFixCmdPost *grep* cwindow

" <Leader>G: カーソル下を "外部grep" 対象に挿入
nnoremap <expr> <Leader>G ':sil grep! ' . expand('<cword>') . ' *'
