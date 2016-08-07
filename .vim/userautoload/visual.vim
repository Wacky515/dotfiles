scriptencoding utf-8

" "autocmd"�i�}�N���j �̏�����
" !!!: �K���擪�ɋL�q
augroup MyAutoCmd
    autocmd!
augroup END


""" ���C���\���� """

" �R�}���h���C���̍s���\��
" DONE: Windows�pGVim�g�p����.gvimrc��ҏW����
if has('unix') || has('mac')
    set cmdheight=3
endif

" �s�ԍ��̕\��
set number

" �X�N���[�����̏�E���[�s���w��
set scrolloff=3

" �����C���f���g���̋󔒕�����
set shiftwidth=4
" �^�u�����̕�
set tabstop=4
" �_�u�������󔒕����ɒu����
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

" �t�@�C�����J�������ɍŌ�̃J�[�\���ʒu�𕜌�����
if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif

""""""""""""""""""""""""""""""""""""""""""""""""""
" !!!: �s�������̉����͌���̂�kill���Ă���
" �s�������i�^�u�A�󔒁A���s�j�̉���
" set list
" �s�������i�^�u�A�󔒁A���s�j�� "Unicode" �ŕ\��
" set listchars=tab:��-,trail:-,extends:��,precedes:��,nbsp:%,eol:?
" �� or ��
" set listchars=tab:>.,trail:_,eol:?,extends:>,precedes:<,nbsp:%

"�S�p�X�y�[�X���n�C���C�g
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


""" �E�B���h�E�\���� """

" �E�C���h�E�^�C�g���Ƀt�@�C���̃p�X��񓙂�\��
set title

" �E�B���h�E�E���ɓ��͒��̃R�}���h��\��
set showcmd

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

" <Shift> + <���>: �E�B���h�E�T�C�Y�ύX
" FIXME: Windows���삹��
" nnoremap <S-Left>  <C-w><<CR>
" nnoremap <S-Right> <C-w>><CR>
" nnoremap <S-Up>    <C-w>-<CR>
" nnoremap <S-Down>  <C-w>+<CR>


""" �R�}���h���C�����[�h�\���� """
"
" �R�}���h���C�����[�h�� <Tab> �ɂ��t�@�C�����⊮��L���ɂ���
set wildmenu

""" �X�e�[�^�X�s�\���� """

" �J�[�\���̍s��\��
set ruler

" �X�e�[�^�X�s�Ɍ��݂�git�u�����`��\��
" !!!: �v���O�C�����K�v
" set statusline+=%{fugitive#statusline()}

