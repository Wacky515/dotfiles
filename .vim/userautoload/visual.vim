scriptencoding utf-8

" "autocmd"（マクロ） の初期化
" !!!: 必ず先頭に記述
augroup MyAutoCmd
    autocmd!
augroup END


""" メイン表示篇 """

" コマンドラインの行数表示
" DONE: Windows用GVim使用時は.gvimrcを編集する
if has('unix') || has('mac')
    set cmdheight=3
endif

" 行番号の表示
set number

" スクロール時の上・下端行数指定
set scrolloff=3

" 自動インデント時の空白文字数
set shiftwidth=4
" タブ文字の幅
set tabstop=4
" ダブ文字を空白文字に置換え
set expandtab
" 行頭は "shiftwidth" 分、それ以外は "tabstop" 分インデント
set smarttab

" 現在行と同じインデントを挿入
set autoindent
" 前行末尾に合わせ、次行インデントを増減
set smartindent
" "<" 、 ">" でインデントする時、"shiftwidth" の倍数に丸める
set shiftround

" カーソル行の背景色変更
set cursorline

" 対になる括弧を強調
set showmatch
" 対応括弧に "<" と ">" を追加
set matchpairs& matchpairs+=<:>

" ファイルを開いた時に最後のカーソル位置を復元する
if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif

""""""""""""""""""""""""""""""""""""""""""""""""""
" !!!: 不可視文字の可視化は見難いのでkillしている
" 不可視文字（タブ、空白、改行）の可視化
" set list
" 不可視文字（タブ、空白、改行）を "Unicode" で表示
" set listchars=tab:≫-,trail:-,extends:≫,precedes:≪,nbsp:%,eol:?
" ↑ or ↓
" set listchars=tab:>.,trail:_,eol:?,extends:>,precedes:<,nbsp:%

"全角スペースをハイライト
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction

if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme       * call ZenkakuSpace()
        autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
    augroup END
    call ZenkakuSpace()
endif

" < http://inari.hatenablog.com/entry/2014/05/05/231307 >
""""""""""""""""""""""""""""""""""""""""""""""""""


""" ウィンドウ表示篇 """

" ウインドウタイトルにファイルのパス情報等を表示
set title

" ウィンドウ右下に入力中のコマンドを表示
set showcmd

" 終了時にウィンドウサイズを記憶する
let g:save_window_file = expand('~/.vim/tmp/.vimwinpos')

"{{{
" if has('unix') || has('mac')
"     " let g:save_window_file = '/.vim/tmp/.vimwinpos'
"     let g:save_window_file = expand('~/.vim/tmp/.vimwinpos')
" endif
" if has('win32') || has ('win64')
"     let g:save_window_file = expand('~/.vim/tmp/.vimwinpos')
"     " let g:save_window_file = expand('C:/Temp/.vimwinpos')
" endif
"}}}

" {{{
" let g:save_window_file = expand('~/.vim/tmp/.vimwinpos')
" let g:save_window_file = expand('C:Temp/.vimwinpos')
" }}}

augroup SaveWindow
    autocmd!
    autocmd VimLeavePre * call s:save_window()
    function! s:save_window()
        let options = [
            \ 'set columns=' . &columns,
            \ 'set lines=' . &lines,
            \ 'winpos ' . getwinposx() . ' ' . getwinposy(),
            \ ]
        call writefile(options, g:save_window_file)
    endfunction
augroup END
if filereadable(g:save_window_file)
    execute 'source' g:save_window_file
endif

" <Shift> + <矢印>: ウィンドウサイズ変更
" FIXME: Windows動作せず
" nnoremap <S-Left>  <C-w><<CR>
" nnoremap <S-Right> <C-w>><CR>
" nnoremap <S-Up>    <C-w>-<CR>
" nnoremap <S-Down>  <C-w>+<CR>


""" コマンドラインモード表示篇 """
"
" コマンドラインモードで <Tab> によるファイル名補完を有効にする
set wildmenu

""" ステータス行表示篇 """

" カーソルの行列表示
set ruler

" ステータス行に現在のgitブランチを表示
" !!!: プラグインが必要
" set statusline+=%{fugitive#statusline()}
