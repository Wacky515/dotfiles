scriptencoding utf-8

if exists("b:did_ftplugin_python")
    finish
endif

let b:did_ftplugin_python = 1

" Python用のシンタックスハイライトをON
let python_highlight_all =1

" シンタックスハイライトに "self" 追加
augroup python
    autocmd!
    autocmd FileType python
                \   syn keyword pythonSelf self
                \ | highlight def link pythonSelf Special
augroup end

" !!!: ".gvim" の設定を記述すると "lightline" が有効にならない  "{{{
" カラースキーマの指定
" colorscheme molokai
" colorscheme hybrid
" colorscheme desert
" colorscheme jellybeans
" 暗背景用の配色にする
" set background=dark
" syntax on
" syntax enable
" set t_Co=256
" }}}

" 80文字目に赤いラインマークを入れる
set colorcolumn=80

" タブの設定
setlocal smarttab
setlocal expandtab
setlocal tabstop=4
setlocal shiftwidth=4

" スクリプトを実行
nnoremap <F5> :w <ENTER> :!python % <ENTER>
" デバッグを実行
nnoremap <F12> :w <ENTER> :!python -m pdb % <ENTER>

" "jedi-vim" で "Anaconda" のライブラリを補完できるようにpathを追加
" "Linux" 環境下でエラー
" if !has("unix")
python << EOF
import os
import sys

home = os.path.expanduser("~")
path = home + "/Anaconda2/Lib/site-packages"
if not path in sys.path:
    sys.path.insert(0, path)
EOF
" endif

" 以下の条件分けは "endif" 無しエラーが解決できないためKill
" if !has("unix")  "{{{
"     python << EOF
"         import os
"         import sys
"         home = os.path.expanduser("~")
"         path = home + "/Anaconda2/Lib/site-packages"
"         if not path in sys.path:
"             sys.path.insert(0, path)
"     EOF
" endif

" if has("win32") || has("win64")
"     python << EOF
"     import os
"     import sys
"     home = os.path.expanduser("~")
"     path = home + "/Anaconda2/Lib/site-packages"
"     if not path in sys.path:
"         sys.path.insert(0, path)
"     EOF
" endif  "}}}

" if !has("unix")"{{{
"     python << EOF
"     import os
"     import sys
"     home = os.path.expanduser("~")
"     path = home + "/Anaconda2/Lib/site-packages"
"     if not path in sys.path:
"         sys.path.insert(0, path)
"     EOF
" endif

" if has("win32") || has("win64")
"     python << EOF
"     import os
"     import sys
"     home = os.path.expanduser("~")
"     path = home + "/Anaconda2/Lib/site-packages"
"     if not path in sys.path:
"         sys.path.insert(0, path)
"     EOF
" endif"}}}
