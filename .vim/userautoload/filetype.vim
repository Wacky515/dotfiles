scriptencoding utf-8
" Created:     2016/08/08 22:24:35
" Last Change: 2018/10/02 10:54:21.

augroup filetypedetect
    au BufRead,BufNewFile *.{md,mdwn,mkd,mkdn,mark*} setfiletype markdown
    au BufRead,BufNewFile *.{sh,bash} setfiletype sh
    au BufRead,BufNewFile *.{bat,cmd} setfiletype dosbatch
                \ setlocal encode=sjis fileencode=sjis
    au BufRead,BufNewFile *.py setfiletype python
    au BufRead,BufNewFile *.toml setfiletype toml
    au BufRead,BufNewFile *.UWS setfiletype uwsc
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

" オプション名 | 補足
" -------------|----------------------------
" expandtab    | tabキーを押すとスペースが入力される
" tabstop      | 画面上で表示する1つのタブの幅
" softtabstop  | いくつの連続した空白を1回で削除できるようにするか
" shiftwidth   | 自動インデントでのインデントの長さ
" autoindent   | 改行した時に自動でインデントします
" smartindent  | {があると次の行は自動で1段深く自動インデントしてくれる
