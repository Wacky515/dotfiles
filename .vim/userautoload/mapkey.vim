scriptencoding utf-8

""" �}�b�v�L�[�� """

" ���̓��[�h�� jj: <Esc>
inoremap jj <Esc>

" vv: �s���܂őI��
vnoremap v $h

" <Esc><Esc>: �n�C���C�g����
nmap <silent> <Esc><Esc> :nohlsearch<CR>

" bp: ��O�̃o�b�t�@���J��
nnoremap <silent>bp :bprevious<CR>
" bn: ���̃o�b�t�@���J��
nnoremap <silent>bn :bnext<CR>
" bb: ���O�̃o�b�t�@���J��
nnoremap <silent>bb :b#<CR>

" ,v: vimrc���J��
nmap ,v :edit $MYVIMRC<CR>
" ,g: gvimrc���J��
nmap ,g :edit $MYGVIMRC<CR>
" <Space>rv: vimrc�𔽉f
nnoremap <silent> <Space>rv :<C-u>source $MYVIMRC \| if has('gui_running') \| source $MYGVIMRC \| endif <CR>
" <Space>rg: gvimrc�𔽉f
nnoremap <silent> <Space>rg :<C-u>source $MYGVIMRC<CR>

" w!!: �X�[�p�[���[�U�[�Ƃ��ĕۑ��isudo���g���������j
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


""" Leader�� """

" <Space> �� "Leader" �Ɋ�����
let mapleader = "\<Space>"

" <Space>o: �t�@�C�����J��
" !!!: �v���O�C�����K�v
" nnoremap <Leader>o :CtrlP<CR>

" <Space>w: �t�@�C����ۑ�
nnoremap <Leader>w :w<CR>
"
" <Space><Space>: �r�W���A�����C�����[�h�ɐؑւ�
nmap <Leader><Leader> V
