scriptencoding utf-8
" Created:     201*/**/** **:**:**
" Last Change: 2021/02/24 12:51:50.
"
" FIXME: Mac で ginit.vim 読込むとエラー
if (has("unix") && has("mac"))
    if hostname()     == "SaladBookAirM1"
        Guifont! Cica:h18
    elseif hostname() == "saladserver.com"
        Guifont! Cica:h16
    elseif hostname() == "SaladBook.local"
        Guifont! Cica:h18
    else
        Guifont! Cica:h18
    endif

elseif (has("unix") && !has("mac"))
    Guifont! Cica\ 16

elseif (has("win32") || has("win64"))
    " Home setting
    if hostname()     == "SALADPRIMEMK-II"
        Guifont! Cica:h12
    elseif hostname() == "SALADCARBONX1"
        Guifont! Cica:h13

    " muRata setting
    elseif hostname() == "HBAMB1448"
        Guifont! Cica:h14
    elseif hostname() == "HBAMB748"
        Guifont! Cica:h14
    elseif hostname() == "HBAMB819"
        Guifont! Cica:h12
    elseif hostname() == "HBAPC511"
        Guifont! Cica:h16
    elseif hostname() == "HBALT071"
        Guifont! Cica:h16
    endif
    " colorscheme iceberg
endif
