scriptencoding utf-8
" Created:     2016/08/08 22:24:35
" Last Change: 2019/01/08 14:47:52.

" MEMO: 詳細設定は "~/dotfiles/.vim/filetype_settings" に記述
augroup filetypedetect
    au BufRead,BufNewFile *.{md,mdwn,mkd,mkdn,mark*} setfiletype markdown
    au BufRead,BufNewFile *.nvim setfiletype vim
    au BufRead,BufNewFile *.{sh,bash} setfiletype sh
    au BufRead,BufNewFile *.{bat,cmd} setfiletype dosbatch
    au BufRead,BufNewFile *.py setfiletype python
    au BufRead,BufNewFile *.toml setfiletype toml
    au BufRead,BufNewFile *.UWS setfiletype uwsc
    au BufRead,BufNewFile *.{ino,pde} setfiletype arduino
augroup END

" オプション名 | 補足
" -------------|----------------------------
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
