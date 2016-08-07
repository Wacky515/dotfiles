scriptencoding utf-8

""" マップキー篇 """

" 入力モード中 jj: <Esc>
inoremap jj <Esc>

" vv / Y: 行末まで選択
vnoremap v $h
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
nmap ,v :edit $MYVIMRC<CR>
" ,g: gvimrcを開く
nmap ,g :edit $MYGVIMRC<CR>
" <Space>rv: vimrcを反映
nnoremap <silent> <Space>rv :<C-u>source $MYVIMRC \| if has("gui_running") \| source $MYGVIMRC \| endif <CR>
" <Space>rg: gvimrcを反映
nnoremap <silent> <Space>rg :<C-u>source $MYGVIMRC<CR>

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

" <Space>o: ファイルを開く
" !!!: プラグインが必要
" nnoremap <Leader>o :CtrlP<CR>

" <Space>w: ファイルを保存
nnoremap <Leader>w :w<CR>

" <Space><Space>: ビジュアルラインモードに切替え
nmap <Leader><Leader> V
