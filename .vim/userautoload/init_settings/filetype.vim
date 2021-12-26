scriptencoding utf-8
" Created:     2016/08/08 22:24:35
" Last Change: 2021/12/26 15:41:26.

" MEMO: 詳細設定は "~/dotfiles/.vim/ftplugin" に記述
augroup filetypedetect
    autocmd BufRead,BufNewFile *.{vim,nvim}               setfiletype vim
    autocmd BufRead,BufNewFile *.{md,mkd,mdwn,mkdn,mark*} setfiletype markdown
    autocmd BufRead,BufNewFile *.{sh,bash*,zsh*,vimshrc}  setfiletype sh
    autocmd BufRead,BufNewFile *.{fish}                   setfiletype fish
    autocmd BufRead,BufNewFile *.{bat,cmd}                setfiletype dosbatch
    autocmd BufRead,BufNewFile *.py                       setfiletype python
    autocmd BufRead,BufNewFile *.toml                     setfiletype toml
    autocmd BufRead,BufNewFile *.UWS                      setfiletype uwsc
    autocmd BufRead,BufNewFile *.{ino,pde}                setfiletype arduino
    " FIXME: autocmd BufRead,BufNewFile *.prg                      setfiletype melfa-basic
    autocmd BufRead,BufNewFile *.bas                      setfiletype basic
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
