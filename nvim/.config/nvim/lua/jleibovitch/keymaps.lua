
local Remap = require("util.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nmap = Remap.nmap

vim.g.mapleader = " "

-- the great escape
inoremap("kj", "<ESC>")

-- greatest remap ever
xnoremap("<leader>p", "\"_dP")
nnoremap("<leader>d", "\"_d")
vnoremap("<leader>d", "\"_d")
 
-- stay selected
vnoremap('>', '>gv')
vnoremap('<', '<gv')

-- 
nnoremap('<S-l>', '<cmd>bnext<CR>')
nnoremap('<S-h>', '<cmd>bprevious<CR>')
