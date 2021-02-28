"
" @brief Translate
"
" @author Atsushi Sakai
"
" @copyright (c): 2016 Atsushi Sakai
"
" @license : MIT

function! Translate(arg)
let l:arg=a:arg
" echo g:myvimrcpath
python << EOF
import vim
import sys

import os
from os.path import expanduser
homepath = expanduser("~")

# sys.path.append('pythonpath')
# sys.path.append("C:\Users\mm12167\dotfiles\.vim\\translate") # valid
sys.path.append(os.path.join("C:", expanduser("~"), "dotfiles", ".vim", "translate"))

# print(sys.path)
import Translate
var = vim.eval("l:arg")
output=Translate.translate(var)
print(output)
EOF
endfunction

" Command enable
command! -nargs=* Translate :call Translate(<f-args>)
