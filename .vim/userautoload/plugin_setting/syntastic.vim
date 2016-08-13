scriptencoding utf-8

let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2
let g:syntastic_mode_map = {"mode": "passive"}
" let g:syntastic_mode_map = {"mode": "active",
" let g:syntastic_mode_map = {"mode": "passive",
                " \ "active_filetypes": ["python"] }
" 挿入モード終了、テキスト変更で "syntastic" 実行
augroup AutoSyntastic
    autocmd!
    autocmd InsertLeave,TextChanged * call s:syntastic()
augroup END
function! s:syntastic()
    w
    SyntasticCheck
endfunction

" PEP8縺ｫ貅匁侠

let g:syntastic_python_checkers = ["flake8"]

" 最大文字数を拡大
" let g:syntastic_python_flake8_args="--max-line-length=120"
