scriptencoding utf-8
" Created:     201*/**/** **:**:**
" Last Change: 2019/10/10 09:32:10.

" インクリメンタルサーチ
" ※ 検索文字入力で即時検索開始
set incsearch

" 検索時に大文字・小文字を区別しない
set ignorecase
" 検索時に大文字がある場合は大文字・小文字を区別
set smartcase

" 最後のヒットまで検索したら最初のヒットに戻る
set wrapscan

" 検索マッチテキストをハイライト
set hlsearch

" 検索開始時にジャンプしない
" nmap* *N
nnoremap * *Nzz

" 検索ジャンプを画面中央に表示
nnoremap n nzz
nnoremap N Nzz
" nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" "/" でvery magic検索
nnoremap /  /\v

" 検索時に "\" や "?" のエスケープを簡素化
" TODO: 動作確認
cnoremap <expr> / getcmdtype() == "/" ? "\/" : "/"
cnoremap <expr> ? getcmdtype() == "?" ? "\?" : "?"

" カーソル下と同じ単語 ハイライト 其一
" FIXME: 空白行にオンカーソルした時の挙動が変
" autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))

" カーソル下と同じ単語 ハイライト 其二
" FIXME: 動かない
" highlight CurrentWord term=NONE ctermbg=DarkMagenta ctermfg=NONE
"
" function! s:EscapeText( text )
"   return substitute( escape(a:text, '\' . '^$.*[~'), "\n", '\\n', 'ge' )
" endfunction
"
" function! s:GetCurrentWord()
"   let l:cword = expand('<cword>')
"   if !empty(l:cword)
"     let l:regexp = s:EscapeText(l:cword)
"     if l:cword =~# '^\k\+$'
"       let l:regexp = '\<' . l:regexp . '\>'
"     endif
"     return l:regexp
"   else
"     return ''
"   endif
" endfunction
"
" function! s:HighlightCurrentWord()
"   let l:word = s:GetCurrentWord()
"   if !empty(l:word)
"     if exists("w:current_match")
"       call matchdelete(w:current_match)
"     endif
"     let w:current_match = matchadd('CurrentWord', l:word, 0)
"   endif
" endfunction
"
" augroup cwh
"   autocmd!
"   autocmd CursorMoved,CursorMovedI * call s:HighlightCurrentWord()
" augroup END
