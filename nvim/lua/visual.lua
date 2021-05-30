local opt = vim.opt
local cmd = vim.cmd
local g = vim.g

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

-- Set the window title to 'filename - nvim'
opt.title = true
opt.titlestring = [[%f - nvim]]

-- Rainbow parentheses
g['rainbow_active'] = 1

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
  highlight = {
    enable = true
  },
}

