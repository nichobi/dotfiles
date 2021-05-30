" Install vim-plug if missing
let autoload_plug_path = stdpath('data') . '/site/autoload/plug.vim'
if !filereadable(autoload_plug_path)
  silent execute '!curl -fLo ' . autoload_plug_path . '  --create-dirs
      \ "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"'
  autocmd VimEnter * PlugInstall --sync "| source $MYVIMRC
endif
unlet autoload_plug_path

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin(stdpath('data') . '/plugged')

" Sync clipboard with tmux
Plug 'roxma/vim-tmux-clipboard'
" Basic Scala integration
Plug 'derekwyatt/vim-scala'
" Better status bar
Plug 'vim-airline/vim-airline'
" Add/delete/replace surroundings such as parentheses
Plug 'machakann/vim-sandwich'
" Highlight the yanked region
Plug 'machakann/vim-highlightedyank'
" Auto close parentheses, etc.
Plug 'cohama/lexima.vim'
" Smart hybrid line numbers
Plug 'jeffkreeftmeijer/vim-numbertoggle'
" Give each level of parentheses a different colour
Plug 'luochen1990/rainbow'
" Improved syntax highlighting for supported languages
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Highlight a unique character in every word on a line
Plug 'unblevable/quick-scope'

Plug 'folke/which-key.nvim'

" Plug 'ndmitchell/ghcid', { 'rtp': 'plugins/nvim' }
" Plug 'vim-latex/vim-latex'

if lsp_client == 'nvim'
  Plug 'neovim/nvim-lsp'
  Plug 'scalameta/nvim-metals'
elseif lsp_client == 'coc'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
endif

call plug#end()

lua << EOF
  require("which-key").setup{}

  require'nvim-treesitter.configs'.setup {
    ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    highlight = {
      enable = true,              -- false will disable the whole extension
    },
  }
EOF

