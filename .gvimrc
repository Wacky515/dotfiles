scriptencoding utf-8

""" 外観テーマ篇 """

" カラースキーマの指定
" colorscheme hybrid
colorscheme desert

" 暗背景用の配色にする
set background=dark

" ウィンドウ 半透明化
if has('mac')
    set transparency=10
endif
if has('win32') || ('win64')
    :autocmd GUIEnter * set transparency=235
endif

" シンタックスハイライト
syntax on

" 行番号の色
highlight LineNr ctermfg=darkyellow
