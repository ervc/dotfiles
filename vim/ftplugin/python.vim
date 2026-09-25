" vim lsp settings

au User lsp_setup call lsp#register_server({
    \ 'name': 'Zuban',
    \ 'cmd': ['zuban', 'server'],
    \ 'allowlist': ['python'],
    \ })

autocmd FileType python nnoremap <buffer>K :LspHover<cr>

" python abbreviations
iab main:: def main():<CR>...<CR><CR><C-d>if __name__=="__main__":<CR>main()<esc>3k$ciw
iab impnp:: import numpy as np
iab impplt:: import matplotlib.pyplot as plt
