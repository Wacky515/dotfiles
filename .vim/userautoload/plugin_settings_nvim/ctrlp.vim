scriptencoding utf-8
" Created:     2018/03/30 12:15:44
" Last Change: 2018/12/24 10:42:13.

" ,s: ショートカットキー
nnoremap ,s <Nop>
" キーマップ "startify" に移譲
" nnoremap ,sp :<C-u>CtrlP<CR>
nnoremap ,sa :<C-u>CtrlP<Space>
nnoremap ,sb :<C-u>CtrlPBuffer<CR>
nnoremap ,sd :<C-u>CtrlPDir<CR>
nnoremap ,sl :<C-u>CtrlPLine<CR>
nnoremap ,sm :<C-u>CtrlPMRUFiles<CR>
nnoremap ,sq :<C-u>CtrlPQuickfix<CR>
nnoremap ,ss :<C-u>CtrlPMixed<CR>
nnoremap ,st :<C-u>CtrlPTag<CR>

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
