# Vimマップキー

## 一般

### FIXME: "NeoVim" で変更必要

- ev: vimrcを開く
- eg: gvimrcを開く
- ,v: vimrcを反映
- ,g: gvimrcを反映

---

- :e!: ファイル再読込

- vv: カーソルから行末まで選択
- Y:  カーソルから行末までヤンク
- g;: 変更箇所へ進む
- g,: 変更箇所へ戻る

- bk: バックアップファイル作成

- ,g:  カーソル下を "Google検索"
- ,s:  "VimShell" 起動
- ,uc: "Unite codic" 起動
- ,hs: ウィンドウを分割してシェルを起動
- ,cd: プログラマ用ネーミング辞書

- NOTWORK:
  - +: フォント 拡大
  - -: フォント 縮小
    - :Zoomfont してからでないと有効ではない？

### 挿入モードで

- ,df:     年月日時分を挿入
- ,dd:     年月日を挿入
- ,dt:     時分を挿入
- ,ds:     年月日曜日を挿入
- ,dy:     曜日を挿入
- dl:      仕切り線を挿入
- \<C-w\>: 前の単語を削除
- \<C-@\>: さっき挿入した文字を挿入して挿入モード終了

- :TableModeToggle:      テーブル作成
- ビジュアルモードで ga: テーブル整形
  - USAGE
    - "*," と入力すればテキスト整形
      - 2文字目の "," はデリミタ
      - 例) |で句切られていれば、"*|" と入力
    - デリミタのデフォルト定義
      - \<Space\>, = : . | & # ,
  - 1文字目の "*" は何番目のデリミタに整形を適用するか
    - "*" は全てを対象にする
    - "1," と入力すれば1番目の "," に対して整形
      - デフォルトでは1なので "," だけでもよい

- NOTWORK:
  - ee: "EasyMotion" 開始

## Denite/Unite

- (D|U)B: 現在のバッファ一覧
- (D|U)F: 現在のバッファのディレクトリ一覧
- (D|U)R: レジスタ一覧
- UC:     ブックマーク一覧
- UA:     ブックマークに追加
- UT:     バッファを新しいタブで開く
- DL:     Colorscheme プレビュー
- NOTWORK:
  - (D|U)M: 最近使用したファイル一覧
- UW:     最近使用したウィンドウ一覧

## Git

- mgs :  Gstatus\<CR\>\<C-w\>T
  - 選択ファイル上で -: "git add/reset" をトグル
- mga:   Gwrite\<CR\>
- mgc:   Gcommit-v\<CR\>
- mgb:   Gblame\<CR\>
- mgd:   Gdiff\<CR\>
- mgm:   Gmerge\<CR\>
- :Agit: 強化版"git log" 起動
- :Gitv: "gitk" 実行

## マーク

- mn:    現在位置をマーク
- m,"*": "*" のマークへ移動
- mj:    次のマークへ移動
- mk:    前のマークへ移動
- md:    マークの全削除
- ml:    マーク一覧を表示/非表示
- ms"*": 次にマークする "*" を設定
- m"*":  NOTWORK: マークする "*" を設定して、同時にマーク
- ddp:   マーク削除
  - 基本カット&ペースト機能で代替

- :CdCurrent:      開いているところをカレントディレトリに変更

- \<F4\>:  "Gundo.vim" ウィンドウを開閉をトグル
- \<F6\>:  "ctags" 作成
- \<F7\>:  チートシート 表示
- \<F8\>:  スニペット登録/編集
  - NeoSnippetEdit: スニペット登録/編集
- \<F9\>:  Ctag一覧
- \<F11\>: ALE修正
  - \<C-k\>: 次の修正
  - \<C-l\>: 前の修正

- \<C-i\>p: CtrlP 起動
- \<C-s\>:  エクスプローラで保存場所選択して保存

- \<C-ww\> or \<C-w\>\<C-w\>: 次のウィンドウへ移動
- \<C-wW\>:                   前のウィンドウへ(逆方向)

- \<C-h\>: 垂直分割で "ctags" 表示
- \<C-l\>: 水平分割で "ctags" 表示

- \<C-j\>: マルチカーソル 選択開始
  - 複数押下で選択していく
- \<Alt\>k: マルチカーソル 全選択

- \<Shift\>k: カーソル下をヘルプ検索

- \<Leader\>s:  ウィンドウを縦分割
- \<Leader\>v:  ウィンドウを横分割

- \<Leader\>i:  初期配置3画面分割
- \<Leader\>e:  ウィンドウサイズ変更開始
- \<Leader\>o:  現在開いているバッファをIDE風に開く
- \<Leader\>md: 編集中のファイルをブラウザで表示（Markdown用）
- \<Leader\>br: 編集中のファイルをブラウザで表示（汎用）
- \<Leader\>j:  Vimのカーソル移動とブラウザの下スクロールを連動
- \<Leader\>js: 下スクロール連動を停止
- \<Leader\>k:  Vimのカーソル移動とブラウザの上スクロールを連動
- \<Leader\>ks: 上スクロール連動を停止

- \<Leader\>m:  over.vim（ビジュアル強化置換）の起動
  - sub: カーソル下の単語をハイライト付きで置換
  - sup: コピーした文字列をハイライト付きで置換

- \<Leader\>l: スペルチェックON/OFFをトグル
  - ]s: 次のスペルミスの箇所へ移動
  - [s: 前のスペルミスの箇所へ移動
  - z=: 正スペル候補を表示し修正
  - zg: カーソル下を正スペルとし登録
  - zw: カーソル下を誤スペルとし登録

- \<Leader\>zh: 全角英数字を半角にする

- \<Leader\>md: 編集中のファイルをブラウザで表示
- \<Leader\>,m: "atom" 起動
- \<Leader\>,c: "VS Code" 起動

## Ctrl移動

- \<C-y\>: 上方向に1行分スクロール
- \<C-m\>: 1行下の先頭
- \<S-y\>: 下方向に1行分スクロール
- \<C-u\>: 上方向に半画面分スクロール *U* p
- \<C-d\>: 下方向に半画面分スクロール *D* own
- \<C-b\>: 上方向に1画面分スクロール  *B* ack
- \<C-f\>: 下方向に1画面分スクロール  *F* orward
- \<C-p\>: 上方向に1行分スクロール
- \<C-n\>: 下方向に1行分スクロール

## Grep

- \<Leader\>r: カーソル下を "RipGrep" 対象に挿入
- \<Leader\>***P***: カーソル下を "The Platinum Searcher" 対象に挿入
- \<Leader\>a: カーソル下を "The Sliver Searcher" 対象に挿入
- \<Leader\>G: カーソル下を "外部grep" 対象に挿入
- \<Leader\>g: カーソル下を "VimGrep" 対象に挿入

## 辞典検索

- \<Leader\>k:  カーソル下を英和辞典検索（GENE）
- \<Leader\>dj: カーソル下を英和辞典検索
- \<Leader\>de: カーソル下を和英辞典検索
- NOTWORK: \<Leader\>da: カーソル下の単語をスペースアルクで検索
- NOTWORK: \<Leader\>dw: カーソル下をWikiで検索

- ,gj: カーソル下をGoogle翻訳（英和）
- ,ge: カーソル下をGoogle翻訳（和英）

- :AutoTranslateModeToggle: 動的に翻訳
- :Translate              : ビジュアルモードで選択した状態

- \<Leader\>sc: "Syntastic" 実行
- \<Leader\>sc: "Syntastic" トグル

## 補完

- \<C-x\>\<C-l\>:   行補完
- \<C-x\>\<C-n\>:   現在のファイル補完
- \<C-x\>\<C-k\>:   "dictionary" 補完
- \<C-x\>\<C-t\>:   "thesaurus" 補完
- \<C-x\>\<C-i\>:   編集中と外部参照ファイルのキーワード補完
- \<C-x\>\<C-]\>:   "tags" 補完
- \<C-x\>\<C-f\>:   ファイル名補完
- \<C-x\>\<C-d\>:   定義もしくはマクロ補完
- \<C-x\>\<C-v\>:   Vimのコマンドライン補完
- \<C-x\>\<C-u\>:   ユーザ定義補完
- \<C-x\>\<C-o\>:   オムニ補完
- \<C-x\>\<C-s\>:   スペリング補完
- \<C-n\>, \<C-p\>: "complete" 補完

## Diff

### Kaoriya

- :VDsplit (ファイル名|バッファ番号)
  - [c:            前方の変更の先頭へ移動
  - ]c:            次方の変更の先頭へ移動
  - :diffg[et]|do: 差分をもう片方のへコピー
  - :diffpu[t]|dp: 差分をもう片方のへコピー
  - diffoff:       Diffモードを終了
  - diffupdate:    Diff状態をアップデート

## Jedi

- \<Leader\>d: 定義元ジャンプ
- \<Leader\>r: 変数リネーム
- \<Leader\>n: 使用箇所表示

## コマンドラインモード

- \<Home\>:           行頭へ移動
- \<End\>:            行末へ移動
- \<Left\>:           一文字戻る
- \<Right\>:          一文字進む
- \<Shift\>\<Left\>:  前の単語へ移動
- \<Shift\>\<Right\>: 次の単語へ移動
- \<Del\>:            カーソルの下の文字を削除
- \<Down\>:           履歴を1つ進む
- \<Up\>:             履歴を1つ戻る
- \<Shift\>\<Ins\>:   ペースト

## Plugin キーバインド割り込み対策

```vimscript
autocmd VimEnter * imap <Nul> <C-Space>
```

- "autocmd" イベントで "VimEnter" を指定すれば基本的に "Plugin" より後に読み込まれる
  - "Plugin" の上書きはある程度回避できる

## 天気予報

- :Weather: 天気予報

## 乗換え案内

- :TrainSearchRoute {出発駅} {到着駅}: 乗換え情報
- :TrainLateInfo: 電車遅延情報
