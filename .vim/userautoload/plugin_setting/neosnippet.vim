scriptencoding utf-8
" Last Change:2018/04/05 10:55:10.

" ショートカットキー
" imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
" TODO: キーを潰していないか確認
imap <Leader>k     <Plug>(neosnippet_expand_or_jump)
" smap <Leader>k     <Plug>(neosnippet_expand_or_jump)
" xmap <Leader>k     <Plug>(neosnippet_expand_target)

" <TAB>: 補完部分を移動
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>" " <Tab>: 下を見て<Shift><Tab>で上に戻る

inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
" imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)"
" \: pumvisible() ? "\<C-n>" : "\<TAB>"
" smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)"
" \: "\<TAB>"
imap <expr><TAB> pumvisible() ? "\<C-n>" : neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.
if has("conceal")
    set conceallevel=2 concealcursor=i
endif

" 自作スニペットのディレクトリ
let g:neosnippet#snippets_directory="~/.cache/dein/repos/github.com/Shougo/neosnippet-snippets,~/.vim/snippets/"
