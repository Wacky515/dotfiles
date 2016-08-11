scriptencoding utf-8

""" 編集篇 """

" !!!: 変化ない
" コマンドラインモードで<Tab>: ファイル名補完
set wildmenu

" ヤンクしたデータをクリップボードで使用＆選択範囲自動コピー
" ※ 使用できるかは環境による
set clipboard=unnamed,autoselect
" < http://nanasi.jp/articles/howto/editing/clipboard.html >

" 自動的に閉じ括弧を入力
" !!!: あまりスマートではない・・・
imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>
imap （ （）<LEFT>
