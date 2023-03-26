scriptencoding utf-8
" Created:     2018/12/27 09:39:26
" Last Change: 2023/03/23 20:31:50.

" ------------------------------------------------------------------------------
"  マップキー
" ------------------------------------------------------------------------------
if has("nvim")
    " <C-,><C-,>: "TComment" 実行
    nnoremap <silent> <C-,><C-,> :<C-u>TComment<CR>
    vnoremap <silent> <C-,><C-,> :TComment<CR>
endif
