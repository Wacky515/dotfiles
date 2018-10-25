# Vimマップキー

## 一般
### FIXME: "NeoVim" で変更必要
- ev: vimrcを開く
- eg: gvimrcを開く
- ,v: vimrcを反映
- ,g: gvimrcを反映

- bk: バックアップファイル作成

- ,s:  "VimShell" 起動
- ,sp: "CtrlP" 起動
- ,uc: "Unite codic" 起動
- ,hs: ウインドウを分割してシェルを起動

### 挿入モードで
- ,df:   年月日時分を挿入
- ,dd:   年月日を挿入
- ,dt:   時分を挿入
- ,ds:   年月日曜日を挿入
- ,dy:   曜日を挿入
- dl:    仕切り線を挿入
- <C-w>: 前の単語を削除
- <C-@>: さっき挿入した文字を挿入して挿入モード終了

- :TableModeToggle:      テーブル作成
- ビジュアルモードで ga: テーブル整形
    - USAGE  {{{
        - "*," と入力すればテキスト整形
            - 2文字目の "," はデリミタ
            - 例) |で句切られていれば、"*|" と入力
        - デリミタのデフォルト定義
            - <Space>, =, :, ., |, &, #, ,
        - 1文字目の "*" は何番目のデリミタに整形を適用するか
        - "*" は全てを対象にする
        - "1," と入力すれば1番目の "," に対して整形
            - デフォルトでは1なので "," だけでもよい
}}}

- ee: "EasyMotion" 開始

- (D|U)b: 現在のバッファ一覧
- (D|U)f: 現在のバッファのディレクトリ一覧
- (D|U)r: レジスタ一覧
- Uc:     ブックマーク一覧
- Ua:     ブックマークに追加
- Ut:     バッファを新しいタブで開く
- (D|U)l: Colorscheme プレビュー
- (D|U)m: 最近使用したファイル一覧
- Uw:     最近使用したウィンドウ一覧

- mgs :Gstatus<CR><C-w>T
    - 選択ファイル上で -: "git add/reset" をトグル
- mga :  Gwrite<CR>
- mgc :  Gcommit-v<CR>
- mgb :  Gblame<CR>
- mgd :  Gdiff<CR>
- mgm :  Gmerge<CR>
- :Agit: 強化版"git log" 起動
- :Gitv: "gitk" 実行

- mn:    現在位置をマーク
- m,:    + 1文字で指定のマークへ移動
- mj:    次のマークへ移動
- mk:    前のマークへ移動
- md:    マークの全削除
- ml:    マーク一覧を表示/非表示
- ms"*": 次にマークする "*" を設定
- m"*":  マークする "*" を設定し、同時にマーク
- ddp:   マーク削除
    - 基本カット&ペースト機能で代替

- :NeoSnippetEdit: スニペット編集
- :CdCurrent:      現在開いているファイル・ディレクトリをカレントディレトリに変更

- <F4>:  "Gundo.vim" ウィンドウを開閉をトグル
- <F6>:  "ctags" 作成
- <F7>:  チートシート 表示
- <F11>: ALE修正

- <Ctrl>s: エクスプローラで保存場所選択して保存
- <Ctrl>e: ウィンドウサイズ変更開始

- <Ctrl>ww or <Ctrl>w<Ctrl>w: 次のウィンドウへ移動
- <Ctrl>wW: 前のウィンドウへ(逆方向)

- <Ctrl>h: 垂直分割で "ctags" 表示
- <Ctrl>l: 水平分割で "ctags" 表示

- <Shift>k: カーソル下をヘルプ検索

- <Leader>i:  初期配置3画面分割
- <Leader>o:  現在開いているバッファをIDE風に開く
- <Leader>p:  ~~編集中のファイルをブラウザで表示~~
- <Leader>md: ~~編集中のファイルをブラウザで表示~~
- <Leader>j:  ~~Vimのカーソル移動とブラウザの下スクロールを連動~~
- <Leader>js: ~~下スクロール連動を停止~~
- <Leader>k:  ~~Vimのカーソル移動とブラウザの上スクロールを連動~~
- <Leader>ks: ~~上スクロール連動を停止~~

- <Leader>m: over.vim（ビジュアル強化置換）の起動
- sub: カーソル下の単語をハイライト付きで置換
- sup: コピーした文字列をハイライト付きで置換

- <Leader>l: スペルチェックON/OFFをトグル
    - ]s: 次のスペルミスの箇所へ移動
    - [s: 前のスペルミスの箇所へ移動
    - z=: 正スペル候補を表示し修正
    - zg: カーソル下を正スペルとし登録
    - zw: カーソル下を誤スペルとし登録

- <Leader>zh: 全角英数字を半角にする

- <Leader>md: 編集中のファイルをブラウザで表示
" <Leader>,m: "atom" 起動
" <Leader>,c: "VS Code" 起動

## Ctrl移動
- <C-b>: 1ページ上
- <C-f>: 1ページ下
- <C-u>: 半ページ上
- <C-d>: 半ページ下
- <C-y>: 1行上
- <C-e>: 1行下
- <C-m>: 1行下の先頭

## Grep
- <Leader>r: カーソル下を "RipGrep" 対象に挿入
- <Leader>p: カーソル下を "The Platinum Searcher" 対象に挿入
- <Leader>a: カーソル下を "The Sliver Searcher" 対象に挿入
- <Leader>G: カーソル下を "外部grep" 対象に挿入
- <Leader>g: カーソル下を "VimGrep" 対象に挿入

## 辞典検索（未動作）
- <Leader>k:  カーソル下を英和辞典検索（GENE）
- <Leader>dj: カーソル下を英和辞典検索
- <Leader>de: カーソル下を和英辞典検索
- <Leader>da: カーソル下の単語をスペースアルクで検索
- <Leader>dw: カーソル下をwikiで検索

- <Leader>gj: カーソル下をGoogle翻訳（英和）
- <Leader>ge: カーソル下をGoogle翻訳（和英）

## 補完
- <C-x><C-l>:   行補完
- <C-x><C-n>:   現在のファイル補完
- <C-x><C-k>:   "dictionary" 補完
- <C-x><C-t>:   "thesaurus" 補完
- <C-x><C-i>:   編集中と外部参照ファイルのキーワード補完
- <C-x><C-]>:   "tags" 補完
- <C-x><C-f>:   ファイル名補完
- <C-x><C-d>:   定義もしくはマクロ補完
- <C-x><C-v>:   Vimのコマンドライン補完
- <C-x><C-u>:   ユーザ定義補完補完
- <C-x><C-o>:   オムニ補完
- <C-x><C-s>:   スペリング補完
- <C-n>, <C-p>: "complete" 補完

## Diff
### Kaoriya
- :VDsplit (ファイル名|バッファ番号)

- [c:            前方の変更の先頭へ移動
- ]c:            次方の変更の先頭へ移動
- :diffg[et]|do: 差分をもう片方のへコピー
- :diffpu[t]|dp: 差分をもう片方のへコピー
- diffoff:       Diffモードを終了
- diffupdate:    Diff状態をアップデート

## コマンドラインモード
- <Home>:         行頭へ移動
- <End>:          行末へ移動
- <Left>:         一文字戻る
- <Right>:        一文字進む
- <Shift><Left>:  前の単語へ移動
- <Shift><Right>: 次の単語へ移動
- <Del>:          カーソルの下の文字を削除
- <Down>:         履歴を一つ進む
- <Up>:           履歴を一つ戻る
- <Shift><Ins>:   ペースト
