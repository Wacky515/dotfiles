# Vim�}�b�v�L�[

## ���

### FIXME: "NeoVim" �ŕύX�K�v

- ev: vimrc���J��
- eg: gvimrc���J��
- ,v: vimrc�𔽉f
- ,g: gvimrc�𔽉f

---

- :e!: �t�@�C���ēǍ�

- vv: �J�[�\������s���܂őI��
- Y:  �J�[�\������s���܂Ń����N
- g;: �ύX�ӏ��֐i��
- g,: �ύX�ӏ��֖߂�

- bk: �o�b�N�A�b�v�t�@�C���쐬

- ,g:  �J�[�\������ "Google����"
- ,s:  "VimShell" �N��
- ,uc: "Unite codic" �N��
- ,hs: �E�B���h�E�𕪊����ăV�F�����N��
- ,cd: �v���O���}�p�l�[�~���O����

- NOTWORK:
  - +: �t�H���g �g��
  - -: �t�H���g �k��
    - :Zoomfont ���Ă���łȂ��ƗL���ł͂Ȃ��H

### �}�����[�h��

- ,df:     �N����������}��
- ,dd:     �N������}��
- ,dt:     ������}��
- ,ds:     �N�����j����}��
- ,dy:     �j����}��
- dl:      �d�؂����}��
- \<C-w\>: �O�̒P����폜
- \<C-@\>: �������}������������}�����đ}�����[�h�I��

- :TableModeToggle:      �e�[�u���쐬
- �r�W���A�����[�h�� ga: �e�[�u�����`
  - USAGE
    - "*," �Ɠ��͂���΃e�L�X�g���`
      - 2�����ڂ� "," �̓f���~�^
      - ��) |�ŋ�؂��Ă���΁A"*|" �Ɠ���
    - �f���~�^�̃f�t�H���g��`
      - \<Space\>, = : . | & # ,
  - 1�����ڂ� "*" �͉��Ԗڂ̃f���~�^�ɐ��`��K�p���邩
    - "*" �͑S�Ă�Ώۂɂ���
    - "1," �Ɠ��͂����1�Ԗڂ� "," �ɑ΂��Đ��`
      - �f�t�H���g�ł�1�Ȃ̂� "," �����ł��悢

- NOTWORK:
  - ee: "EasyMotion" �J�n

## Denite/Unite

- (D|U)B: ���݂̃o�b�t�@�ꗗ
- (D|U)F: ���݂̃o�b�t�@�̃f�B���N�g���ꗗ
- (D|U)R: ���W�X�^�ꗗ
- UC:     �u�b�N�}�[�N�ꗗ
- UA:     �u�b�N�}�[�N�ɒǉ�
- UT:     �o�b�t�@��V�����^�u�ŊJ��
- DL:     Colorscheme �v���r���[
- NOTWORK:
  - (D|U)M: �ŋߎg�p�����t�@�C���ꗗ
- UW:     �ŋߎg�p�����E�B���h�E�ꗗ

## Git

- mgs :  Gstatus\<CR\>\<C-w\>T
  - �I���t�@�C����� -: "git add/reset" ���g�O��
- mga:   Gwrite\<CR\>
- mgc:   Gcommit-v\<CR\>
- mgb:   Gblame\<CR\>
- mgd:   Gdiff\<CR\>
- mgm:   Gmerge\<CR\>
- :Agit: ������"git log" �N��
- :Gitv: "gitk" ���s

## �}�[�N

- mn:    ���݈ʒu���}�[�N
- m,"*": "*" �̃}�[�N�ֈړ�
- mj:    ���̃}�[�N�ֈړ�
- mk:    �O�̃}�[�N�ֈړ�
- md:    �}�[�N�̑S�폜
- ml:    �}�[�N�ꗗ��\��/��\��
- ms"*": ���Ƀ}�[�N���� "*" ��ݒ�
- m"*":  NOTWORK: �}�[�N���� "*" ��ݒ肵�āA�����Ƀ}�[�N
- ddp:   �}�[�N�폜
  - ��{�J�b�g&�y�[�X�g�@�\�ő��

- :CdCurrent:      �J���Ă���Ƃ�����J�����g�f�B���g���ɕύX

- \<F4\>:  "Gundo.vim" �E�B���h�E���J���g�O��
- \<F6\>:  "ctags" �쐬
- \<F7\>:  �`�[�g�V�[�g �\��
- \<F8\>:  �X�j�y�b�g�o�^/�ҏW
  - NeoSnippetEdit: �X�j�y�b�g�o�^/�ҏW
- \<F9\>:  Ctag�ꗗ
- \<F11\>: ALE�C��
  - \<C-k\>: ���̏C��
  - \<C-l\>: �O�̏C��

- \<C-i\>p: CtrlP �N��
- \<C-s\>:  �G�N�X�v���[���ŕۑ��ꏊ�I�����ĕۑ�

- \<C-ww\> or \<C-w\>\<C-w\>: ���̃E�B���h�E�ֈړ�
- \<C-wW\>:                   �O�̃E�B���h�E��(�t����)

- \<C-h\>: ���������� "ctags" �\��
- \<C-l\>: ���������� "ctags" �\��

- \<C-j\>: �}���`�J�[�\�� �I���J�n
  - ���������őI�����Ă���
- \<Alt\>k: �}���`�J�[�\�� �S�I��

- \<Shift\>k: �J�[�\�������w���v����

- \<Leader\>s:  �E�B���h�E���c����
- \<Leader\>v:  �E�B���h�E��������

- \<Leader\>i:  �����z�u3��ʕ���
- \<Leader\>e:  �E�B���h�E�T�C�Y�ύX�J�n
- \<Leader\>o:  ���݊J���Ă���o�b�t�@��IDE���ɊJ��
- \<Leader\>md: �ҏW���̃t�@�C�����u���E�U�ŕ\���iMarkdown�p�j
- \<Leader\>br: �ҏW���̃t�@�C�����u���E�U�ŕ\���i�ėp�j
- \<Leader\>j:  Vim�̃J�[�\���ړ��ƃu���E�U�̉��X�N���[����A��
- \<Leader\>js: ���X�N���[���A�����~
- \<Leader\>k:  Vim�̃J�[�\���ړ��ƃu���E�U�̏�X�N���[����A��
- \<Leader\>ks: ��X�N���[���A�����~

- \<Leader\>m:  over.vim�i�r�W���A�������u���j�̋N��
  - sub: �J�[�\�����̒P����n�C���C�g�t���Œu��
  - sup: �R�s�[������������n�C���C�g�t���Œu��

- \<Leader\>l: �X�y���`�F�b�NON/OFF���g�O��
  - ]s: ���̃X�y���~�X�̉ӏ��ֈړ�
  - [s: �O�̃X�y���~�X�̉ӏ��ֈړ�
  - z=: ���X�y������\�����C��
  - zg: �J�[�\�����𐳃X�y���Ƃ��o�^
  - zw: �J�[�\��������X�y���Ƃ��o�^

- \<Leader\>zh: �S�p�p�����𔼊p�ɂ���

- \<Leader\>md: �ҏW���̃t�@�C�����u���E�U�ŕ\��
- \<Leader\>,m: "atom" �N��
- \<Leader\>,c: "VS Code" �N��

## Ctrl�ړ�

- \<C-y\>: �������1�s���X�N���[��
- \<C-m\>: 1�s���̐擪
- \<S-y\>: ��������1�s���X�N���[��
- \<C-u\>: ������ɔ���ʕ��X�N���[�� *U* p
- \<C-d\>: �������ɔ���ʕ��X�N���[�� *D* own
- \<C-b\>: �������1��ʕ��X�N���[��  *B* ack
- \<C-f\>: ��������1��ʕ��X�N���[��  *F* orward
- \<C-p\>: �������1�s���X�N���[��
- \<C-n\>: ��������1�s���X�N���[��

## Grep

- \<Leader\>r: �J�[�\������ "RipGrep" �Ώۂɑ}��
- \<Leader\>***P***: �J�[�\������ "The Platinum Searcher" �Ώۂɑ}��
- \<Leader\>a: �J�[�\������ "The Sliver Searcher" �Ώۂɑ}��
- \<Leader\>G: �J�[�\������ "�O��grep" �Ώۂɑ}��
- \<Leader\>g: �J�[�\������ "VimGrep" �Ώۂɑ}��

## ���T����

- \<Leader\>k:  �J�[�\�������p�a���T�����iGENE�j
- \<Leader\>dj: �J�[�\�������p�a���T����
- \<Leader\>de: �J�[�\������a�p���T����
- NOTWORK: \<Leader\>da: �J�[�\�����̒P����X�y�[�X�A���N�Ō���
- NOTWORK: \<Leader\>dw: �J�[�\������Wiki�Ō���

- ,gj: �J�[�\������Google�|��i�p�a�j
- ,ge: �J�[�\������Google�|��i�a�p�j

- :AutoTranslateModeToggle: ���I�ɖ|��
- :Translate              : �r�W���A�����[�h�őI���������

- \<Leader\>sc: "Syntastic" ���s
- \<Leader\>sc: "Syntastic" �g�O��

## �⊮

- \<C-x\>\<C-l\>:   �s�⊮
- \<C-x\>\<C-n\>:   ���݂̃t�@�C���⊮
- \<C-x\>\<C-k\>:   "dictionary" �⊮
- \<C-x\>\<C-t\>:   "thesaurus" �⊮
- \<C-x\>\<C-i\>:   �ҏW���ƊO���Q�ƃt�@�C���̃L�[���[�h�⊮
- \<C-x\>\<C-]\>:   "tags" �⊮
- \<C-x\>\<C-f\>:   �t�@�C�����⊮
- \<C-x\>\<C-d\>:   ��`�������̓}�N���⊮
- \<C-x\>\<C-v\>:   Vim�̃R�}���h���C���⊮
- \<C-x\>\<C-u\>:   ���[�U��`�⊮
- \<C-x\>\<C-o\>:   �I���j�⊮
- \<C-x\>\<C-s\>:   �X�y�����O�⊮
- \<C-n\>, \<C-p\>: "complete" �⊮

## Diff

### Kaoriya

- :VDsplit (�t�@�C����|�o�b�t�@�ԍ�)
  - [c:            �O���̕ύX�̐擪�ֈړ�
  - ]c:            �����̕ύX�̐擪�ֈړ�
  - :diffg[et]|do: �����������Е��̂փR�s�[
  - :diffpu[t]|dp: �����������Е��̂փR�s�[
  - diffoff:       Diff���[�h���I��
  - diffupdate:    Diff��Ԃ��A�b�v�f�[�g

## Jedi

- \<Leader\>d: ��`���W�����v
- \<Leader\>r: �ϐ����l�[��
- \<Leader\>n: �g�p�ӏ��\��

## �R�}���h���C�����[�h

- \<Home\>:           �s���ֈړ�
- \<End\>:            �s���ֈړ�
- \<Left\>:           �ꕶ���߂�
- \<Right\>:          �ꕶ���i��
- \<Shift\>\<Left\>:  �O�̒P��ֈړ�
- \<Shift\>\<Right\>: ���̒P��ֈړ�
- \<Del\>:            �J�[�\���̉��̕������폜
- \<Down\>:           ������1�i��
- \<Up\>:             ������1�߂�
- \<Shift\>\<Ins\>:   �y�[�X�g

## Plugin �L�[�o�C���h���荞�ݑ΍�

```vimscript
autocmd VimEnter * imap <Nul> <C-Space>
```

- "autocmd" �C�x���g�� "VimEnter" ���w�肷��Ί�{�I�� "Plugin" ����ɓǂݍ��܂��
  - "Plugin" �̏㏑���͂�����x����ł���

## �V�C�\��

- :Weather: �V�C�\��

## �抷���ē�

- :TrainSearchRoute {�o���w} {�����w}: �抷�����
- :TrainLateInfo: �d�Ԓx�����
