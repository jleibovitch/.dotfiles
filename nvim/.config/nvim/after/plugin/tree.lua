-- source: https://github.com/nvim-tree/nvim-tree.lua
--
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup()


local nnoremap = require('util.keymap').nnoremap

nnoremap('<leader>e', '<cmd>NvimTreeToggle<CR>')
