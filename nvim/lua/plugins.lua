local cmd = vim.cmd
local fn = vim.fn
local g = vim.g

-- Bootstrap packer if not already installed
local packer_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(packer_path)) > 0 then
  cmd('!git clone https://github.com/wbthomason/packer.nvim '..packer_path)
  cmd('packadd packer.nvim')
end

require('packer').startup(function()
  -- Manage packer with packer
  use 'wbthomason/packer.nvim'
  -- My own vim colorscheme
  use {
    --'~/projects/nicolour-nvim',
    'nichobi/nicolour-nvim',
    requires = {
      'rktjmp/lush.nvim'
    }
  }
  -- Sync clipboard with tmux
  use 'roxma/vim-tmux-clipboard'
  -- LSP configurations
  use 'neovim/nvim-lspconfig'
  -- Scala LSP
  use 'scalameta/nvim-metals'
  -- C# LSP
  use 'seblj/roslyn.nvim'
  -- Completion engine, with snippet plugin
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-calc',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip',
    }
  }

  -- Basic Scala integration
  use 'derekwyatt/vim-scala'
  -- Better status bar
  use 'hoob3rt/lualine.nvim'
  -- Add/delete/replace surroundings such as parentheses
  use 'machakann/vim-sandwich'
  -- Highlight the yanked region
  -- Replace with integrated version? https://github.com/neovim/neovim/pull/12279
  use 'machakann/vim-highlightedyank'
  -- Smart hybrid line numbers
  use 'jeffkreeftmeijer/vim-numbertoggle'
  -- Give each level of parentheses a different colour
  use 'luochen1990/rainbow'
  -- Improved syntax highlighting for supported languages
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  -- Add a buffer bar
  use 'romgrk/barbar.nvim'
  -- Highlight a unique character in every word on a line
  use {
    'unblevable/quick-scope',
    config = function()
      vim.g.qs_highlight_on_keys = {'f', 'F', 't', 'T'}
    end
  }
  -- Show key binding popups
  use {
    'folke/which-key.nvim',
    config = function()
      require('which-key').setup{plugins = {
          spelling = {enabled = true}
        }
      }
    end
  }
  -- ANSI-only colorscheme
  use 'jeffkreeftmeijer/vim-dim'
  -- File/fuzzy finder
  use {
    'nvim-telescope/telescope.nvim',
    requires = {'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim', { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }},
    config = function()
      require('telescope').setup{
        defaults = {
          mappings = {
            i = {
              ["<C-j>"] = require('telescope.actions').move_selection_next,
              ["<C-k>"] = require('telescope.actions').move_selection_previous,
            }
          }
        }
      }
      require('telescope').load_extension('projects')
      require('telescope').load_extension('fzf')
    end
  }
  -- Automatically cd to project root
  use {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup{
        manual_mode = true,
      }
    end
  }
  use {
    'rmagatti/auto-session',
    config = function()
      require("auto-session").setup {
        --suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
      }
    end
}
end)



