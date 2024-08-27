local g = vim.g
local wk = require('which-key')

-- Document vim-sandwich
wk.register({
  s = {
    a = {'Add surrounding'},
    d = {'Delete surrounding'},
    r = {'Replace surrounding'},
  }
})

-- Smarter j/k movement that takes line wraps into account except when counts are set
wk.register({
  j = {"v:count ? (v:count > 5 ? \"m'\" . v:count : '') . 'j' : 'gj'", 'Move cursor down'},
  k = {"v:count ? (v:count > 5 ? \"m'\" . v:count : '') . 'k' : 'gk'", 'Move cursor up'},
}, {expr = true})

-- File related bindings
wk.register({
  ['<leader>f'] = {
    name = '+file',
    f = {'<cmd>Telescope find_files<cr>', 'Find File'},
    r = {'<cmd>Telescope oldfiles<cr>',   'Open Recent File'},
    g = {'<cmd>Telescope live_grep<cr>',  'Search working directory'},
    b = {'<cmd>Telescope buffers<cr>',    'Open buffer'},
    p = {'<cmd>Telescope projects<cr>',   'Open projects'},
    n = {'<cmd>enew<cr>',                 'New File'},
  },
})

-- LSP bindings
wk.register({
  ['<leader>'] = {
    D  = {'<cmd>lua vim.lsp.buf.type_definition()<CR>',                            'Type definition'},
    ca = {'<cmd>lua vim.lsp.buf.code_action()<CR>',                                'Code action'},
    e  = {'<cmd>lua vim.diagnostic.open_float()<CR>',                              'Show line diagnostics'},
    F  = {'<cmd>lua vim.lsp.buf.formatting()<CR>',                                 'Format'},
    q  = {'<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>',                         'View location list'},
    rn = {'<cmd>lua vim.lsp.buf.rename()<CR>',                                     'Rename symbol'},
    wa = {'<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>',                       'Add workspace folder'},
    wl = {'<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', 'List workspace folders'},
    wr = {'<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>',                    'Remove workspace folder'},
  },
  K         = {'<cmd>lua vim.lsp.buf.hover()<CR>',            'Show hover'},
  ['<C-k>'] = {'<cmd>lua vim.lsp.buf.signature_help()<CR>',   'Signature help'},
  ['[d']    = {'<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', 'Previous diagnostic'},
  [']d']    = {'<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', 'Next diagnostic'},
  ['gD']    = {'<cmd>lua vim.lsp.buf.declaration()<CR>',      'Go to declaration'},
  ['gd']    = {'<cmd>lua vim.lsp.buf.definition()<CR>',       'Go to definition'},
  ['gi']    = {'<cmd>lua vim.lsp.buf.implementation()<CR>',   'Go to implementation'},
  ['gr']    = {'<cmd>lua vim.lsp.buf.references()<CR>',       'Go to references'},
})

-- nvim-cmp bindings
-- These currently don't work correctly when bound manually,
-- so letting nvim-cmp set up bindings automatically
--local cmp = require('cmp')
wk.register({
  --['<C-Space>'] = {cmp.mapping.complete(),                 'Complete'},
  --['<CR>']      = {cmp.mapping.confirm({ select = true }), 'Confirm'},
  --['<C-e>']     = {cmp.mapping.close(),                    'Close'},
  --['<C-f>']     = {cmp.mapping.scroll_docs(4),             'Scroll down'},
  --['<C-d>']     = {cmp.mapping.scroll_docs(-4),            'Scroll up'},
}, {mode = 'i'})

-- barbar.nvim bindings
wk.register({
  -- Move to previous/next
  ['<A-k>'] = {'<cmd>BufferPrevious<CR>',               'Previous buffer'},
  ['<A-j>'] = {'<cmd>BufferNext<CR>',                   'Next buffer'},
  -- Re-order to previous/next
  ['<A-h>'] = {'<cmd>BufferMovePrevious<CR>',           'Move buffer previous'},
  ['<A-l>'] = {'<cmd>BufferMoveNext<CR>',               'Move buffer next'},
  -- Goto buffer in position...
  ['<A-1>'] = {'<cmd>BufferGoto 1<CR>',                 'Go to buffer 1'},
  ['<A-2>'] = {'<cmd>BufferGoto 2<CR>',                 'Go to buffer 2'},
  ['<A-3>'] = {'<cmd>BufferGoto 3<CR>',                 'Go to buffer 3'},
  ['<A-4>'] = {'<cmd>BufferGoto 4<CR>',                 'Go to buffer 4'},
  ['<A-5>'] = {'<cmd>BufferGoto 5<CR>',                 'Go to buffer 5'},
  ['<A-6>'] = {'<cmd>BufferGoto 6<CR>',                 'Go to buffer 6'},
  ['<A-7>'] = {'<cmd>BufferGoto 7<CR>',                 'Go to buffer 7'},
  ['<A-8>'] = {'<cmd>BufferGoto 8<CR>',                 'Go to buffer 8'},
  ['<A-9>'] = {'<cmd>BufferGoto 9<CR>',                 'Go to buffer 9'},
  ['<A-0>'] = {'<cmd>BufferLast<CR>',                   'Go to last buffer'},
  ['<leader>b'] = {
    name = 'buffer',
    n = {'<cmd>BufferNext<CR>',                         'Next buffer'},
    p = {'<cmd>BufferPrevious<CR>',                     'Previous buffer'},
    d = {
      name = 'close',
      d = {'<cmd>BufferClose<CR>',                      'Close buffer'},
      o = {'<cmd>BufferCloseAllButCurrentOrPinned<CR>', 'Close other buffers'},
      h = {'<cmd>BufferCloseBuffersLeft<CR>',           'Close buffers to the right'},
      l = {'<cmd>BufferCloseBuffersRight<CR>',          'Close buffers to the left'},
    },
    f = {'<cmd>BufferPick<CR>',                         'Pick a buffer'},
    P = {'<cmd>BufferPin<CR>',                          'Pin/unpin a buffer'},
    o = {
      name = 'order',
      b = {'<cmd>BufferOrderByBufferNumber<CR>',        'Order by buffer number'},
      d = {'<cmd>BufferOrderByDirectory<CR>',           'Order by directory'},
      l = {'<cmd>BufferOrderByLanguage<CR>',            'Order by language'},
      w = {'<cmd>BufferOrderByWindowNumber<CR>',        'Order by window number'},
    },
  },
})

