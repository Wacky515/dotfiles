scriptencoding utf-8

" "autocmd"（マクロ） の初期化
" !!!: 必ず先頭に記述
augroup MyAutoCmd
    autocmd!
augroup END

""" 編集篇 """

" ヤンクしたデータをクリップボードで使用＆選択範囲自動コピー
" ※ 使用できるかは環境による
set clipboard=unnamed,autoselect
" < http://nanasi.jp/articles/howto/editing/clipboard.html >

" 自動的に閉じ括弧を入力
" !!!: あまりスマートではない・・・
imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>
