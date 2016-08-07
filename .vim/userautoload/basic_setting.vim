scriptencoding utf-8

" "autocmd"�i�}�N���j �̏�����
" !!!: �K���擪�ɋL�q
augroup MyAutoCmd
    autocmd!
augroup END


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

" �������ɑ啶���E����������ʂ��Ȃ�
set ignorecase
" �������ɑ啶��������ꍇ�͑啶���E�����������
set smartcase

" �Ō�̃q�b�g�܂Ō���������ŏ��̃q�b�g�ɖ߂�
set wrapscan

" �����}�b�`�e�L�X�g���n�C���C�g
set hlsearch

" �������� "\" �� "?" �̃G�X�P�[�v���ȑf��
" TODO: ����m�F
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'

" grep�����̐ݒ�
" TODO: ����m�F
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
set grepprg=grep\ -nh


""" �ҏW�� """

" �����N�����f�[�^���N���b�v�{�[�h�Ŏg�p���I��͈͎����R�s�[
" �� �g�p�ł��邩�͊��ɂ��
set clipboard=unnamed,autoselect
" < http://nanasi.jp/articles/howto/editing/clipboard.html >

" �����I�ɕ����ʂ����
" !!!: ���܂�X�}�[�g�ł͂Ȃ��E�E�E
imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>


""" �R���\�[���\���� """

" �J�[�\���̍s��\��
set ruler


""" ���C���\���� """

" �R�}���h���C���̍s���\��
" DONE: Windows�pGVim�g�p����.gvimrc��ҏW����
if has('unix') || has('mac')
    set cmdheight=3
endif

" �s�ԍ��̕\��
set number

" �����C���f���g���̋󔒐�
set shiftwidth=4
" �^�u�����̕�
set tabstop=4
" �_�u�������󔒕����ɒu������
set expandtab
" �s���� "shiftwidth" ���A����ȊO�� "tabstop" ���C���f���g
set smarttab

" ���ݍs�Ɠ����C���f���g��}��
set autoindent
" �O�s�����ɍ��킹�A���s�C���f���g�𑝌�
set smartindent
" "<" �A ">" �ŃC���f���g���鎞�A"shiftwidth" �̔{���Ɋۂ߂�
set shiftround

" �J�[�\���s�̔w�i�F�ύX
set cursorline

" �΂ɂȂ銇�ʂ�����
set showmatch
" �Ή����ʂ� "<" �� ">" ��ǉ�
set matchpairs& matchpairs+=<:>

""""""""""""""""""""""""""""""""""""""""""""""""""
" !!!: �s�������̉����͌���̂�kill���Ă���
" �s�������i�^�u�A�󔒁A���s�j�̉���
" set list
" �s�������i�^�u�A�󔒁A���s�j�� "Unicode" �ŕ\��
" set listchars=tab:��-,trail:-,extends:��,precedes:��,nbsp:%,eol:?
" �� or ��
" set listchars=tab:>.,trail:_,eol:?,extends:>,precedes:<,nbsp:%

"�S�p�X�y�[�X���n�C���C�g�\��
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction

if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme       * call ZenkakuSpace()
        autocmd VimEnter,WinEnter * match ZenkakuSpace /�@/
    augroup END
    call ZenkakuSpace()
endif

" < http://inari.hatenablog.com/entry/2014/05/05/231307 >
""""""""""""""""""""""""""""""""""""""""""""""""""

" �X�N���[�����̏�E���[�s���w��
set scrolloff=3

" �t�@�C�����J�������ɍŌ�̃J�[�\���ʒu�𕜌�����
if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif


""" �E�B���h�E�\���� """

" �I�����ɃE�B���h�E�T�C�Y���L������
if has('unix') || has('mac')
    let g:save_window_file = '/vim/tmp/.vimwinpos'
endif
if has('win32') || has ('win64')
    let g:save_window_file = 'C:/Temp/.vimwinpos'
endif
augroup SaveWindow
    autocmd!
    autocmd VimLeavePre * call s:save_window()
    function! s:save_window()
        let options = [
            \ 'set columns=' . &columns,
            \ 'set lines=' . &lines,
            \ 'winpos ' . getwinposx() . ' ' . getwinposy(),
            \ ]
        call writefile(options, g:save_window_file)
    endfunction
augroup END
if filereadable(g:save_window_file)
    execute 'source' g:save_window_file
endif

" �E�C���h�E�^�C�g���Ƀt�@�C���̃p�X��񓙂�\��
set title

" <Shift> + <���>: �E�B���h�E�T�C�Y�ύX
" FIXME: Windows���삹��
" nnoremap <S-Left>  <C-w><<CR>
" nnoremap <S-Right> <C-w>><CR>
" nnoremap <S-Up>    <C-w>-<CR>
" nnoremap <S-Down>  <C-w>+<CR>

" �E�B���h�E�E���ɓ��͒��̃R�}���h��\��
set showcmd


""" �R�}���h���C�����[�h�� """
"
" �R�}���h���C�����[�h�� <Tab> �ɂ��t�@�C�����⊮��L���ɂ���
set wildmenu


""" ��{�ݒ�� """

" ���̓R�}���h�����̕ۑ���
set history=1000

" �܂��݂̐ݒ�
:set foldmethod=marker

" FIXME: ���삹��(Mac OK!)
if has('unix') || has('mac')
    " ".swp" �̃f�B���N�g���ύX
    set directory=~/.vim/tmp
    " "~" �̃f�B���N�g���ύX
    set backupdir=~/.vim/tmp
    " ".un~" �̃f�B���N�g���ύX
    set undodir=~/.vim/tmp
    " ".viminfo" �̃f�B���N�g���ύX
    set viminfo+=n~/.vim/tmp/viminfo.txt
endif
" TODO: ���f�B���N�g���i.vim�j��ύX����
if has('win32') || has ('win64')
    " ".swp" �̃f�B���N�g���ύX
    set directory=C:/Temp
    " "~" �̃f�B���N�g���ύX
    set backupdir=C:/Temp
    " ".un~" �̃f�B���N�g���ύX
    set undodir=C:/Temp
    " ".viminfo" �̃f�B���N�g���ύX
    set viminfo+=nC:/Temp/viminfo.txt
endif


" ���[�h���C���̐ݒ�
" �� �t�@�C�����̃G�f�B�^�ݒ�
:set modeline

" FIXME: �������Ȃ�
" !!!: �擪�s�ɂ��L�q������
" vimrc �������f
" augroup MyAutoCmd
"     autocmd!
" augroup END
if !has('gui_running') && !(has('win32') || has('win64'))
    " .vimrc�̍ēǍ����ɂ��F���ω�����悤�ɂ���
    autocmd MyAutoCmd BufWritePost $MYVIMRC nested source $MYVIMRC
else
    " .vimrc�̍ēǍ����ɂ��F���ω�����悤�ɂ���
    autocmd MyAutoCmd BufWritePost $MYVIMRC source $MYVIMRC |
                \if has('gui_running') | source $MYGVIMRC
    autocmd MyAutoCmd BufWritePost $MYGVIMRC if has('gui_running') | source $MYGVIMRC
endif


""" �X�e�[�^�X�s�� """

" �X�e�[�^�X�s�Ɍ��݂�git�u�����`��\��
" !!!: �v���O�C�����K�v
" set statusline+=%{fugitive#statusline()}


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

""" Windows �̏ꍇ
" if has('win32') || has ('win64')
"         " Windows 32bit�A Windows 64bit �p�ݒ�
" endif

""" ���ŗL�̐ݒ�����ꍇ

" if ( has ('python') || has('python3') )
" 	" Python �p�ݒ�
" else
" 	" Python �ȊO�̐ݒ�
" endif
