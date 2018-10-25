scriptencoding utf-8
" Created:     2016/08/14 14:59:36
" Last Change: 2018/10/24 09:55:58.

" ---------------------------------------------------------------------------
" メイン表示篇
" ---------------------------------------------------------------------------

" 行番号の表示
set number

" 補完メニューの高さ
set pumheight=10

" 長い行を省略表示しない
set display=lastline

" カーソル行の背景色変更
set cursorline

" スクロール時の上・下端行数指定
set scrolloff=3

" 東アジアの文字のうちA特性(Ambiguous)の文字幅を指定
" 2バイト文字（"□" や "○"）でカーソル位置がずれる問題の対策
set ambiwidth=double

" 対になる括弧を強調
set showmatch
" ↑ の強調時間[msec]
set matchtime=1
" 対応括弧に "<" と ">" を追加
set matchpairs& matchpairs+=<:>

" 画面上で表示する1つのタブ文字の幅
set tabstop=4
" Tab" 押下で入力されるスペースの数
set expandtab
" 行頭は "shiftwidth" 分、それ以外は "tabstop" 分インデント
set smarttab
" smartindent" で増減する幅
set shiftwidth=4
" コマンド・改行・自動インデント時、現在行と同じインデントを挿入
set autoindent
" 改行時に前行の構文をチェックし次行のインデントを増減
    " "{" があると次行は自動で1段深く自動インデント
set smartindent
" "<" 、 ">" でインデントする時、"shiftwidth" の倍数に丸める
set shiftround

" ファイルを開いた時に最後のカーソル位置を復元する
if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif

" ---------------------------------------------------------------------------
" 全角スペースをハイライト
" ---------------------------------------------------------------------------
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction

if has("syntax")
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme       * call ZenkakuSpace()
        autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
    augroup END
    call ZenkakuSpace()
endif
" < http://inari.hatenablog.com/entry/2014/05/05/231307 >
" ---------------------------------------------------------------------------


" ---------------------------------------------------------------------------
" ウィンドウ表示篇
" ---------------------------------------------------------------------------

" ウインドウタイトルにファイルのパス情報等を表示
set title

" ウィンドウ右下に入力中のコマンドを表示
set showcmd

"タブラベルを常に表示する
set showtabline=3

" <Shift> + <矢印>: ウィンドウサイズ変更
" FIXME: Windows動作せず
" nnoremap <S-Left>  <C-w><<CR>
" nnoremap <S-Right> <C-w>><CR>
" nnoremap <S-Up>    <C-w>-<CR>
" nnoremap <S-Down>  <C-w>+<CR>

" ---------------------------------------------------------------------------
" 終了時にウィンドウサイズを記憶する
" ---------------------------------------------------------------------------
if !has("nvim")
    let g:save_window_file = expand("~/.vim/tmp/.vimwinpos")
    augroup SaveWindow
        autocmd!
        autocmd VimLeavePre * call s:save_window()
        function! s:save_window()
            let options = [
                \ "set columns=" . &columns,
                \ "set lines=" . &lines,
                \ "winpos " . getwinposx() . " " . getwinposy(),
                \ ]
            call writefile(options, g:save_window_file)
        endfunction
    augroup END

    if filereadable(g:save_window_file)
        execute "source" g:save_window_file
    endif
endif
" ---------------------------------------------------------------------------


" ---------------------------------------------------------------------------
" コマンドラインモード表示篇
" ---------------------------------------------------------------------------

" コマンドラインモードの補完GUI
    " 候補をリストで表示し "TAB" でフォーカス
set wildmenu wildmode=list:full


" ---------------------------------------------------------------------------
" ステータス行表示篇
" ---------------------------------------------------------------------------

" カーソルの行列表示
set ruler

