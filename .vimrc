scriptencoding utf-8
" Created:     2016/07/31 **:**:**
<<<<<<< HEAD
" Last Change: 2019/11/06 15:21:47.

" NOT_WORK:
" " "Macvim" Ç≈ "Python3" ÇåƒèoÇ∑ÅiPython2Ç∆ïπópïsâ¬ÇÃÇΩÇﬂÅj " {{{
=======
" Last Change: 2019/11/24 21:00:40.

" NOT_WORK:
" " "Macvim" „Åß "Python3" „ÇíÂëºÂá∫„ÅôÔºàPython2„Å®‰ΩµÁî®‰∏çÂèØ„ÅÆ„Åü„ÇÅÔºâ " {{{
>>>>>>> 4fa438d838e85600434ecbf43c65ee2e2fc639db
" if (has("mac") && has("kaoriya"))
"     if has("python3")
"     endif
" endif
" }}}

<<<<<<< HEAD
" MEMO: ïKÇ∏êÊì™Ç…ãLèq
" "autocmd" ÅiÉ}ÉNÉçÅjÇÃèâä˙âª
=======
" MEMO: ÂøÖ„ÅöÂÖàÈ†≠„Å´Ë®òËø∞
" "autocmd" Ôºà„Éû„ÇØ„É≠Ôºâ„ÅÆÂàùÊúüÂåñ
>>>>>>> 4fa438d838e85600434ecbf43c65ee2e2fc639db
augroup MyAutoCmd
    autocmd!
augroup END

<<<<<<< HEAD
" "vimproc" ì«çûÇ›éûÅA"*.dll" é©ìÆDL & çXêV
let g:vimproc#download_windows_dll = 1

" ---------------------------------------------------------------------------
" "Python" ê›íË
" ---------------------------------------------------------------------------
if hostname()     == "saladserver.com"
    let g:python3_host_prog = "/usr/local/bin/python3"
elseif hostname() == "ProSalad133-2018.local"
=======
" "vimproc" Ë™≠Ëæº„ÅøÊôÇ„ÄÅ"*.dll" Ëá™ÂãïDL & Êõ¥Êñ∞
let g:vimproc#download_windows_dll = 1

" ---------------------------------------------------------------------------
" "Python" Ë®≠ÂÆö
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
    " MEMO: Å´ "Denite" Ç≈ÉGÉâÅ[
    " let g:python3_host_prog = "C:\\tools\\miniconda3\\python.exe"
    if !has("nvim")
        " "HBAMB748" "Vim" Ç≈ "Unkwown option" ÉGÉâÅ[
=======
    " MEMO: ‚Üì "Denite" „Åß„Ç®„É©„Éº
    " let g:python3_host_prog = "C:\\tools\\miniconda3\\python.exe"
    if !has("nvim")
        " "HBAMB748" "Vim" „Åß "Unkwown option" „Ç®„É©„Éº
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
" dein.vimÇÃê›íË
=======
" dein.vim„ÅÆË®≠ÂÆö
>>>>>>> 4fa438d838e85600434ecbf43c65ee2e2fc639db
" ---------------------------------------------------------------------------
if !&compatible
    set nocompatible
endif

<<<<<<< HEAD
" "Vim" ãNìÆäÆóπéûÇ…ÉCÉìÉXÉgÅ[Éã
=======
" "Vim" Ëµ∑ÂãïÂÆå‰∫ÜÊôÇ„Å´„Ç§„É≥„Çπ„Éà„Éº„É´
>>>>>>> 4fa438d838e85600434ecbf43c65ee2e2fc639db
augroup PluginInstall
    autocmd!
    autocmd VimEnter * if dein#check_install() | call dein#install() | endif
augroup END

<<<<<<< HEAD
" ÉvÉâÉOÉCÉìÇÉCÉìÉXÉgÅ[ÉãÇ∑ÇÈÉfÉBÉåÉNÉgÉäÇéwíË
=======
" „Éó„É©„Ç∞„Ç§„É≥„Çí„Ç§„É≥„Çπ„Éà„Éº„É´„Åô„Çã„Éá„Ç£„É¨„ÇØ„Éà„É™„ÇíÊåáÂÆö
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
" TODO: UnixånÇÃÉpÉXê›íËí«â¡
" "dein.vim" ÇÉCÉìÉXÉgÅ[ÉãÇ∑ÇÈÉfÉBÉåÉNÉgÉäÇÉâÉìÉ^ÉCÉÄÉpÉXÇ÷í«â¡
=======
" TODO: UnixÁ≥ª„ÅÆ„Éë„ÇπË®≠ÂÆöËøΩÂä†
" "dein.vim" „Çí„Ç§„É≥„Çπ„Éà„Éº„É´„Åô„Çã„Éá„Ç£„É¨„ÇØ„Éà„É™„Çí„É©„É≥„Çø„Ç§„É†„Éë„Çπ„Å∏ËøΩÂä†
>>>>>>> 4fa438d838e85600434ecbf43c65ee2e2fc639db
let s:dein_dir = s:plugin_dir . "repos/github.com/Shougo/dein.vim"

execute "set runtimepath+=" . s:dein_dir

<<<<<<< HEAD
" ÉçÉOèoóÕ
let g:dein#install_log_filename = s:dein_dir . "/dein.log"

" "dein.vim" Ç™Ç»ÇØÇÍÇŒ "git clone"
=======
" „É≠„Ç∞Âá∫Âäõ
let g:dein#install_log_filename = s:dein_dir . "/dein.log"

" "dein.vim" „Åå„Å™„Åë„Çå„Å∞ "git clone"
>>>>>>> 4fa438d838e85600434ecbf43c65ee2e2fc639db
if !isdirectory(s:dein_dir)
    call mkdir(s:dein_dir, "p")
    silent execute printf("!git clone %s %s", "https://github.com/Shougo/dein.vim", s:dein_dir)
endif
" REF: < http://yuheikagaya.hatenablog.jp/entry/2016/03/20/171907 >

<<<<<<< HEAD
" ê›íËäJén
if dein#load_state(s:plugin_dir)
    call dein#begin(s:plugin_dir)

    " ÉvÉâÉOÉCÉìÉäÉXÉg "*.toml" ÇéwíË
=======
" Ë®≠ÂÆöÈñãÂßã
if dein#load_state(s:plugin_dir)
    call dein#begin(s:plugin_dir)

    " „Éó„É©„Ç∞„Ç§„É≥„É™„Çπ„Éà "*.toml" „ÇíÊåáÂÆö
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
    "*.toml" Çì«çûÇ›ÅAÉLÉÉÉbÉVÉÖ
=======
    "*.toml" „ÇíË™≠Ëæº„Åø„ÄÅ„Ç≠„É£„ÉÉ„Ç∑„É•
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
    " ê›íËèIóπ
=======
    " Ë®≠ÂÆöÁµÇ‰∫Ü
>>>>>>> 4fa438d838e85600434ecbf43c65ee2e2fc639db
    call dein#end()
    call dein#save_state()
endif

<<<<<<< HEAD
" ñ¢ÉCÉìÉXÉgÅ[ÉãÇÃÉvÉâÉOÉCÉìÇ™Ç†ÇÍÇŒÉCÉìÉXÉgÅ[Éã
=======
" Êú™„Ç§„É≥„Çπ„Éà„Éº„É´„ÅÆ„Éó„É©„Ç∞„Ç§„É≥„Åå„ÅÇ„Çå„Å∞„Ç§„É≥„Çπ„Éà„Éº„É´
>>>>>>> 4fa438d838e85600434ecbf43c65ee2e2fc639db
if has("vim_starting") && dein#check_install()
    call dein#install()
endif

" MEMO:
<<<<<<< HEAD
" ÉvÉâÉOÉCÉìÇÃí«â¡ÅEçÌèúÇ‚tomlÉtÉ@ÉCÉãÇÃê›íËÇïœçXÇµÇΩå„ÇÕ
" ìKãX "du: call dein#check_update()" Ç‚ "dc: call dein#clear_state()" Çé¿çsÇ∑ÇÈ
" --------------------------------------------------------------------------------

" ---------------------------------------------------------------------------
" Initèàóù
" ---------------------------------------------------------------------------

" MEMO: ãLèqèáî‘ ïœçXÇµÇ»Ç¢ÅIÅIÅI
" <Space> Ç "Leader" Ç…äÑìñÇƒ
let mapleader = "\<Space>"

" "Windows" ä¬ã´ÇÃê›íËÉtÉ@ÉCÉãÇÃèÍèäÇÅA"Linux/Mac" ä¬ã´Ç…Ç†ÇÌÇπÇÈ
set runtimepath+=$HOME/.vim
" "Vim" ÇÃê›íËÉtÉ@ÉCÉã
runtime! userautoload/*.vim
" ÉvÉâÉOÉCÉìÇÃê›íËÉtÉ@ÉCÉã
=======
" „Éó„É©„Ç∞„Ç§„É≥„ÅÆËøΩÂä†„ÉªÂâäÈô§„ÇÑtoml„Éï„Ç°„Ç§„É´„ÅÆË®≠ÂÆö„ÇíÂ§âÊõ¥„Åó„ÅüÂæå„ÅØ
" ÈÅ©ÂÆú "du: call dein#check_update()" „ÇÑ "dc: call dein#clear_state()" „ÇíÂÆüË°å„Åô„Çã
" --------------------------------------------------------------------------------

" ---------------------------------------------------------------------------
" InitÂá¶ÁêÜ
" ---------------------------------------------------------------------------

" MEMO: Ë®òËø∞È†ÜÁï™ Â§âÊõ¥„Åó„Å™„ÅÑÔºÅÔºÅÔºÅ
" <Space> „Çí "Leader" „Å´Ââ≤ÂΩì„Å¶
let mapleader = "\<Space>"

" "Windows" Áí∞Â¢É„ÅÆË®≠ÂÆö„Éï„Ç°„Ç§„É´„ÅÆÂ†¥ÊâÄ„Çí„ÄÅ"Linux/Mac" Áí∞Â¢É„Å´„ÅÇ„Çè„Åõ„Çã
set runtimepath+=$HOME/.vim
" "Vim" „ÅÆË®≠ÂÆö„Éï„Ç°„Ç§„É´
runtime! userautoload/*.vim
" „Éó„É©„Ç∞„Ç§„É≥„ÅÆË®≠ÂÆö„Éï„Ç°„Ç§„É´
>>>>>>> 4fa438d838e85600434ecbf43c65ee2e2fc639db
if !has("nvim")
    runtime! userautoload/plugin_settings/*.vim
    runtime! userautoload/plugin_settings_nvim/*.vim
else
    runtime! userautoload/plugin_settings_nvim/*.vim
endif

<<<<<<< HEAD
" ì«Ç›çûÇÒÇæÉvÉâÉOÉCÉìÇ‡ä‹ÇﬂÅAÉtÉ@ÉCÉãÉ^ÉCÉvÇÃåüèo
" ÉtÉ@ÉCÉãÉ^ÉCÉvï ÉvÉâÉOÉCÉì/ÉCÉìÉfÉìÉgÇóLå¯âªÇ∑ÇÈ
=======
" Ë™≠„ÅøËæº„Çì„Å†„Éó„É©„Ç∞„Ç§„É≥„ÇÇÂê´„ÇÅ„ÄÅ„Éï„Ç°„Ç§„É´„Çø„Ç§„Éó„ÅÆÊ§úÂá∫
" „Éï„Ç°„Ç§„É´„Çø„Ç§„ÉóÂà•„Éó„É©„Ç∞„Ç§„É≥/„Ç§„É≥„Éá„É≥„Éà„ÇíÊúâÂäπÂåñ„Åô„Çã
>>>>>>> 4fa438d838e85600434ecbf43c65ee2e2fc639db
filetype plugin indent on
