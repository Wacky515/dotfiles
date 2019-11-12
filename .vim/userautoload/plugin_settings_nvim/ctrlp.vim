scriptencoding utf-8
" Created:     2018/03/30 12:15:44
" Last Change: 2019/01/07 15:59:57.

" <C-i>: ショートカットキー
nnoremap <C-i> <Nop>
" nnoremap ,s <Nop>

nnoremap <C-i>p :<C-u>CtrlP<CR>
nnoremap <C-i>a :<C-u>CtrlP<Space>
nnoremap <C-i>b :<C-u>CtrlPBuffer<CR>
nnoremap <C-i>d :<C-u>CtrlPDir<CR>
nnoremap <C-i>l :<C-u>CtrlPLine<CR>
nnoremap <C-i>m :<C-u>CtrlPMRUFiles<CR>
nnoremap <C-i>q :<C-u>CtrlPQuickfix<CR>
nnoremap <C-i>s :<C-u>CtrlPMixed<CR>
nnoremap <C-i>t :<C-u>CtrlPTag<CR>

let g:ctrlp_map = '<Nop>'
" Guess vcs root dir
let g:ctrlp_working_path_mode = 'ra'
" Open new file in current window
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_extensions = ['tag', 'quickfix', 'dir', 'line', 'mixed']
" let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:18'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:18'

" ---------------------------------------------------------------------------
"  RipGrep 設定
" ---------------------------------------------------------------------------
if executable('rg')
  let g:ctrlp_use_caching = 0
  "let g:ctrlp_user_command = 'cd %s && rg "" -i -r --no-color -l ./**/*'
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
endif

