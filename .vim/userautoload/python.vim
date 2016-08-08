scriptencoding utf-8

if exists('b:did_ftplugin_python')
    finish
endif
let b:did_ftplugin_python = 1

" Python用のシンタックスハイライトをON
let python_highlight_all =1

setlocal smarttab
setlocal expandtab
setlocal tabstop=4
setlocal shiftwidth=4

" スクリプトを実行
" TODO: 実行前に ":w" をする
nnoremap <F5> :!python % <ENTER>
" デバッグを実行
nnoremap <F12> :!python -m pdb % <ENTER>

