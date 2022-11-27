local cmp_nvim_lsp = require('cmp_nvim_lsp')

local Remap = require("util.keymap")
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap
 
local function lsp_keymaps(bufnr)
    opts = { noremap = true, silent = true, buffer = bufnr }
    nnoremap("K", function()  vim.lsp.buf.hover() end, opts)
    nnoremap("gD", function()  vim.lsp.buf.declaration() end, opts)
    nnoremap("gd", function()  vim.lsp.buf.definition() end, opts)
    nnoremap("gi", function()  vim.lsp.buf.implementation() end, opts)
    nnoremap("gr", function()  vim.lsp.buf.references() end, opts)
    nnoremap("[d", function()  vim.lsp.buf.goto_next() end, opts)
    nnoremap("]d", function()  vim.lsp.buf.goto_prev() end, opts)
    nnoremap("<leader>f", function() vim.lsp.buf.format({async = true}) end, opts)
    nnoremap("<leader>rn", function()  vim.lsp.buf.rename() end, opts)
    nnoremap("<leader>lca", function()  vim.lsp.buf.code_action() end, opts)
    nnoremap("<leader>ld", function()  vim.diagnostic.open_float() end, opts)
    nnoremap("<leader>li", "<cmd>LspInfo<CR>")
    inoremap("<C-h>", function()  vim.lsp.buf.signature_help() end, opts)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
-- setup lsp for text too
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

local function on_attach(client, bufnr)
    lsp_keymaps(bufnr)
end

local function config(_config)
    return vim.tbl_deep_extend("force", {
        capabilities = vim.tbl_extend('keep', capabilities, {}),
        on_attach = on_attach,
        }, _config or {})
end

local lspconfig = require('lspconfig')
-- rust
lspconfig.rust_analyzer.setup(config())

--python
lspconfig.pyright.setup(config())
