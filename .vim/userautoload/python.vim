scriptencoding utf-8

" TODO: if has (*.py)

" スクリプトを実行
" TODO: 実行前に ":w" をする
nnoremap <F5> :!python % <ENTER>
" デバッグを実行
nnoremap <F12> :!python -m pdb % <ENTER>

