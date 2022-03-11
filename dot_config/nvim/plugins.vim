let g:PLUGIN_CONFIG_DIR = g:NVIM_CONFIG_DIR . '/plugins/config'

if &compatible
  set nocompatible " Be iMproved
endif

let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" Required:
" Add the dein installation directory into runtimepath
if &runtimepath !~# '/dein.vim'
	if !isdirectory(s:dein_repo_dir)
		execute '!curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh;sh ./installer.sh ~/.cache/dein;rm installer.sh'
	endif
	execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ":p")
endif

" Required:
if dein#load_state(s:dein_dir)
	call dein#begin(s:dein_dir)

	" toml files
	let g:rc_dir		= expand('~/.config/nvim/plugins')
	let s:toml			= g:rc_dir . '/dein.toml'
	let s:lazy_toml	= g:rc_dir . '/dein_lazy.toml'

	" cache TOML files
	call dein#load_toml(s:toml,				{'lazy': 0})
	call dein#load_toml(s:lazy_toml,	{'lazy': 1})

	" save
	call dein#end()
	call dein#save_state()
endif



" Let dein manage dein

" Add or remove your plugins here like this:
"call dein#add('Shougo/neosnippet.vim')
"call dein#add('Shougo/neosnippet-snippets')


" Required:
filetype plugin indent on
syntax enable

if dein#check_install()
 call dein#install()
endif
