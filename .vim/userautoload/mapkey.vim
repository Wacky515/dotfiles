﻿scriptencoding utf-8
" Last Change: 2018/08/15 11:33:49.

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

" bk: バックアップファイル作成
nnoremap bk :<C-u>w %.bk

" 挿入モードで dl: 仕切り線を挿入
inoremap dl ---------------------------------------------------------------------------<Esc>:TComment<CR>^

" " 0: 直下に空行挿入
" nnoremap 0 :<C-u>call append(expand('.'), '')<CR>j
" " 9: 直上に空行挿入
" nnoremap 9 O<Esc>cc<Esc>

" <Esc><Esc>: ハイライト消去
if has("mac")
    nmap <silent> <C-[><C-[> :<C-u>nohlsearch<CR>
else
    nmap <silent> <Esc><Esc> :<C-u>nohlsearch<CR>
endif

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

" bo: エクスプローラで開く
nnoremap <silent>bo :<C-u>browse open<CR>
" bs: エクスプローラで保存
nnoremap <silent>bo :<C-u>browse sav<CR>

" bp: 前のバッファを開く
nnoremap <silent>bp :<C-u>bprevious<CR>
" bn: 次のバッファを開く
nnoremap <silent>bn :<C-u>bnext<CR>
" bb: 直前のバッファを開く
nnoremap <silent>bb :<C-u>b#<CR>
" <Ctrl>j: 裏バッファへ切替え
nnoremap <C-j> <C-^>

" TODO: LinuxのNeoVimで確認
" w!!: スーパーユーザーとして保存（sudoが使える環境限定）
if has("unix")
    cmap w!! w !sudo tee > /dev/null %
endif

" "Macの時ノーマルモードで:と;を入れ替える
" if has("mac")
"     noremap : ;
"     noremap ; :
" endif

" FIXME: "NeoVim" で変更必要
if !has("nvim")
    " ev: vimrcを開く
    nmap ev :<C-u>edit $MYVIMRC<CR>
    " eg: gvimrcを開く
    nmap eg :<C-u>edit $MYGVIMRC<CR>
    " ,v: vimrcを反映
    nnoremap <silent> ,v :<C-u>source $MYVIMRC \| if has("gui_running") \| source $MYGVIMRC \| endif <CR>
    " ,g: gvimrcを反映
    nnoremap <silent> ,g :<C-u>source $MYGVIMRC<CR>
endif

" "NeoVim" の "Terminal mode" をノーマルモードを使用する
if has("nvim")
  tnoremap <silent> <ESC> <C-\><C-n>
endif

" ヤンクした文字列でカーソル位置の単語を置換
nnoremap <silent> cy ce<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
vnoremap <silent> cy c<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
nnoremap <silent> ciy ciw<C-r>0<ESC>:let@/=@1<CR>:noh<CR>

" <Ctrl>s: エクスプローラで保存場所選択して保存
nnoremap <C-s> :<C-u>browse sav<CR>
" if !has("nvim") " {{{
"     imap <script> <C-s> <SID>(gui-save)<Esc>
"     nmap <script> <C-s> <SID>(gui-save)
"     imap <script> <SID>(gui-save) <C-o><SID>(gui-save)
"     nnoremap      <SID>(gui-save) :<C-u>call <SID>gui_save()<CR>
"     function! s:gui_save()
"         if bufname('%') ==# ''
"             browse confirm saveas
"         else
"             update
"         endif
"     endfunction
" endif
" }}}

" TODO: 動作確認
" 起動時のみカレントディレクトリを開いたファイルの親ディレクトリに指定
function! s:ChangeCurrentDir(directory, bang)
    if a:directory == ''
        lcd %:p:h
    else
        execute 'lcd' . a:directory
    endif
    if a:bang == ''
        pwd
    endif
endfunction

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
" Command Line篇
" ---------------------------------------------------------------------------
" <Home>: 行頭へ移動
cnoremap <C-a> <Home>
" <End>: 行末へ移動
cnoremap <C-e> <End>
" <Left>: 一文字戻る
cnoremap <C-b> <Left>
" <Right>: 一文字進む
cnoremap <C-f> <Right>
" <Shift><Left>: 前の単語へ移動
cnoremap <M-b> <S-Left>
" <Shift><Right>: 次の単語へ移動
cnoremap <M-f> <S-Right>
" <Del>: カーソルの下の文字を削除
cnoremap <C-d> <Del>
" <Down>: 履歴を一つ進む
cnoremap <C-n> <Down>
" <Up>: 履歴を一つ戻る
cnoremap <C-p> <Up>

" ---------------------------------------------------------------------------
" Leader篇
" ---------------------------------------------------------------------------
" <Space> を "Leader" に割当て
" let mapleader = "\<Space>"
" －> ".vimrc" へ

" <Leader>q: ファイルを閉じる
nnoremap <Leader>q :<C-u>q<CR>

" <Leader>w: ファイルを保存
" －> 重複していて効かないので ".vimrc" へ

" <Leader>s: ウィンドウを縦分割
nnoremap <Leader>s :<C-u>sp<CR>

" <Leader>v: ウィンドウを横分割
" nnoremap <Leader>v :<C-u>vs<CR>
nnoremap <Leader>v :<C-u>vs<CR><C-w>l

" <Leader>S: ウィンドウを縦分割(ファイルを選択)
nnoremap <Leader>S :<C-u>sp<TAB>

" <Leader>V: ウィンドウを横分割（ファイルを選択）
nnoremap <Leader>V :<C-u>vs<TAB>
" nnoremap <Leader>V :<C-u>vs
" nnoremap <Leader>V :<C-u>vs<TAB><C-w>l

" <Leader>t: 新規タブを作成
nnoremap <Leader>t :<C-u>tabnew<cr>

" <Leader>T: 新規タブを作成（ファイルを選択）
nnoremap <Leader>T :<C-u>tabnew <TAB>

" <Leader><Leader>: ビジュアルラインモードに切替え
nmap <Leader><Leader> V

" <Leader>l: スペルチェックON/OFFをトグル
nnoremap <silent> <Leader>l :set spell!<CR>
