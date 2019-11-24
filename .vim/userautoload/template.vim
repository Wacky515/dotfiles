scriptencoding utf-8
" Created:     201*/**/** **:**:**
" Last Change: 2019/11/06 15:04:47.

" 新規作成時、動的にテンプレートを読込む
augroup templateload
    autocmd!
    autocmd BufNewFile *.vim  0r ~/.vim/templates/template.vim

    " autocmd BufNewFile ~/dotles/etc/*/osx/*/*.sh
    "             \ 0r ~/.vim/mplates/template_mac.sh
    " autocmd BufNewFile brew*h 0r ~/.vim/templates/template_mac.sh

    autocmd BufNewFile *.sh   0r ~/.vim/templates/template.sh
    autocmd BufNewFile *.shm  0r ~/.vim/templates/template_mac.sh

    autocmd BufNewFile *.cmd  0r ~/.vim/templates/template.cmd
    autocmd BufNewFile *.bat  0r ~/.vim/templates/template.bat

    autocmd BufNewFile *.py   0r ~/.vim/templates/template.py

    autocmd BufNewFile *.html 0r ~/.vim/templates/template.html
    autocmd BufNewFile *.pl   0r ~/.vim/templates/template.pl
    autocmd BufNewFile *.pm   0r ~/.vim/templates/template.pm

    autocmd BufNewFile *      %substitute#__DATE__#\=strftime("%d/%m/%Y")#ge
    autocmd BufNewFile *      %substitute#__NAME__#\=expand("%")#ge
    autocmd BufNewFile *      %substitute#__START__#\=strftime("")#ge
    autocmd BufNewFile *      %substitute#__YEAR__#\=strftime("%Y")#ge
augroup END

