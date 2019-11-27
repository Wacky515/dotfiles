scriptencoding utf-8
" Created:     2018/12/18 08:03:07
" Last Change: 2019/11/26 16:35:53.

" ---------------------------------------------------------------------------
"  マップキー
" ---------------------------------------------------------------------------
let g:fontzoom_no_default_key_mappings = 1
" +: フォント 拡大
" nmap <silent> +          <Plug>(fontzoom-larger)
nmap <silent> <S-Up>     <Plug>(fontzoom-larger)
nmap <C-ScrollWheelUp>   <Plug>(fontzoom-larger)
" -: フォント 縮小
" nmap <silent> -          <Plug>(fontzoom-smaller)
nmap <silent> <S-Down>    <Plug>(fontzoom-smaller)
nmap <C-ScrollWheelDown> <Plug>(fontzoom-smaller)
