# グループに属していない "autocmd"

- "autocmd" コマンドは [group] を省略できる
  - が、".vimrc" 内で [group] を省略すると厄介

```vimscript
:au[tocmd] [group] {event} {pat} [nested] {cmd}
```

- [group] 未指定 "autocmd" を ".vimrc" に記述していると、".vimrc" を読込む度に登録処理
  - ".vimrc" 読込み回数 "autocmd" 実行
    - 段々 "Vim" が重くなる

- 悪いパターン

```vimscript
autocmd FileType cpp setlocal expandtab
autocmd FileType make setlocal noexpandtab
```

- 良いパターン

```vimscript
augroup vimrc
  autocmd!
augroup END

autocmd vimrc FileType cpp setlocal expandtab
autocmd vimrc FileType make setlocal noexpandtab
```

- vimrcの先頭の方で・・・

```vimscript
augroup vimrc
  autocmd!
augroup END
```

- を宣言することでグループ ".vimrc" に属する "autocmd" 初期化
  - "autocmd!" が現在のグループに属している "autocmd" をすべて登録解除
  - その後、グループ ".vimrc" に属した "autocmd" を使えばOK
  - これで ".vimrc" を再読込みしても "Vim" が重くならない

- 上記の方法以外の記述法

```vimscript
augroup vimrc
  autocmd!
  autocmd FileType cpp setlocal expandtab
  autocmd FileType make setlocal noexpandtab
  " ...
augroup END
```

- 初期化と登録を同時に実行
- 毎回 "autocmd" の後にグループ名を書かなくていい
  - 若干コーディングが楽
  - グループ名は任意
  - ".vimrc" の必要はない
