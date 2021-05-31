local g = vim.g
local wk = require('which-key')
-- Rebind Y to yank rest of line, rather than duplicating yy
-- Matches D, C, etc.
wk.register({Y = {'y$', 'Yank rest of line'}})

wk.register({
  ['<leader>'] = {
    f = {
      name = '+file',
      f = {'<cmd>Telescope find_files<cr>', 'Find File'},
      r = {'<cmd>Telescope oldfiles<cr>',   'Open Recent File'},
      g = {'<cmd>Telescope live_grep<cr>',  'Search working directory'},
      b = {'<cmd>Telescope buffers<cr>',    'Open buffer'},
      n = {'<cmd>enew<cr>',                 'New File'},
    },
  },
})

if g.lsp_client == 'coc' then
  wk.register({
    g = {
      d = {'<Plug>coc-definition',        'Open definition'},
      y = {'<Plug>(coc-type-definition)', 'Open definition of type'},
      i = {'<Plug>(coc-implementation)',  'Open implementation'},
      r = {'<Plug>(coc-references)',      'Find references'},
    },
  })
elseif g.lsp_client == 'nvim' then
  wk.register({
    ['<C-k>'] = {'<cmd>lua vim.lsp.buf.signature_help()<CR>', 'Signature help'},
    ['<leader>'] = {
      D  = {'<cmd>lua vim.lsp.buf.type_definition()<CR>',                            'Type definition'},
      ca = {'<cmd>lua vim.lsp.buf.code_action()<CR>',                                'Code action'},
      e  = {'<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>',               'Show line diagnostics'},
      f  = {'<cmd>lua vim.lsp.buf.formatting()<CR>',                                 'Format'},
      q  = {'<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>',                         'View location list'},
      rn = {'<cmd>lua vim.lsp.buf.rename()<CR>',                                     'Rename symbol'},
      wa = {'<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>',                       'Add workspace folder'},
      wl = {'<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', 'List workspace folders'},
      wr = {'<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>',                    'Remove workspace folder'},
    },
    K  = {'<Cmd>lua vim.lsp.buf.hover()<CR>', ''},
    ['[d'] = {'<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', 'Previous diagnostic'},
    [']d'] = {'<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', 'Next diagnostic'},
    ['gD'] = {'<Cmd>lua vim.lsp.buf.declaration()<CR>',      'Go to declaration'},
    ['gd'] = {'<Cmd>lua vim.lsp.buf.definition()<CR>',       'Go to definition'},
    ['gi'] = {'<cmd>lua vim.lsp.buf.implementation()<CR>',   'Go to implementation'},
    ['gr'] = {'<cmd>lua vim.lsp.buf.references()<CR>',       'Go to references'},
  })
  wk.register({
    ['<C-Space>']  = {[[compe#complete()]],             'Complete'},
    ['<CR>']       = {[[compe#confirm('<CR>')]],        'Confirm'},
    ['<C-e>']      = {[[compe#close('<C-e>')]],         'Close'},
    ['<C-f>']      = {[[compe#scroll({'delta': +4 })]], 'Scroll'},
    ['<C-d>']      = {[[compe#scroll({'delta': -4 })]], 'Scroll'},
  }, {mode = 'i', expr = true})
end
