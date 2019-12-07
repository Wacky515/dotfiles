scriptencoding utf-8
" Created:     2016/08/14 14:59:36
" Last Change: 2019/11/22 11:58:10.

" ---------------------------------------------------------------------------
" メイン表示篇
" ---------------------------------------------------------------------------
" ターミナル 256色表示
set t_Co=256

" 行番号 表示
set number

" 選択行 番号色
highlight LineNr ctermfg=darkyellow

" 選択行 強調
set cursorline

" 選択列 強調
set cursorcolumn

" 補完メニュー 高さ
set pumheight=10

" 長行 省略しない
set display=lastline

" スクロール時 上下端行数
set scrolloff=3

" シンタックスハイライト
" "dein.vim" に関する設定の後にON
syntax on

" 対応括弧 強調
set showmatch
" ↑ の強調時間[msec]
set matchtime=1
" 対応括弧に "<" と ">" を追加
set matchpairs& matchpairs+=<:>

" 東アジアの文字のうちA特性(Ambiguous)の文字幅 指定
    " 2バイト文字（"□" や "○"）でカーソル位置がずれる
    " East Asian Width Class Ambiguous の幅
if has("Kaoriya")
    set ambiwidth=double
elseif has("mac") && !has("gui_running")
    set ambiwidth=double
elseif has("unix") && has("gui_running")
    set ambiwidth=double
else
    set ambiwidth=single
endif

" NVIM: モード毎にカーソル形状 変更
if (has('nvim') && has('vim_starting'))
    " 挿入モード時     非点滅縦線
    let &t_SI .= "\e[6 q"
    " ノーマルモード時 非点滅ブロック
    let &t_EI .= "\e[2 q"
    " 置換モード時     非点滅下線
    let &t_SR .= "\e[4 q"
endif

" 画面上で表示するタブ文字 幅
set tabstop=4
" "TAB" スペース数
set expandtab
" 行頭は "shiftwidth" 分、それ以外は "tabstop" 分インデント
set smarttab
" "smartindent" 増減幅
set shiftwidth=4
" コマンド/改行/自動インデント時、現在行と同じインデントを挿入
set autoindent
" 改行時に前行の構文をチェックし次行のインデントを増減
" "{" があると次行は自動で1段深く自動インデント
set smartindent
" "<" 、 ">" でインデントする時、"shiftwidth" の倍数に丸める
set shiftround

" 挿入モード時 選択行(列)色 変更
augroup vimrc_change_cursorline_color
    autocmd!
    " 挿入モード時         カーソル行 ブルーグリーン
    autocmd InsertEnter
                \ * highlight
                \ CursorLine ctermbg=24
                \ guibg=#005f87
                \ | highlight
                \ CursorColumn ctermbg=24
                \ guibg=#005f87
    " 挿入モードを抜けた時 カーソル行 ダークグレー
    autocmd InsertLeave
                \ * highlight
                \ CursorLine ctermbg=236
                \ guibg=#303030
                \ | highlight
                \ CursorColumn ctermbg=236
                \ guibg=#303030
augroup END

" ---------------------------------------------------------------------------
" ウィンドウ表示篇
" ---------------------------------------------------------------------------
" ウインドウタイトルにファイルのパス情報等 表示
set title

" ウィンドウ右下に入力中のコマンド 表示
set showcmd

"タブラベル 常時表示
set showtabline=3

" ---------------------------------------------------------------------------
" 再開時 ウィンドウサイズ 復元
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
" 再開時 カーソル位置 復元
" ---------------------------------------------------------------------------"
if has("autocmd")
    autocmd BufReadPost *
                \ if line("'\"") > 0 && line ("'\"") <= line("$") |
                \   exe "normal! g'\"" |
                \ endif
endif

" ---------------------------------------------------------------------------
" コマンドラインモード表示篇
" ---------------------------------------------------------------------------
" コマンドライン（"Vim" 画面下部）高さ
set cmdheight=5

" コマンドラインモードの補完GUI
" 候補をリストで表示し "TAB" でフォーカス
set wildmenu wildmode=list:full

" ---------------------------------------------------------------------------
" ステータス行表示篇
" ---------------------------------------------------------------------------
" カーソル 行列数表示
set ruler

" ---------------------------------------------------------------------------
" 全角スペース ハイライト
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
