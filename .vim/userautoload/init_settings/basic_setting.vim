scriptencoding utf-8
" Created:     201*/**/** **:**:**
" Last Change: 2021/02/28 12:45:13.

" 起動メッセージ
augroup InitialMessage
    autocmd!
    autocmd VimEnter * echo "(U^w^) < Enjoy vimming!"
augroup END

" モード変更が遅い対策
set timeout timeoutlen=1000 ttimeoutlen=50

" コマンド履歴 保存数
set history=1000

" 折畳み 設定
set foldmethod=marker

" モードライン（ファイル毎の設定） ON
set modeline

" ヘルプ 日本語表記
set helplang=ja

" ".swp"        の保存先
if !has("nvim")
    set directory=~/.vim/tmp
else
    set noswapfile
    " set directory=~/.config/nvim/tmp
endif
" "viminfo.txt" の保存先
if !has("nvim")
    set viminfo+=n~/.vim/tmp/viminfo.txt
endif
" "~"           の保存先
set backupdir=~/.vim/tmp
" ".un~"        の保存先
set undodir=~/.vim/tmp

if (has("win32") || ("win64"))
    " 編集中ディレクトリを保存ダイアログの初期ディレクトリにする
    :set browsedir=buffer
    " " カレントディレクトリを保存ダイアログの初期ディレクトリにする
    " :set browsedir=current
endif

" 操作ヒント 表示
function! s:hint_cmd_output(prefix, cmd) abort
    redir   => str
    execute a:cmd
    redir   END
    echo    str
    return a:prefix . nr2char(getchar())
endfunction

" "Undo" 永続化
if has("persistent_undo")
    let undo_path = expand("~/.vim/undo")
    exe "set undodir=" . undo_path
    set undofile
endif

" KILL: "autodate.vim" 動作不良のため
"" "*.bin" 設定  " {{{
"augroup BinaryXXD
"    autocmd!
"    autocmd BufReadPre  *.bin let &binary =1
"    autocmd BufReadPost * if &binary | silent %!xxd -g 1
"    autocmd BufReadPost * set ft=xxd | endif
"    autocmd BufWritePre * if &binary | %!xxd -r | endif
"    autocmd BufWritePost * if &binary | silent %!xxd -g 1
"    autocmd BufWritePost * set nomod | endif
"augroup END
" }}}
" " カーソル位置のマーク " {{{
" nnoremap <expr> m  <SID>hint_cmd_output('m', 'marks')
" " マーク位置へジャンプ
" nnoremap <expr> `  <SID>hint_cmd_output('`', 'marks')
" " マーク位置へジャンプ
" nnoremap <expr> '  <SID>hint_cmd_output("'", 'marks')
" レジスタ参照（ヤンクや削除）
" nnoremap <expr> "  <SID>hint_cmd_output('"', 'registers')
" " マクロ記録
" nnoremap <expr> q  <SID>hint_cmd_output('q', 'registers')
" " マクロ再生
" nnoremap <expr> @  <SID>hint_cmd_output('@', 'registers')
" }}}
