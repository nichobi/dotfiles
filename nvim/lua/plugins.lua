local cmd = vim.cmd
local fn = vim.fn
local g = vim.g

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  spec = {
    -- My own vim colorscheme
    {
      --dir = '~/projects/nicolour-nvim',
      'nichobi/nicolour-nvim',
      dependencies = {
        'rktjmp/lush.nvim'
      }
    },
    -- Sync clipboard with tmux
    { 'roxma/vim-tmux-clipboard' },
    -- LSP configurations
    { 'neovim/nvim-lspconfig' },
    -- Scala LSP
    { 'scalameta/nvim-metals' },
    -- C# LSP
    { 'seblj/roslyn.nvim' },
    -- Latex/Written language LSP
    { 'vigoux/ltex-ls.nvim' },

    -- Completion engine, with snippet plugin
    {
      'hrsh7th/nvim-cmp',
      dependencies = {
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-calc',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-vsnip',
        'hrsh7th/vim-vsnip',
      }
    },

    -- Basic Scala integration
    { 'derekwyatt/vim-scala' },
    -- Better status bar
    { 'nvim-lualine/lualine.nvim' },
    -- Add/delete/replace surroundings such as parentheses
    { 'machakann/vim-sandwich' },
    -- Add objects for selecting indentation levels
    { 'kiyoon/treesitter-indent-object.nvim' },
    -- Highlight the yanked region
    -- Replace with integrated version? https://github.com/neovim/neovim/pull/12279
    { 'machakann/vim-highlightedyank' },
    -- Smart hybrid line numbers
    { 'jeffkreeftmeijer/vim-numbertoggle' },
    -- Give each level of parentheses a different colour
    { 'luochen1990/rainbow' },
    -- Improved syntax highlighting for supported languages
    { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },
    -- Add a buffer bar
    { 'romgrk/barbar.nvim' },
    -- Highlight a unique character in every word on a line
    {
      'unblevable/quick-scope',
      config = function()
        vim.g.qs_highlight_on_keys = {'f', 'F', 't', 'T'}
      end
    },
    -- Show key binding popups
    { 'folke/which-key.nvim',
      opts = {
        plugins = {
          spelling = {enabled = true}
        },
        triggers = {
          { "<auto>", mode = "nixsotc" },
          { "s", mode = { "n", "v" } },
        }
      }
    },
    -- ANSI-only colorscheme
    { 'jeffkreeftmeijer/vim-dim' },
    -- File/fuzzy finder
    { 'nvim-telescope/telescope.nvim',
      dependencies = {
        'nvim-lua/popup.nvim',
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
        'nvim-telescope/telescope-project.nvim',
      },
      config = function()
        require('telescope').setup{
          defaults = {
            mappings = {
              i = {
                ["<C-j>"] = require('telescope.actions').move_selection_next,
                ["<C-k>"] = require('telescope.actions').move_selection_previous,
              }
            }
          },
          extensions = {
            project = {
              base_dirs = {
                '~/projects',
                '~/dotfiles'
              }
            }
          }
        }
        require('telescope').load_extension('project')
        require('telescope').load_extension('fzf')
      end
    },

    -- Automatically cd to project root
    { "ahmedkhalf/project.nvim",
      opts = {
        manual_mode = true,
      }
    },

    { 'rmagatti/auto-session',
      opts =
        {
          suppressed_dirs = { "~/", "~/projects", "~/Downloads", "/"},
        }
    },
  }
})
