scriptencoding utf-8
" Created:     201*/**/** **:**:**
" Last Change: 2019/11/26 17:40:14.

" --------------------------------------------------------------------------------
" マップキー
" --------------------------------------------------------------------------------
" 複数行をインデント
    " 操作時に選択を解除しないようにする
vnoremap > >gv
vnoremap < <gv

" <Leader>zh: 全角英数字を半角にする
if !has("nvim")
    nnoremap <Leader>zh :HzjaConvert han_eisu<Enter>
    vnoremap <Leader>zh :HzjaConvert han_eisu<Enter>
endif

" 3. "." 押下で改行して閉じ括弧を補完（関数記述用）
inoremap (. ()<Left><CR><Esc><S-o>
inoremap [. []<Left><CR><Esc><S-o>
inoremap {. {}<Left><CR><Esc><S-o>
inoremap '. ''''''<Left><Left><Left><CR><Esc><S-o>
inoremap ". """"""<Left><Left><Left><CR><Esc><S-o>
inoremap `. ``````<Left><Left><Left><CR><Esc><S-o>

" 挿入モードで日時を挿入
" ,df: フルセット
inoremap <expr> ,df strftime('%Y/%m/%d %H:%M:%S')
" ,dd: 年月日
inoremap <expr> ,dd strftime('%Y/%m/%d')
" ,dt: 時分
inoremap <expr> ,dt strftime('%H:%M')

" 挿入モードで曜日を挿入
let weeks = [ "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat" ]
let wday = strftime("%w")
" ,ds: 年月日曜日
inoremap <expr> ,ds strftime('%Y/%m/%d ').weeks[wday]
" ,dy: 曜日のみ
inoremap <expr> ,dy strftime('').weeks[wday]

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
