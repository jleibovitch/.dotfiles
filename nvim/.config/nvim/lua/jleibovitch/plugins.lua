local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- disabled for now, autosave does not play well
-- Autocommand that reloads neovim whenever you save the plugins.lua file
-- vim.cmd([[
--  augroup packer_user_config
--    autocmd!
--    autocmd BufLeave plugins.lua source <afile> | PackerSync
--  augroup end
-- ]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return packer.startup(function(use)
    -- let packer manage itself
    use('wbthomason/packer.nvim')

    -- theme related (look and feel)
    use('jleibovitch/onedark.nvim') -- TODO: revert to non-forked when bug is fixed
    use('nvim-tree/nvim-web-devicons')
    use('nvim-lualine/lualine.nvim')
    use({'akinsho/bufferline.nvim', tag = 'v3.*' })
    use('lewis6991/gitsigns.nvim')
    use({'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}) -- better folding
    use('NvChad/nvim-colorizer.lua')
    use('lukas-reineke/indent-blankline.nvim') -- indent indicators
    use('goolord/alpha-nvim') -- greeter

    -- tree and file search
    use('nvim-tree/nvim-tree.lua')
    use('nvim-lua/plenary.nvim')
    use({'nvim-telescope/telescope.nvim', branch = '0.1.x' })
    use('ahmedkhalf/project.nvim')

    -- Intellisense / completion
    use('neovim/nvim-lspconfig')
    use('hrsh7th/cmp-nvim-lsp')
    use('hrsh7th/cmp-buffer')
    use('hrsh7th/cmp-path')
    use('hrsh7th/cmp-cmdline')
    use('hrsh7th/nvim-cmp')
    use('hrsh7th/cmp-nvim-lua')
    use('nvim-lua/lsp_extensions.nvim')

    -- treesitter
    use({'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    })
    use('nvim-treesitter/nvim-treesitter-context')

    -- snips + cmp support
    use('L3MON4D3/LuaSnip')
    use('saadparwaiz1/cmp_luasnip')

    -- auto plugins
    use('jiangmiao/auto-pairs')
    use('pocco81/auto-save.nvim')
    
    -- tpope
    use('numToStr/Comment.nvim')   
    -- use('tpope/vim-commentary')
    use('tpope/vim-fugitive')
    use('tpope/vim-surround')

    -- performance
    use('lewis6991/impatient.nvim')

    -- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require('packer').sync()
	end
end)
