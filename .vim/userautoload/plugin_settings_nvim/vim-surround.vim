<<<<<<< HEAD
scriptencoding utf-8
" Last Change: 2018/03/30 11:06:37.

let g:surround_{char2nr("a")} = "**\r**"

" DONE: "}" <- の時カーソル位置がおかしい為キル
" nmap <Leader>" ysiw"
nmap <Leader>n" ysiw"
nmap <Leader>" ysiw"i<Space><Esc>f";a<Space><Esc>
nmap <Leader>f" ysiw"i<Space><Esc>
nmap <Leader>b" ysiw"f"a<Space><Esc>

" nmap <Leader>' ysiw'
nmap <Leader>n' ysiw'
nmap <Leader>' ysiw'i<Space><Esc>f';a<Space><Esc>
nmap <Leader>f' ysiw'i<Space><Esc>
nmap <Leader>b' ysiw'f'a<Space><Esc>

" nmap <Leader>` ysiw`
nmap <Leader>n` ysiw`
nmap <Leader>` ysiw`i<Space><Esc>f`;a<Space><Esc>
nmap <Leader>f` ysiw`i<Space><Esc>
nmap <Leader>b` ysiw`f`a<Space><Esc>

nmap <Leader>{ ysiw{
nmap <Leader>} ysiw}
nmap <Leader>[ ysiw[
nmap <Leader>] ysiw]
nmap <Leader>( ysiw(
nmap <Leader>) ysiw)
nmap <Leader>< ysiw<
nmap <Leader>> ysiw>
nmap <Leader>* ysiw*
" nmap <Leader><Leader>* ysiw*wysiw*
" nmap <Leader>a ysiwa
" nmap <Leader><Leader>* ysiwa
nmap 2<Leader>* ysiwa
nmap 3<Leader>* ysiw*wysiw*wysiw*

xmap " S"
xmap ' S'
xmap ` S`
xmap [ S[
xmap ] S]
xmap ( S(
xmap ) S)
xmap * S*
" 行選択時の段落移動ができないため KILL
" xmap { S{
" xmap } S}
" 複数行のインデント調整できないため KILL
" xmap < S<
" xmap > S>

xmap <Leader>* S*gvS*
xmap <Leader>a Sa
=======
scriptencoding utf-8
" Created:     201*/**/** **:**:**
" Last Change: 2019/11/25 11:15:03.

" --------------------------------------------------------------------------------
" マップキー
" --------------------------------------------------------------------------------
" <Leader>*:  "*" で "word" を前後にスペースありで囲む
" <Leader>n*: "*" で "word" を前後にスペースなしで囲む
" <Leader>f*: "*" で "word" を前にスペースありで囲む
" <Leader>b*: "*" で "word" を後にスペースありで囲む
" MEMO: "*=[",',`]"
" ds*:        囲い文字 "*" を削除
" cs**':      囲い文字 "*" を "*'" に変更
" [c|d]i*:    "*" の中身を削除

nmap <Leader>"  ysiw"i<Space><Esc>f";a<Space><Esc>
nmap <Leader>n" ysiw"
nmap <Leader>f" ysiw"i<Space><Esc>
nmap <Leader>b" ysiw"f"a<Space><Esc>

nmap <Leader>'  ysiw'i<Space><Esc>f';a<Space><Esc>
nmap <Leader>n' ysiw'
nmap <Leader>f' ysiw'i<Space><Esc>
nmap <Leader>b' ysiw'f'a<Space><Esc>

nmap <Leader>`  ysiw`i<Space><Esc>f`;a<Space><Esc>
nmap <Leader>n` ysiw`
nmap <Leader>f` ysiw`i<Space><Esc>
nmap <Leader>b` ysiw`f`a<Space><Esc>

" <Leader>はじめカッコ: "word" を前後にスペースありで囲む
" <Leader>おわりカッコ: "word" を前後にスペースなしで囲む
nmap <Leader>( ysiw(
nmap <Leader>) ysiw)
nmap <Leader>[ ysiw[
nmap <Leader>] ysiw]
nmap <Leader>{ ysiw{
nmap <Leader>} ysiw}

" KILL: 不等号は設定不可の模様
" nmap <Leader>< ysiw<
" nmap <Leader>> ysiw>

" [1-3]<Leader>*: "[1-3]*" で "word" を前後にスペースなしで囲む
nmap <Leader>* ysiw*
nmap <Leader><Leader>* ysiwa
nmap <Leader><Leader><Leader>* ysiw*wysiw*wysiw*

" ビジュアルモードで "word" を選択し "*": 前後にスペースなしで囲む
" MEMO: "*=[",',`,),],*]"
xmap " S"
xmap ' S'
xmap ` S`
xmap ) S)
xmap ] S]
xmap * S*

" ビジュアルモードで "word" を選択し "*": 前後にスペースありで囲む
" MEMO: "*=[(,[]"
xmap ( S(
xmap [ S[

" KILL: ビジュアルモードで段落移動できない
" xmap { S{
" xmap } S}

" KILL: ビジュアルモードでインデント調整できない
" xmap < S<
" xmap > S>

" --------------------------------------------------------------------------------
" 基本設定
" --------------------------------------------------------------------------------
" MEMO: g:surruound_{char2nr("<char>")}
"       "<char>" を記号の一つの様に使え、囲む物を定義できる
let g:surround_{char2nr("a")} = "**\r**"
>>>>>>> b4b7e5ffbd7dcbd2804a52346bc8cc05a80b6a80
