" Customize global settings
call ddc#custom#patch_global('sources', ['nvim-lsp', 'around', 'deoppet'])
"call ddc#custom#patch_global('completionMenu', 'pum.vim')
" Change source options
call ddc#custom#patch_global('sourceOptions', {
      \ '_': {
      \   'matchers': ['matcher_head'],
      \   'sorters': ['sorter_rank'],
			\		'converters': ['converter_remove_overlap'] },
			\ 'around': {'mark': 'A'},
			\	'nvim-lsp': {
			\		'mark': 'L',
			\		'forceCompletionPattern': '\.\w*|:\w*|->\w*' },
			\ 'deoppet': { 'dup': v:true, 'mark': 'dp'},
			\ })

call ddc#custom#patch_global('sourceParams', {
      \		'around': {'maxSize': 500},
      \ })

" Customize settings on a filetype
""call ddc#custom#patch_filetype(['c', 'cpp'], 'sources', ['around', 'clangd'])
""call ddc#custom#patch_filetype(['c', 'cpp'], 'sourceOptions', {
""      \ 'clangd': {'mark': 'C'},
""      \ })
""call ddc#custom#patch_filetype('markdown', 'sourceParams', {
""      \ 'around': {'maxSize': 100},
""      \ })

" Mappings

" <TAB>: completion.
inoremap <silent><expr> <TAB>
\ ddc#map#pum_visible() ? '<C-n>' :
\ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
\ '<TAB>' : ddc#map#manual_complete()

" <S-TAB>: completion back.
inoremap <expr><S-TAB>  ddc#map#pum_visible() ? '<C-p>' : '<C-h>'

" Use ddc.
call ddc#enable()
