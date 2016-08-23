scriptencoding utf-8

augroup filetypedetect
    au BufRead,BufNewFile *.py setfiletype python
    au BufRead,BufNewFile *.{ino,pde} setfiletype arduino
    au BufRead,BufNewFile *.{md,mdwn,mkd,mkdn,mark*} setfiletype markdown
augroup END

" augroup filetypedetect
"     au BufRead,BufNewFile *.py setfiletype python
" augroup END

" augroup filetypedetect
"     au BufRead,BufNewFile *.{ino,pde} setfiletype arduino
" augroup END

" augroup filetypedetect
"     au BufRead,BufNewFile *.{md,mdwn,mkd,mkdn,mark*} setfiletype markdown
" augroup END
" autocmd MyAutoGroup BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
