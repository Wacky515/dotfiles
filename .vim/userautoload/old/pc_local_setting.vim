scriptencoding utf-8

if hostname() == "CAD0021"
    " call s:MySetGUIFonts("13.5")
    " colorscheme desert
    " set guifont=Ricty_Diminished:h32
elseif hostname() == "iroha"
    " call s:MySetGUIFonts("16")
else
    " call s:MySetGUIFonts("12")
endif
