scriptencoding utf-8
" Last Change: 2018/04/13 08:49:44.

" モード変更の挙動が遅い対処
set timeout timeoutlen=1000 ttimeoutlen=50

" 入力コマンド履歴の保存数
set history=1000

" 折り畳みの設定
set foldmethod=marker

" モードライン（ファイル毎の設定）をON
set modeline

" ".swp" のディレクトリ変更
set directory=~/.vim/tmp
" "~" のディレクトリ変更
set backupdir=~/.vim/tmp
" ".un~" のディレクトリ変更
set undodir=~/.vim/tmp
" ".viminfo" のディレクトリ変更
if !has("nvim")
    set viminfo+=n~/.vim/tmp/viminfo.txt
endif
