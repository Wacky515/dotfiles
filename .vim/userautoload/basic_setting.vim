scriptencoding utf-8
" Last Change: 2018/03/24 22:52:49.

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
set viminfo+=n~/.vim/tmp/viminfo.txt

" 新規作成時、動的にテンプレートを読込む
augroup templateload
    autocmd!
    autocmd BufNewFile *.py 0r ~/.vim/template/template.py
    autocmd BufNewFile *.py %substitute#__NAME__#\=expand("%")#ge
    autocmd BufNewFile *.py %substitute#__DATE__#\=strftime("%d/%m/%Y")#ge
    autocmd BufNewFile *.py %substitute#__YEAR__#\=strftime("%Y")#ge

    autocmd BufNewFile *.html 0r ~/.vim/template/template.html
    autocmd BufNewFile *.html %substitute#__DATE__#\=strftime("%d/%m/%Y")#ge

    autocmd BufNewFile *.pl 0r ~/.vim/template/template.pl
    autocmd BufNewFile *.pl %substitute#__DATE__#\=strftime("%d/%m/%Y")#ge

    autocmd BufNewFile *.pm 0r ~/.vim/template/template.pm
    autocmd BufNewFile *.pm %substitute#__DATE__#\=strftime("%d/%m/%Y")#ge
augroup END
