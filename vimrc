" plugins
source ~/.vim/my-plugins.vim

" colorscheme
if has('termguicolors')
    set termguicolors
endif
" options: 'hard', 'medium'(default), 'soft'
let g:everforest_background = 'medium'
let g:everforest_better_performance = 1
" check for ++nested
if has('patch-8.1.1113')
    colorscheme everforest
else
    autocmd vimenter * nested colorscheme everforest
endif

" filetypes after colorscheme
filetype plugin indent on
syntax on


" leader
let mapleader = " "
let maplocalleader = " "

" display settings
set scrolloff=5
set number relativenumber
set textwidth=80
set colorcolumn=80
set ruler
set smartindent
set incsearch
set ignorecase smartcase

" enable mouse
set mouse=a

" auto tab settings
set autoindent expandtab tabstop=4 shiftwidth=4
set linebreak

" latex flavor default
let g:tex_flavor="tex"

" md setting
set conceallevel=0
let g:vim_markdown_conceal = 0
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
set foldlevelstart=99
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
nnoremap <leader><leader> :CallFZF<cr>
nnoremap <leader>ff :CallFZF<cr>
nnoremap <leader>fw :write<cr>
nnoremap <leader>qq :quit<cr>

" fast file opening
nnoremap <leader>oo :call fzf#run(fzf#wrap(
            \ {'sink': {f -> system('open ' . shellescape(f))}}
            \ ))<cr>

" faster window switching
nnoremap <leader>w <C-w>
nnoremap <leader>wq :wq<cr>
nnoremap <leader>wv <C-w>v<C-w>l

" better buffer switching
nnoremap <leader>bb :buffers<cr>:buffer<space>
nnoremap <leader>bl :bnext<cr>
nnoremap <leader>bh :bprevious<cr>
nnoremap <leader>bd :bdelete<cr>

" git shortcuts
" lazygit
nnoremap <leader>gl :!lazygit<cr>

" run/compile code
nnoremap <leader>rp :write<cr>:!python %<cr>

" delete into trash register
nnoremap x "_x

" add new lines
nnoremap <cr> o<esc>
nnoremap <S-cr> O<esc>

" Google Antigravity setup
" Enable auto-reloading if agy makes local changes
set autoread
autocmd FocusGained,BufEnter,CursorHold * if mode() != 'c' | checktime | endif
" split window and launch agy on <leader>ag
nnoremap <leader>ag :vsplit \| wincmd L \| vertical resize 45 \| terminal agy<CR>i
tnoremap <Esc> <C-\><C-n>

function! CallFZF()
    write
    FZF
endfunction
command! CallFZF call CallFZF()

" Create PDF using pandoc
function! MakePDF()
    write
    execute '!make pdf'
endfunction
command! MakePDF call MakePDF()
