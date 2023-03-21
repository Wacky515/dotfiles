scriptencoding utf-8
" Created:     2018/09/13 12:32:57
" Last Change: 2023/03/21 09:51:43.

" ------------------------------------------------------------------------------
"  マップキー
" ------------------------------------------------------------------------------
nmap p  <Plug>(yankround-p)
xmap p  <Plug>(yankround-p)
nmap P  <Plug>(yankround-P)
nmap gp <Plug>(yankround-gp)
xmap gp <Plug>(yankround-gp)
nmap gP <Plug>(yankround-gP)

if has("mac")
    nmap <C-k>    <Plug>(yankround-prev)
    nmap <C-j>    <Plug>(yankround-next)
else
    nmap <S-Up>   <Plug>(yankround-prev)
    nmap <S-Down> <Plug>(yankround-next)
endif

" コマンドラインで挿入
cmap <C-r> <Plug>(yankround-insert-register)
" コマンドラインで前のレジスタ置換え
cmap <C-y> <Plug>(yankround-pop)

" NOTWORK: "Mac" で動作しない
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
