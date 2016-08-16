scriptencoding utf-8

""" 基本設定篇 """

" 入力コマンド履歴の保存数
set history=1000

" 折り畳みの設定
set foldmethod=marker

" ".swp" のディレクトリ変更
set directory=~/.vim/tmp
" "~" のディレクトリ変更
set backupdir=~/.vim/tmp
" ".un~" のディレクトリ変更
set undodir=~/.vim/tmp
" ".viminfo" のディレクトリ変更
set viminfo+=n~/.vim/tmp/viminfo.txt

" タグファイルの指定
set tags=~/.tags

" !!!: 動作未確認
" モードラインをON
" ※ ファイル毎の設定
set modeline

" FIXME: ↓効かないのかもわからない
" vimrc 即時反映"{{{
" !!!: 先頭行にも記述があるので一旦Kill
" augroup MyAutoCmd
"     autocmd!
" augroup END
" !!!: "Linux" でエラーになるのでKill
" if !has("gui_running") && !(has("win32") || has("win64"))
"     " .vimrcの再読込時にも色が変化するようにする
"     autocmd MyAutoCmd BufWritePost $MYVIMRC nested source $MYVIMRC
" else
"     " .vimrcの再読込時にも色が変化するようにする
"     autocmd MyAutoCmd BufWritePost $MYVIMRC source $MYVIMRC |
"     ¥if has("gui_running") | source $MYGVIMRC
"     autocmd MyAutoCmd BufWritePost $MYGVIMRC if has("gui_running") | source $MYGVIMRC
" endif"}}}


""" Vimスクリプト 記述法 Memo """
"{{{
""" OS固有の設定を持つ場合

""" Unix の場合
" if has("unix")
"     " Unix 用設定
" endif

""" Mac の場合
" if has("mac")
"     " Mac 用設定
" endif

" Unix と Mac 共通の設定の場合
" if has("unix") || has("mac")
"     " Unix と Mac の共通設定
" endif

""" Windows の場合
" if has("win32") || has("win64")
"     " Windows 32bit、 Windows 64bit 用設定
" endif

""" 環境固有の設定を持つ場合

" if ( has("python") || has("python3") )
" 	" Python 用設定
" else
" 	" Python 以外の設定
" endif
"}}}
