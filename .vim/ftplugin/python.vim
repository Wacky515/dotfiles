scriptencoding utf-8
" Created:     201*/**/** **:**:**
" Last Change: 2019/01/08 13:52:41.

if exists("b:did_ftplugin_python")
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

" "jedi-vim" で "Anaconda3" のライブラリを補完できるように "path" を追加
if has('vim_starting')
    if has('macunix')
        " brew install python3
        set pythonthreedll=
                    \ /usr/local/Cellar/python3/3.6.4_2/
                    \ Frameworks/Python.framework/Versions/3.6/Python
        set pythonthreehome=
                    \ /usr/local/Cellar/python3/3.6.4_2/
                    \ Frameworks/Python.framework/Versions/3.6
    elseif has('win32')
        " 完璧ではない
        " embed 版のpython をダウンロードして vim と同じフォルダに置く。
        "   python35.dll
        "   python35.zip
    endif
endif

" REF:
    " if has("linux")
        " set pythonthreedll=$VIM/python3/python35.dll
    " elseif has("win64")
        " let $PYTHONHOME='C:\ProgramData\chocolatey\.chocolatey\anaconda3.5.0.1'
        " let $PYTHONHOME='C:\tools\Anaconda3\envs\TestAnacondaVEnv\python35.dll'
        " set pythonthreedll=C:\tools\Anaconda3\envs\TestAnacondaVEnv\python35.dll
    " endif

" REF: https://qiita.com/CutBaum/items/a8de8e3f4e32c0a3ad1e

" スクリプトを実行
nnoremap <F5> :w <ENTER> :!python % <ENTER>
" デバッグを実行
nnoremap <F12> :w <ENTER> :!python -m pdb % <ENTER>

" シンタックスハイライトに "self" 追加
augroup python
    autocmd!
    autocmd FileType python
                \   syn keyword pythonSelf self
                \ | highlight def link pythonSelf Special
augroup end

" 80文字目に赤いラインマーク
set colorcolumn=80

" FIXME: ".gvim" の設定を記述すると "lightline" が有効にならない  "{{{
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

" 以下、旧記述
" FIXED?: "Linux" 環境下でエラー "{{{
" if !has("unix")
" python3 << EOF
" import os
" import sys

" スクリプトを実行
nnoremap <F5> :w <ENTER> :!python % <ENTER>
" デバッグを実行
nnoremap <F12> :w <ENTER> :!python -m pdb % <ENTER>

" jedi-vim" で "Anaconda3 " のライブラリを補完できるようにpathを追加
" FIXED?: "Linux" 環境下でエラー
if !has("unix")
    " python3 << EOF
    python << EOF
    import os
    import sys

    path = "C:/tools/Anaconda3/Lib/site-packages"
    if not path in sys.path:
        sys.path.insert(0, path)
        EOF
    endif

    " 以下の条件分けは "endif" 無しエラーが解決できないためKill
    " if !has("unix") "{{{
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
    " endif "}}}

    " if !has("unix") "{{{
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
    " endif
    " }}}
