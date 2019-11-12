scriptencoding utf-8
" Created:     2018/09/13 12:32:57
" Last Change: 2019/10/30 16:05:26.

" MEMO: "dein*.tmol" に記述移管
" nmap p     <Plug>(yankround-p)
" xmap p     <Plug>(yankround-p)
" nmap P     <Plug>(yankround-P)
" nmap gp    <Plug>(yankround-gp)
" xmap gp    <Plug>(yankround-gp)
" nmap gP    <Plug>(yankround-gP)
" nmap <C-p> <Plug>(yankround-prev)
" nmap <C-n> <Plug>(yankround-next)

" <Leader>y: 履歴一覧(Unite)
nnoremap <Leader>y :<C-u>Unite yankround<CR>
" g<C-p>: 履歴一覧(CtrlP)
nnoremap <silent>g<C-p> :<C-u>CtrlPYankRound<CR>

" 履歴取得数
let g:yankround_max_history = 50

" 履歴の保存パス
let g:yankround_dir = "~/"

" 貼り付けをハイライト
let g:yankround_use_region_hl = 1

