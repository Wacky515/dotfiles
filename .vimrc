scriptencoding utf-8
" Created:     2016/07/31 **:**:**
<<<<<<< HEAD
" Last Change: 2019/11/06 15:21:47.

" NOT_WORK:
" " "Macvim" Å "Python3" ðÄo·iPython2Æ¹psÂÌ½ßj " {{{
=======
" Last Change: 2019/11/24 21:00:40.

" NOT_WORK:
" " "Macvim" ã§ "Python3" ãå¼åºãï¼Python2ã¨ä½µç¨ä¸å¯ã®ããï¼ " {{{
>>>>>>> 4fa438d838e85600434ecbf43c65ee2e2fc639db
" if (has("mac") && has("kaoriya"))
"     if has("python3")
"     endif
" endif
" }}}

<<<<<<< HEAD
" MEMO: K¸æªÉLq
" "autocmd" i}NjÌú»
=======
" MEMO: å¿ãåé ­ã«è¨è¿°
" "autocmd" ï¼ãã¯ã­ï¼ã®åæå
>>>>>>> 4fa438d838e85600434ecbf43c65ee2e2fc639db
augroup MyAutoCmd
    autocmd!
augroup END

<<<<<<< HEAD
" "vimproc" ÇÝA"*.dll" ©®DL & XV
let g:vimproc#download_windows_dll = 1

" ---------------------------------------------------------------------------
" "Python" Ýè
" ---------------------------------------------------------------------------
if hostname()     == "saladserver.com"
    let g:python3_host_prog = "/usr/local/bin/python3"
elseif hostname() == "ProSalad133-2018.local"
=======
" "vimproc" èª­è¾¼ã¿æã"*.dll" èªåDL & æ´æ°
let g:vimproc#download_windows_dll = 1

" ---------------------------------------------------------------------------
" "Python" è¨­å®
" ---------------------------------------------------------------------------
if hostname()     == "saladserver.com"
    let g:python3_host_prog = "/usr/local/bin/python3"
elseif hostname() == "ProSalad13-2018.local"
>>>>>>> 4fa438d838e85600434ecbf43c65ee2e2fc639db
    let g:python3_host_prog = "/usr/local/bin/Python3"
elseif hostname() == "SaladBook.local"
    let g:python3_host_prog = "/usr/local/bin/python3"
elseif hostname() == "HBAMB748"
    let g:python_host_prog  = "C:\\Python27\\python.exe"
    let g:python3_host_prog = "C:\\Python36\\python.exe"
<<<<<<< HEAD
    " MEMO: « "Denite" ÅG[
    " let g:python3_host_prog = "C:\\tools\\miniconda3\\python.exe"
    if !has("nvim")
        " "HBAMB748" "Vim" Å "Unkwown option" G[
=======
    " MEMO: â "Denite" ã§ã¨ã©ã¼
    " let g:python3_host_prog = "C:\\tools\\miniconda3\\python.exe"
    if !has("nvim")
        " "HBAMB748" "Vim" ã§ "Unkwown option" ã¨ã©ã¼
>>>>>>> 4fa438d838e85600434ecbf43c65ee2e2fc639db
        if has("gui_running")
            set pythonthreedll=C:\Python36\python36.dll
        else
            let g:python3_host_prog = "C:\\tools\\miniconda3\\python.exe"
        endif
    endif
elseif hostname() == "HBAMB819"
    let g:python_host_prog  = "C:\\Python27\\python.exe"
    let g:python3_host_prog = "C:\\Users\\mm12167\\AppData\\Local\\Programs\\Python\\Python36\\python.exe"
    if !has("nvim")
        if has("gui_running")
            set pythonthreedll=C:\Users\mm12167\AppData\Local\Programs\Python\Python36\python36.dll
        else
            let g:python3_host_prog = "C:\\tools\\Anaconda3\\python.exe"
        endif
    endif
elseif hostname() == "HBAMB748A"
    let g:python_host_prog  = "C:\\Python27\\python.exe"
    let g:python3_host_prog = "C:\\Python35\\python.exe"
elseif hostname() == "SALADCARBONX1"
    let g:python3_host_prog =
    \ "C:\\Users\\SkyDog\\AppData\\Local\\Programs\\Python\\Python37\\python.exe"
elseif hostname() == "ProSalad133.local"
    let g:python3_host_prog = "/usr/local/bin/Python3"
else
    if has("unix")
        " let g:python3_host_prog = "/usr/local/bin/Python3"
        let g:python3_host_prog = "/usr/bin/python3"
    elseif (has("win32") || has("win64"))
        let g:python3_host_prog = "C:\\Python35\\python.exe"
    endif
endif

" ---------------------------------------------------------------------------
<<<<<<< HEAD
" dein.vimÌÝè
=======
" dein.vimã®è¨­å®
>>>>>>> 4fa438d838e85600434ecbf43c65ee2e2fc639db
" ---------------------------------------------------------------------------
if !&compatible
    set nocompatible
endif

<<<<<<< HEAD
" "Vim" N®®¹ÉCXg[
=======
" "Vim" èµ·åå®äºæã«ã¤ã³ã¹ãã¼ã«
>>>>>>> 4fa438d838e85600434ecbf43c65ee2e2fc639db
augroup PluginInstall
    autocmd!
    autocmd VimEnter * if dein#check_install() | call dein#install() | endif
augroup END

<<<<<<< HEAD
" vOCðCXg[·éfBNgðwè
=======
" ãã©ã°ã¤ã³ãã¤ã³ã¹ãã¼ã«ãããã£ã¬ã¯ããªãæå®
>>>>>>> 4fa438d838e85600434ecbf43c65ee2e2fc639db
if !has("nvim")
    if !has("gui_running")
        let s:plugin_dir = expand("~/.cache/dein/")
    else
        let s:plugin_dir = expand("~/.config/gvim/dein/")
    endif
elseif exists("g:nyaovim_version")
    let s:plugin_dir     = expand("~/.config/nyaovim/dein")
elseif exists("g:gui_oni")
    let s:plugin_dir     = expand("~/.config/oni/dein")
elseif has("nvim")
    let s:plugin_dir     = expand("~/.config/nvim/dein/")
endif

<<<<<<< HEAD
" TODO: UnixnÌpXÝèÇÁ
" "dein.vim" ðCXg[·éfBNgð^CpXÖÇÁ
=======
" TODO: Unixç³»ã®ãã¹è¨­å®è¿½å 
" "dein.vim" ãã¤ã³ã¹ãã¼ã«ãããã£ã¬ã¯ããªãã©ã³ã¿ã¤ã ãã¹ã¸è¿½å 
>>>>>>> 4fa438d838e85600434ecbf43c65ee2e2fc639db
let s:dein_dir = s:plugin_dir . "repos/github.com/Shougo/dein.vim"

execute "set runtimepath+=" . s:dein_dir

<<<<<<< HEAD
" OoÍ
let g:dein#install_log_filename = s:dein_dir . "/dein.log"

" "dein.vim" ªÈ¯êÎ "git clone"
=======
" ã­ã°åºå
let g:dein#install_log_filename = s:dein_dir . "/dein.log"

" "dein.vim" ããªããã° "git clone"
>>>>>>> 4fa438d838e85600434ecbf43c65ee2e2fc639db
if !isdirectory(s:dein_dir)
    call mkdir(s:dein_dir, "p")
    silent execute printf("!git clone %s %s", "https://github.com/Shougo/dein.vim", s:dein_dir)
endif
" REF: < http://yuheikagaya.hatenablog.jp/entry/2016/03/20/171907 >

<<<<<<< HEAD
" ÝèJn
if dein#load_state(s:plugin_dir)
    call dein#begin(s:plugin_dir)

    " vOCXg "*.toml" ðwè
=======
" è¨­å®éå§
if dein#load_state(s:plugin_dir)
    call dein#begin(s:plugin_dir)

    " ãã©ã°ã¤ã³ãªã¹ã "*.toml" ãæå®
>>>>>>> 4fa438d838e85600434ecbf43c65ee2e2fc639db
    if !has("nvim")
        let g:plugin_dir   = expand("~/.vim/vim_plugins")
        let s:toml         = g:plugin_dir . "/dein.toml"
        let s:lazy_toml    = g:plugin_dir . "/dein_lazy.toml"
        let s:python_toml  = g:plugin_dir . "/dein_python.toml"
    endif

    let g:plugin_dir_nvim  = expand("~/.vim/vim_plugins_nvim")
    let s:toml_nvim        = g:plugin_dir_nvim . "/dein_nvim.toml"
    let s:lazy_toml_nvim   = g:plugin_dir_nvim . "/dein_lazy_nvim.toml"
    let s:python_toml_nvim = g:plugin_dir_nvim . "/dein_python_nvim.toml"

<<<<<<< HEAD
    "*.toml" ðÇÝALbV
=======
    "*.toml" ãèª­è¾¼ã¿ãã­ã£ãã·ã¥
>>>>>>> 4fa438d838e85600434ecbf43c65ee2e2fc639db
    if !has("nvim")
        call dein#load_toml(s:toml,             {"lazy": 0})
        call dein#load_toml(s:lazy_toml,        {"lazy": 1})
    endif

    call dein#load_toml(s:toml_nvim,            {"lazy": 0})
    call dein#load_toml(s:lazy_toml_nvim,       {"lazy": 1})

    if has ("python3")
        call dein#load_toml(s:python_toml_nvim, {"lazy": 1})
    endif

    if !has("nvim")
        call dein#add("roxma/nvim-yarp")
        call dein#add("roxma/vim-hug-neovim-rpc")
    endif

    if exists("g:nyaovim_version")
        call dein#add("rhysd/nyaovim-markdown-preview")
        call dein#add("rhysd/nyaovim-popup-tooltip")
        call dein#add("rhysd/nyaovim-mini-browser")
    endif

<<<<<<< HEAD
    " ÝèI¹
=======
    " è¨­å®çµäº
>>>>>>> 4fa438d838e85600434ecbf43c65ee2e2fc639db
    call dein#end()
    call dein#save_state()
endif

<<<<<<< HEAD
" ¢CXg[ÌvOCª êÎCXg[
=======
" æªã¤ã³ã¹ãã¼ã«ã®ãã©ã°ã¤ã³ãããã°ã¤ã³ã¹ãã¼ã«
>>>>>>> 4fa438d838e85600434ecbf43c65ee2e2fc639db
if has("vim_starting") && dein#check_install()
    call dein#install()
endif

" MEMO:
<<<<<<< HEAD
" vOCÌÇÁEíâtomlt@CÌÝèðÏXµ½ãÍ
" KX "du: call dein#check_update()" â "dc: call dein#clear_state()" ðÀs·é
" --------------------------------------------------------------------------------

" ---------------------------------------------------------------------------
" Init
" ---------------------------------------------------------------------------

" MEMO: LqÔ ÏXµÈ¢III
" <Space> ð "Leader" ÉÄ
let mapleader = "\<Space>"

" "Windows" Â«ÌÝèt@CÌêðA"Linux/Mac" Â«É í¹é
set runtimepath+=$HOME/.vim
" "Vim" ÌÝèt@C
runtime! userautoload/*.vim
" vOCÌÝèt@C
=======
" ãã©ã°ã¤ã³ã®è¿½å ã»åé¤ãtomlãã¡ã¤ã«ã®è¨­å®ãå¤æ´ããå¾ã¯
" é©å® "du: call dein#check_update()" ã "dc: call dein#clear_state()" ãå®è¡ãã
" --------------------------------------------------------------------------------

" ---------------------------------------------------------------------------
" Initå¦ç
" ---------------------------------------------------------------------------

" MEMO: è¨è¿°é çª å¤æ´ããªãï¼ï¼ï¼
" <Space> ã "Leader" ã«å²å½ã¦
let mapleader = "\<Space>"

" "Windows" ç°å¢ã®è¨­å®ãã¡ã¤ã«ã®å ´æãã"Linux/Mac" ç°å¢ã«ãããã
set runtimepath+=$HOME/.vim
" "Vim" ã®è¨­å®ãã¡ã¤ã«
runtime! userautoload/*.vim
" ãã©ã°ã¤ã³ã®è¨­å®ãã¡ã¤ã«
>>>>>>> 4fa438d838e85600434ecbf43c65ee2e2fc639db
if !has("nvim")
    runtime! userautoload/plugin_settings/*.vim
    runtime! userautoload/plugin_settings_nvim/*.vim
else
    runtime! userautoload/plugin_settings_nvim/*.vim
endif

<<<<<<< HEAD
" ÇÝñ¾vOCàÜßAt@C^CvÌo
" t@C^CvÊvOC/CfgðLø»·é
=======
" èª­ã¿è¾¼ãã ãã©ã°ã¤ã³ãå«ãããã¡ã¤ã«ã¿ã¤ãã®æ¤åº
" ãã¡ã¤ã«ã¿ã¤ãå¥ãã©ã°ã¤ã³/ã¤ã³ãã³ããæå¹åãã
>>>>>>> 4fa438d838e85600434ecbf43c65ee2e2fc639db
filetype plugin indent on
