" Global plugins using vim-plug

" Plugins 
call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'
Plug 'ryanoasis/vim-devicons'
" Plug 'fatih/vim-go'
" Fzf requires a binary and vim package
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" " Intellisense
" Plug 'neovim/nvim-lspconfig'
" Plug 'hrsh7th/nvim-compe'

call plug#end()
