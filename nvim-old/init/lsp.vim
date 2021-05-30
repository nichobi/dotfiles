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
"autocmd BufWritePre *.scala silent call CocAction('format')

