local lsp = vim.lsp
local diag = vim.diagnostic

function map(args)
  opts = args.opts or {}
  mode = args.mode or {'n'}
  for _, map in ipairs(args) do
    if #map ~= 2 then error('map: expected 2 args, found ' .. #map) end
    opts = { noremap = true, silent = true }
    for k,v in pairs(map) do
      if type(k) ~= 'number' then
        opts[k] = v
      end
    end
    vim.keymap.set(mode, map[1], map[2], opts)
  end
end

-- Document vim-sandwich
map({
  --{ "sa", desc = "Add surrounding" },
  --{ "sd", desc = "Delete surrounding" },
  --{ "sr", desc = "Replace surrounding" },
})

map({
  mode = { 'o', 'x' },
  { 'aI', function() require'treesitter_indent_object.textobj'.select_indent_outer() end,
    desc = 'Select indent level lines' },
  { 'ai', function() require'treesitter_indent_object.textobj'.select_indent_outer(true) end,
    desc = 'Select indent level' },
  { 'iI', function() require'treesitter_indent_object.textobj'.select_indent_inner() end,
    desc = 'Select inner indent level lines' },
  { 'ii', function() require'treesitter_indent_object.textobj'.select_indent_inner(true, 'V') end,
    desc = 'Select inner indent level' },
})

-- Smarter j/k movement that takes line wraps into account except when counts are set,
-- and adds long jumps to the jump list
map({
  { 'j', [[v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj']],
    desc = 'Move cursor down', expr = true, replace_keycodes = false },
  { 'k', [[v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk']],
    desc = 'Move cursor up', expr = true, replace_keycodes = false },
})

-- File related bindings
map({
  --{ '<leader>f', group = 'file' },
  { '<leader>fF', '<cmd>Telescope find_files hidden=true no_ignore=true<cr>',
    desc = 'Find file (hidden)' },
  { '<leader>fb', '<cmd>Telescope buffers<cr>',
    desc = 'Open buffer' },
  { '<leader>ff', '<cmd>Telescope find_files<cr>',
    desc = 'Find file' },
  { '<leader>fg', '<cmd>Telescope live_grep<cr>',
    desc = 'Search working directory' },
  { '<leader>fn', '<cmd>enew<cr>',
    desc = 'New file' },
  { '<leader>fp', '<cmd>Telescope project<cr>',
    desc = 'Open projects' },
  { '<leader>fr', '<cmd>Telescope oldfiles<cr>',
    desc = 'Open recent file' },
})

-- LSP bindings
map({
  { 'K',          lsp.buf.hover,           desc = 'Show hover' },
  { '<C-k>',      lsp.buf.signature_help,  desc = 'Signature help' },
  { 'gD',         lsp.buf.declaration,     desc = 'Go to declaration' },
  { 'gd',         lsp.buf.definition,      desc = 'Go to definition' },
  { 'gi',         lsp.buf.implementation,  desc = 'Go to implementation' },
  { 'gr',         lsp.buf.references,      desc = 'Go to references' },
  { '<leader>D',  lsp.buf.type_definition, desc = 'Type definition' },
  { '<leader>ca', lsp.buf.code_action,     desc = 'Code action' },
  { '<leader>rn', lsp.buf.rename,          desc = 'Rename symbol' },
  { '<leader>e',  diag.open_float,         desc = 'Show line diagnostics' },
  { '<leader>F',  lsp.buf.format,          desc = 'Format' },
  { ']d',         diag.goto_next,          desc = 'Next diagnostic' },
  { '[d',         diag.goto_prev,          desc = 'Previous diagnostic' },
  { '<leader>q',  diag.setloclist,         desc = 'View location list' },
  { '<leader>wa', lsp.buf.add_workspace_folder,
    desc = 'Add workspace folder' },
  { '<leader>wl', function() print(vim.inspect(lsp.buf.list_workspace_folders())) end,
    desc = 'List workspace folders' },
  { '<leader>wr', lsp.buf.remove_workspace_folder,
    desc = 'Remove workspace folder' },
})

-- barbar.nvim bindings
map({
  -- Move to previous/next
  { '<A-j>', '<cmd>BufferNext<CR>',     desc = 'Next buffer' },
  { '<A-k>', '<cmd>BufferPrevious<CR>', desc = 'Previous buffer' },
  -- Re-order to previous/next
  { '<A-h>', '<cmd>BufferMovePrevious<CR>', desc = 'Move buffer previous' },
  { '<A-l>', '<cmd>BufferMoveNext<CR>',     desc = 'Move buffer next' },
  -- Goto buffer in position...
  { '<A-0>', '<cmd>BufferLast<CR>',   desc = 'Go to last buffer' },
  { '<A-1>', '<cmd>BufferGoto 1<CR>', desc = 'Go to buffer 1' },
  { '<A-2>', '<cmd>BufferGoto 2<CR>', desc = 'Go to buffer 2' },
  { '<A-3>', '<cmd>BufferGoto 3<CR>', desc = 'Go to buffer 3' },
  { '<A-4>', '<cmd>BufferGoto 4<CR>', desc = 'Go to buffer 4' },
  { '<A-5>', '<cmd>BufferGoto 5<CR>', desc = 'Go to buffer 5' },
  { '<A-6>', '<cmd>BufferGoto 6<CR>', desc = 'Go to buffer 6' },
  { '<A-7>', '<cmd>BufferGoto 7<CR>', desc = 'Go to buffer 7' },
  { '<A-8>', '<cmd>BufferGoto 8<CR>', desc = 'Go to buffer 8' },
  { '<A-9>', '<cmd>BufferGoto 9<CR>', desc = 'Go to buffer 9' },
  --{ '<leader>b', group = 'buffer' },
  { '<leader>bP', '<cmd>BufferPin<CR>', desc = 'Pin/unpin a buffer' },
  --{ '<leader>bd', group = 'close' },
  { '<leader>bdd', '<cmd>BufferClose<CR>',                      desc = 'Close buffer' },
  { '<leader>bdh', '<cmd>BufferCloseBuffersLeft<CR>',           desc = 'Close buffers to the right' },
  { '<leader>bdl', '<cmd>BufferCloseBuffersRight<CR>',          desc = 'Close buffers to the left' },
  { '<leader>bdo', '<cmd>BufferCloseAllButCurrentOrPinned<CR>', desc = 'Close other buffers' },
  { '<leader>bf',  '<cmd>BufferPick<CR>',                       desc = 'Pick a buffer' },
  { '<leader>bn',  '<cmd>BufferNext<CR>',                       desc = 'Next buffer' },
  --{ '<leader>bo', group = 'order' },
  { '<leader>bob', '<cmd>BufferOrderByBufferNumber<CR>', desc = 'Order by buffer number' },
  { '<leader>bod', '<cmd>BufferOrderByDirectory<CR>',    desc = 'Order by directory' },
  { '<leader>bol', '<cmd>BufferOrderByLanguage<CR>',     desc = 'Order by language' },
  { '<leader>bow', '<cmd>BufferOrderByWindowNumber<CR>', desc = 'Order by window number' },
  { '<leader>bp',  '<cmd>BufferPrevious<CR>',            desc = 'Previous buffer' },
})
