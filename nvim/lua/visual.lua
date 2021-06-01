local cmd = vim.cmd
local fn  = vim.fn
local g   = vim.g
local opt = vim.opt

cmd('colorscheme dim')

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

-- Set number row minimum width to 2 digits (third is occupied by a space)
opt.numberwidth = 3

-- Set the window title to 'filename - nvim'
opt.title = true
opt.titlestring = [[%f - nvim]]

-- Rainbow parentheses
g.rainbow_active = 1

-- Show signcolumn in number row
opt.signcolumn='number'

-- Highlight trailing whitespace in red while in normal mode
cmd('highlight ExtraWhitespace ctermbg=red guibg=red')
cmd([[
  match ExtraWhitespace /\s\+$/
  autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
  autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
  autocmd InsertLeave * match ExtraWhitespace /\s\+$/
  autocmd BufWinLeave * call clearmatches()
]])

-- Highlight lines longer than 100 chars in darkgrey
cmd('highlight LongLine ctermbg=darkgrey guibg=darkgrey')
cmd([[2mat LongLine '\%101v.']])

cmd([[
  augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
  augroup END
]])

-- Disable numbers for terminal buffers
cmd([[
  autocmd BufWinEnter,WinEnter,TermOpen term://* setlocal norelativenumber
  autocmd BufWinEnter,WinEnter,TermOpen term://* setlocal nonumber
  autocmd BufWinEnter,WinEnter,TermOpen term://* setlocal signcolumn=no
]])

require'nvim-treesitter.configs'.setup {
  ensure_installed = {'bash', 'scala', 'haskell', 'java', 'lua', 'html', 'css'},
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

-- Style signcolumn icons
fn.sign_define('LspDiagnosticsSignError',       {text = '', texthl = 'LspDiagnosticsDefaultError'})
fn.sign_define('LspDiagnosticsSignWarning',     {text = '', texthl = 'LspDiagnosticsDefaultWarning'})
fn.sign_define('LspDiagnosticsSignInformation', {text = '', texthl = 'LspDiagnosticsDefaultInformation'})
fn.sign_define('LspDiagnosticsSignHint',        {text = '', texthl = 'LspDiagnosticsDefaultHint'})
cmd [[
  highlight LspDiagnosticsDefaultError       ctermfg=9'
  highlight LspDiagnosticsDefaultWarning     ctermfg=11'
  highlight LspDiagnosticsDefaultInformation ctermfg=7'
  highlight LspDiagnosticsDefaultHint        ctermfg=7'
]]

