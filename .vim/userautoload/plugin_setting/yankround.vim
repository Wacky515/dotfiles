scriptencoding utf-8
" Created:     2018/09/13 12:32:57
" Last Change: 2018/09/13 17:08:18.

nmap p <Plug>(yankround-p)
xmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap gp <Plug>(yankround-gp)
xmap gp <Plug>(yankround-gp)
nmap gP <Plug>(yankround-gP)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)

" 履歴取得数
let g:yankround_max_history = 50
" 履歴一覧(kien/ctrlp.vim)
nnoremap <silent>g<C-p> :<C-u>CtrlPYankRound<CR>

" 履歴の保存パス
let g:yankround_dir = "~/"
