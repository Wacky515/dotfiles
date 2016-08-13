scriptencoding utf-8

if exists("b:did_ftplugin_python")
    finish
endif
let b:did_ftplugin_python = 1

" Python用のシンタックスハイライトをON
let python_highlight_all =1

" カラースキーマの指定
" colorscheme hybrid
" colorscheme desert
" colorscheme jellybeans
colorscheme molokai
" 暗背景用の配色にする
set background=dark
" syntax on
syntax enable
set t_Co=256

" 80文字目に赤いラインマークを入れる
set colorcolumn=80

" タブの設定
setlocal smarttab
setlocal expandtab
setlocal tabstop=4
setlocal shiftwidth=4

" スクリプトを実行
" DONE: 実行前に ":w" をする
" nnoremap <F5> :!python % <ENTER>
nnoremap <F5> :w <ENTER> :!python % <ENTER>
" デバッグを実行
nnoremap <F12> :w <ENTER> :!python -m pdb % <ENTER>

" FIXME: パスを通せない
" "Anaconda" のパス
" python << EOF
" import os
" import sys

" home = os.path.expanduser("‾")
" " path = home + "/anaconda/lib/python2.7/site-packages"
" " path = home + "/Anaconda2/Lib/site-packages"
" " path = home + "/Anaconda2"
" " path = home + "¥Anaconda2¥Lib¥site-packages"
" " path = home + "/Anaconda2/Lib/site-packages/"
" path = "C:/（旧環境）_Python27/Lib/site-packages"
" if not path in sys.path:
"     sys.path.insert(0, path)
" EOF

" if has("win32") || has("win64")
"     python << EOF
"     import os
"     import sys
"
"     home = os.path.expanduser("‾")
"     " path = home + "/anaconda/lib/python2.7/site-packages"
"     path = home + "/Anaconda2/Lib/site-packages"
"     if not path in sys.path:
"         sys.path.insert(0, path)
"     EOF
" endif
python << EOF
import os
import sys

home = os.path.expanduser("‾")
path = home + "/anaconda/lib/python2.7/site-packages"
" path = os.path.expanduser("C:\\Users\\22683\\Anaconda2\\Lib\\site-packages")
" path = os.path.expanduser("~/22683\Anaconda2\Lib\site-packages")
" path = os.path.expanduser("~/.pyenv/versions/anaconda-2.3.0/lib/python2.7/site-packages")
" C:\Users\22683\Anaconda2\Lib\site-packages
if not path in sys.path:
    sys.path.append(path)
EOF
