scriptencoding utf-8
" Created:     2016/08/11 **:**:**
" Last Change: 2023/03/12 08:29:14.
" MEMO: コマンドが変わっている、動作確認

" USAGE:
    " ":Gstatus" のステータス画面のファイル名上で
        " -: "add" と "reset" 切替え
        " C|cc: コミット画面表示

    " ステータス行に現在のgitブランチを表示
    " set statusline+=%{fugitive#statusline()}
    " set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ \[ENC=%{&fileencoding}]%P
" < REF: http://myenigma.hatenablog.com/entry/2016/07/10/084048 >

" ------------------------------------------------------------------------------
"  マップキー
" ------------------------------------------------------------------------------
" プリフィクスキー
nnoremap [fugitive]  <Nop>
nmap mg  [fugitive]

nnoremap <silent> [fugitive]s :<C-u>Git<CR>
" nnoremap <silent> [fugitive]a :Gwrite<CR>
nnoremap <silent> [fugitive]a :<C-u>Git add<CR>
" nnoremap <silent> [fugitive]c :Gcommit-v<CR>
nnoremap <silent> [fugitive]c :<C-u>Git cm<CR>

nnoremap <silent> [fugitive]b :<C-u>Git blame<CR>
nnoremap <silent> [fugitive]d :<C-u>Git diff<CR>

" nnoremap <silent> [fugitive]m :Gmerge<CR>
nnoremap <silent> [fugitive]m :<C-u>Git merge<CR>

" ------------------------------------------------------------------------------
"  基本設定
" ------------------------------------------------------------------------------
" "Vim" 起動時のエラー回避
set statusline+=%{exists('g:loaded_fugitive')?fugitive#statusline():''}
