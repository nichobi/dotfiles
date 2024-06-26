local autocmd = vim.api.nvim_create_autocmd
local cmd     = vim.cmd
local fn      = vim.fn
local g       = vim.g
local opt     = vim.opt

local function highlight(name, val)
  vim.api.nvim_set_hl(0, name, val)
end

opt.termguicolors = true
cmd('colorscheme nicolour-nvim')

-- Show at least one line above/below the cursor
opt.scrolloff=1

-- Show live feedback for substitutions, with split preview of other occurences
opt.inccommand='split'

-- Wrap lines that don't fit on screen at word boundaries
opt.wrap = true
opt.linebreak = true
opt.breakindent = true

-- Open new windows below or to the right
opt.splitbelow = true
opt.splitright = true

-- Set hybrid line numbers
opt.number = true
opt.relativenumber = true

-- Set number row minimum width to 2 digits (third is occupied by a space
opt.numberwidth = 3

-- Set the window title to 'filename - nvim'
opt.title = true
opt.titlestring = [[%f - nvim]]

-- Disable mode text in message area
opt.showmode = false

-- Rainbow parentheses
g.rainbow_active = 1

-- Show signcolumn in number row
opt.signcolumn='number'

-- Highlight trailing whitespace in red while in normal mode
highlight('ExtraWhitespace', {ctermbg = 'red', bg = 'red'})
cmd([[match ExtraWhitespace /\s\+$/]])
autocmd({'BufWinEnter'}, {command = [[match ExtraWhitespace /\s\+$/]]       })
autocmd({'InsertEnter'}, {command = [[match ExtraWhitespace /\s\+\%#\@<!$/]]})
autocmd({'InsertLeave'}, {command = [[match ExtraWhitespace /\s\+$/]]       })
autocmd({'BufWinLeave'}, {command = [[call clearmatches()]]                 })

-- Highlight lines longer than 100 chars in darkgrey
highlight('LongLine', {ctermbg = 'darkgrey', bg = 'darkgrey'})
cmd([[2mat LongLine '\%101v.']])

-- Disable numbers for terminal buffers
autocmd({"BufEnter", "BufWinEnter", "TermOpen"}, {
  pattern = {"term://*"},
  command = "setlocal norelativenumber nonumber signcolumn=no",
})

require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    'bash',
    'css',
    'haskell',
    'html',
    'java',
    'lua',
    'scala',
  },
  highlight = {
    enable = true
  },
}

-- lualine setup
local function metalsStatus()
  return (vim.g['metals_status'] or '')
end

require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = '16color',
    component_separators = '│',
    section_separators = '',
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'filename'},
    lualine_c = {metalsStatus},
  },
}

require'bufferline'.setup {
  animation = false,
  auto_hide = true,
  icons = {
    filetype = { enabled = false },
    -- Disable close, save and unpin buttons
    button   = '', --disable close button
    modified = {button = ''},
    pinned   = {button = ''},
  },
}

-- Style signcolumn icons
fn.sign_define('LspDiagnosticsSignError',       {text = '', texthl = 'LspDiagnosticsDefaultError'})
fn.sign_define('LspDiagnosticsSignWarning',     {text = '', texthl = 'LspDiagnosticsDefaultWarning'})
fn.sign_define('LspDiagnosticsSignInformation', {text = '', texthl = 'LspDiagnosticsDefaultInformation'})
fn.sign_define('LspDiagnosticsSignHint',        {text = '', texthl = 'LspDiagnosticsDefaultHint'})
highlight('LspDiagnosticsDefaultError',       {ctermfg=9})
highlight('LspDiagnosticsDefaultWarning',     {ctermfg=11})
highlight('LspDiagnosticsDefaultInformation', {ctermfg=7})
highlight('LspDiagnosticsDefaultHint',        {ctermfg=7})

