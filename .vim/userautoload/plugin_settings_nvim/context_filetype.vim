scriptencoding utf-8
" Created:     2018/09/14 12:05:06
" Last Change: 2019/11/22 16:20:25.

" ------------------------------------------------------------------------------
"  基本設定
" ------------------------------------------------------------------------------
" ノーマルモードのカーソル移動中に "filetype" の切替を無効化
    " HELP は除外
let g:precious_enable_switch_CursorMoved = { '*': 0, 'help': 1 }

" 挿入モード ON/OFF に合わせトグル
autocmd MyAutoCmd InsertEnter * :PreciousSwitch
autocmd MyAutoCmd InsertLeave * :PreciousReset
