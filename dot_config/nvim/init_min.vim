let s:dein_dir = expand($HOME . '/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ":p")

call dein#begin(s:dein_dir)
call dein#add(s:dein_repo_dir)
call dein#add('rebelot/kanagawa.nvim', {'hook_add' : 'colorscheme kanagawa'})
call dein#add('neovim/nvim-lspconfig')
call dein#add('williamboman/nvim-lsp-installer')
call dein#add('vim-denops/denops.vim')
call dein#add('Shougo/ddc.vim')
call dein#add('Shougo/ddc-around')
call dein#add('Shougo/ddc-matcher_head')
call dein#add('Shougo/ddc-nvim-lsp')

call dein#end()
call dein#save_state()
filetype plugin indent on
syntax enable
if dein#check_install() 
	call dein#install()
endif

" lsp settings
lua << EOF
local lsp_servers = require('nvim-lsp-installer.servers')
local language = 'vimls'
local isAvailable, server = lsp_servers.get_server(language)
if not isAvailable then
	error(string.format('%s is not available.', language))
	return
end

server:on_ready(function()
	local opts = {filetypes = {'vim'}}
	server:setup(opts)
end)

if not server:is_installed() then
	server:install()
end
EOF

" ddc settings
call ddc#custom#patch_global('sources', ['nvim-lsp', 'around'])
call ddc#custom#patch_global('sourceOptions', {
			\ '_': { 'matchers': ['matcher_head'] },
			\ 'nvim-lsp': {'mark': 'L', 'forceCompletionPattern': '\.\w*|:\w*|->\w*' },
			\ 'around': {'mark': 'A'}})
inoremap <silent><expr> <TAB> ddc#map#pum_visible() ? '<C-n>' : (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ? '<TAB>' : ddc#map#manual_complete()
call ddc#enable()"
