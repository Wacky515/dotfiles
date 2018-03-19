scriptencoding utf-8
" Last Change: 2018/03/19 10:52:42.

" ステータス行に現在のgitブランチを表示
set statusline+=%{fugitive#statusline()}

" ステータス行に現在のgitブランチを表示
" set statusline+=%{fugitive#statusline()}

" "Vim" 起動時のエラー回避
set statusline+=%{exists('g:loaded_fugitive')?fugitive#statusline():''}

" マップキー
nnoremap [fugitive]  <Nop>
" nmap <space>g [fugitive]
nmap mg [fugitive]
nnoremap <silent> [fugitive]s :Gstatus<CR><C-w>T
nnoremap <silent> [fugitive]a :Gwrite<CR>
nnoremap <silent> [fugitive]c :Gcommit-v<CR>
nnoremap <silent> [fugitive]b :Gblame<CR>
nnoremap <silent> [fugitive]d :Gdiff<CR>
nnoremap <silent> [fugitive]m :Gmerge<CR>

":Gstatus"時のマップキー
    " 選択ファイル上で -: "git add/reset" をトグル
    " 選択ファイル上で D: "git diff %{file}"
    " 選択ファイル上で U: "git checkout"
g?    show this help
<C-N> next file
<C-P> previous file
<CR>  |:Gedit|
-     |:Git| add
-     |:Git| reset (staged files)
cA    |:Gcommit| --amend --reuse-message=HEAD
ca    |:Gcommit| --amend
cc    |:Gcommit|
cva   |:Gcommit| --amend --verbose
cvc   |:Gcommit| --verbose
D     |:Gdiff|
ds    |:Gsdiff|
dp    |:Git!| diff (p for patch; use :Gw to apply)
dp    |:Git| add --intent-to-add (untracked files)
dv    |:Gvdiff|
O     |:Gtabedit|
o     |:Gsplit|
p     |:Git| add --patch
p     |:Git| reset --patch (staged files)
q     close status
r     reload status
S     |:Gvsplit|
U     |:Git| checkout
U     |:Git| checkout HEAD (staged files)
U     |:Git| clean (untracked files)
U     |:Git| rm (unmerged files)
