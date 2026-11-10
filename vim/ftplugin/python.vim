" vim lsp settings (Zuban server is registered in vimrc)
nnoremap <buffer> K :LspHover<cr>

" python abbreviations
iab main:: def main():<CR><CR><C-d>if __name__=="__main__":<CR>main()<esc>3k$a
iab impnp:: import numpy as np
iab impplt:: import matplotlib.pyplot as plt
