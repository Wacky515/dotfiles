scriptencoding utf-8
" Created:     2018/09/13 12:32:57
" Last Change: 2023/03/11 14:34:53.

" ------------------------------------------------------------------------------
"  マップキー
" ------------------------------------------------------------------------------
nmap p        <Plug>(yankround-p)
xmap p        <Plug>(yankround-p)
nmap P        <Plug>(yankround-P)
nmap gp       <Plug>(yankround-gp)
xmap gp       <Plug>(yankround-gp)
nmap gP       <Plug>(yankround-gP)
nmap <S-Up>   <Plug>(yankround-prev)
nmap <S-Down> <Plug>(yankround-next)

" コマンドライン内の設定
cmap <C-r>    <Plug>(yankround-insert-register)
cmap <C-y>    <Plug>(yankround-pop)

" g<C-p>:    履歴一覧(CtrlP)
nnoremap g<C-p>    :<C-u>CtrlPYankRound<CR>

" ------------------------------------------------------------------------------
"  基本設定
" ------------------------------------------------------------------------------
" 貼り付けをハイライト
let g:yankround_use_region_hl = 1

" 履歴取得数
let g:yankround_max_history   = 50

" 履歴の保存パス
let g:yankround_dir           = "~/"
