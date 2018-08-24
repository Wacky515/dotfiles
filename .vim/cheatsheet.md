# Vimマップキー

- FIXME: "NeoVim" で変更必要
    - ev: vimrcを開く
    - eg: gvimrcを開く
    - ,v: vimrcを反映
    - ,g: gvimrcを反映

- bk: バックアップファイル作成

- ,sp :CtrlP 起動
- ,s: "VimShell" を起動
- ,hs: ウインドウを分割してシェルを起動
- ,uc: "Unite codic" 起動

- 挿入モードで dl: 仕切り線を挿入

- ee: "EasyMotion" 開始

- Ub: 現在のバッファ一覧
- Uf: 現在のバッファのディレクトリ一覧
- Ur: レジスタ一覧
- Uc: ブックマーク一覧
- Ua: ブックマークに追加kkk
- Ut: バッファを新しいタブで開く
- Ul: Colorscheme プレビュー
- Um: 最近使用したファイル一覧
- Uw: 最近使用したウィンドウ一覧

- mn: 現在位置をマーク
- m,: + 1文字で指定のマークへ移動
- mj: 次のマークへ移動
- mk: 前のマークへ移動
- md: マークの全削除
- ml: マーク一覧を表示/非表示
- ms"*": 次にマークする "*" を設定
- m"*": マークする "*" を設定し、同時にマーク

- :NeoSnippetEdit: スニペット編集

- <Ctrl>s: エクスプローラで保存場所選択して保存
- <Ctrl>e: ウィンドウサイズ変更開始

- <Shift>k: カーソル下をヘルプ検索

- <F4>: "Gundo.vim" ウィンドウを開閉をトグル

- <F6>: "ctags" 作成
- <Ctrl>h: 垂直分割で "ctags" 表示
- <Ctrl>l: 水平分割で "ctags" 表示
    - imap <C-k>     <Plug>(neosnippet_expand_or_jump) ＜－
    - smap <C-k>     <Plug>(neosnippet_expand_or_jump)
    - xmap <C-k>     <Plug>(neosnippet_expand_target)

- <Leader>o: 現在開いているバッファをIDE風に開く

- <Leader>p: 編集中のファイルをブラウザで表示
- <Leader>md: 編集中のファイルをブラウザで表示
- <Leader>j: Vimのカーソル移動とブラウザの下スクロールを連動
- <Leader>js: 下スクロール連動を停止
- <Leader>k: Vimのカーソル移動とブラウザの上スクロールを連動
- <Leader>ks: 上スクロール連動を停止

- <Leader>l: スペルチェックON/OFFをトグル
    - ]s: 次のスペルミスの箇所へ移動
    - [s: 前のスペルミスの箇所へ移動
    - z=: 正しいスペルの候補を表示し、選択した単語でスペルミスを修正
    - zg: カーソル下の単語を正しいスペルとして辞書登録
    - zw: カーソル下の単語を誤ったスペルとして辞書登録

- <Leader>zh: 全角英数字を半角にする

- <Leader>md: 編集中のファイルをブラウザで表示

## エラーだらけの原因？ 削除済み
- <Leader>r: カーソル下を "RipGrep" 対象に挿入

- <Leader>a: カーソル下を "The Sliver Searcher" 対象に挿入
- <Leader>g: カーソル下を "VimGrep" 対象に挿入
- <Leader>G: カーソル下を "外部grep" 対象に挿入
- <Leader><Ctrl>k: 英和辞典起動

## 未動作
- <Leader>dij: カーソル下を英和辞典検索
- <Leader>die: カーソル下を和英辞典検索
- <Leader>dia: カーソル下の単語をスペースアルクで検索
- <Leader>diw: カーソル下をwikiで検索

# コマンドラインモード

- <Home>: 行頭へ移動
- <End>: 行末へ移動
- <Left>: 一文字戻る
- <Right>: 一文字進む
- <Shift><Left>: 前の単語へ移動
- <Shift><Right>: 次の単語へ移動
- <Del>: カーソルの下の文字を削除
- <Down>: 履歴を一つ進む
- <Up>: 履歴を一つ戻る
- <Shift><Ins>: ペースト
