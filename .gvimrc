scriptencoding utf-8

""" �O�σe�[�}�� """

" �J���[�X�L�[�}�̎w��
colorscheme hybrid
" colorscheme desert

" �Ôw�i�p�̔z�F�ɂ���
set background=dark

" �E�B���h�E ��������
if has('mac')
    set transparency=10
endif
if has('win32') || ('win64')
    :autocmd GUIEnter * set transparency=235
endif

" �t�H���g�̐ݒ�
" TODO: �t�H���g�̃C���X�g�[��
""" Windows �̏ꍇ
if has ('mac')
    set guifont=Ricty_Diminished:h18
elseif has('win32') || has ('win64')
    set guifont=Ricty_Diminished:h16
endif

" �V���^�b�N�X�n�C���C�g
syntax on

" �s�ԍ��̐F
highlight LineNr ctermfg=darkyellow
