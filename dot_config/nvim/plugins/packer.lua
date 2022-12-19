local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	-- theme --
	use {
		'rebelot/kanagawa.nvim',
		config = "vim.cmd([[exec 'source' . g:PLUGIN_CONFIG_DIR . '/kanagawa.lua']])"
	}

	-- lsp --
	use {
		'williamboman/mason.nvim',
		config = "vim.cmd[[exec 'source' . g:PLUGIN_CONFIG_DIR . '/lspins.lua']]",
		requires = {
			{ 'williamboman/mason-lspconfig.nvim' },
			{ 'neovim/nvim-lspconfig' }
		}
	}

	-- comp --



	-- Put this at the end after all plugins
	if packer_bootstrap then
		require('packer').sync()
	end
end)
