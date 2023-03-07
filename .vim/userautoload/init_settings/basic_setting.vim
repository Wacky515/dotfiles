scriptencoding utf-8
" Created:     201*/**/** **:**:**
" Last Change: 2023/03/07 12:55:27.

" モード変更 高速化
set timeout timeoutlen=1000 ttimeoutlen=50

" コマンド履歴 保存数
set history=1000

" 折畳み 設定
set foldmethod=marker

" ヘルプ 日本語化
set helplang=ja

" モードライン(ファイル個別に "Vim" 設定) ON
set modeline

" "Undo" 永続化
if has("persistent_undo")
    let undo_path = expand("~/.vim/undo")
    exe "set undodir=" . undo_path
    set undofile
endif

" 起動メッセージ
" augroup InitialMessage  " {{{
"     autocmd!
"     autocmd VimEnter * echo "(U^w^) < Enjoy vimming!"
" augroup END
" }}}

" " 操作ヒント 表示
" function! s:hint_cmd_output(prefix, cmd) abor  " t{{{
"     redir   => str
"     execute a:cmd
"     redir   END
"     echo    str
"     return a:prefix . nr2char(getchar())
" endfunction
" }}}

" ------------------------------------------------------------------------------
"  一時ファイル 保存先設定
" ------------------------------------------------------------------------------
" "*.swp"
if !has("nvim")
    set directory=~/.vim/tmp
else
    set noswapfile
    " set directory=~/.config/nvim/tmp
endif
" "viminfo.txt"
if !has("nvim")
    set viminfo+=n~/.vim/tmp/viminfo.txt
endif
" "*~"
set backupdir=~/.vim/tmp
" "*.un~"
set undodir=~/.vim/tmp

if (has("win32") || ("win64"))
    " 編集中ディレクトリを保存ダイアログの初期ディレクトリにする
    :set browsedir=buffer
    " " カレントディレクトリを保存ダイアログの初期ディレクトリにする
    " :set browsedir=current
endif
