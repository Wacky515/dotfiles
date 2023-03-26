scriptencoding utf-8
" Created:     2019/07/13 10:32:50
" Last Change: 2019/11/26 15:13:47.

" ------------------------------------------------------------------------------
"  基本設定
" ------------------------------------------------------------------------------
set updatetime=1000
function! s:winime_off()
  if exists("g:loaded_winime") && (has('win32') || has('win64'))
    if mode() !=# 'i'
      call winime#off()
      call feedkeys(mode() ==# 'i' ? "\<C-g>\<ESC>" : "g\<ESC>", 'n')
    endif
  endif
endfunction
augroup winime_off
  autocmd!
  autocmd CursorHold,CursorHoldI * call s:winime_off()
augroup END
