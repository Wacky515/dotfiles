scriptencoding utf-8

if exists("b:did_ftplugin_python")
    finish
endif
let b:did_ftplugin_python = 1

" Python用のシンタックスハイライトをON
let python_highlight_all =1

" !!!: .gvimの設定を記述すると "lightline" が有効にならない
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

" "Anaconda" のパス
python << EOF
import os

home = os.path.expanduser("~")
path = home + "/Anaconda2/Lib/site-packages"
if not path in sys.path:
    sys.path.insert(0, path)
EOF

" 以下の条件分けは "endif" 無しエラーが解決できないためKill
" if !has("unix")"{{{
"     python << EOF
"         import os

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
" endif"}}}

" if !has("unix")"{{{
"     python << EOF
"     import os

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

" シンタックスハイライトに追加 Test3
augroup python
    autocmd!
    autocmd FileType python
                \   syn keyword pythonSelf self
                \ | highlight def link pythonSelf Special
augroup end

" シンタックスハイライトに追加 Test2
" syn match pythonBoolean "\(\W\|^\)\@<=self\(\.\)\@="

" " シンタックスハイライトに追加 Test1
" if version < 600
"   syntax clear
" elseif exists('b:current_after_syntax')
"   finish
" endif
"
" " We need nocompatible mode in order to continue lines with backslashes.
" " Original setting will be restored.
" let s:cpo_save = &cpo
" set cpo&vim
"
" syn match pythonOperator "\(+\|=\|-\|\^\|\*\)"
" syn match pythonDelimiter "\(,\|\.\|:\)"
" syn keyword pythonSpecialWord self
"
" hi link pythonSpecialWord    Special
" hi link pythonDelimiter      Special
"
" let b:current_after_syntax = 'python'
"
" let &cpo = s:cpo_save
" unlet s:cpo_save
