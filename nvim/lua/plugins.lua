local cmd = vim.cmd
local fn = vim.fn
local g = vim.g

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
      { out, 'WarningMsg' },
      { '\nPress any key to exit...' },
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
    { 'scalameta/nvim-metals',
      ft = { "scala", "sbt", "java" },
      opts = function()
        local metals_config = require('metals').bare_config()
        metals_config.init_options.statusBarProvider = 'off'
        metals_config.capabilities = require('blink.cmp').get_lsp_capabilities()
        return metals_config
      end,
      config = function(self, metals_config)
        local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
        vim.api.nvim_create_autocmd("FileType", {
          pattern = self.ft,
          callback = function()
            require("metals").initialize_or_attach(metals_config)
          end,
          group = nvim_metals_group,
        })
      end,
    },
    -- C# LSP
    { 'seblj/roslyn.nvim' },
    -- Latex/Written language LSP
    { 'vigoux/ltex-ls.nvim' },

    -- Completion engine, with snippet plugin
    {
      'saghen/blink.cmp',
      -- optional: provides snippets for the snippet source
      dependencies = 'rafamadriz/friendly-snippets',
      version = 'v0.*',
      opts = {}
    },

    -- Basic Scala integration
    { 'derekwyatt/vim-scala' },
    -- Better status bar
    { 'nvim-lualine/lualine.nvim' },
    -- Add/delete/replace surroundings such as parentheses
    { 'machakann/vim-sandwich' },
    -- Add objects for selecting indentation levels
    { 'kiyoon/treesitter-indent-object.nvim' },
    -- Smart hybrid line numbers
    { 'jeffkreeftmeijer/vim-numbertoggle' },
    -- Give each level of parentheses a different colour
    { 'luochen1990/rainbow' },
    -- Improved syntax highlighting for supported languages
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate',
      config = function()
        require'nvim-treesitter.configs'.setup {
          ensure_installed = {
            'bash',
            'css',
            'haskell',
            'helm',
            'html',
            'java',
            'json',
            'lua',
            'markdown',
            'markdown_inline',
            'norg',
            'python',
            'scala',
            'vim',
            'vimdoc',
            'yaml',
          },
          incremental_selection = {
            enable = true,
            keymaps = {
              init_selection = 'gnn',
              node_incremental = 'grn',
              scope_incremental = 'grc',
              node_decremental = 'grm',
            },
          },
          indent = {
            enable = true
          },
          auto_install = true,
          highlight = {
            enable = true
          },
        }
      end
    },
    -- Add a buffer bar
    { 'romgrk/barbar.nvim',
      init = function() vim.g.barbar_auto_setup = false end,
      opts = {
        icons = {
          filetype = {
            enabled = false
          }
        }
      }
    },
    -- Show key binding popups
    { 'folke/which-key.nvim',
      opts = {
        plugins = {
          spelling = {enabled = true}
        },
        triggers = {
          { '<auto>', mode = 'nixsotc' },
          { 's', mode = { 'n', 'v' } },
        }
      }
    },
    -- Notification UI
    { 'j-hui/fidget.nvim',
      opts = {},
    },
    -- File/fuzzy finder
    { 'nvim-telescope/telescope.nvim',
      dependencies = {
        'nvim-lua/popup.nvim',
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        'nvim-telescope/telescope-project.nvim',
      },
      config = function()
        require('telescope').setup{
          defaults = {
            mappings = {
              i = {
                ['<C-j>'] = require('telescope.actions').move_selection_next,
                ['<C-k>'] = require('telescope.actions').move_selection_previous,
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

    { 'rmagatti/auto-session',
      opts =
        {
          suppressed_dirs = { '~/', '~/projects', '~/Downloads', '/'},
        }
    },
  }
})
