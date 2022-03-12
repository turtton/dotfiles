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
