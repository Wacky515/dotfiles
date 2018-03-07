scriptencoding utf-8

" ステータス行に現在のgitブランチを表示
set statusline+=%{fugitive#statusline()}

" "Vim" 起動時のエラー回避
set statusline+=%{exists('g:loaded_fugitive')?fugitive#statusline():''}
