scriptencoding utf-8
" Last Change: 2018/03/24 22:55:38.

augroup filetypedetect
    au BufRead,BufNewFile *.{md,mdwn,mkd,mkdn,mark*} setfiletype markdown
    au BufRead,BufNewFile *.toml setfiletype toml
    au BufRead,BufNewFile *.{bat,cmd} setfiletype dosbatch
    au BufRead,BufNewFile *.{sh,bash} setfiletype sh
    au BufRead,BufNewFile *.py setfiletype python
    au BufRead,BufNewFile *.{ino,pde} setfiletype arduino
augroup END

" FIXME: "autocmd" 実行時に "lightline" を有効にできない " {{{
" augroup reload_gvimrc
"     autocmd!
"     autocmd bufwritepost $GMYVIMRC nested source $GMYVIMRC
" augroup END

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
" }}}
