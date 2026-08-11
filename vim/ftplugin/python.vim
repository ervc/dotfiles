" vim lsp settings

au User lsp_setup call lsp#register_server({
    \ 'name': 'Zuban',
    \ 'cmd': ['zuban', 'server'],
    \ 'allowlist': ['python'],
    \ })

autocmd FileType python nnoremap <buffer>K :LspHover<cr>
