" fzf
" nnoremap <silent> <C-A-f> :FZF<CR>
" save as superuser
cnoremap <silent> w!! :w !sudo tee > /dev/null %<CR> :e!<CR>
" quick normal mode
inoremap <C-h> <ESC>
" change display
nmap wj <c-w>j
nmap wk <c-w>k
nmap wh <c-w>h
nmap wl <c-w>l
" split display
nmap wv <c-w>v
nmap ws <c-w>s
" quick redo
nmap U <c-R>

" Toggle case and start typing. E.g. `<leader>iget`: `property` -> `getProperty`
map <leader>i ~hi
" Remove selection and toggle case. E.g. `v2l<leader>u`: `getProperty` -> `property`
vmap <leader>u d~h

