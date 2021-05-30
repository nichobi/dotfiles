local g = vim.g
local wk = require("which-key")
-- Rebind Y to yank rest of line, rather than duplicating yy
-- Matches D, C, etc.
wk.register({Y = {'y$', "Yank rest of line"}})

wk.register({
  ["<leader>"] = {
    f = {
      name = "+file",
      f = { "<cmd>Telescope find_files<cr>", "Find File" },
      r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
      n = { "<cmd>enew<cr>", "New File" },
    },
  },
})

if g['lsp_client'] == 'coc' then
  wk.register({
    g = {
      d = { "<Plug>coc-definition", "Open definition" },
      y = { "<Plug>(coc-type-definition)", "Open definition of type"},
      i = { "<Plug>(coc-implementation)", "Open implementation"},
      r = { "<Plug>(coc-references)", "Find references"},
    },
  })
end
