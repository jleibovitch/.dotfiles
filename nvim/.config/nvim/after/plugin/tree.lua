--[[ 
sources: 
- https://github.com/nvim-tree/nvim-tree.lua
- https://github.com/ahmedkhalf/project.nvim
-- ]]

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local nnoremap = require('util.keymap').nnoremap
local tree = require("nvim-tree")
local project = require('project_nvim')

-- setup nvim tree
tree.setup({
    renderer = {
        highlight_git = true,
        icons = {
            glyphs = {
                git = {
                    unstaged = "✗",
                    staged = "✓",
                    unmerged = "",
                    renamed = "➜",
                    untracked = "★",
                    deleted = "",
                    ignored = "◌",
                },
            },
        },
    },
})

--
-- -- setup nvim project
-- project.setup({
--     -- Manual mode doesn't automatically change your root directory, so you have
--     -- the option to manually do so using `:ProjectRoot` command.
--     manual_mode = false,
--
--     -- Methods of detecting the root directory. **"lsp"** uses the native neovim
--     -- lsp, while **"pattern"** uses vim-rooter like glob pattern matching. Here
--     -- order matters: if one is not detected, the other is used as fallback. You
--     -- can also delete or rearangne the detection methods.
--     detection_methods = { "lsp", "pattern" },
--
--     -- All the patterns used to detect root dir, when **"pattern"** is in
--     -- detection_methods
--     patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
--
--     -- Table of lsp clients to ignore by name
--     -- eg: { "efm", ... }
--     ignore_lsp = {},
--
--     -- Don't calculate root dir on specific directories
--     -- Ex: { "~/.cargo/*", ... }
--     exclude_dirs = {},
--
--     -- Show hidden files in telescope
--     show_hidden = false,
--
--     -- When set to false, you will get a message when project.nvim changes your
--     -- directory.
--     silent_chdir = true,
--
--     -- What scope to change the directory, valid options are
--     -- * global (default)
--     -- * tab
--     -- * win
--     scope_chdir = 'global',
--
--     -- Path where project.nvim will store the project history for use in
--     -- telescope
--     datapath = vim.fn.stdpath("data"),
-- })

nnoremap('<leader>e', '<cmd>NvimTreeToggle<CR>')
