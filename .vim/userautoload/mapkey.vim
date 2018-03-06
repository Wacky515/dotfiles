scriptencoding utf-8

""" マップキー篇 """

" TODO: マークにジャンプ時、画面をトップに位置にする

" 入力モード中 jj: <Esc>
inoremap jj <Esc>

" <Ctrl>s: エクスプローラで保存場所選択して保存
imap <script> <C-s> <SID>(gui-save)<Esc>
nmap <script> <C-s> <SID>(gui-save)
imap <script> <SID>(gui-save) <C-o><SID>(gui-save)
nnoremap      <SID>(gui-save) :<C-u>call <SID>gui_save()<CR>
function! s:gui_save()
    if bufname('%') ==# ''
        browse confirm saveas
    else
        update
    endif
endfunction

" vv: カーソルから行末まで選択
vnoremap v $h
" Y: カーソルから行末までヤンク
nnoremap Y y$

" FIXME: "Mac" では効かない
" <Esc><Esc>: ハイライト消去
nmap <silent> <Esc><Esc> :nohlsearch<CR>

" bp: 一つ前のバッファを開く
nnoremap <silent>bp :bprevious<CR>
" bn: 次のバッファを開く
nnoremap <silent>bn :bnext<CR>
" bb: 直前のバッファを開く
nnoremap <silent>bb :b#<CR>

" ,v: vimrcを開く
" nmap ,v :edit $MYVIMRC<CR>
nmap ev :edit $MYVIMRC<CR>
" ,g: gvimrcを開く
" nmap ,g :edit $MYGVIMRC<CR>
nmap eg :edit $MYGVIMRC<CR>
" <Leader>rv: vimrcを反映
nnoremap <silent> ,v :<C-u>source $MYVIMRC \| if has("gui_running") \| source $MYGVIMRC \| endif <CR>
" <Leader>rg: gvimrcを反映
nnoremap <silent> ,g :<C-u>source $MYGVIMRC<CR>
" " <Leader>rv: vimrcを反映 " {{{
" nnoremap <silent> <Leader>rv :<C-u>source $MYVIMRC \| if has("gui_running") \| source $MYGVIMRC \| endif <CR>
" " <Leader>rg: gvimrcを反映
" nnoremap <silent> <Leader>rg :<C-u>source $MYGVIMRC<CR>
" " <Leader>,v: vimrcを反映
" nnoremap <silent> <Leader>,v :<C-u>source $MYVIMRC \| if has("gui_running") \| source $MYGVIMRC \| endif <CR>
" " <Leader>,g: gvimrcを反映
" nnoremap <silent> <Leader>,g :<C-u>source $MYGVIMRC<CR>
" }}}

"Macの時ノーマルモードで:と;を入れ替える
if has("mac")
    noremap : ;
    noremap ; :
endif

" w!!: スーパーユーザーとして保存（sudoが使える環境限定）
if has("unix")
    cmap w!! w !sudo tee > /dev/null %
endif

" TODO: 動作確認
" ":e" などでファイルを開く時、フォルダが存在しない場合は自動作成
function! s:mkdir(dir, force)
    if !isdirectory(a:dir) && (a:force ||
            \ input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y/%[es]$')
        call mkdir(iconv(a:dir, &encoding, &termencoding), "p")
    endif
endfunction
if has("unix") || has("mac")
    autocmd MyAutoCmd BufWritePre * call s:mkdir(expand("<afile>:p:h"), v:cmdbang)
endif


""" Leader篇 """

" <Space> を "Leader" に割当て
let mapleader = "\<Space>"

" <Leader>o: ファイルを開く
" !!!: プラグインが必要
" nnoremap <Leader>o :CtrlP<CR>

" <Leader>w: ファイルを保存
nnoremap <Leader>w :w<CR>

" <Leader><Leader>: ビジュアルラインモードに切替え
nmap <Leader><Leader> V
