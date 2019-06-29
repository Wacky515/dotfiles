scriptencoding utf-8
" Created:     201*/**/** **:**:**
" Last Change: 2018/12/17 16:02:24.
" TODO: �J�����p�X��%HOMEPATH%�f�B���N�g������������Ă��܂�

" !!!: �K���擪�ɋL�q
" "autocmd"�i�}�N���j �̏�����
augroup MyAutoCmd
    autocmd!
augroup END

" TODO: �E�C���h�E�T�C�Y�L������
" �E�C���h�E��
set columns=180
" �E�C���h�E��
set lines=57
    " �E�C���h�E�ʒu
if has("gui")
    winpos  200  10
endif

if hostname() == "HBAMB748A"
    execute "source" "C:\\Users\\MM12167\\.gvimrc"
elseif hostname() == "HBAMB819"
    execute "source" "C:\\Users\\MM12167.DMJ\\.gvimrc"
elseif hostname() == "SALADCARBONX1"
    " "Vim" ����rc�t�@�C���p�X�ݒ�
    let g:rc_dir = expand("~/dotfiles")

    " rc�t�@�C���Ǎ��݊֐�
    function! s:source_rc(rc_file_name)
        let rc_file = expand(g:rc_dir . "/" . a:rc_file_name)
        if filereadable(rc_file)
            execute "source" rc_file
        endif
    endfunction

    " GUI��{�ݒ�
    call s:source_rc(".gvimrc")
endif

