" leader
let mapleader = " "
let maplocalleader = " "

" display settings
set scrolloff=5
set number relativenumber
syntax on
set textwidth=80
set ruler
autocmd FileType tex set textwidth=80
set smartindent
set incsearch
set ignorecase smartcase

" auto tab settings
set autoindent expandtab tabstop=4 shiftwidth=4
set linebreak

" plugins
source ~/.vim/my-plugins

" colorscheme
set termguicolors
set background=dark
autocmd vimenter * ++nested colorscheme gruvbox
" let g:gruvbox_italic=1
" let g:gruvbox_contrast_dark="hard"
" let g:airline_theme = 'catppuccin_mocha'

" latex flavor default
let g:tex_flavor="tex"

" latex spell checking
autocmd FileType tex set spell spelllang=en
autocmd FileType tex syntax spell toplevel

" md spell checking
autocmd FileType markdown set spell spelllang=en
autocmd FileType markdown syntax spell toplevel

" md setting
set conceallevel=0
let g:vim_markdown_conceal = 0
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
" disable markdown autoindents hack
hi SpellBad ctermfg=red gui=underline cterm=underline

" fast excape
inoremap kj <esc>
vnoremap kj <esc>

" fast edit of vimrc
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" fast file editing
nnoremap <leader><leader> :FZF<cr>
nnoremap <leader>ff :FZF<cr>
nnoremap <leader>fw :write<cr>
nnoremap <leader>qq :quit<cr>

" faster window switching
nnoremap <leader>w <C-w>
nnoremap <leader>wv <C-w>v<C-w>l :FZF<cr>

" better buffer switching
nnoremap <leader>bb :buffers<cr>:buffer<space>
nnoremap <leader>bl :bnext<cr>
nnoremap <leader>bh :bprevious<cr>
nnoremap <leader>bd :bdelete<cr>

" git shortcuts

" lazygit
nnoremap <leader>gl :!lazygit<cr>

" delete into trash register
nnoremap x "_x
" python specific events
" comments and uncomments
autocmd FileType python inoremap """ """<cr><cr>"""<esc>ki

" C specific events
autocmd FileType C inoremap /* /*<cr><cr>*/<esc>ki

" add new lines
nnoremap <cr> o<esc>
nnoremap <S-cr> O<esc>
