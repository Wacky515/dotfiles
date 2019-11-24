scriptencoding utf-8
" Created:     201*/**/** **:**:**
" Last Change: 2019/11/22 17:21:05.

" --------------------------------------------------------------------------------
" マップキー
" --------------------------------------------------------------------------------
" <F6>:    "Ctags" 作成
nnoremap <F6> :<C-u>!ctags -R<CR>
" <Ctrl>h: 垂直分割で "Ctags" 表示
nnoremap <C-h> :vsplit<CR> :exe("tjump ".expand('<cword>'))<CR>
" <Ctrl>l: 水平分割で "Ctags" 表示
nnoremap <C-l> :split<CR>  :exe("tjump ".expand('<cword>'))<CR>

" --------------------------------------------------------------------------------
" 基本設定
" --------------------------------------------------------------------------------
" 再帰的に処理
set tags=./tags;

function! s:execute_ctags() abort
  " 探すタグファイル名
  let tag_name = '.tags'
  " ディレクトリを遡りタグファイルを探し、パス取得
  let tags_path = findfile(tag_name, '.;')
  " タグファイルパスが見つからなかった場合の処理
  if tags_path ==# ''
    return
  endif

  " タグファイルのディレクトリパスを取得
    " `:p:h` の部分は、:h filename-modifiers で確認
  let tags_dirpath = fnamemodify(tags_path, ':p:h')
  " 見つかったタグファイルのディレクトリに移動し
  " "Ctags" をバックグラウンド実行（エラー出力破棄）
  execute 'silent !cd' tags_dirpath '&& ctags -R -f' tag_name '2> /dev/null &'
endfunction

augroup ctags
  autocmd!
  autocmd BufWritePost * call s:execute_ctags()
augroup END

" DEP:
" " ファイルを保存時に "Ctags" 作成
" autocmd BufWritePost * call system("ctags -R")
