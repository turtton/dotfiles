let g:PLUGIN_CONFIG_DIR = g:NVIM_CONFIG_DIR . '/plugins/config'

if &compatible
  set nocompatible " Be iMproved
endif

let s:rc_dir		= expand(g:NVIM_CONFIG_DIR . '/plugins')

" Packer
" exec 'source' . s:rc_dir . '/packer.lua'
" Dein
exec 'source' . s:rc_dir . '/dein.vim'
