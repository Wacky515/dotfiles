# Snippet setting for Vim

- snippet [name]
- abbr    [abbreviation]
- alias   [aliases]
- regexp  [pattern]
- options [options]

``` Example
  if ${1:conditions}
    ${2}
  endif
```

## snippet [name] (必須)

- [name] に snippet を展開するための Keyword を書く
- [name] に対して snippet 展開
- NeoSnippet なら Ctrl+k で展開

## abbr [abbreviation]

- 補完の Popup に表示される説明文

## alias [aliases]

- [name] の別名を複数つけられる。

## regexp [pattern]

- [pattern] にマッチしたときのみ [name] を展開
- [pattern] には正規表現を記述
  - 例えば空白を除いた行頭の [name] のみを展開する場合

``` Example
  regexp '^\s*'
```

## options [options]

### word

- 単語の区切りで [name] を見つける
- options word なしだと

``` Example
  hoge1 + hoge2
```

- 上記で hoge2 の snippet が登録されていても展開されない
- hoge1 + hoge2で [name] みなされる
- 1単語は英数字とアンダースコアのつながりで判断される
  - 上の場合 + で別の単語と認識される

### head

- 行頭の [name] のみ snippet を適用
  - 空白などは除く

### indent

- snippet 展開後の文字に indent を適用
- snippet の中身(必須)

``` Snippet
if ${1:condition1}
  ${2:#:statement}
endif
if $1 AND ${3:condition2}
  ${4:TARGET}
endif
${5}
```

- ${} で囲まれた部分は place holder
- snippet 展開後 Ctrl+k でその場所に移動
- place holder の種類は以下

#### ${number:text}

- number は飛ぶ順番
- text はその場所にデフォルトで表示される文字列
  - 変更が必要な場合はtextを上書きする

#### ${number:#:text}

- \# 無しとの違いは、text を変更せず Ctrl+k で 次の place holder にジャンプした際に text が消される

#### ${number:TARGET}

- ビジュアルモードで選択中のテキストをここに挿入できる
- この機能を使うためには
  - \<Plug\>(neosnippet_expand_target)

#### ${number}

- ただのジャンプ先として便利
  - 例えば if や for の中から抜けるための place holder

#### $number

- ジャンプ先ではなく同じ番号の place holder で入力された文字がここにも入力
- for文などで以下のように使用

``` for
for (${1:i}; $1<${2:end}; $1++) {
  ${3:#:loop}
}
${4}
```

#### ${0}

- 最後にジャンプする場所
- number1 から順に飛んで最後に 0 に飛ぶ
