scriptencoding utf-8
" Created:     2018/09/13 12:19:02
" Last Change: 2023/03/07 11:31:17.

" ------------------------------------------------------------------------------
"  マップキー
" ------------------------------------------------------------------------------
" <Leader>m: "vim-over" 起動
nnoremap <silent> <Leader>mr :OverCommandLine<CR>
    " | キー | 効果
    " ||
    " | <Up>  /<C-p>          | 1つ前のコマンド履歴を挿入
    " | <Down>/<C-n>          | 1つ後のコマンド履歴を挿入
    " | <C-r><C-f>            | カーソル位置のファイル名を挿入
    " | <C-r><C-w>            | カーソル位置の word を挿入
    " | <C-r><C-r>            | カーソル位置の WORD を挿入
    " | <C-r>{0-9a-z"%#:-=.*} | 番号/名前付きレジスタの挿入

" <C-h>: カーソル位置の単語をハイライト付きで置換
nnoremap <C-h> :OverCommandLine<CR>%s/<C-r><C-w>//gc<Left><Left>

" sup:   ヤンクをハイライト付きで置換
nnoremap sup :OverCommandLine<CR>%s!<C-r>=substitute(@0, '!', '\\!', 'g')<CR>!!gI<Left><Left><Left>
