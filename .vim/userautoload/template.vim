scriptencoding utf-8
" Created:     20**/**/** **:**:**
" Last Change: 2018/12/24 09:05:30.

" 新規作成時、動的にテンプレートを読込む
augroup templateload
    autocmd!
    autocmd BufNewFile *.vim 0r ~/.vim/templates/template.vim
    autocmd BufNewFile *.vim %substitute#__DATE__#\=strftime("%Y/%m/%d %H:%M:%S")#ge
    autocmd BufNewFile *.vim %substitute#__START__#\=strftime("")#ge

    autocmd BufNewFile *.sh 0r ~/.vim/templates/template.sh
    autocmd BufNewFile *.sh %substitute#__DATE__#\=strftime("%Y/%m/%d %H:%M:%S")#ge
    autocmd BufNewFile *.sh %substitute#__START__#\=strftime("")#ge

    autocmd BufNewFile *.cmd 0r ~/.vim/templates/template.cmd
    autocmd BufNewFile *.cmd %substitute#__DATE__#\=strftime("%Y/%m/%d %H:%M:%S")#ge
    autocmd BufNewFile *.cmd %substitute#__START__#\=strftime("")#ge

    autocmd BufNewFile *.bat 0r ~/.vim/templates/template.bat
    autocmd BufNewFile *.bat %substitute#__DATE__#\=strftime("%Y/%m/%d %H:%M:%S")#ge
    autocmd BufNewFile *.bat %substitute#__START__#\=strftime("")#ge

    autocmd BufNewFile *.py 0r ~/.vim/templates/template.py
    autocmd BufNewFile *.py %substitute#__NAME__#\=expand("%")#ge
    autocmd BufNewFile *.py %substitute#__DATE__#\=strftime("%d/%m/%Y")#ge
    autocmd BufNewFile *.py %substitute#__YEAR__#\=strftime("%Y")#ge
    autocmd BufNewFile *.py %substitute#__START__#\=strftime("")#ge

    autocmd BufNewFile *.html 0r ~/.vim/templates/template.html
    autocmd BufNewFile *.html %substitute#__DATE__#\=strftime("%d/%m/%Y")#ge
    autocmd BufNewFile *.html %substitute#__START__#\=strftime("")#ge

    autocmd BufNewFile *.pl 0r ~/.vim/templates/template.pl
    autocmd BufNewFile *.pl %substitute#__DATE__#\=strftime("%d/%m/%Y")#ge
    autocmd BufNewFile *.pl %substitute#__START__#\=strftime("")#ge

    autocmd BufNewFile *.pm 0r ~/.vim/templates/template.pm
    autocmd BufNewFile *.pm %substitute#__DATE__#\=strftime("%d/%m/%Y")#ge
    autocmd BufNewFile *.pm %substitute#__START__#\=strftime("")#ge
augroup END

