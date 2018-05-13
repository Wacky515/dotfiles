scriptencoding utf-8
" Last Change: 2018/05/13 16:59:31.

" マップキー
nnoremap [Mark] <Nop>
nmap m [Mark]

" 起動時にマーク表示
aug show-marks-sync
        au!
        au BufReadPost * sil! DoShowMarks
aug END

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

" 任意の位置にマーク
command! -nargs=? SetNextMarkChar call s:set_next_mark_char(<f-args>)
function! s:set_next_mark_char(...)
  if a:0 >= 1
    let b:markrement_pos=index(g:markrement_char,a:1)-1
  else
    echo "Next:".g:markrement_char[b:markrement_pos+1]
  end
endfunction

" 次にマークする文字を設定
nnoremap [Mark]sa :SetNextMarkChar a<CR>
nnoremap [Mark]sb :SetNextMarkChar b<CR>
nnoremap [Mark]sc :SetNextMarkChar c<CR>
nnoremap [Mark]sd :SetNextMarkChar d<CR>
nnoremap [Mark]se :SetNextMarkChar e<CR>
nnoremap [Mark]sf :SetNextMarkChar f<CR>
nnoremap [Mark]sg :SetNextMarkChar g<CR>
nnoremap [Mark]sh :SetNextMarkChar h<CR>
nnoremap [Mark]si :SetNextMarkChar i<CR>
nnoremap [Mark]sj :SetNextMarkChar j<CR>
nnoremap [Mark]sk :SetNextMarkChar k<CR>
nnoremap [Mark]sl :SetNextMarkChar l<CR>
nnoremap [Mark]sm :SetNextMarkChar m<CR>
nnoremap [Mark]sn :SetNextMarkChar n<CR>
nnoremap [Mark]so :SetNextMarkChar o<CR>
nnoremap [Mark]sp :SetNextMarkChar p<CR>
nnoremap [Mark]sq :SetNextMarkChar q<CR>
nnoremap [Mark]sr :SetNextMarkChar r<CR>
nnoremap [Mark]ss :SetNextMarkChar s<CR>
nnoremap [Mark]st :SetNextMarkChar t<CR>
nnoremap [Mark]su :SetNextMarkChar u<CR>
nnoremap [Mark]sv :SetNextMarkChar v<CR>
nnoremap [Mark]sw :SetNextMarkChar w<CR>
nnoremap [Mark]sx :SetNextMarkChar x<CR>
nnoremap [Mark]sy :SetNextMarkChar y<CR>
nnoremap [Mark]sz :SetNextMarkChar z<CR>

" マークする文字を設定し、同時にマーク
nnoremap [Mark]ma :SetNextMarkChar a<CR>:<C-u>call <SID>AutoMarkrement()<CR>:DoShowMarks<CR>
nnoremap [Mark]mb :SetNextMarkChar b<CR>:<C-u>call <SID>AutoMarkrement()<CR>:DoShowMarks<CR>
nnoremap [Mark]mc :SetNextMarkChar c<CR>:<C-u>call <SID>AutoMarkrement()<CR>:DoShowMarks<CR>
nnoremap [Mark]md :SetNextMarkChar d<CR>:<C-u>call <SID>AutoMarkrement()<CR>:DoShowMarks<CR>
nnoremap [Mark]me :SetNextMarkChar e<CR>:<C-u>call <SID>AutoMarkrement()<CR>:DoShowMarks<CR>
nnoremap [Mark]mf :SetNextMarkChar f<CR>:<C-u>call <SID>AutoMarkrement()<CR>:DoShowMarks<CR>
nnoremap [Mark]mg :SetNextMarkChar g<CR>:<C-u>call <SID>AutoMarkrement()<CR>:DoShowMarks<CR>
nnoremap [Mark]mh :SetNextMarkChar h<CR>:<C-u>call <SID>AutoMarkrement()<CR>:DoShowMarks<CR>
nnoremap [Mark]mi :SetNextMarkChar i<CR>:<C-u>call <SID>AutoMarkrement()<CR>:DoShowMarks<CR>
nnoremap [Mark]mj :SetNextMarkChar j<CR>:<C-u>call <SID>AutoMarkrement()<CR>:DoShowMarks<CR>
nnoremap [Mark]mk :SetNextMarkChar k<CR>:<C-u>call <SID>AutoMarkrement()<CR>:DoShowMarks<CR>
nnoremap [Mark]ml :SetNextMarkChar l<CR>:<C-u>call <SID>AutoMarkrement()<CR>:DoShowMarks<CR>
nnoremap [Mark]mm :SetNextMarkChar m<CR>:<C-u>call <SID>AutoMarkrement()<CR>:DoShowMarks<CR>
nnoremap [Mark]mn :SetNextMarkChar n<CR>:<C-u>call <SID>AutoMarkrement()<CR>:DoShowMarks<CR>
nnoremap [Mark]mo :SetNextMarkChar o<CR>:<C-u>call <SID>AutoMarkrement()<CR>:DoShowMarks<CR>
nnoremap [Mark]mp :SetNextMarkChar p<CR>:<C-u>call <SID>AutoMarkrement()<CR>:DoShowMarks<CR>
nnoremap [Mark]mq :SetNextMarkChar q<CR>:<C-u>call <SID>AutoMarkrement()<CR>:DoShowMarks<CR>
nnoremap [Mark]mr :SetNextMarkChar r<CR>:<C-u>call <SID>AutoMarkrement()<CR>:DoShowMarks<CR>
nnoremap [Mark]ms :SetNextMarkChar s<CR>:<C-u>call <SID>AutoMarkrement()<CR>:DoShowMarks<CR>
nnoremap [Mark]mt :SetNextMarkChar t<CR>:<C-u>call <SID>AutoMarkrement()<CR>:DoShowMarks<CR>
nnoremap [Mark]mu :SetNextMarkChar u<CR>:<C-u>call <SID>AutoMarkrement()<CR>:DoShowMarks<CR>
nnoremap [Mark]mv :SetNextMarkChar v<CR>:<C-u>call <SID>AutoMarkrement()<CR>:DoShowMarks<CR>
nnoremap [Mark]mw :SetNextMarkChar w<CR>:<C-u>call <SID>AutoMarkrement()<CR>:DoShowMarks<CR>
nnoremap [Mark]mx :SetNextMarkChar x<CR>:<C-u>call <SID>AutoMarkrement()<CR>:DoShowMarks<CR>
nnoremap [Mark]my :SetNextMarkChar y<CR>:<C-u>call <SID>AutoMarkrement()<CR>:DoShowMarks<CR>
nnoremap [Mark]mz :SetNextMarkChar z<CR>:<C-u>call <SID>AutoMarkrement()<CR>:DoShowMarks<CR>

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

" m,: + 1文字で指定のマークへ移動
nnoremap [Mark], '
" mj: 次のマークへ移動
nnoremap [Mark]j ]`
" mk: 前のマークへ移動
nnoremap [Mark]k [`
" md: マークの全削除
com! -bar MarksDelete sil :delm! | :delm 0-9A-Z | :wv! | :DoShowMarks
nn <silent>[Mark]d :MarksDelete<CR>

" Help、quickfix、編集不可バッファはマークを表示しない
let showmarks_ignore_type = "hqm"
