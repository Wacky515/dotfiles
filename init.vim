scriptencoding utf-8
" Created:     201*/**/** **:**:**
" Last Change: 2018/12/17 16:00:00.
" MEMO: "VeoVim" が起動しない時は "dein" のディレクトリを消す

" !!!: 必ず先頭に記述
" "autocmd"（マクロ） の初期化
augroup MyAutoCmd
    autocmd!
augroup END

if hostname() == "HBAMB748A"
    " "Windows7" の "NeoVim" はデリミタが "\\"
    execute "source" "C:\\Users\\MM12167\\.vimrc"
elseif hostname() == "HBAMB819"
    execute "source" "C:\\Users\\MM12167.DMJ\\.vimrc"

else
    " "Vim" 毎のrcファイルパス設定
    let g:rc_dir = expand("~/dotfiles")

    " rcファイル読込み関数
    function! s:source_rc(rc_file_name)
        let rc_file = expand(g:rc_dir . "/" . a:rc_file_name)
        if filereadable(rc_file)
            execute "source" rc_file
        endif
    endfunction

    " 基本設定
    call s:source_rc(".vimrc")
endif

