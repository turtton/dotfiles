let g:NVIM_CONFIG_DIR= expand($HOME . '/.config/nvim')
exec 'source' . g:NVIM_CONFIG_DIR . '/settings.vim'
exec 'source' . g:NVIM_CONFIG_DIR . '/nvim-settings.vim'
exec 'source' . g:NVIM_CONFIG_DIR . '/keybindings.vim'

exec 'source' . g:NVIM_CONFIG_DIR . '/plugins.vim'
"exec 'source' . g:NVIM_CONFIG_DIR . '/minconf/init_min.vim'
