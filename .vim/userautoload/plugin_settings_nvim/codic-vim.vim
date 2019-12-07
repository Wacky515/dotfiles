scriptencoding utf-8
" Created:     201*/**/** **:**:**
" Last Change: 2019/11/29 17:09:50.

" --------------------------------------------------------------------------------
" マップキー
" --------------------------------------------------------------------------------
" ,un: "Unite codic" 起動
nnoremap <silent> ,un :<C-u>Unite codic<CR>

" ,cd: カーソル下の単語を "Codic"
nnoremap <expr> ,cd ':Codic ' . expand('<cword>') . ''
