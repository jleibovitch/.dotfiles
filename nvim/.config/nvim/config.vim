" All of the vim config goes here

inoremap kj <Esc>
let mapleader = " "

vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
"Set tabs
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

syntax on
set encoding=utf-8
set backspace=indent,eol,start
set nu
set relativenumber
set noshowmode
set nowrap
set nobackup
set nowritebackup
set hidden

" make room for the signs :)
set signcolumn=yes

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

"Mappings
nnoremap <silent> <C-p> :FZF<CR>
nnoremap <silent> <C-b> :NERDTreeToggle<CR>
nnoremap <silent> <leader> :NERDTreeFind<CR>

