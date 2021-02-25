scriptencoding utf-8
" Created:     201*/**/** **:**:**
" Last Change: 2021/02/26 08:27:24.

" ---------------------------------------------------------------------------
"  マップキー
" ---------------------------------------------------------------------------
" スクリプトを実行
if has("mac")
    nnoremap <F5>  :w <ENTER> :!Python3 %:p <ENTER>
elseif (has("win32") || has("win64"))
    nnoremap <F5>  :w <ENTER> :!py -3.7 % <ENTER>
endif

" デバッグを実行
if has("mac")
    nnoremap <F12> :w <ENTER> :!Python3 -m pdb %:p <ENTER>
elseif (has("win32") || has("win64"))
    nnoremap <F12> :w <ENTER> :!py -3.7 -m pdb % <ENTER>
endif

" ---------------------------------------------------------------------------
"  基本設定
" ---------------------------------------------------------------------------
" "jedi-vim" で "Anaconda3" のライブラリを補完できるよう "path" を追加
if has("vim_starting")
    if has("mac")
        set pythonthreedll=/usr/local/Cellar/python@3.9/3.9.2/Frameworks/Python.framework/Versions/3.9/Python
        set pythonthreehome=/usr/local/Cellar/python@3.9/3.9.2/Frameworks/Python.framework/Versions/3.9/

    elseif has("unix")
        set pythonthreedll=$VIM/python3/python35.dll
        set pythonthreehome=$VIM/python3/

    elseif (has("win32") || has("win64"))
        if !has("nvim")
            if hostname() == "HBAMB819"
                set pythonthreedll=C:\Python36\python36.dll
            else
                set pythonthreedll=C:\Users\mm12167\AppData\Local\Programs\Python\Python36\python36.dll
            endif
        endif
    endif
endif

" タブの設定
setlocal smarttab
setlocal expandtab
setlocal tabstop=4
setlocal shiftwidth=4

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

" " 80文字目に赤いラインマーク
" set colorcolumn=80
