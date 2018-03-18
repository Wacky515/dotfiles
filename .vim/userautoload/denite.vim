scriptencoding utf-8
" Last Change: 2018/03/18 12:30:34.
" < https://rcmdnk.com/blog/2018/02/16/computer-vim/ >

if dein#tap('denite.nvim')
  " カスタムメニュー 追加
  let s:menus = {}
  let s:menus.file = {'description': 'File search (buffer, file, file_rec, file_mru'}
  let s:menus.line = {'description': 'Line search (change, grep, line, tag'}
  let s:menus.others = {'description': 'Others (command, command_history, help)'}
  let s:menus.file.command_candidates = [
        \ ['buffer', 'Denite buffer'],
        \ ['file: Files in the current directory', 'Denite file'],
        \ ['file_rec: Files, recursive list under the current directory', 'Denite file_rec'],
        \ ['file_mru: Most recently used files', 'Denite file_mru']
        \ ]
  let s:menus.line.command_candidates = [
        \ ['change', 'Denite change'],
        \ ['grep :grep', 'Denite grep'],
        \ ['line', 'Denite line'],
        \ ['tag', 'Denite tag']
        \ ]
  let s:menus.others.command_candidates = [
        \ ['command', 'Denite command'],
        \ ['command_history', 'Denite command_history'],
        \ ['help', 'Denite help']
        \ ]

  call denite#custom#var('menu', 'menus', s:menus)

  nnoremap [denite] <Nop>
  " 各ソースの呼出し
  nmap <Leader>d [denite]

  nnoremap <silent> [denite]b :Denite buffer<CR>
  nnoremap <silent> [denite]c :Denite changes<CR>
  nnoremap <silent> [denite]f :Denite file<CR>
  nnoremap <silent> [denite]g :Denite grep<CR>
  nnoremap <silent> [denite]h :Denite help<CR>
  nnoremap <silent> [denite]h :Denite help<CR>
  nnoremap <silent> [denite]l :Denite line<CR>
  nnoremap <silent> [denite]t :Denite tag<CR>
  nnoremap <silent> [denite]m :Denite file_mru<CR>
  nnoremap <silent> [denite]u :Denite menu<CR>

  call denite#custom#map(
        \ 'insert',
        \ '<Down>',
        \ '<denite:move_to_next_line>',
        \ 'noremap'
        \)
  call denite#custom#map(
        \ 'insert',
        \ '<Up>',
        \ '<denite:move_to_previous_line>',
        \ 'noremap'
        \)
  call denite#custom#map(
        \ 'insert',
        \ '<C-N>',
        \ '<denite:move_to_next_line>',
        \ 'noremap'
        \)
  call denite#custom#map(
        \ 'insert',
        \ '<C-P>',
        \ '<denite:move_to_previous_line>',
        \ 'noremap'
        \)
  call denite#custom#map(
        \ 'insert',
        \ '<C-G>',
        \ '<denite:assign_next_txt>',
        \ 'noremap'
        \)
  call denite#custom#map(
        \ 'insert',
        \ '<C-T>',
        \ '<denite:assign_previous_line>',
        \ 'noremap'
        \)
  call denite#custom#map(
        \ 'normal',
        \ '/',
        \ '<denite:enter_mode:insert>',
        \ 'noremap'
        \)
  call denite#custom#map(
        \ 'insert',
        \ '<Esc>',
        \ '<denite:enter_mode:normal>',
        \ 'noremap'
        \)
endif
