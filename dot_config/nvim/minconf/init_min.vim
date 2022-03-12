let s:dein_dir = expand($HOME . '/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ":p")

call dein#begin(s:dein_dir)
call dein#add(s:dein_repo_dir)
call dein#add('vim-denops/denops.vim')
call dein#load_toml(g:NVIM_CONFIG_DIR . '/minconf/min_plugins.toml')
call dein#add('neovim/nvim-lspconfig')
call dein#add('Shougo/ddc-around')
call dein#add('Shougo/ddc-matcher_head')
call dein#add('Shougo/ddc-sorter_rank')
call dein#add('Shougo/ddc-nvim-lsp')
call dein#add('Shougo/ddc-converter_remove_overlap')

call dein#end()
call dein#save_state()
filetype plugin indent on
syntax enable
if dein#check_install() 
	call dein#install()
endif

