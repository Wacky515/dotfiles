scriptencoding utf-8
" Created:     2018/09/12 15:02:45
" Last Change: 2023/03/09 17:20:16.

" ------------------------------------------------------------------------------
"  マップキー
" ------------------------------------------------------------------------------
" <Leader>l: 初期配置3画面 分割
nnoremap <silent> <Leader>mm :split<CR>:<C-u>call GitBash()<CR><C-w>j:vsplit<CR>

" <Leader>z: Git Bash 起動
nnoremap <Leader>z :split<CR>:<C-u>call GitBash()<CR>

" ------------------------------------------------------------------------------
"  基本設定
" ------------------------------------------------------------------------------
if (has("win32") || has("win64"))
    function! GitBash()
        " 日本語版 "Windows"の場合`ja`が設定される
        " 入力ロケールに合わせた "UTF-8" に再設定
        let l:env = {
                    \ 'LANG': systemlist('"C:/Program Files/Git/usr/bin/locale.exe" -iU')[0],
                    \ }

        " "remote" 連携設定
        if has('clientserver')
            call extend(l:env, {
                        \ 'GVIM': $VIMRUNTIME,
                        \ 'VIM_SERVERNAME': v:servername,
                        \ })
        endif

        " "term_start" で "git for windows" の "bash" を実行
        call term_start(['C:/Program Files/Git/bin/bash.exe', '-l'], {
                    \ 'term_name': 'Git',
                    \ 'term_finish': 'close',
                    \ 'curwin': v:true,
                    \ 'cwd': $USERPROFILE,
                    \ 'env': l:env,
                    \ })
    endfunction

    " set shell=C:\\Program\ Files\ (x86)\\clink\\0.4.9\\clink.bat
endif
