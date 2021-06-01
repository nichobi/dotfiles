local g = vim.g
local cmd = vim.cmd
local opt = vim.opt

-- Configuration for vim-scala
cmd('au BufRead,BufNewFile *.sbt set filetype=scala')
-- Use proper scaladoc comment indentation
g.scala_scaladoc_indent = 1

if g.lsp_client == 'nvim' then
  -- Haskell language server
  require'lspconfig'.hls.setup{}
  -- Bash language server
  require'lspconfig'.bashls.setup{}


  metals_config = require('metals').bare_config
  metals_config.init_options.statusBarProvider = 'on'
  cmd [[augroup lsp
        au!
        au FileType scala,sbt lua require('metals').initialize_or_attach(metals_config)
        augroup end
      ]]

  opt.completeopt = 'menuone,noselect'

  require('compe').setup({
    enabled = true,
    autocomplete = true,
    debug = false,
    min_length = 1,
    source = {
      path = true,
      buffer = true,
      calc = true,
      nvim_lsp = true,
      nvim_lua = true,
      vsnip = true,
      ultisnips = true,
      nvim_lsp = true,
    },
  })
elseif g.lsp_client == 'coc' then
  -- Autocheck all scala files on write
  cmd([[autocmd BufWritePre *.scala silent call CocAction('format')]])

  -- coc extensions
  g.coc_global_extensions = {
    'coc-metals',
    'coc-vimtex',
  }
end
