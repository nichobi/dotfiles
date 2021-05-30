" Rebind Y to yank rest of line, rather than duplicating yy
" Matches D, C, etc.
nmap Y y$

" Load example coc.nvim bindings from coc-metals
let coc_metals_example =
  \ expand("~/.config/coc/extensions/node_modules/coc-metals/coc-mappings.vim")
if lsp_client == 'coc' && filereadable(coc_metals_example)
  ":execute 'source' coc_metals_example
endif

if lsp_client == 'coc'
lua << EOF
  local wk = require("which-key")
  wk.register({
    ["<leader>"] = {
      f = {
        name = "+file",
        f = { "<cmd>Telescope find_files<cr>", "Find File" },
        r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
        n = { "<cmd>enew<cr>", "New File" },
      },
    },
    g = {
      d = { "<Plug>coc-definition", "Open definition" },
      y = { "<Plug>(coc-type-definition)", "Open definition of type"},
      i = { "<Plug>(coc-implementation)", "Open implementation"},
      r = { "<Plug>(coc-references)", "Find references"},
    },
  })
EOF
endif
