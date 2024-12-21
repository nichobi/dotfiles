local g = vim.g
local cmd = vim.cmd
local opt = vim.opt

-- Configuration for vim-scala
cmd('au BufRead,BufNewFile *.sbt set filetype=scala')
-- Use proper scaladoc comment indentation
g.scala_scaladoc_indent = 1

local capabilities = require('blink.cmp').get_lsp_capabilities()

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
        args = {"%f", "--synctex", "--keep-logs", "--keep-intermediates", "--outdir", "build/"},
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
require'ltex-ls'.setup {
  capabilities = capabilities,
  settings = {
    ltex = {
      language = "en-GB",
      enablePickyRules = true,
      disabledRules = {
        ['en-GB'] = {
          "OXFORD_SPELLING_Z_NOT_S",
          "KIND_OF_A" -- Disabled so ltex doesn't complain about "the type of an expression" in thesis
        },
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


opt.completeopt = 'menu,menuone,noselect'


-- Use buffer source for `/`.
