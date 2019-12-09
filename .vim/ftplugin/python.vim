scriptencoding utf-8
" Created:     201*/**/** **:**:**
" Last Change: 2019/11/29 16:31:10.

" ---------------------------------------------------------------------------
"  マップキー
" ---------------------------------------------------------------------------
" スクリプトを実行
nnoremap <F5>  :w <ENTER> :!python % <ENTER>
" デバッグを実行
nnoremap <F12> :w <ENTER> :!python -m pdb % <ENTER>

" ---------------------------------------------------------------------------
"  基本設定
" ---------------------------------------------------------------------------
" タブの設定
setlocal smarttab
setlocal expandtab
setlocal tabstop=4
setlocal shiftwidth=4

" 80文字目に赤いラインマーク
set colorcolumn=80

" "Python" 用のシンタックスハイライトをON
let python_highlight_all =1

if exists("b:did_ftplugin_python")
    finish
endif
let b:did_ftplugin_python = 1

" シンタックスハイライトに "self" 追加
augroup python
    autocmd!
    autocmd FileType python
                \   syn keyword pythonSelf self
                \ | highlight def link pythonSelf Special
augroup end

" "jedi-vim" で "Anaconda3" のライブラリを補完できるよう "path" を追加
if has("vim_starting")
    if has("macunix")
        " brew install python3
        set pythonthreedll=
                    \ /usr/local/Cellar/python3/3.6.4_2/
                    \ Frameworks/Python.framework/Versions/3.6/Python
        set pythonthreehome=
                    \ /usr/local/Cellar/python3/3.6.4_2/
                    \ Frameworks/Python.framework/Versions/3.6
    elseif has("win32")
        " FIXME:
        " embed 版 Python を Vim と同じフォルダに置く
        "   python35.dll
        "   python35.zip
    endif
endif

" REF:  " {{{
    " if has("linux")
        " set pythonthreedll=$VIM/python3/python35.dll
    " elseif has("win64")
        " let $PYTHONHOME="C:\ProgramData\chocolatey\.chocolatey\anaconda3.5.0.1"
        " let $PYTHONHOME="C:\tools\Anaconda3\envs\TestAnacondaVEnv\python35.dll"
        " set pythonthreedll=C:\tools\Anaconda3\envs\TestAnacondaVEnv\python35.dll
    " endif

" https://qiita.com/CutBaum/items/a8de8e3f4e32c0a3ad1e
" }}}
