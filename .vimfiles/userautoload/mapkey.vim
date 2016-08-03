scriptencoding utf-8

""" �}�N�� �� �L�[�A�T�C���� """

" ���̓��[�h�� "jj": <Esc>
inoremap jj <Esc>

" "v" + "v": �s���܂őI��
vnoremap v $h

" <ESC> + <ESC>: �n�C���C�g����
nmap <silent> <Esc><Esc> :nohlsearch<CR>

" vimrc�Agvimrc���J��
nmap ,v :edit $MYVIMRC<CR>
nmap ,g :edit $MYGVIMRC<CR>
" vimrc�Agvimrc�𔽉f
nnoremap <silent> <Space>rv :<C-u>source $MYVIMRC \| if has('gui_running') \| source $MYGVIMRC \| endif <CR>
nnoremap <silent> <Space>rg :<C-u>source $MYGVIMRC<CR>

" "w!!" :�X�[�p�[���[�U�[�Ƃ��ĕۑ��isudo���g���������j
if has('unix') 
    cmap w!! w !sudo tee > /dev/null %
endif

" ":e" �ȂǂŃt�@�C�����J�����A�t�H���_�����݂��Ȃ��ꍇ�͎����쐬
function! s:mkdir(dir, force)
    if !isdirectory(a:dir) && (a:force ||
            \ input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
        call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
endfunction
if has('unix') || has('mac')
    autocmd MyAutoCmd BufWritePre * call s:mkdir(expand('<afile>:p:h'), v:cmdbang)
endif
