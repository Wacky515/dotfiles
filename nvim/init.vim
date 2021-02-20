scriptencoding utf-8
" Created:     201*/**/** **:**:**
" Last Change: 2019/10/29 09:37:19.

" !!!: �K���擪�ɋL�q
" "autocmd"�i�}�N���j �̏�����
augroup MyAutoCmd
    autocmd!
augroup END

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

" NeoVim ��p�ݒ�
colorscheme iceberg

" ee: "TComment" �N��
nnoremap <silent> ee :<C-u>TComment<CR>
