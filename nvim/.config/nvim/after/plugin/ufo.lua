local ufo = require('ufo')

local nnoremap = require('util.keymap').nnoremap

nnoremap('zR', ufo.openAllFolds)
nnoremap('zM', ufo.closeAllFolds)

ufo.setup({
    provider_selector = function(bufnr, filetype, buftype)
        return {'treesitter', 'indent'}
    end
})
