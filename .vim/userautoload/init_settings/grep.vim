scriptencoding utf-8
" Created:     2017/10/27 **:**:**.
" Last Change: 2023/03/21 14:01:11.
" MEMO: 検索速度順に記述

" ------------------------------------------------------------------------------
"  基本設定
" ------------------------------------------------------------------------------
" "vimgrep" を "RipGrep" に置換え
if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" ":vimgrep"、":grep"、":Ggrep" 後、自動的に "QuickFix-Window" 表示
autocmd QuickFixCmdPost *grep* cwindow

" "外部grep" の設定と除外ファイル
set grepprg=grep\  " {{{
            \ -rnIH\
            \ --exclude-dir=.git\
            \ --exclude-dir=.svn\
            \ --exclude-dir=db\
            \ --exclude-dir=log\
            \ --exclude-dir=node_modules\
            \ --exclude-dir=tags\
            \ --exclude-dir=tmp\
            \ --exclude-dir=vendor\
            \ --exclude=tags\
            \ --exclude="*.min.js\
            " }}}

" KILL: "fzf" 設定とコンフリクトする  " {{{
" command! -nargs=* -complete=file Rg :tabnew | :silent grep --sort-files <args>
" command! -nargs=* -complete=file Rgg :tabnew | :silent grep <args>
" }}}
