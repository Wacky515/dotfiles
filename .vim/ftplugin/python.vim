scriptencoding utf-8

if exists('b:did_ftplugin_python')
    finish
endif
let b:did_ftplugin_python = 1

" Python�p�̃V���^�b�N�X�n�C���C�g��ON
let python_highlight_all =1

" �^�u�̐ݒ�
setlocal smarttab
setlocal expandtab
setlocal tabstop=4
setlocal shiftwidth=4

" 80�����ڂɐԂ����C���}�[�N������
set colorcolumn=80

" �J���[�X�L�[�}�̎w��
" colorscheme hybrid
colorscheme desert
" �Ôw�i�p�̔z�F�ɂ���
set background=dark

" �X�N���v�g�����s
" DONE: ���s�O�� ":w" ������
" nnoremap <F5> :!python % <ENTER>
nnoremap <F5> :w <ENTER> :!python % <ENTER>
" �f�o�b�O�����s
nnoremap <F12> :w <ENTER> :!python -m pdb % <ENTER>

