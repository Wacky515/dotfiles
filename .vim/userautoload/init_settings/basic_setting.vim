scriptencoding utf-8
" Created:     201*/**/** **:**:**
" Last Change: 2023/03/21 10:28:48.

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
if (has("persistent_undo") && !has("nvim"))
    let undo_path = expand("~/.vim/undo")
    exe "set undodir=" . undo_path
    set undofile
elseif (has("persistent_undo") && has("nvim"))
    let undo_path = expand("~/.config/nvim/undo")
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
if !has("nvim")
    " "*.swp"
    set directory=~/.vim/tmp
    " "*~"
    set backupdir=~/.vim/tmp
    " "*.un~"
    set undodir=~/.vim/tmp
    " "viminfo.txt"
    set viminfo+=n~/.vim/tmp/viminfo.txt
elseif has("nvim")
    " "*.swp"
    set directory=~/.config/nvim/tmp
    " "*~"
    set backupdir=~/.config/nvim/tmp
    " "*.un~"
    set undodir=~/.config/nvim/tmp
    " "viminfo.txt"
    set viminfo+=n~/.config/nvim/tmp/viminfo.txt
else
    set noswapfile
endif

if (has("win32") || ("win64"))
    " 編集中ディレクトリを保存ダイアログの初期ディレクトリにする
    :set browsedir=buffer
    " " カレントディレクトリを保存ダイアログの初期ディレクトリにする
    " :set browsedir=current
endif
