scriptencoding utf-8

" <Leader>g: カーソル下を "vimgrep" 対象に挿入（<Enter押下で再帰的に検索、現在開いているのと同一の拡張子が対象）
nnoremap <expr> <Leader>g ':vimgrep /\<' . expand('<cword>') . '\>/j **/*.' . expand('%:e')

" <Leader>G: カーソル下を "外部grep" 対象に挿入（<Enter押下で再帰的に検索）
nnoremap <expr> <Leader>G ':sil grep! ' . expand('<cword>') . ' *'

" "外部grep" の設定と除外ファイル
set grepprg=grep\ -rnIH\ --exclude-dir=.svn\ --exclude-dir=.git\ --exclude-dir=node_modules\ --exclude-dir=db\ --exclude-dir=tmp\ --exclude-dir=log\ --exclude-dir=vendor\ --exclude-dir=tags\ --exclude=tags\ --exclude="*.min.js\
" 以下にしたい " {{{
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

" "Grep" 検索時、自動的に "QuickFix List" を表示
autocmd QuickFixCmdPost *grep* cwindow
