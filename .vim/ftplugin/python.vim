scriptencoding utf-8
" Created:     201*/**/** **:**:**
" Last Change: 2023/03/12 08:20:01.

" ------------------------------------------------------------------------------
"  マップキー
" ------------------------------------------------------------------------------
" スクリプトを実行
if has("mac")
    nnoremap <F5>  :<C-u>w <ENTER> :!Python3 %:p <ENTER>
elseif (has("win32") || has("win64"))
    nnoremap <F5>  :<C-u>w <ENTER> :!py -3.7 % <ENTER>
endif

" デバッグを実行
if has("mac")
    nnoremap <F12> :<C-u>w <ENTER> :!Python3 -m pdb %:p <ENTER>
elseif (has("win32") || has("win64"))
    nnoremap <F12> :<C-u>w <ENTER> :!py -3.7 -m pdb % <ENTER>
endif

" ------------------------------------------------------------------------------
"  基本設定
" ------------------------------------------------------------------------------
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
