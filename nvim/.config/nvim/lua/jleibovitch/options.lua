
local options = {
    completeopt = {"menu", "menuone", "noselect"}, -- enable complete for cmp
    backup = false,
    encoding = "utf-8",
    nu = true,
    relativenumber = true,
    errorbells = false,
    updatetime = 50,                              -- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience.
    writebackup = false,
    wrap = false,
    expandtab = true,
    shiftwidth = 4,
    tabstop = 4,
    softtabstop = 4,
    signcolumn="yes",                           -- make space for signs
    scrolloff = 8,                              -- minimal number of screen lines to keep above and below the cursor
    sidescrolloff = 8,                          -- minimal number of screen columns either side of cursor if wrap is `false`
    cmdheight = 2,                              -- more space in the neovim command line for displaying messages
    clipboard = "unnamedplus",                  -- copy to system clipboard
    ignorecase = true,                          -- ignore case in search
    smartcase = true,                           -- uppercase in search searches for uppercases
    smartindent = true,
    mouse = "a",
    splitbelow = true,
    splitright = true,
    cursorline = true,                          -- highlight the current line
    hlsearch = false,
    incsearch = true,
    termguicolors = true,
    showmode = false,                           -- we don't need to see things like -- INSERT -- anymore
    inccommand = "split"
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- Don't pass messages to |ins-completion-menu|.
vim.opt.shortmess:append("c")
