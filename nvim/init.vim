scriptencoding utf-8
" Created:     201*/**/** **:**:**
" Last Change: 2018/12/17 16:00:00.
" MEMO: "VeoVim" ���N�����Ȃ����� "dein" �̃f�B���N�g��������

" !!!: �K���擪�ɋL�q
" "autocmd"�i�}�N���j �̏�����
augroup MyAutoCmd
    autocmd!
augroup END

if hostname() == "HBAMB748A"
    " "Windows7" �� "NeoVim" �̓f���~�^�� "\\"
    execute "source" "C:\\Users\\MM12167\\.vimrc"
elseif hostname() == "HBAMB819"
    execute "source" "C:\\Users\\MM12167.DMJ\\.vimrc"

else
    " "Vim" ����rc�t�@�C���p�X�ݒ�
    let g:rc_dir = expand("~/dotfiles")

    " rc�t�@�C���Ǎ��݊֐�
    function! s:source_rc(rc_file_name)
        let rc_file = expand(g:rc_dir . "/" . a:rc_file_name)
        if filereadable(rc_file)
            execute "source" rc_file
        endif
    endfunction

    " ��{�ݒ�
    call s:source_rc(".vimrc")
endif
