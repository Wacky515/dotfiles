scriptencoding utf-8
" Created:     201*/**/** **:**:**
" Last Change: 2023/03/06 11:59:00.

" ------------------------------------------------------------------------------
"  マップキー
" ------------------------------------------------------------------------------
" ,un: "Unite codic" 起動
nnoremap <silent> ,un :<C-u>Unite codic<CR>

" ,cd: カーソル位置の単語を "Codic"
nnoremap <expr> ,cd ':Codic ' . expand('<cword>') . ''
