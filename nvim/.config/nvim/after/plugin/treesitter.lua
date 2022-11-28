local configs = require('nvim-treesitter.configs')
local context = require('treesitter-context')

configs.setup({
    -- one of "all" or a list of languages
    ensure_installed = "all",
    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,
    ignore_install = { "phpdoc" }, -- List of parsers to ignore installing
    highlight = {
        enable = true, -- false will disable the whole extension
    },
    autopairs = {
        enable = true,
    },
    indent = { 
        enable = true,
    },
})

-- init context
context.setup({
    enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
    throttle = true, -- Throttles plugin updates (may improve performance)
    max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
    show_all_context = show_all_context,
    patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
        -- For all filetypes
        -- Note that setting an entry here replaces all other patterns for this entry.
        -- By setting the 'default' entry below, you can control which nodes you want to
        -- appear in the context window.
        default = {
            'class',
            'function',
            'method',
            'for',
            'while',
            'if',
            'switch',
            'case',
            'interface',
            'struct',
            'enum',
        },

        rust = {
            "loop_expression",
            "impl_item",
        },
    },
})
