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
if has('termguicolors')
    set termguicolors
endif
" set background=dark
" options: 'hard', 'medium'(default), 'soft'
let g:everforest_background = 'medium'
let g:everforest_better_performance = 1
" check for ++nested
if has('patch-8.1.1113')
    autocmd vimenter * ++nested colorscheme everforest
else
    autocmd vimenter * nested colorscheme everforest
endif


" latex flavor default
let g:tex_flavor="tex"

" latex spell checking
autocmd FileType tex set spell spelllang=en
autocmd FileType tex syntax spell toplevel
" quick search sections and headings
" regex explanation:
" \v for very magic regex
" ^ start of line, \\ literal '\'
" ( chapter \| (sub)*section \) match 'chapter' or '(sub(sub))section'
" \{ for literal '{'
" .* to allow searching in middle of section title
autocmd FileType tex nnoremap <leader>ss /\v^\\(chapter\|(sub)*section)\{.*

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

" fast line movement
nnoremap H ^
vnoremap H ^
onoremap H ^
nnoremap L $
vnoremap L $
onoremap L $

" fast edit of vimrc
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" fast file editing
nnoremap <leader><leader> :FZF<cr>
nnoremap <leader>ff :FZF<cr>
nnoremap <leader>fw :write<cr>
nnoremap <leader>qq :quit<cr>

" fast file opening
nnoremap <leader>oo :call fzf#run(fzf#wrap(
            \ {'sink': {f -> system('open ' . shellescape(f))}}
            \ ))<cr>

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

" comments and uncomments
autocmd FileType python inoremap """ """<cr><cr>"""<esc>ki
" C specific events
autocmd FileType C inoremap /* /*<cr><cr>*/<esc>ki

" add new lines
nnoremap <cr> o<esc>
nnoremap <S-cr> O<esc>
