
" default plugins and vim config
source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/config.vim

" LSP config
source $HOME/.config/nvim/plug-config/lsp.lua " lsp server settings
source $HOME/.config/nvim/plug-config/lsp.vim " lsp mappings

if (has('termguicolors'))
  set termguicolors
endif

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

" Statusline
function! LspStatus() abort
  if luaeval('#vim.lsp.buf_get_clients() > 0')
    return luaeval("require('lsp-status').status()")
  endif

  return ''
endfunction

let g:onedark_hide_endofbuffer = 1
let g:onedark_terminal_italics = 1

colorscheme onedark

let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], ['readonly', 'filename', 'modified'],  ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent', 'ts' ],
      \              [ 'lspstatus', 'fileformat', 'fileencoding', 'filetype'] ]
      \ },
      \ 'component_function': {
      \   'lspstatus': 'LspStatus',
      \ },
      \ }

