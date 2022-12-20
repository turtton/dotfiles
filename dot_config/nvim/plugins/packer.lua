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

	-- I don't know why but plenary should install here(requires section does not work :thinking:)
	use 'nvim-lua/plenary.nvim'

	-- theme --
	use {
		'rebelot/kanagawa.nvim',
		config = "vim.cmd([[exec 'source' . g:PLUGIN_CONFIG_DIR . '/kanagawa.lua']])"
	}

	-- lsp --
	use 'neovim/nvim-lspconfig'
	use {
		'williamboman/mason.nvim',
		config = "vim.cmd[[exec 'source' . g:PLUGIN_CONFIG_DIR . '/lspins.lua']]",
		requires = {
			{ 'williamboman/mason-lspconfig.nvim' }
		}
	}

	-- comp --
	use {
		'Shougo/ddc.vim',
		config = "vim.cmd[[exec 'source' . g:PLUGIN_CONFIG_DIR . '/ddc.vim']]",
		requires = {
			{ 'vim-denops/denops.vim' },
			{ 'Shougo/ddc-ui-native' },
			{ 'Shougo/ddc-nvim-lsp' },
			{ 'Shougo/ddc-around' },
			{ 'Shougo/ddc-matcher_head' },
			{ 'Shougo/ddc-sorter_rank' },
			{ 'Shougo/ddc-converter_remove_overlap' },
			{ 'Shougo/ddc-zsh' },
			{
				'vim-skk/skkeleton',
				config = "vim.cmd[[exec 'source' . g:PLUGIN_CONFIG_DIR . '/skkeleton.vim']]"
			},
			{
				'matsui54/denops-popup-preview.vim',
				requires = { 'Shougo/pum.vim', 'vim-denops/denops.vim' },
				config = "vim.fn['popup_preview#enable']()"
			},
			{
				'matsui54/denops-signature_help',
				config = "vim.fn['signature_help#enable']()",
				requires = 'vim-denops/denops.vim'
			}
		}
	}

	-- language tools --
	use {
		'scalameta/nvim-metals',
		opt = true,
		ft = { 'scala', 'sbt' },
		requires = { 'nvim-lua/plenary.nvim' }
	}
	use {
		'simrat39/rust-tools.nvim',
		--	opt = true,
		--	ft = { 'rs', 'toml' },
		requires = {
			{ 'mfussenegger/nvim-dap' },
			{
				'saecki/crates.nvim',
				tag = 'v0.3.0',
				requires = 'nvim-lua/plenary.nvim',
				config = function() require('crates').setup() end
			}
		}
	}
	use {
		'peterhoeg/vim-qml',
		opt = true,
		ft = { 'qml' }
	}
	use { 'normen/vim-pio' }

	-- syntax highlight --
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
		config = "vim.cmd[[exec 'source' . g:PLUGIN_CONFIG_DIR . '/treesitter.lua']]"
	}

	-- git --
	use {
		'lewis6991/gitsigns.nvim',
		config = "vim.cmd[[exec 'source' . g:PLUGIN_CONFIG_DIR . '/gitsigns.lua']]",
		requires = 'nvim-lua/plenary.nvim'
	}

	-- utils --
	-- file tree
	use {
		'lambdalisue/fern.vim',
		config = "vim.cmd[[nnoremap <silent> wf :Fern . -drawer -reveal=%<CR>]]"
	}
	-- key documentation
	use {
		'folke/which-key.nvim',
		config = "vim.cmd[[exec 'source' . g:PLUGIN_CONFIG_DIR . '/which-key.lua']]"
	}
	-- improve asterisk searching
	use {
		'haya14busa/vim-asterisk',
		config = "vim.cmd[[exec 'source' . g:PLUGIN_CONFIG_DIR . '/asterisk.vim']]"
	}
	-- mini(huge) functional utils
	use {
		'echasnovski/mini.nvim',
		branch = 'stable',
		config = "vim.cmd[[exec 'source' . g:PLUGIN_CONFIG_DIR . '/mini.lua']]"
	}
	-- fuzzy finder
	use {
		'nvim-telescope/telescope.nvim',
		tag = '0.1.0',
		config = "vim.cmd[[exec 'source' . g:PLUGIN_CONFIG_DIR . '/telescope.vim']]",
		requires = {
			{ 'nvim-lua/plenary.nvim' },
			{ 'nvim-telescope/telescope-ui-select.nvim' }
		}
	}

	-- Put this at the end after all plugins
	if packer_bootstrap then
		require('packer').sync()
	end
end)
