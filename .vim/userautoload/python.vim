scriptencoding utf-8

if exists('b:did_ftplugin_python')
    finish
endif
let b:did_ftplugin_python = 1

" Python�p�̃V���^�b�N�X�n�C���C�g��ON
let python_highlight_all =1

setlocal smarttab
setlocal expandtab
setlocal tabstop=4
setlocal shiftwidth=4

" �X�N���v�g�����s
" TODO: ���s�O�� ":w" ������
nnoremap <F5> :!python % <ENTER>
" �f�o�b�O�����s
nnoremap <F12> :!python -m pdb % <ENTER>

