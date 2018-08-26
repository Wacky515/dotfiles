scriptencoding utf-8
" Created:     2017/10/27 00:00:00.
" Last Change: 2018/08/26 16:37:23.
" MEMO: 検索速度順に記述

" FIXME: 日本語がマッチしない
" <Leader>r: カーソル下を "RipGrep" 対象に挿入
    " <Enter>押下でカレントディレクトリ以下を再帰的に検索
" "fzf" 準拠のCUI
nnoremap <expr> <Leader>r ':Rg ' . expand('<cword>') . ''

" FIXME: 日本語がマッチしない
" <Leader>a: カーソル下を "The Sliver Searcher" 対象に挿入
    " <Enter>押下でカレントディレクトリ以下を再帰的に検索
nnoremap <expr> <Leader>a ':Ag ' . expand('<cword>') . ''

" <Leader>G: カーソル下を "外部grep" 対象に挿入
    " <Enter>押下でカレントディレクトリ以下を再帰的に検索
" nnoremap <expr> <Leader>G ':silent grep! ' . expand('<cword>') . ' *'
nnoremap <expr> <Leader>G ':silent grep! ' . expand('<cword>') . ' */*'

" "外部grep" の設定と除外ファイル
set grepprg=grep\ -rnIH\ --exclude-dir=.svn\ --exclude-dir=.git\ --exclude-dir=node_modules\ --exclude-dir=db\ --exclude-dir=tmp\ --exclude-dir=log\ --exclude-dir=vendor\ --exclude-dir=tags\ --exclude=tags\ --exclude="*.min.js\
" 上記の列挙は以下の記述にしたい " {{{
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

" <Leader>g: カーソル下を "VimGrep" 対象に挿入
    " <Enter>押下でカレントディレクトリ以下を再帰的に検索
    " 開いているものと同一の拡張子が対象
nnoremap <expr> <Leader>g ':vimgrep /\<' . expand('<cword>') . '\>/j **/*.' . expand('%:e')

" ":vimgrep"、":grep"、":Ggrep" 後、自動的に "QuickFix-Window" 表示
autocmd QuickFixCmdPost *grep* cwindow
