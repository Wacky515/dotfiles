scriptencoding utf-8

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
cnoremap <expr> / getcmdtype() == "/" ? "\/" : "/"
cnoremap <expr> ? getcmdtype() == "?" ? "\?" : "?"

" grep�����̐ݒ�
" TODO: ����m�F
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
set grepprg=grep\ -nh
