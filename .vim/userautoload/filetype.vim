scriptencoding utf-8

augroup filetypedetect
    au BufRead,BufNewFile *.py setfiletype python
augroup END

autocmd MyAutoGroup BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
