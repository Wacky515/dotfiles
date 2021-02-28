scriptencoding utf-8
" Created:     201*/**/** **:**:**
" Last Change: 2020/03/16 10:34:03.

" 1. "lexima.vim" で代替  " {{{
" " 自動的に閉じ括弧を入力
" " 1. 閉じ括弧を補完
" inoremap " <Space>""<Space><Left><Left>
" inoremap ' <Space>''<Space><Left><Left>
" inoremap ( ()<Left>
" inoremap [ []<Left>
" inoremap { {}<Left>

" " 2. <Enter> 押下で閉じ括弧を補完しない
" inoremap "<Enter> "
" inoremap '<Enter> '
" inoremap (<Enter> (
" inoremap [<Enter> [
" inoremap {<Enter> {
" }}}

" 保存時に行末の空白を削除
autocmd BufWritePre * :%s/\s\+$//ge

" 日本語の行連結は空白を入力しない
set formatoptions=Mm

" スペルチェック機能を使う
if !has("nvim")
    set nospell
    " 日本語を除外
    set spelllang=en,cjk
    " 間違ったスペルに下線
    hi clear SpellBad
    hi SpellBad cterm=underline
    " 間違ったキャメルケースに下線と太字
    hi clear SpellCap
    hi SpellCap cterm=underline,bold
endif

" ヤンクしたデータをクリップボードで使用＆選択範囲自動コピー
" MEMO: 使用可否は環境による
if !has("nvim")
    set clipboard=unnamed,autoselect
endif
" < http://nanasi.jp/articles/howto/editing/clipboard.html >
