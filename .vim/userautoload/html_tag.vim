scriptencoding utf-8
" Created:     201*/**/** **:**:**
" Last Change: 2019/11/22 11:36:19.

" </: html 閉じタグ補完
augroup MyXML
  autocmd!
  autocmd Filetype xml  inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END
