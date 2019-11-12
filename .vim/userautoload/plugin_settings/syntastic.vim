scriptencoding utf-8
" Create:      201*/**/** **:**:**
" Last Change: 2018/12/21 15:23:53.

" ---------------------------------------------------------------------------
" マップキー
" ---------------------------------------------------------------------------
" <Leader>sc: "Syntastic" 実行
nnoremap <Leader>sc :SyntasticCheck<CR>
" <Leader>sc: "Syntastic" トグル
nnoremap <Leader>st :SyntasticToggleMode<CR>

" ---------------------------------------------------------------------------
" 基本設定
" ---------------------------------------------------------------------------
" "Python" の構文チェックを "Flake8" に指定
let g:syntastic_python_checkers = ["flake8"]
" "Markdown" の構文チェックを "textlint" に指定
let g:syntastic_markdown_checkers = ["textlint"]
" "*.txt" の構文チェックを "textlint" に指定
let g:syntastic_text_checkers = ["textlint"]

let g:syntastic_mode_map = {"mode": "passive",
            \ "active_filetypes": ["python", "markdown", "text"] }

let g:syntastic_error_symbol="✗"
let g:syntastic_warning_symbol="！"
let g:syntastic_style_error_symbol = "✗"
let g:syntastic_style_warning_symbol = "！"

" ":wq" で "syntastic" を実行 "しない"
let g:syntastic_check_on_wq = 0
" ":w" で "syntastic" を実行 "しない"
let g:syntastic_check_on_w = 0

" 構文エラー行に「>>」を表示 " {{{
" let g:syntastic_enable_signs=1
" the error window will be automatically closed when no errors are
" detected, but not opened automatically
" let g:syntastic_auto_loc_list=2

" "{"mode": "passive"}" で保存時に "syntastic" 実行
" let g:syntastic_mode_map = {"mode": "active"}
" let g:syntastic_mode_map = {"mode": "passive"}
" }}}
" "Python" の構文チェックを "PEP8" に指定 " {{{
" let g:syntastic_python_checkers = ["PEP8"]
" }}}
" TODO: 動作確認 " {{{
" Automatically jump to the first error detected
" let g:syntastic_auto_jump = 0

" !!!: 遅いためKill
" 挿入モード終了、テキスト変更で "syntastic" 実行
" augroup AutoSyntastic
"     autocmd!
"     autocmd InsertLeave,TextChanged * call s:syntastic()
" augroup END

" 最大文字数を拡大
" let g:syntastic_python_flake8_args="--max-line-length=120
" }}}

