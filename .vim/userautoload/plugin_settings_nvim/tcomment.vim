scriptencoding utf-8
" Created:     2018/12/27 09:39:26
" Last Change: 2023/03/12 08:05:26.

" ------------------------------------------------------------------------------
"  マップキー
" ------------------------------------------------------------------------------
if has("nvim")
    " CHECK: "Jetpack" の遅延読込み設定ができていない
    " ee: "TComment" 実行
    nnoremap <silent> ee :<C-u>TComment<CR>
else
    " <C-=><C-=>: "TComment" 実行
    nnoremap <silent> <C-=><C-=> :<C-u>TComment<CR>
endif

" REF:
" let g:tcommentMapLeader1   = '<C-_>'    (default: '<c-_>')
" let g:tcommentMapLeader2   = '<Leader>' (default: '<Leader>_')
" let g:tcommentMapLeaderOp1 = 'gc'       (default: 'gc')
" let g:tcommentMapLeaderOp2 = 'gC'       (default: 'gC')
