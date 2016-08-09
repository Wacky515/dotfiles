scriptencoding utf-8

if exists('b:did_ftplugin_python')
    finish
endif
let b:did_ftplugin_python = 1

" Python用のシンタックスハイライトをON
let python_highlight_all =1

" タブの設定
setlocal smarttab
setlocal expandtab
setlocal tabstop=4
setlocal shiftwidth=4

" 80文字目に赤いラインマークを入れる
set colorcolumn=80

" カラースキーマの指定
" colorscheme hybrid
colorscheme desert
" 暗背景用の配色にする
set background=dark

" スクリプトを実行
" DONE: 実行前に ":w" をする
" nnoremap <F5> :!python % <ENTER>
nnoremap <F5> :w <ENTER> :!python % <ENTER>
" デバッグを実行
nnoremap <F12> :w <ENTER> :!python -m pdb % <ENTER>

