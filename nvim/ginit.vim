scriptencoding utf-8
" Created:     201*/**/** **:**:**
" Last Change: 2019/12/03 09:36:18.

" !!!: �K���擪�ɋL�q
" "autocmd"�i�}�N���j �̏�����
augroup MyAutoCmd
    autocmd!
augroup END

" TODO: �E�B���h�E�T�C�Y�L������
" �E�B���h�E��
set columns=360
" �E�B���h�E��
set lines=180
" �E�B���h�E�ʒu
if has("gui")
    winpos 200 10
endif

" "Vim" ����rc�t�@�C�� �p�X�ݒ�
let g:rc_dir = expand("~/dotfiles")

" rc�t�@�C�� �Ǎ��݊֐�
function! s:source_rc(rc_file_name)
    let rc_file = expand(g:rc_dir . "/" . a:rc_file_name)
    if filereadable(rc_file)
        execute "source" rc_file
    endif
endfunction

" GUI ��{�ݒ�
call s:source_rc(".gvimrc")

" "NeoVim" ��p�ݒ�
if (has("unix") && !has("mac"))
    Guifont! Cica\ 16

elseif (has("unix") && has("mac"))
    if hostname()     == "ProSalad13-2018.local"
        Guifont! Cica:h18
    elseif hostname() == "saladserver.com"
        Guifont! Cica:h16
    elseif hostname() == "SaladBook.local"
        Guifont! Cica:h18
    else
        Guifont! Cica:h18
    endif

elseif (has("win32") || has("win64"))
    " Home setting
    if hostname()     == "SALADPRIMEMK-II"
        Guifont! Cica:h12
    elseif hostname() == "SALADCARBONX1"
        Guifont! Cica:h13

    " muRata setting
    elseif hostname() == "HBAMB748"
        Guifont! Cica:h14
    elseif hostname() == "HBAMB819"
        Guifont! Cica:h12
    elseif hostname() == "HBALT071"
        Guifont! Cica:h16
    endif
    " colorscheme iceberg
endif
