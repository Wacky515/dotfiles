:scriptencoding utf-8
" Last Change: 2018/03/21 14:14:30.

" ---------------------------------------------------------------------------
" マップキー篇
" ---------------------------------------------------------------------------
" TODO: マークにジャンプ時、画面をトップに位置にする
" キーマッピングに適しているキー " {{{
    " 1. <Space>
    " 2. ,
    " 3. s
    " 4. t
    " m(prefixに)
" }}}

" 挿入モードで jj: <Esc>
inoremap jj <Esc>

" バックアップファイル作成
nnoremap bk :w %.bk

" 0: 直下に空行挿入
nnoremap 0 :<C-u>call append(expand('.'), '')<CR>j

" 9: 直上に空行挿入
nnoremap 9 O<Esc>cc<Esc>

" <Ctrl>j: 裏バッファへ切替え
nnoremap <C-j> <C-^>

" <Leader>l: スペルチェックをトグル
nnoremap <silent> <Leader>l :set spell!<CR>

" 挿入モードで dl: 仕切り線を挿入
inoreabbrev dl ---------------------------------------------------------------------------<Esc>:TComment<CR>^

" FIXME: "Mac" では効かない
" <Esc><Esc>: ハイライト消去
nmap <silent> <Esc><Esc> :nohlsearch<CR>

" [*|#]: 検索した後に移動しない設定
nnoremap * *N
nnoremap # #N

" vv: カーソルから行末まで選択
vnoremap v $h
" Y: カーソルから行末までヤンク
nnoremap Y y$

" <Tab>: 対のカッコにジャンプ
nnoremap <Tab> %
vnoremap <Tab> %

" bp: 前のバッファを開く
nnoremap <silent>bp :bprevious<CR>
" bn: 次のバッファを開く
nnoremap <silent>bn :bnext<CR>
" bb: 直前のバッファを開く
nnoremap <silent>bb :b#<CR>

" TODO: MacのNeoVimで確認
"Macの時ノーマルモードで:と;を入れ替える
if has("mac")
    noremap : ;
    noremap ; :
endif

" TODO: LinuxのNeoVimで確認
" w!!: スーパーユーザーとして保存（sudoが使える環境限定）
if has("unix")
    cmap w!! w !sudo tee > /dev/null %
endif

" FIXME: "NeoVim" で変更必要
" ,v: vimrcを開く
nmap ev :edit $MYVIMRC<CR>
" ,g: gvimrcを開く
nmap eg :edit $MYGVIMRC<CR>
" <Leader>rv: vimrcを反映
nnoremap <silent> ,v :<C-u>source $MYVIMRC \| if has("gui_running") \| source $MYGVIMRC \| endif <CR>
" <Leader>rg: gvimrcを反映
nnoremap <silent> ,g :<C-u>source $MYGVIMRC<CR>

" ヤンクした文字列でカーソル位置の単語を置換
nnoremap <silent> cy ce<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
vnoremap <silent> cy c<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
nnoremap <silent> ciy ciw<C-r>0<ESC>:let@/=@1<CR>:noh<CR>

" <Ctrl>s: エクスプローラで保存場所選択して保存
if !has("nvim")
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


" ---------------------------------------------------------------------------
" Leader篇
" ---------------------------------------------------------------------------

" <Space> を "Leader" に割当て
" let mapleader = "\<Space>"
" －> .vimrc へ

" <Leader>o: ファイルを開く
" !!!: プラグインが必要
" nnoremap <Leader>o :CtrlP<CR>

" <Leader>q: ファイルを閉じる
nnoremap <Leader>q :<C-u>q<CR>

" <Leader>w: ファイルを保存
nnoremap <Leader>w :w<CR>

" <Leader>s: ウィンドウを縦分割
nnoremap <Leader>s :<C-u>sp<CR>

" <Leader>v: ウィンドウを横分割
nnoremap <Leader>v :<C-u>vs<CR>

" <Leader>S: ウィンドウを縦分割(ファイルを選択)
nnoremap <Leader>S :<C-u>sp <TAB>

" <Leader>V: ウィンドウを横分割（ファイルを選択）
nnoremap <Leader>V :<C-u>vs <TAB>

" <Leader>t: 新規タブを作成
nnoremap <Leader>t :<C-u>tabnew<cr>

" <Leader>T: 新規タブを作成（ファイルを選択）
nnoremap <Leader>T :<C-u>tabnew <TAB>

" <Leader><Leader>: ビジュアルラインモードに切替え
nmap <Leader><Leader> V
