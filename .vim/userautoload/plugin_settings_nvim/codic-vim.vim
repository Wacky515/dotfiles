scriptencoding utf-8
" Created:     201*/**/** **:**:**
" Last Change: 2018/12/26 07:26:01.

" ,un: "Unite codic" 起動
nnoremap <silent> ,un :<C-u>Unite codic<CR>

" ,cd: カーソル下の単語を "Codic"
" FIXME: 末尾にエンターを入れたい
nnoremap <expr> ,cd ':Codic ' . expand('<cword>') . ''

