" Rebind Y to yank rest of line, rather than duplicating yy
" Matches D, C, etc.
nmap Y y$

" Load example coc.nvim bindings from coc-metals
let coc_metals_example =
  \ expand("~/.config/coc/extensions/node_modules/coc-metals/coc-mappings.vim")
if lsp_client == 'coc' && filereadable(coc_metals_example)
  :execute 'source' coc_metals_example
endif

