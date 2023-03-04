scriptencoding utf-8
" Created:     2018/03/19 09:07:48
" Last Change: 2019/11/22 17:01:54.

" -----------------------------------------------------------------------------
"  マップキー
" -----------------------------------------------------------------------------
" TODO: 縦分割にしたい(現状は仮挙動、遅い)
" TODO: F8 動作をトグルしたい
" <F8>: スニペット登録/編集
" nnoremap <F8> :NeoSnippetEdit<CR>
nnoremap <F8> :vsplit <CR> :NeoSnippetEdit<CR>

" <C-k>: ターゲットジャンプ
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" <TAB>:        次の補完部分へ移動
imap <expr><TAB> pumvisible() ?
            \ "\<C-n>" : neosnippet#jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" <Shift><Tab>: 前の補完部分へ移動
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"

" -----------------------------------------------------------------------------
"  基本設定
" -----------------------------------------------------------------------------
" For snippet_complete marker.
if has("conceal")
    set conceallevel=2 concealcursor=i
endif

" 自作スニペットのディレクトリ
let g:neosnippet#snippets_directory =
            \ "~/.cache/dein/repos/github.com/Shougo/neosnippet-snippets,
            \ ~/.vim/snippets/"
