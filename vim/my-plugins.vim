" Vim Plugged plugins
call plug#begin()

" status bar at the bottom
Plug 'vim-airline/vim-airline'

" fuzzyfind setup
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" color schemes
Plug 'morhetz/gruvbox'
Plug 'sainnhe/everforest'

" vim markdown
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'
"""" If you don't have nodejs and yarn
"""" use pre build, add 'vim-plug' to the filetype list so vim-plug can update this plugin
"""" see: https://github.com/iamcco/markdown-preview.nvim/issues/50
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" Smarter vim comment using gc and gcc
Plug 'tpope/vim-commentary'

" pep8 compliant python indenting
Plug 'Vimjas/vim-python-pep8-indent'

" vim autocomplete for python
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

call plug#end()
