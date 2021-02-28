scriptencoding utf-8
" Created:     2021/02/28 19:42:22
" Last Change: 2021/02/28 19:42:30.

" !!!: 必ず先頭に記述
" "autocmd" （マクロ）の初期化
augroup MyAutoCmd
    autocmd!
augroup END

" ---------------------------------------------------------------------------
" "Python" の "Path" 設定
" ---------------------------------------------------------------------------
" MEMO:
" "pythonthreedll" は "python.vim" に記述
" "Python3.6.*" でないと "Dark powed" できない 2021/02/21
if has("vim_starting")
    if has("mac")
        let g:python3_host_prog = "/usr/local/bin/python3"
        let g:python_host_prog  = "/usr/bin/python"

    elseif has("unix")
        let g:python3_host_prog = "/usr/bin/python3"
        let g:python_host_prog  = "/usr/bin/Python"

    elseif (has("win32") || has("win64"))
        if hostname() == "HBAMB1448"
            let g:python3_host_prog =
                \ $HOME."/AppData/Local/Programs/Python/Python36/python.exe"
        elseif hostname() == "HBAMB819"
            let g:python3_host_prog =
                \ "C:\\Python36\\python.exe"
                " \ "C:\\tools\\miniconda3\\envs\\vim_mcon_env_py36\\python.exe"
            let g:python_host_prog  =
                \ "C:\\tools\\miniconda3\\envs\\vim_mcon_env_py27\\python.exe"
            " elseif hostname() == "HBAMB748A"
            "     let g:python3_host_prog = "C:\\Python35\\python.exe"
            "     let g:python_host_prog  = "C:\\Python27\\python.exe"

        else
            let g:python3_host_prog =
                \ "C:\\tools\\miniconda3\\envs\\vim_mcon_env_py36\\python.exe"
            let g:python_host_prog  =
                \ "C:\\tools\\miniconda3\\envs\\vim_mcon_env_py27\\python.exe"
            " REF: "Path" が通っている "Python" を参照する場合は以下の記述
            "let g:python3_host_prog = "python"
            " REF: 設定自動化
            " " MEMO: "~/.vim_no_python" が存在した場合はスキップ " {{{
            " if !filereadable(expand('~/.vim_no_python'))
            "     " if has('nvim') && !filereadable(expand('~/.vim_no_python'))
            "     let s:python3 = system('which python3')
            "     if strlen(s:python3) != 0
            "         let s:python3_dir = $HOME . '/.py3env'
            "         if ! isdirectory(s:python3_dir)
            "             call system('python3 -m venv ' . s:python3_dir)
            "             call system('source ' . s:python3_dir . '/bin/activate && pip install neovim flake8 jedi')
            "         endif
            "         let g:python3_host_prog = s:python3_dir . '/bin/python'
            "         let $PATH = s:python3_dir . '/bin:' . $PATH
            "     endif
            " endif
            " }}}
        endif
    endif
endif
