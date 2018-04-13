scriptencoding utf-8
" Last Change: 2018/04/13 09:57:35.

" 新規作成時、動的にテンプレートを読込む
augroup templateload
    autocmd!
    autocmd BufNewFile *.vim 0r ~/.vim/template/template.vim
    autocmd BufNewFile *.vim %substitute#__DATE__#\=strftime("%Y/%m/%d %H:%M:%S")#ge

    autocmd BufNewFile *.sh 0r ~/.vim/template/template.sh
    autocmd BufNewFile *.sh %substitute#__DATE__#\=strftime("%Y/%m/%d %H:%M:%S")#ge

    autocmd BufNewFile *.cmd 0r ~/.vim/template/template.cmd
    autocmd BufNewFile *.cmd %substitute#__DATE__#\=strftime("%Y/%m/%d %H:%M:%S")#ge

    autocmd BufNewFile *.bat 0r ~/.vim/template/template.bat
    autocmd BufNewFile *.bat %substitute#__DATE__#\=strftime("%Y/%m/%d %H:%M:%S")#ge

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
