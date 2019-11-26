scriptencoding utf-8
" Created:     201*/**/** **:**:**
" Last Change: 2019/11/26 15:23:59.

" ---------------------------------------------------------------------------
" マップキー
" ---------------------------------------------------------------------------
" " <Leader>e: "EasyMotion" 開始
nnoremap <Leader>e <Plug>(easymotion-prefix)
" nnoremap ee <Plug>(easymotion-prefix)

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
" nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
" nmap i <Plug>(easymotion-overwin-f2)

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" ---------------------------------------------------------------------------
" 基本設定
" ---------------------------------------------------------------------------
" デフォルトのキーマッピングを無効に
let g:EasyMotion_do_mapping = 0

" 検索時、大文字小文字を区別しない
let g:EasyMotion_smartcase  = 1

" f + 2文字 で画面全体を検索してジャンプ
" nmap f <plug>(easymotion-overwin-f2)
