local g = vim.g
local cmd = vim.cmd
local opt = vim.opt

-- Configuration for vim-scala
cmd('au BufRead,BufNewFile *.sbt set filetype=scala')
-- Use proper scaladoc comment indentation
g.scala_scaladoc_indent = 1

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Haskell language server
require'lspconfig'.hls.setup{capabilities = capabilities}
-- Bash language server
require'lspconfig'.bashls.setup{capabilities = capabilities}
-- Latex language server
require'lspconfig'.texlab.setup{
  capabilities = capabilities,
  settings = {
    texlab = {
      auxDirectory = "build",
      build = {
        executable = "tectonic",
        args = {"%f", "--synctex", "--outdir", "build/"},
        onSave = true,
        forwardSearchAfter = true,
      },
      forwardSearch = {
          executable = "zathura",
          args = { "--synctex-forward", "%l:1:%f", "%p" },
      },
    }
  }
}
-- LanguageTool language server
require'lspconfig'.ltex.setup{
  capabilities = capabilities,
  settings = {
    ltex = {
      language = "en-GB",
      disabledRules = {
        ['en-GB'] = {"OXFORD_SPELLING_Z_NOT_S"},
      }
    }
  },
}

-- Roslyn C# LSP
require("roslyn").setup({
  config = {
    capabilities = capabilities,
  },
  exe = {
    "dotnet",
    vim.fs.joinpath(vim.fn.stdpath("data"), "roslyn", "Microsoft.CodeAnalysis.LanguageServer.dll"),
  },
  filewatching = true,
})

metals_config = require('metals').bare_config()
metals_config.init_options.statusBarProvider = 'on'
metals_config.capabilities = capabilities
cmd [[augroup lsp
      au!
      au FileType scala,sbt lua require('metals').initialize_or_attach(metals_config)
      augroup end
    ]]

opt.completeopt = 'menu,menuone,noselect'

local cmp = require('cmp')
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert(),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
  }, {
    { name = 'buffer' },
    { name = 'calc' },
    { name = 'path' },
  })
})


-- Use buffer source for `/`.
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':'.
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

