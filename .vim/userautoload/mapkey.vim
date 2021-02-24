scriptencoding utf-8
" Created:     2018/03/05 21:06:40
" Last Change: 2021/02/24 00:08:45.
" TODO: マークにジャンプ時、画面をトップに位置にする

" --------------------------------------------------------------------------------
" マップキー
" --------------------------------------------------------------------------------
" キーマッピングに適しているキー " {{{
    " 1. <Space>
    " 2. ,
    " 3. s
    " 4. t
    " m(prefixに)
" }}}

" 挿入モードで jj: <Esc>
inoremap jj <Esc>

" 複数行をインデント
    " 操作時に選択を解除しないようにする
vnoremap > >gv
vnoremap < <gv

" bk: バックアップファイル作成
nnoremap bk :<C-u>w %.bk

" dl: 仕切り線を挿入
noremap dl i---------------------------------------------------------------------------<Esc>:TComment<CR>^

" [*|#]: 検索した後に移動しない設定
nnoremap * *N
nnoremap # #N

" vv: カーソルから行末まで選択
vnoremap v $h
" Y:  カーソルから行末までヤンク
nnoremap Y y$

" <Esc><Esc>: ハイライト消去
if has("mac")
    nmap <silent> <C-[><C-[> :<C-u>nohlsearch<CR>
else
    nmap <silent> <Esc><Esc> :<C-u>nohlsearch<CR>
endif

" "." 押下で改行して閉じ括弧を補完（関数記述用）
inoremap (. ()<Left><CR><Esc><S-o>
inoremap [. []<Left><CR><Esc><S-o>
inoremap {. {}<Left><CR><Esc><S-o>
inoremap '. ''''''<Left><Left><Left><CR><Esc><S-o>
inoremap ". """"""<Left><Left><Left><CR><Esc><S-o>
inoremap `. ``````<Left><Left><Left><CR><Esc><S-o>

" <Leader>zh: 全角英数字を半角にする
if !has("nvim")
    nnoremap <Leader>zh :HzjaConvert han_eisu<Enter>
    vnoremap <Leader>zh :HzjaConvert han_eisu<Enter>
endif

" 挿入モードで日時を挿入
" ,df: フルセット
inoremap <expr> ,df strftime('%Y/%m/%d %H:%M:%S')
" ,dd: 年月日
inoremap <expr> ,dd strftime('%Y/%m/%d')
" ,dt: 時分
inoremap <expr> ,dt strftime('%H:%M')

" 挿入モードで曜日を挿入
let weeks = [ "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat" ]
let wday = strftime("%w")
" ,ds: 年月日曜日
inoremap <expr> ,ds strftime('%Y/%m/%d ').weeks[wday]
" ,dy: 曜日のみ
inoremap <expr> ,dy strftime('').weeks[wday]

" <Leader>fu: 改行コードを "LF"       として開直す
" nnoremap <Leader>fu :<C-u>e ++fileformat=unix<CR>:<C-u>%s/^M//g<CR>
nnoremap <Leader>fu :<C-u>e ++fileformat=unix<CR>:<C-u>%s/\r//g<CR>

" <Leader>fd: 改行コードを "CR/LF"    として開直す
nnoremap <Leader>fd :<C-u>e ++fileformat=dos<CR>

" <Leader>eu: 文字コードを "UTF-8"    として開直す
nnoremap <Leader>eu :<C-u>e ++encoding=utf-8<CR>

" <Leader>ej: 文字コードを "SIFT-JIS" として開直す
nnoremap <Leader>ej :<C-u>e ++encoding=sjis<CR>

" +/-: フォントサイズUp/Down
if !has("nvim")
    nnoremap + :silent! let &guifont = substitute(
                \ &guifont,
                \ ':h\zs\d\+',
                \ '\=eval(submatch(0)+1)',
                \ '')<CR>
    nnoremap - :silent! let &guifont = substitute(
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

" ヤンクした文字列でカーソル位置の単語を置換
nnoremap <silent> cy ce<C-r>0<Esc>:let@/=@1<CR>:noh<CR>
vnoremap <silent> cy c<C-r>0<Esc>:let@/=@1<CR>:noh<CR>
nnoremap <silent> ciy ciw<C-r>0<Esc>:let@/=@1<CR>:noh<CR>

" bo:      エクスプローラで開く
nnoremap <silent> bo :<C-u>browse open<CR>
" bs:      エクスプローラで保存場所選択して保存
nnoremap <silent> bs :<C-u>browse sav<CR>
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

" bp:      前のバッファを開く
nnoremap <silent> bp :<C-u>bprevious<CR>
" bn:      次のバッファを開く
nnoremap <silent> bn :<C-u>bnext<CR>
" bb:      直前のバッファを開く
nnoremap <silent> bb :<C-u>b#<CR>
" MEMO: マルチカーソルに譲渡
" <Ctrl>j: 裏バッファを開く
" nnoremap <C-j> <C-^>

" <Ctrl>p: 上方向に1行分スクロール
noremap <C-p> <C-y>
" <Ctrl>n: 下方向に1行分スクロール
noremap <C-n> <C-e>

" <Shift><矢印>: ウィンドウサイズ変更
    " FIXME: Windows 動作せず
if !(has("win32") || has("win64"))
    nnoremap <S-Left>  <C-w><<CR>
    nnoremap <S-Right> <C-w>><CR>
    nnoremap <S-Up>    <C-w>-<CR>
    nnoremap <S-Down>  <C-w>+<CR>
" else
"     nnoremap <S-Left>  <C-w>h
"     nnoremap <S-Right> <C-w>l
"     nnoremap <S-Up>    <C-w>k
"     nnoremap <S-Down>  <C-w>j
endif

if !has("nvim")
    " ev: vimrcを開く
    nmap ev :<C-u>edit $MYVIMRC<CR>
    " eg: gvimrcを開く
    nmap eg :<C-u>edit $MYGVIMRC<CR>
    " ,v: vimrcを反映
    nnoremap <silent> ,v :<C-u>source $MYVIMRC<CR>
    " nnoremap <silent> ,v :<C-u>source $MYVIMRC \| if has("gui_running") \| source $MYGVIMRC \| endif <CR>
    " ,g: gvimrcを反映
    nnoremap <silent> ,g :<C-u>source $MYGVIMRC<CR>
elseif has("nvim")
    " ev: vimrcを開く
    nmap ev :<C-u>edit ~/dotfiles/.vimrc<CR>
    " eg: gvimrcを開く
    nmap eg :<C-u>edit ~/dotfiles/.gvimrc<CR>
    " ,v: vimrcを反映
    nnoremap <silent> ,v :<C-u>source ~/dotfiles/.vimrc<CR>
    " nnoremap <silent> ,v :<C-u>source ~/dotfiles/.vimrc \| if has("gui_running") \| source ~/dotfiles/.vimrc \| endif <CR>
    " ,g: gvimrcを反映
    nnoremap <silent> ,g :<C-u>source ~/dotfiles/.gvimrc<CR>
endif

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

" " <TAB>: 対のカッコにジャンプ
" nnoremap <TAB> %
" vnoremap <TAB> %

" " 0: 直下に空行挿入
" nnoremap 0 :<C-u>call append(expand('.'), '')<CR>j
" " 9: 直上に空行挿入
" nnoremap 9 O<Esc>cc<Esc>

" "Mac" のノーマルモードで ":" と ";" を入替え  " {{{
" if has("mac")
"     noremap : ;
"     noremap ; :
" endif
" }}}
"Surface Go" のノーマルモードで ":" と ";" を入替え
if hostname() == "SALADSURFACEGO"
    noremap : ;
    noremap ; :
endif

" --------------------------------------------------------------------------------
" 基本設定篇
" --------------------------------------------------------------------------------
" TEST:
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

if (has("unix") || has("mac"))
    autocmd MyAutoCmd BufWritePre * call s:mkdir(expand("<afile>:p:h"), v:cmdbang)
endif

" ---------------------------------------------------------------------------
" コマンドライン篇
" ---------------------------------------------------------------------------
" <Home>:         行頭へ移動
cnoremap <C-a> <Home>
" <End>:          行末へ移動
cnoremap <C-e> <End>
" <Left>:         一文字戻る
cnoremap <C-b> <Left>
" <Right>:        一文字進む
cnoremap <C-f> <Right>
" <Shift><Left>:  前の単語へ移動
cnoremap <M-b> <S-Left>
" <Shift><Right>: 次の単語へ移動
cnoremap <M-f> <S-Right>
" <Del>:          カーソルの下の文字を削除
cnoremap <C-d> <Del>
" <Down>:         履歴を一つ進む
cnoremap <C-n> <Down>
" <Up>:           履歴を一つ戻る
cnoremap <C-p> <Up>

" ---------------------------------------------------------------------------
" リーダ篇
" ---------------------------------------------------------------------------
" <Space> を "Leader" に割当て
" MEMO: ".vimrc" に記述
" let mapleader = "\<Space>"

" <Leader>w: ファイルを保存
autocmd VimEnter * nnoremap <Leader>w :<C-u>w<CR>

" <C-i>:     前のカーソル位置
autocmd VimEnter * nnoremap <C-i> <C-i>

" <Leader>q: ファイルを閉じる
nnoremap <Leader>q :<C-u>q<CR>

" <Leader>s: ウィンドウを縦分割
nnoremap <Leader>s :<C-u>sp<CR>

" <Leader>v: ウィンドウを横分割
nnoremap <Leader>v :<C-u>vs<CR><C-w>l

" <Leader>S: ウィンドウを縦分割(ファイルを選択)
nnoremap <Leader>S :<C-u>sp<TAB>

" <Leader>V: ウィンドウを横分割（ファイルを選択）
nnoremap <Leader>V :<C-u>vs<TAB>

" <Leader>t: 新規タブを作成
nnoremap <Leader>t :<C-u>tabnew<CR>

" <Leader>T: 新規タブを作成（ファイルを選択）
nnoremap <Leader>T :<C-u>tabnew <TAB>

" <Leader><Leader>: ビジュアルラインモードに切替え
nmap <Leader><Leader> V

" <Leader>l: スペルチェックON/OFFをトグル
nnoremap <silent> <Leader>l :<C-u>set spell!<CR>

" EXコマンドの出力をクリップボードへコピー
func! s:func_copy_cmd_output(cmd)
	redir @*>
	silent execute a:cmd
	redir END
endfunc

command! -nargs=1 -complete=command CopyCmdOutput call <SID>func_copy_cmd_output(<q-args>)
