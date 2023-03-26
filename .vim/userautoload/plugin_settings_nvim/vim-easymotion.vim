scriptencoding utf-8
" Created:     201*/**/** **:**:**
" Last Change: 2023/03/11 13:19:43.

" ------------------------------------------------------------------------------
"  マップキー
" ------------------------------------------------------------------------------
" デフォルトのキーマッピングを有効に
let g:EasyMotion_do_mapping = 1

" ,,e: "EasyMotion" 開始
map ,, <Plug>(easymotion-prefix)
nmap ,,e <plug>(easymotion-s2)
xmap ,,e <plug>(easymotion-s2)
" USEGE:  " {{{
" Jump to anywhere you want with minimal keystrokes,
    " with just one key binding.
" `s{char}{label}`
" nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
" nmap i <Plug>(easymotion-overwin-f2)
" nmap s <Plug>(easymotion-s2)
" xmap s <Plug>(easymotion-s2)
" "surround.vim" と差別化
" omap z <Plug>(easymotion-s2)
" ,,e{char}{char}: "{char}{char}" 画面全体を検索
" ,,e{char}<CR>:   1つの "{char}" で検索
" ,,e{char}{char}: "{char}{char}" で検索
" ,,e<CR>:         前回の検索をリピート
" }}}

" ,,j/k: 拡張行移動
map ,,j <Plug>(easymotion-j)
map ,,k <Plug>(easymotion-k)
" 上記移動時にカーソル位置を維持

" KILL: 繰返しができない " {{{
" " f,t,F,T の挙動強化
"     " カーソル行に{char}が1つならばデフォルトの挙動
"     " 2つ以上ならばラベルで移動ポイント選択
" map f <Plug>(easymotion-fl)
" map t <Plug>(easymotion-tl)
" map F <Plug>(easymotion-Fl)
" map T <Plug>(easymotion-Tl)

" " 対象範囲を "forward/backward" 両方向にできるモーション
" map f <Plug>(easymotion-bd-fl)
" map t <Plug>(easymotion-bd-tl)
" }}}

" ------------------------------------------------------------------------------
"  基本設定
" ------------------------------------------------------------------------------
" 検索時、大文字小文字を区別しない
let g:EasyMotion_smartcase        = 1

" 最初のマッチにジャンプ
let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_space_jump_first = 1
