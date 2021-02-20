# �O���[�v�ɑ����Ă��Ȃ� "autocmd"

- "autocmd" �R�}���h�� [group] ���ȗ��ł���
  - ���A".vimrc" ���� [group] ���ȗ�����Ɩ��

```vimscript
:au[tocmd] [group] {event} {pat} [nested] {cmd}
```

- [group] ���w�� "autocmd" �� ".vimrc" �ɋL�q���Ă���ƁA".vimrc" ��Ǎ��ޓx�ɓo�^����
  - ".vimrc" �Ǎ��݉� "autocmd" ���s
    - �i�X "Vim" ���d���Ȃ�

- �����p�^�[��

```vimscript
autocmd FileType cpp setlocal expandtab
autocmd FileType make setlocal noexpandtab
```

- �ǂ��p�^�[��

```vimscript
augroup vimrc
  autocmd!
augroup END

autocmd vimrc FileType cpp setlocal expandtab
autocmd vimrc FileType make setlocal noexpandtab
```

- vimrc�̐擪�̕��ŁE�E�E

```vimscript
augroup vimrc
  autocmd!
augroup END
```

- ��錾���邱�ƂŃO���[�v ".vimrc" �ɑ����� "autocmd" ������
  - "autocmd!" �����݂̃O���[�v�ɑ����Ă��� "autocmd" �����ׂēo�^����
  - ���̌�A�O���[�v ".vimrc" �ɑ����� "autocmd" ���g����OK
  - ����� ".vimrc" ���ēǍ��݂��Ă� "Vim" ���d���Ȃ�Ȃ�

- ��L�̕��@�ȊO�̋L�q�@

```vimscript
augroup vimrc
  autocmd!
  autocmd FileType cpp setlocal expandtab
  autocmd FileType make setlocal noexpandtab
  " ...
augroup END
```

- �������Ɠo�^�𓯎��Ɏ��s
- ���� "autocmd" �̌�ɃO���[�v���������Ȃ��Ă���
  - �኱�R�[�f�B���O���y
  - �O���[�v���͔C��
  - ".vimrc" �̕K�v�͂Ȃ�
