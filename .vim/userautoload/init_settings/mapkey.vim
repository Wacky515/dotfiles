scriptencoding utf-8
" Created:     2018/03/05 21:06:40
" Last Change: 2023/03/13 17:29:05.

" ------------------------------------------------------------------------------
"  マップキー
    " キーマッピングに適しているキー " {{{
        " 1. <Space>
        " 2. ,
        " 3. s
        " 4. t
        " m(prefixに)
" }}}
" ------------------------------------------------------------------------------
" 挿入モードで jj: <Esc>
inoremap jj <Esc>

" vv: カーソルから行末まで選択
vnoremap v $h
" Y:  カーソルから行末までヤンク
nnoremap Y y$

" 複数行をインデント
vnoremap > >gv
vnoremap < <gv

" <Ctrl>p: 上方向に1行分スクロール
noremap <C-p> <C-y>
" <Ctrl>n: 下方向に1行分スクロール
noremap <C-n> <C-e>

" +/-: フォント 拡大/縮小
if !has("nvim")
    nnoremap + :<C-u>silent! let &guifont = substitute(
                \ &guifont,
                \ ':h\zs\d\+',
                \ '\=eval(submatch(0)+1)',
                \ '')<CR>
    nnoremap - :<C-u>silent! let &guifont = substitute(
                \ &guifont,
                \ ':h\zs\d\+',
                \ '\=eval(submatch(0)-1)',
                \ '')<CR>
endif

function! LargerFont()
  call AdjustFontSize(1)
endfunction
command! LargerFont call LargerFont()

function! SmallerFont()
  call AdjustFontSize(-1)
endfunction
command! SmallerFont call SmallerFont()

" 挿入モードで "開き括弧" + .: 改行して閉じ括弧を補完(関数記述用)
inoremap (. ()<Left><CR><Esc><S-o>
inoremap [. []<Left><CR><Esc><S-o>
inoremap {. {}<Left><CR><Esc><S-o>
" MEMO: "lexima.vim" と干渉
" inoremap '. ''''''<Left><Left><Left><CR><Esc><S-o>
" inoremap ". """"""<Left><Left><Left><CR><Esc><S-o>
" inoremap `. ``````<Left><Left><Left><CR><Esc><S-o>

if !has("nvim")
    " ev: vimrcを開く
    nmap ev :<C-u>edit $MYVIMRC<CR>
    " eg: gvimrcを開く
    nmap eg :<C-u>edit $MYGVIMRC<CR>
    " ,v: vimrcを反映
    nnoremap <silent> ,v :<C-u>source $MYVIMRC<CR>
    " ,g: gvimrcを反映
    nnoremap <silent> ,g :<C-u>source $MYGVIMRC<CR>
elseif has("nvim")
    " ev: vimrcを開く
    nmap ev :<C-u>edit ~/dotfiles/nvim/init.vim<CR>
    " eg: gvimrcを開く
    nmap eg :<C-u>edit ~/dotfiles/nvim/ginit.vim<CR>
    " ,v: vimrcを反映
    nnoremap <silent> ,v :<C-u>source ~/dotfiles/.vimrc<CR>
    " ,g: gvimrcを反映
    nnoremap <silent> ,g :<C-u>source ~/dotfiles/.gvimrc<CR>
endif

" dl: 仕切り線を挿入
noremap dl
\ i-----------------------------------------------------------------------------
\ <Esc>:<C-u>TComment<CR>^

" dm: 仕切り線(マップキー)を挿入
noremap dm 78i-<Esc>:<C-u>TComment<CR>yypO<Space>マップキー<Esc>jo

" db: 仕切り線(基本設定)を挿入
noremap db 78i-<Esc>:<C-u>TComment<CR>yypO<Space>基本設定<Esc>jo

" 挿入モードで日時挿入
" ,df: フルセット
inoremap <expr> ,df strftime('%Y/%m/%d %H:%M:%S')
" ,dd: 年月日
inoremap <expr> ,dd strftime('%Y/%m/%d')
" ,dt: 時分
inoremap <expr> ,dt strftime('%H:%M')

" " 挿入モードで曜日挿入
" let weeks = [ "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat" ]  " {{{
" let wday = strftime("%w")
" " ,ds: 年月日曜日
" inoremap <expr> ,ds strftime('%Y/%m/%d ').weeks[wday]
" " ,dy: 曜日のみ
" inoremap <expr> ,dy strftime('').weeks[wday]
" }}}

" <Shift><矢印>: ウィンドウサイズ変更
    " FIXME: Windows 動作せず
if !(has("win32") || has("win64"))
    nnoremap <S-Left>  <C-w><<CR>
    nnoremap <S-Right> <C-w>><CR>
    nnoremap <S-Up>    <C-w>-<CR>
    nnoremap <S-Down>  <C-w>+<CR>
" else{{{
"     nnoremap <S-Left>  <C-w>h  " "yankround" と重複
"     nnoremap <S-Right> <C-w>l  " "yankround" と重複
"     nnoremap <S-Up>    <C-w>k
"     nnoremap <S-Down>  <C-w>j}}}
endif

" F3: カーソル位置の "Syntax highlight" を調査
nnoremap <F3> :<C-u>echo synIDattr(synID(line("."), col("."), 1), "name")<CR>

" "NeoVim" の "Terminal mode" でノーマルモードを使用する
if has("nvim")
  tnoremap <silent> <Esc> <C-\><C-n>
endif

" TODO: LinuxのNeoVimで確認
" w!!: スーパーユーザーとして保存
    " "sudo" が使える環境限定
if has("unix")
    cmap w!! w !sudo tee > /dev/null %
endif

" TODO: マークにジャンプ時、画面をトップに位置にする
" " カーソル位置のマーク " {{{
" nnoremap <expr> m  <SID>hint_cmd_output('m', 'marks')
" " マーク位置へジャンプ
" nnoremap <expr> `  <SID>hint_cmd_output('`', 'marks')
" " マーク位置へジャンプ
" nnoremap <expr> '  <SID>hint_cmd_output("'", 'marks')
" レジスタ参照(ヤンクや削除)
" nnoremap <expr> "  <SID>hint_cmd_output('"', 'registers')
" " マクロ記録
" nnoremap <expr> q  <SID>hint_cmd_output('q', 'registers')
" " マクロ再生
" nnoremap <expr> @  <SID>hint_cmd_output('@', 'registers')
" }}}

" ------------------------------------------------------------------------------
"  コマンドライン
" ------------------------------------------------------------------------------
" <Ctrl>a: 行頭へ移動
cnoremap <C-a> <Home>
" <Ctrl>e: 行末へ移動
cnoremap <C-e> <End>
" <Ctrl>b: 一文字戻る
cnoremap <C-b> <Left>
" <Ctrl>f: 一文字進む
cnoremap <C-f> <Right>
" <Meta>f: 次の単語へ移動
cnoremap <M-f> <S-Right>
" <Meta>b: 前の単語へ移動
cnoremap <M-b> <S-Left>
" <Ctrl>h: カーソル左側の文字を削除
cnoremap <C-h> <BS>
" <Ctrl>d: カーソル位置の文字を削除
cnoremap <C-d> <Del>
" <Ctrl>n: コマンド履歴を一つ進む
cnoremap <C-n> <Down>
" <Ctrl>p:コマンド 履歴を一つ戻る
cnoremap <C-p> <Up>

" ------------------------------------------------------------------------------
"  リーダ
" ------------------------------------------------------------------------------
" <Space> を "Leader" に割当て
" MEMO: ".vimrc" に記述移管
" let mapleader = "\<Space>"

" <Leader>a:  全選択
nnoremap <Leader>a ggVG

" <Leader><Leader>: ビジュアルラインモードに切替え
nmap <Leader><Leader> V

" <Leader>s:  ウィンドウを縦分割
nnoremap <Leader>s :<C-u>sp<CR>

" <Leader>v:  ウィンドウを横分割
nnoremap <Leader>v :<C-u>vs<CR><C-w>l

" <Leader>tn:  新規タブを作成
nnoremap <Leader>tn :<C-u>tabnew<CR>

" <Leader>bp: 前のバッファを開く
nnoremap <silent> <Leader>bp :<C-u>bprevious<CR>
" <Leader>bn: 次のバッファを開く
nnoremap <silent> <Leader>bn :<C-u>bnext<CR>
" <Leader>bb: 直前のバッファを開く
nnoremap <silent> <Leader>bb :<C-u>b#<CR>
" <Ctrl>j:    裏バッファを開く
nnoremap <C-j> <C-^>

" <Leader>bo: エクスプローラで新規ファイルを開く
nnoremap <silent> <Leader>bo :<C-u>browse open<CR>

" <Leader>w:  ファイルを保存
autocmd VimEnter * nnoremap <Leader>w :<C-u>w<CR>

" <Ctrl>s:    エクスプローラで保存場所を選択して編集中のファイルを保存
nnoremap <C-s> :<C-u>browse sav<CR>

" <Leader>bk: バックアップファイル(%.bk)作成
nnoremap <Leader>bk :<C-u>w %.bk

" <Leader>q:  ファイルを閉じる
nnoremap <Leader>q :<C-u>q<CR>

" <Leader>l:  スペルチェックON/OFFをトグル
nnoremap <silent> <Leader>l :<C-u>set spell!<CR>

" <Leader>fu: 改行コードを "LF"       として開き直す
nnoremap <Leader>fu :<C-u>e ++fileformat=unix<CR>:<C-u>%s/\r//g<CR>
" <Leader>fd: 改行コードを "CR/LF"    として開き直す
nnoremap <Leader>fd :<C-u>e ++fileformat=dos<CR>
" <Leader>eu: 文字コードを "UTF-8"    として開き直す
nnoremap <Leader>eu :<C-u>e ++encoding=utf-8<CR>
" <Leader>ej: 文字コードを "SIFT-JIS" として開き直す
nnoremap <Leader>ej :<C-u>e ++encoding=sjis<CR>

" <Leader>zh: 全角英数字を半角英数に変換
if !has("nvim")
    nnoremap <Leader>zh :<C-u>HzjaConvert han_eisu<Enter>
    vnoremap <Leader>zh :<C-u>HzjaConvert han_eisu<Enter>
endif

" <Leader>br: 編集中のファイルを "Chrome" で表示(汎用)
if has("win32") || has("win64")
    nmap <Leader>br :<C-u>! start chrome.exe "%:p"<CR>
    vmap <Leader>br :<C-u>! start chrome.exe "%:p"<CR>
endif

" ------------------------------------------------------------------------------
"  基本設定
" ------------------------------------------------------------------------------
" TEST:
" 起動時に在現のディレクトリを、開いたファイルの親ディレクトリに指定
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
            \ input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~?
            \ '^y/%[es]$')
        call mkdir(iconv(a:dir, &encoding, &termencoding), "p")
    endif
endfunction

if (has("unix") || has("mac"))
    autocmd MyAutoCmd BufWritePre * call s:mkdir(expand("<afile>:p:h"), v:cmdbang)
endif

" EXコマンドの出力をクリップボードへコピー
func! s:func_copy_cmd_output(cmd)
    redir @*>
    silent execute a:cmd
    redir END
endfunc

command! -nargs=1 -complete=command CopyCmdOutput call
            \ <SID>func_copy_cmd_output(<q-args>)

" ------------------------------------------------------------------------------
"  キーバインド割込み対策
" ------------------------------------------------------------------------------
" Plugin キーバインド割込み対策
    " 1.
    " ```VimScript
    " autocmd VimEnter * imap <Nul> <C-Space>
    " ```
    "   - "autocmd" イベントで "VimEnter" を指定する
    "     - 基本的に "Plugin" より後に読込まれる
    "     - "Plugin" の上書きはある程度回避できる

    " 2.
    " " let g:ctrlp_map = '<nop>'
    "     nnoremap <Leader>e :CtrlP ~/<CR>

    " <C-i><C-i>: カーソル位置 進む
    " nnoremap <C-i> <Nop>
    " autocmd VimEnter * nnoremap <C-i> <C-i>
