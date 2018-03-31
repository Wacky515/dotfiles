scriptencoding utf-8
" Last Change: 2018/03/24 23:05:16.

" マップキー
nnoremap [Mark] <Nop>
nmap m [Mark]

" mn: 現在位置をマーク
if !exists('g:markrement_char')
    let g:markrement_char = [
        \ 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
        \ 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
        \ ]
endif
nnoremap <silent>[Mark]n :<C-u>call <SID>AutoMarkrement()<CR>:DoShowMarks<CR>
function! s:AutoMarkrement()
    if !exists('b:markrement_pos')
        let b:markrement_pos = 0
    else
        let b:markrement_pos = (b:markrement_pos + 1) % len(g:markrement_char)
    endif
    execute 'mark' g:markrement_char[b:markrement_pos]
    echo 'marked' g:markrement_char[b:markrement_pos]
endfunction

" ml: マーク一覧を表示/非表示
let b:mark_exist = 0
set updatetime=1
function! s:MarkList()
    if b:mark_exist == 0
        let b:mark_exist = 1
        nnoremap <silent>[Mark]l :<C-u>1PreviewMarks<CR>
            \:<C-u>NoShowMarks<CR> :<C-u>call <SID>MarkList()<CR>
    else
        let b:mark_exist = 0
        nnoremap <silent>[Mark]l :<C-u>PreviewMarks<CR>
            \:<C-u>DoShowMarks<CR> :<C-u>call <SID>MarkList()<CR>
    endif
endfunction
nnoremap <silent>[Mark]l :<C-u>PreviewMarks<CR>
            \:<C-u>DoShowMarks<CR> :<C-u>call <SID>MarkList()<CR>

" mm: +1文字で指定のマークへ移動
" FIXME: ↓ 動作しない
" nnoremap [Mark]m '
" mj: 次のマークへ移動
nnoremap [Mark]j ]`
" mk: 前のマークへ移動
nnoremap [Mark]k [`
