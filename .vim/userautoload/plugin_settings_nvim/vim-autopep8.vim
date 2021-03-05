scriptencoding utf-8
" Created:     2021/03/05 11:44:10
" Last Change: 2021/03/05 14:31:23.

" ---------------------------------------------------------------------------
" マップキー
" ---------------------------------------------------------------------------
" <Sift>s: "PEP8" に基づいた自動整形
function! Preserve(command)
    " Save the last search.
    let search = @/
    " Save the current cursor position.
    let cursor_position = getpos('.')
    " Save the current window position.
    normal! H
    let window_position = getpos('.')
    call setpos('.', cursor_position)
    " Execute the command.
    execute a:command
    " Restore the last search.
    let @/ = search
    " Restore the previous window position.
    call setpos('.', window_position)
    normal! zt
    " Restore the previous cursor position.
    call setpos('.', cursor_position)
endfunction
function! Autopep8()
    call Preserve(':silent %!autopep8 --ignore=E501 -')
endfunction
autocmd FileType python nnoremap <S-s> :call Autopep8()<CR>

" REF:
" Do not fix these errors/warnings (default: E226,E24,W6)
" let g:autopep8_ignore="E501,W293"

" ---------------------------------------------------------------------------
"  基本設定
" ---------------------------------------------------------------------------
" "Quickfix" 位置
let g:flake8_quickfix_location="topleft"
" "Quickfix" 高さ
let g:flake8_quickfix_height=7
" 左端にシンボルを表示
let g:flake8_show_in_gutter=1
" ファイル内にマークを表示
let g:flake8_show_in_file=1
