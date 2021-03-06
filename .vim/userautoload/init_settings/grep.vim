scriptencoding utf-8
" Created:     2017/10/27 **:**:**.
" Last Change: 2020/04/17 09:31:20.
" MEMO: 検索速度順に記述

" ":vimgrep"、":grep"、":Ggrep" 後、自動的に "QuickFix-Window" 表示
autocmd QuickFixCmdPost *grep* cwindow

" "vimgrep" を "RipGrep" に置換え
if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
" KILL: "fzf" 設定とコンフリクトするため
" command! -nargs=* -complete=file Rg :tabnew | :silent grep --sort-files <args>
" command! -nargs=* -complete=file Rgg :tabnew | :silent grep <args>

" <Leader>r: カーソル下を "RipGrep" （UTF-8)      対象に挿入
    " <Enter>押下でカレントディレクトリ以下を再帰的に検索
    " MEMO: "fzf" 準拠のCUI
nnoremap <expr> <Leader>r ':Rg ' . expand('<cword>') . ''

" <Leader>R: カーソル下を "RipGrep" （Shift_JIS)  対象に挿入
nnoremap <expr> ,r ':Rgs ' . expand('<cword>') . ''

" <Leader>P: カーソル下を "The Platinum Searcher" 対象に挿入
    " <Enter>押下でカレントディレクトリ以下を再帰的に検索
nnoremap <expr> <Leader>P ':Pt ' . expand('<cword>') . ''

" <Leader>a: カーソル下を "The Sliver Searcher"   対象に挿入
    " <Enter>押下でカレントディレクトリ以下を再帰的に検索
    " MEMO: 日本語はマッチしない
nnoremap <expr> <Leader>a ':Ag ' . expand('<cword>') . ' -G \.*$$'

" <Leader>G: カーソル下を "外部grep" 対象に挿入
    " <Enter>押下でカレントディレクトリ以下を再帰的に検索
nnoremap <expr> <leader>G ':silent grep! ' . expand('<cword>') . ' */*'
" "外部grep" の設定と除外ファイル " {{{
set grepprg=grep\
            \ -rnIH\
            \ --exclude-dir=.svn\
            \ --exclude-dir=.git\
            \ --exclude-dir=node_modules\
            \ --exclude-dir=db\
            \ --exclude-dir=tmp\
            \ --exclude-dir=log\
            \ --exclude-dir=vendor\
            \ --exclude-dir=tags\
            \ --exclude=tags\
            \ --exclude="*.min.js\
" }}}

" <Leader>g: カーソル下を "VimGrep" 対象に挿入
    " <Enter>押下でカレントディレクトリ以下を再帰的に検索
    " 開いているものと同一の拡張子が対象
nnoremap <expr> <Leader>g ':vimgrep /\<' . expand('<cword>') . '\>/j **/*.' . expand('%:e')
