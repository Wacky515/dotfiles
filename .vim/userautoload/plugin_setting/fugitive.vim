scriptencoding utf-8

" grep検索の実行後に "QuickFix List" を表示
autocmd QuickFixCmdPost *grep* cwindow

" ステータス行に現在のgitブランチを表示
set statusline+=%{fugitive#statusline()}
