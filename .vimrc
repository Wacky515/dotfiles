scriptencoding utf-8
" test from raspi
" test from raspi 2nd
" test from Debian
" test from Xacti
" test from Xacti Windows

""" Leader�� """

" <Space> �� Leader �Ɋ�����
let mapleader = "\<Space>"

" <Space>+ "o": �t�@�C�����J��
nnoremap <Leader>o :CtrlP<CR>

" <Space> + "w": �t�@�C����ۑ�
nnoremap <Leader>w :w<CR>
"
" <Space> + <Space>: �r�W���A�����C�����[�h�ɐؑւ�
nmap <Leader><Leader> V


""" ������ """

" �����W�����v����ʒ����ɕ\��
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" �C���N�������^���T�[�`
" �� �����������͂ő��������J�n
set incsearch

" �����}�b�`�e�L�X�g���n�C���C�g
set hlsearch

" �啶���E����������ʂ��Ȃ�
set ignorecase

" ���������ɑ啶��������ꍇ�͑啶���E�����������
set smartcase

" "\" �� "?" ���󋵂ɍ��������G�X�P�[�v
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'


""" �ҏW�� """

" �����N�����f�[�^���N���b�v�{�[�h�Ŏg�p���I��͈͎����R�s�[
" �� �g�p�ł��邩�͊��ɂ��
" �Q�l: http://nanasi.jp/articles/howto/editing/clipboard.html
set clipboard=unnamed,autoselect

" �����I�ɕ����ʂ����
" �� ���܂�X�}�[�g�ł͂Ȃ��E�E�E
imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>

" "<" �A ">" �ŃC���f���g���鎞�A"shiftwidth" �̔{���Ɋۂ߂�
set shiftround


""" ���C���\���� """

" �s�ԍ��̕\��
set number

" �V���^�b�N�X�n�C���C�g
syntax on

" �J�[�\���s�̔w�i�F�ύX
set cursorline
"
" �΂ɂȂ銇�ʂ�����
set showmatch

" ���s���ɑO�s�̃C���f���g���p��
set autoindent
" ���s���ɓ��͂��ꂽ�s�����ɍ��킹�A���s�C���f���g�𑝌�
set smartindent

" �S�p�X�y�[�X�̉���
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /�@/

" �X�N���[��������J�n����O��̍s���w��
set scrolloff=5

" �t�@�C�����J�������ɍŌ�̃J�[�\���ʒu�𕜌�����
if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif

" �s�������̉���
set list
" �s�������� "Unicode" �ŕ\��
set listchars=tab:��-,trail:-,extends:��,precedes:��,nbsp:%,eol:?


""" �O�σe�[�}�� """
" �Ôw�i�p�̔z�F�ɂ���
set background=dark


""" �R���\�[���\���� """

" �J�[�\���̍s��\��
set ruler

" �R�}���h���C���̍s��
set cmdheight=3


""" �E�B���h�E�\���� """

" �E�C���h�E�^�C�g���Ƀt�@�C���̃p�X��񓙂�\��
set title

" <Shift> + <���>: �E�B���h�E�T�C�Y�ύX
nnoremap <S-Left>  <C-w><<CR>
nnoremap <S-Right> <C-w>><CR>
nnoremap <S-Up>    <C-w>-<CR>
nnoremap <S-Down>  <C-w>+<CR>

" �E�B���h�E�E���ɓ��͒��̃R�}���h��\��
set showcmd


""" �}�N�� �� �L�[�A�T�C���� """

" ���̓��[�h�� "jj" : <Esc>
inoremap jj <Esc>

" "v" + "v": �s���܂őI��
vnoremap v $h

" <ESC> + <ESC>: �n�C���C�g����
nmap <silent> <Esc><Esc> :nohlsearch<CR>

" "w!!" :�X�[�p�[���[�U�[�Ƃ��ĕۑ��isudo���g���������j
cmap w!! w !sudo tee > /dev/null %

" ":e" �ȂǂŃt�@�C�����J�����A�t�H���_�����݂��Ȃ��ꍇ�͎����쐬
function! s:mkdir(dir, force)
  if !isdirectory(a:dir) && (a:force ||
        \ input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
    call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
  endif
endfunction
autocmd MyAutoCmd BufWritePre * call s:mkdir(expand('<afile>:p:h'), v:cmdbang)


""" �R�}���h���C�����[�h�� """
"
" �R�}���h���C�����[�h��<Tab>�L�[�ɂ��t�@�C�����⊮��L���ɂ���
set wildmenu


""" Vim�X�N���v�g �L�q�@ Memo """

""" OS�ŗL�̐ݒ�����ꍇ

""" Unix �̏ꍇ
" if has('unix') 
"         " Unix �p�ݒ�
" endif

""" Mac �̏ꍇ
" if has('mac')
"         " Mac �p�ݒ�
" endif

" Unix �� Mac ���ʂ̐ݒ�̏ꍇ
" if has('unix') || has('mac')
"         " Unix �� Mac �̋��ʐݒ�
" endif

""" Windlws �̏ꍇ
" if has('win32') || has ('win64')
"         " Windows 32bit�A Windows 64bit �p�ݒ�
" endif
