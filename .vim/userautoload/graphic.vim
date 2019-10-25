scriptencoding utf-8
" Created:     2016/08/14 14:59:36
" Last Change: 2019/10/25 15:04:55.

" ---------------------------------------------------------------------------
" メイン表示篇
" ---------------------------------------------------------------------------
" 行番号 表示
set number

" 補完メニュー 高さ
set pumheight=10

" 長い行を省略表示しない
set display=lastline

" カーソル行 背景色変更
set cursorline

" スクロール時 上下端行数
set scrolloff=3

" 東アジアの文字のうちA特性(Ambiguous)の文字幅 指定
    " 2バイト文字（"□" や "○"）でカーソル位置がずれる
set ambiwidth=double

" 対応括弧 強調
set showmatch
" ↑ の強調時間[msec]
set matchtime=1
" 対応括弧に "<" と ">" を追加
set matchpairs& matchpairs+=<:>

" 画面上で表示するタブ文字 幅
set tabstop=4
" "TAB"  スペース数
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

" ファイルを開いた時、最後のカーソル位置 復元
if has("autocmd")
    autocmd BufReadPost *
                \ if line("'\"") > 0 && line ("'\"") <= line("$") |
                \   exe "normal! g'\"" |
                \ endif
endif

" インサートモード時カーソル行(列)色 変更
augroup vimrc_change_cursorline_color
    autocmd!
    " インサートモード時         カーソル行 ブルーグリーン
    autocmd InsertEnter
                \ * highlight
                \ CursorLine ctermbg=24
                \ guibg=#005f87
                \ | highlight
                \ CursorColumn ctermbg=24
                \ guibg=#005f87
    " インサートモードを抜けた時 カーソル行 ダークグレー
    autocmd InsertLeave
                \ * highlight
                \ CursorLine ctermbg=236
                \ guibg=#303030
                \ | highlight
                \ CursorColumn ctermbg=236
                \ guibg=#303030
augroup END

" NVIM: モード毎にカーソル形状 変更
if (has('nvim') && has('vim_starting'))
    " 挿入モード時     非点滅縦線
    let &t_SI .= "\e[6 q"
    " ノーマルモード時 非点滅ブロック
    let &t_EI .= "\e[2 q"
    " 置換モード時     非点滅下線
    let &t_SR .= "\e[4 q"
endif

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
" 終了時 ウィンドウサイズ 記憶
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
" コマンドラインモード表示篇
" ---------------------------------------------------------------------------
" コマンドラインモードの補完GUI
" 候補をリストで表示し "TAB" でフォーカス
set wildmenu wildmode=list:full

" ---------------------------------------------------------------------------
" ステータス行表示篇
" ---------------------------------------------------------------------------
" カーソル 行列表示
set ruler

