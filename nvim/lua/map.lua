local g = vim.g
local wk = require('which-key')

-- Document vim-sandwich
wk.add({
  { "sa", desc = "Add surrounding" },
  { "sd", desc = "Delete surrounding" },
  { "sr", desc = "Replace surrounding" },
})

wk.add({
  mode = { "o", "x" },
  { "aI", function() require'treesitter_indent_object.textobj'.select_indent_outer() end,
    desc = "Select indent level lines" },
  { "ai", function() require'treesitter_indent_object.textobj'.select_indent_outer(true) end,
    desc = "Select indent level" },
  { "iI", function() require'treesitter_indent_object.textobj'.select_indent_inner() end,
    desc = "Select inner indent level lines" },
  { "ii", function() require'treesitter_indent_object.textobj'.select_indent_inner(true, 'V') end,
    desc = "Select inner indent level" },
})

-- Smarter j/k movement that takes line wraps into account except when counts are set
wk.add({
  { "j", "v:count ? (v:count > 5 ? \"m'\" . v:count : '') . 'j' : 'gj'", desc = "Move cursor down", expr = true, replace_keycodes = false },
  { "k", "v:count ? (v:count > 5 ? \"m'\" . v:count : '') . 'k' : 'gk'", desc = "Move cursor up", expr = true, replace_keycodes = false },
})

-- File related bindings
wk.add({
  { "<leader>f", group = "file" },
  { "<leader>fF", "<cmd>Telescope find_files hidden=true no_ignore=true<cr>", desc = "Find file (hidden)" },
  { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Open buffer" },
  { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find file" },
  { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Search working directory" },
  { "<leader>fn", "<cmd>enew<cr>", desc = "New file" },
  { "<leader>fp", "<cmd>Telescope projects<cr>", desc = "Open projects" },
  { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Open recent file" },
})

-- LSP bindings
wk.add({
  { "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", desc = "Signature help" },
  { "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", desc = "Type definition" },
  { "<leader>F", "<cmd>lua vim.lsp.buf.format()<CR>", desc = "Format" },
  { "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", desc = "Code action" },
  { "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>", desc = "Show line diagnostics" },
  { "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", desc = "View location list" },
  { "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", desc = "Rename symbol" },
  { "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", desc = "Add workspace folder" },
  { "<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", desc = "List workspace folders" },
  { "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", desc = "Remove workspace folder" },
  { "K", "<cmd>lua vim.lsp.buf.hover()<CR>", desc = "Show hover" },
  { "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", desc = "Previous diagnostic" },
  { "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", desc = "Next diagnostic" },
  { "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", desc = "Go to declaration" },
  { "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", desc = "Go to definition" },
  { "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", desc = "Go to implementation" },
  { "gr", "<cmd>lua vim.lsp.buf.references()<CR>", desc = "Go to references" },
})

-- nvim-cmp bindings
-- These currently don't work correctly when bound manually,
-- so letting nvim-cmp set up bindings automatically
--local cmp = require('cmp')
--wk.register({
--  ['<C-Space>'] = {cmp.mapping.complete(),                 'Complete'},
--  ['<CR>']      = {cmp.mapping.confirm({ select = true }), 'Confirm'},
--  ['<C-e>']     = {cmp.mapping.close(),                    'Close'},
--  ['<C-f>']     = {cmp.mapping.scroll_docs(4),             'Scroll down'},
--  ['<C-d>']     = {cmp.mapping.scroll_docs(-4),            'Scroll up'},
--}, {mode = 'i'})

-- barbar.nvim bindings
wk.add({
  -- Move to previous/next
  { "<A-j>", "<cmd>BufferNext<CR>", desc = "Next buffer" },
  { "<A-k>", "<cmd>BufferPrevious<CR>", desc = "Previous buffer" },
  -- Re-order to previous/next
  { "<A-h>", "<cmd>BufferMovePrevious<CR>", desc = "Move buffer previous" },
  { "<A-l>", "<cmd>BufferMoveNext<CR>", desc = "Move buffer next" },
  -- Goto buffer in position...
  { "<A-0>", "<cmd>BufferLast<CR>", desc = "Go to last buffer" },
  { "<A-1>", "<cmd>BufferGoto 1<CR>", desc = "Go to buffer 1" },
  { "<A-2>", "<cmd>BufferGoto 2<CR>", desc = "Go to buffer 2" },
  { "<A-3>", "<cmd>BufferGoto 3<CR>", desc = "Go to buffer 3" },
  { "<A-4>", "<cmd>BufferGoto 4<CR>", desc = "Go to buffer 4" },
  { "<A-5>", "<cmd>BufferGoto 5<CR>", desc = "Go to buffer 5" },
  { "<A-6>", "<cmd>BufferGoto 6<CR>", desc = "Go to buffer 6" },
  { "<A-7>", "<cmd>BufferGoto 7<CR>", desc = "Go to buffer 7" },
  { "<A-8>", "<cmd>BufferGoto 8<CR>", desc = "Go to buffer 8" },
  { "<A-9>", "<cmd>BufferGoto 9<CR>", desc = "Go to buffer 9" },
  { "<leader>b", group = "buffer" },
  { "<leader>bP", "<cmd>BufferPin<CR>", desc = "Pin/unpin a buffer" },
  { "<leader>bd", group = "close" },
  { "<leader>bdd", "<cmd>BufferClose<CR>", desc = "Close buffer" },
  { "<leader>bdh", "<cmd>BufferCloseBuffersLeft<CR>", desc = "Close buffers to the right" },
  { "<leader>bdl", "<cmd>BufferCloseBuffersRight<CR>", desc = "Close buffers to the left" },
  { "<leader>bdo", "<cmd>BufferCloseAllButCurrentOrPinned<CR>", desc = "Close other buffers" },
  { "<leader>bf", "<cmd>BufferPick<CR>", desc = "Pick a buffer" },
  { "<leader>bn", "<cmd>BufferNext<CR>", desc = "Next buffer" },
  { "<leader>bo", group = "order" },
  { "<leader>bob", "<cmd>BufferOrderByBufferNumber<CR>", desc = "Order by buffer number" },
  { "<leader>bod", "<cmd>BufferOrderByDirectory<CR>", desc = "Order by directory" },
  { "<leader>bol", "<cmd>BufferOrderByLanguage<CR>", desc = "Order by language" },
  { "<leader>bow", "<cmd>BufferOrderByWindowNumber<CR>", desc = "Order by window number" },
  { "<leader>bp", "<cmd>BufferPrevious<CR>", desc = "Previous buffer" },
})
