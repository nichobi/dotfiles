local cmd = vim.cmd
local fn = vim.fn
local g = vim.g

local packer_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(packer_path)) > 0 then
  cmd('!git clone https://github.com/wbthomason/packer.nvim '..packer_path)
  cmd('packadd packer.nvim')
end

return require('packer').startup(function()
  -- Manage packer with packer
  use 'wbthomason/packer.nvim'
  -- Sync clipboard with tmux
  use 'roxma/vim-tmux-clipboard'
  -- Basic Scala integration
  use 'derekwyatt/vim-scala'
  -- Better status bar
  use 'vim-airline/vim-airline'
  -- Add/delete/replace surroundings such as parentheses
  use 'machakann/vim-sandwich'
  -- Highlight the yanked region
  -- Replace with integrated version? https://github.com/neovim/neovim/pull/12279
  use 'machakann/vim-highlightedyank' 
  -- Auto close parentheses, etc.
  use 'cohama/lexima.vim'
  -- Smart hybrid line numbers
  use 'jeffkreeftmeijer/vim-numbertoggle'
  -- Give each level of parentheses a different colour
  use 'luochen1990/rainbow'
  -- Improved syntax highlighting for supported languages
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  -- Highlight a unique character in every word on a line
  use 'unblevable/quick-scope'
  -- Show key binding popups
  use 'folke/which-key.nvim'
  -- ANSI-only colorscheme
  use 'jeffkreeftmeijer/vim-dim'


  if g['lsp_client'] == 'nvim' then
    use 'neovim/nvim-lsp'
    use 'scalameta/nvim-metals'
  elseif g['lsp_client'] == 'coc' then
    use {'neoclide/coc.nvim', branch ='release'}
  end
end)

