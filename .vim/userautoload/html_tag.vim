scriptencoding utf-8

" </: html•Â‚¶ƒ^ƒO•ÛŠÇ
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END
