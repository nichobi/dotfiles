" coc extensions
let g:coc_global_extensions = [
  \ 'coc-metals',
  \ 'coc-vimtex',
\]

" Configuration for vim-scala
au BufRead,BufNewFile *.sbt set filetype=scala
" Use proper scaladoc comment indentation
let g:scala_scaladoc_indent = 1

" Autocheck all scala files on write
autocmd BufWritePre *.scala silent call CocAction('format')

" Load example coc.nvim bindings from coc-metals
let coc_metals_example =
  \ expand("~/.config/coc/extensions/node_modules/coc-metals/coc-mappings.vim")
if lsp_client == 'coc' && filereadable(coc_metals_example)
  :execute 'source' coc_metals_example
endif

