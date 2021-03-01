scriptencoding utf-8
" Created:     2018/12/27 09:39:26
" Last Change: 2021/03/01 11:58:08.

" ---------------------------------------------------------------------------
"  マップキー
" ---------------------------------------------------------------------------
if has("nvim")
    " ee: "TComment" 起動
    nnoremap <silent> ee :<C-u>TComment<CR>
else
    " <C-=><C-=>: "TComment" 起動
    nnoremap <silent> <C-=><C-=> :<C-u>TComment<CR>
endif

" REF:
" let g:tcommentMapLeader1   = '<C-_>'    (default: '<c-_>')
" let g:tcommentMapLeader2   = '<Leader>' (default: '<Leader>_')
" let g:tcommentMapLeaderOp1 = 'gc'       (default: 'gc')
" let g:tcommentMapLeaderOp2 = 'gC'       (default: 'gC')
