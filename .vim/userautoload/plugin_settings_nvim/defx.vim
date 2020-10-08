scriptencoding utf-8
" Created:     2020/09/06 00:16:21
" Last Change: 2020/10/08 12:58:28.

" --------------------------------------------------------------------------------
" マップキー
" --------------------------------------------------------------------------------
autocmd FileType defx call s:defx_my_settings()

function! s:defx_my_settings() abort
    nnoremap <silent><buffer><expr> <CR>
                \ defx#do_action('drop')
    nnoremap <silent><buffer><expr> c
                \ defx#do_action('copy')
    nnoremap <silent><buffer><expr> m
                \ defx#do_action('move')
    nnoremap <silent><buffer><expr> p
                \ defx#do_action('paste')
    nnoremap <silent><buffer><expr> l
                \ defx#do_action('drop')
    nnoremap <silent><buffer><expr> t
                \ defx#do_action('open','tabnew')
    nnoremap <silent><buffer><expr> E
                \ defx#do_action('drop', 'vsplit')
    nnoremap <silent><buffer><expr> P
                \ defx#do_action('drop', 'pedit')
    nnoremap <silent><buffer><expr> o
                \ defx#do_action('open_or_close_tree')
    nnoremap <silent><buffer><expr> K
                \ defx#do_action('new_directory')
    nnoremap <silent><buffer><expr> N
                \ defx#do_action('new_file')
    nnoremap <silent><buffer><expr> M
                \ defx#do_action('new_multiple_files')
    nnoremap <silent><buffer><expr> C
                \ defx#do_action('toggle_columns',
                \                'mark:indent:icon:filename:type:size:time')
    nnoremap <silent><buffer><expr> S
                \ defx#do_action('toggle_sort', 'time')
    nnoremap <silent><buffer><expr> d
                \ defx#do_action('remove')
    nnoremap <silent><buffer><expr> r
                \ defx#do_action('rename')
    nnoremap <silent><buffer><expr> !
                \ defx#do_action('execute_command')
    nnoremap <silent><buffer><expr> x
                \ defx#do_action('execute_system')
    nnoremap <silent><buffer><expr> yy
                \ defx#do_action('yank_path')
    nnoremap <silent><buffer><expr> .
                \ defx#do_action('toggle_ignored_files')
    nnoremap <silent><buffer><expr> ;
                \ defx#do_action('repeat')
    nnoremap <silent><buffer><expr> h
                \ defx#do_action('cd', ['..'])
    nnoremap <silent><buffer><expr> ~
                \ defx#do_action('cd')
    nnoremap <silent><buffer><expr> q
                \ defx#do_action('quit')
    nnoremap <silent><buffer><expr> <Space>
                \ defx#do_action('toggle_select') . 'j'
    nnoremap <silent><buffer><expr> *
                \ defx#do_action('toggle_select_all')
    nnoremap <silent><buffer><expr> j
                \ line('.') == line('$') ? 'gg' : 'j'
    nnoremap <silent><buffer><expr> k
                \ line('.') == 1 ? 'G' : 'k'
    nnoremap <silent><buffer><expr> <C-l>
                \ defx#do_action('redraw')
    nnoremap <silent><buffer><expr> <C-g>
                \ defx#do_action('print')
    nnoremap <silent><buffer><expr> cd
                \ defx#do_action('change_vim_cwd')
endfunction

" <Leader>ff: "defx" 起動
nnoremap <silent> <Leader>ff :<C-u> Defx <CR>

" ---------------------------------------------------------------------------
"  基本設定
" ---------------------------------------------------------------------------
" "Vim" 起動時に "defx" 起動
" autocmd VimEnter * execute 'Defx'

" 自動更新
autocmd BufWritePost * call defx#redraw()
autocmd BufEnter * call defx#redraw()

" 起動時のレイアウトと設定
call defx#custom#option('_', {
            \ 'winwidth': 40,
            \ 'split': 'vertical',
            \ 'direction': 'topleft',
            \ 'show_ignored_files': 1,
            \ 'buffer_name': 'exlorer',
            \ 'toggle': 1,
            \ 'resume': 1,
            \ 'columns': 'indent:git:icons:filename:mark',
            \ })
" "git" ステータスアイコン
call defx#custom#column('git', 'indicators', {
            \ 'Modified'  : '✹',
            \ 'Staged'    : '✚',
            \ 'Untracked' : '✭',
            \ 'Renamed'   : '➜',
            \ 'Unmerged'  : '═',
            \ 'Ignored'   : '☒',
            \ 'Deleted'   : '✖',
            \ 'Unknown'   : '?'
            \ })
