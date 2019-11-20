scriptencoding utf-8
" Created:     2018/09/13 12:32:57
" Last Change: 2019/11/20 13:49:02.

" ---------------------------------------------------------------------------
"  マップキー
" ---------------------------------------------------------------------------
" MEMO: "dein*.tmol" に記述移管  " {{{
    " nmap p        <Plug>(yankround-p)
    " xmap p        <Plug>(yankround-p)
    " nmap P        <Plug>(yankround-P)
    " nmap gp       <Plug>(yankround-gp)
    " xmap gp       <Plug>(yankround-gp)
    " nmap gP       <Plug>(yankround-gP)
    " nmap <S-Up>   <Plug>(yankround-prev)
    " nmap <S-Down> <Plug>(yankround-next)
	" cmap <C-r>    <Plug>(yankround-insert-register)
	" cmap <C-y>    <Plug>(yankround-pop)
" }}}

" <Leader>y: 履歴一覧(Unite)
nnoremap <Leader>y :<C-u>Unite yankround<CR>
" g<C-p>:    履歴一覧(CtrlP)
nnoremap <silent>g<C-p> :<C-u>CtrlPYankRound<CR>

" ---------------------------------------------------------------------------
"  基本設定
" ---------------------------------------------------------------------------
" 履歴取得数
let g:yankround_max_history = 50

" 履歴の保存パス
let g:yankround_dir = "~/"

" 貼り付けをハイライト
let g:yankround_use_region_hl = 1
