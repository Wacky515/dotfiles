scriptencoding utf-8
" Created:     2018/03/30 14:27:10
" Last Change: 2018/09/13 23:14:49.

" du:  "dein" アップデート
nmap du :<C-u>call dein#check_update()<CR>

" dc:  "dein" クリア
nmap dc :<C-u>call dein#clear_state()<CR>
