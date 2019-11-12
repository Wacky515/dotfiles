scriptencoding utf-8
" Created:     2018/09/14 12:05:06
" Last Change: 2018/12/17 14:08:17.

" NORMALモードのカーソル移動中に "filetype" の切替を無効化
" (Helpは除外)
let g:precious_enable_switch_CursorMoved = { '*': 0, 'help': 1 }

" INSERTモードのON／OFFに合わせてトグル
autocmd MyAutoCmd InsertEnter * :PreciousSwitch
autocmd MyAutoCmd InsertLeave * :PreciousReset

