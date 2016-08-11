scriptencoding utf-8

" .vimrc�̐擪�ɋL�q��������Kill���ėl�q��
" " "autocmd"�i�}�N���j �̏�����
" " !!!: �K���擪�ɋL�q
" augroup MyAutoCmd
"     autocmd!
" augroup END


""" ���C���\���� """

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
" �����s���ȗ��\�����Ȃ�
set display=lastline
" �⊮���j���[�̍���
set pumheight=10
" �΂ɂȂ銇�ʂ�����
set showmatch
" ���̋�������[msec]
set matchtime=1
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
" !!!: �s�������̉����͌���̂�Kill���Ă���
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
if has("syntax")
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

" !!!: �ω��Ȃ�
" �E�C���h�E�^�C�g���Ƀt�@�C���̃p�X��񓙂�\��
" set title

" !!!: �ω��Ȃ�
" �E�B���h�E�E���ɓ��͒��̃R�}���h��\��
" set showcmd

"�^�u���x������ɕ\������
:set showtabline=3

" �I�����ɃE�B���h�E�T�C�Y���L������
let g:save_window_file = expand("~/.vim/tmp/.vimwinpos")
augroup SaveWindow
    autocmd!
    autocmd VimLeavePre * call s:save_window()
    function! s:save_window()
        let options = [
            \ "set columns=" . &columns,
            \ "set lines=" . &lines,
            \ "winpos " . getwinposx() . " " . getwinposy(),
            \ ]
        call writefile(options, g:save_window_file)
    endfunction
augroup END
if filereadable(g:save_window_file)
    execute "source" g:save_window_file
endif

" <Shift> + <���>: �E�B���h�E�T�C�Y�ύX
" FIXME: Windows���삹��
" nnoremap <S-Left>  <C-w><<CR>
" nnoremap <S-Right> <C-w>><CR>
" nnoremap <S-Up>    <C-w>-<CR>
" nnoremap <S-Down>  <C-w>+<CR>


""" �R�}���h���C�����[�h�\���� """


""" �X�e�[�^�X�s�\���� """

" !!!: �ω��Ȃ�
" �J�[�\���̍s��\��
" set ruler

" �X�e�[�^�X�s�Ɍ��݂�git�u�����`��\��
" !!!: �v���O�C�����K�v
" set statusline+=%{fugitive#statusline()}
