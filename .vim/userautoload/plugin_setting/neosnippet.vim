scriptencoding utf-8
" Created:     2018/03/19 09:07:48
" Last Change: 2018/09/21 11:29:38.

" ---------------------------------------------------------------------------
" マップキー
" ---------------------------------------------------------------------------
" <C-k>: ターゲットジャンプ
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
" TODO: キーを潰していないか確認
" imap <Leader>k <Plug>(neosnippet_expand_or_jump)
" smap <Leader>k <Plug>(neosnippet_expand_or_jump)
" xmap <Leader>k <Plug>(neosnippet_expand_target)

" <TAB>:        次の補完部分へ移動
" <Shift><Tab>: 前の補完部分へ移動
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
imap <expr><TAB> pumvisible() ?
            \ "\<C-n>" : neosnippet#jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" ---------------------------------------------------------------------------
" 基本設定
" ---------------------------------------------------------------------------
" For snippet_complete marker.
if has("conceal")
    set conceallevel=2 concealcursor=i
endif

" 自作スニペットのディレクトリ
let g:neosnippet#snippets_directory =
            \ "~/.cache/dein/repos/github.com/Shougo/neosnippet-snippets,
            \ ~/.vim/snippets/"
