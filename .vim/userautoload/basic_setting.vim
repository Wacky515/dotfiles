scriptencoding utf-8
" Created:     20**/**/** :**:**:**
" Last Change: 2018/12/24 08:39:59.

" モード変更の挙動が遅い対処
set timeout timeoutlen=1000 ttimeoutlen=50

" 入力コマンド履歴の保存数
set history=1000

" 折り畳みの設定
set foldmethod=marker

" モードライン（ファイル毎の設定）をON
set modeline

" ".swp" のディレクトリ変更
set directory=~/.vim/tmp
" "~" のディレクトリ変更
set backupdir=~/.vim/tmp
" ".un~" のディレクトリ変更
set undodir=~/.vim/tmp
" ".viminfo" のディレクトリ変更
if !has("nvim")
    set viminfo+=n~/.vim/tmp/viminfo.txt
endif

if has("win32") || ("win64")
    " 編集中のファイルのあるディレクトリをファイル保存ダイアログの初期ディレクトリにする
    :set browsedir=buffer
    " カレントディレクトリをファイル保存ダイアログの初期ディレクトリにする
    :set browsedir=current
endif

" 操作ヒント 表示
function! s:hint_cmd_output(prefix, cmd) abort
    redir => str
    execute a:cmd
    redir END
    echo str
    return a:prefix . nr2char(getchar())
endfunction

" カーソル位置のマーク
nnoremap <expr> m  <SID>hint_cmd_output('m', 'marks')
" マーク位置へジャンプ
nnoremap <expr> `  <SID>hint_cmd_output('`', 'marks')
" マーク位置へジャンプ
nnoremap <expr> '  <SID>hint_cmd_output("'", 'marks')
" レジスタ参照（ヤンクや削除）
nnoremap <expr> "  <SID>hint_cmd_output('"', 'registers')
" マクロ記録
nnoremap <expr> q  <SID>hint_cmd_output('q', 'registers')
" マクロ再生
nnoremap <expr> @  <SID>hint_cmd_output('@', 'registers')

