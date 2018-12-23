scriptencoding utf-8
" Created:     201*/**/** **:**:**
" Last Change: 2018/12/22 22:58:07.
" DONE: 開いたパスに%HOMEPATH%ディレクトリが生成されてしまう

" !!!: 必ず先頭に記述
" "autocmd" （マクロ）の初期化
augroup MyAutoCmd
    autocmd!
augroup END

" FIXME: ウインドウサイズ指定
" ウインドウ幅
set columns=180
" ウインドウ高
set lines=57
" ウインドウ位置
if has("gui")
    winpos  200  10
endif
" ウインドウサイズ 最大
" call GuiWindowMaximized(1)

set ambiwidth=double

execute "source" "~\\.gvimrc"

" if hostname() == "HBAMB748"  " {{{
"     execute "source" "C:\\Users\\MM12167\\.gvimrc"
" elseif hostname() == "HBAMB748A"
"     execute "source" "C:\\Users\\MM12167\\.gvimrc"
" elseif hostname() == "HBAMB819"
"     execute "source" "C:\\Users\\MM12167.DMJ\\.gvimrc"
" elseif hostname() == "SALADCARBONX1"
"     execute "source" "~\\.gvimrc"
"
" else
"     " "Vim" 毎のrcファイルパス設定
"     let g:rc_dir = expand("~/dotfiles")
"
"     " rcファイル読込み関数
"     function! s:source_rc(rc_file_name)
"         let rc_file = expand(g:rc_dir . "/" . a:rc_file_name)
"         if filereadable(rc_file)
"             execute "source" rc_file
"         endif
"     endfunction
"     " GUI基本設定
"     call s:source_rc(".gvimrc")
" endif
" " }}}

