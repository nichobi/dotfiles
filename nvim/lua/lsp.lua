local g = vim.g
local cmd = vim.cmd
-- coc extensions
g['coc_global_extensions'] = {
  'coc-metals',
  'coc-vimtex',
}

-- Configuration for vim-scala
cmd('au BufRead,BufNewFile *.sbt set filetype=scala')
-- Use proper scaladoc comment indentation
g['scala_scaladoc_indent'] = 1

-- Autocheck all scala files on write
cmd([[autocmd BufWritePre *.scala silent call CocAction('format')]])

