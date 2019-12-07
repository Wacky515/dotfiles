<<<<<<< HEAD
scriptencoding utf-8
" Created:     2016/08/08 22:24:35
" Last Change: 2019/11/12 10:32:17.

" MEMO: 詳細設定は "~/dotfiles/.vim/filetype_settings" に記述
augroup filetypedetect
    au BufRead,BufNewFile *.{md,mdwn,mkd,mkdn,mark*} setfiletype markdown
    au BufRead,BufNewFile *.nvim setfiletype vim
    au BufRead,BufNewFile *.{sh,bash,bash_*c,bashrc,zsh,fish,vimshrc} setfiletype sh
    au BufRead,BufNewFile *.{bat,cmd} setfiletype dosbatch
    au BufRead,BufNewFile *.py setfiletype python
    au BufRead,BufNewFile *.toml setfiletype toml
    au BufRead,BufNewFile *.UWS setfiletype uwsc
    au BufRead,BufNewFile *.{ino,pde} setfiletype arduino
augroup END

" オプション名 | 補足
" -------------+----------------------------------------------------------------
" expandtab    | "Tab" 押下で入力されるスペースの数
" tabstop      | 画面上で表示する1つのタブ文字の幅
" softtabstop  | 連続した空白に対して "Tab" や "BS" 押下で動くカーソル幅
" autoindent   | コマンド・改行・自動インデント時、現在行と同じインデントを挿入
" smartindent  | 改行時に前行の構文をチェックし次行のインデントを増減
"              | "{" があると次行は自動で1段深く自動インデント
" shiftwidth   | "smartindent" で増減する幅

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
=======
scriptencoding utf-8
" Created:     2016/08/08 22:24:35
" Last Change: 2019/11/22 11:28:23.

" MEMO: 詳細設定は "~/dotfiles/.vim/filetype_settings" に記述
augroup filetypedetect
    au BufRead,BufNewFile *.{md,mkd,mdwn,mkdn,mark*} setfiletype markdown
    au BufRead,BufNewFile *.{vim,nvim}               setfiletype vim
    au BufRead,BufNewFile *.{sh,bash*,zsh*,vimshrc}  setfiletype sh
    au BufRead,BufNewFile *.{fish}                   setfiletype fish
    au BufRead,BufNewFile *.{bat,cmd}                setfiletype dosbatch
    au BufRead,BufNewFile *.py                       setfiletype python
    au BufRead,BufNewFile *.toml                     setfiletype toml
    au BufRead,BufNewFile *.UWS                      setfiletype uwsc
    au BufRead,BufNewFile *.{ino,pde}                setfiletype arduino
augroup END

" オプション名 | 補足
" -------------+----------------------------------------------------------------
" expandtab    | "Tab" 押下で入力されるスペースの数
" tabstop      | 画面上で表示する1つのタブ文字の幅
" softtabstop  | 連続した空白に対して "Tab" や "BS" 押下で動くカーソル幅
" autoindent   | コマンド・改行・自動インデント時、現在行と同じインデントを挿入
" smartindent  | 改行時に前行の構文をチェックし次行のインデントを増減
"              | "{" があると次行は自動で1段深く自動インデント
" shiftwidth   | "smartindent" で増減する幅

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
>>>>>>> b4b7e5ffbd7dcbd2804a52346bc8cc05a80b6a80
