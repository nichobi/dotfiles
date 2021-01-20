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

Plug 'roxma/vim-tmux-clipboard'
Plug 'derekwyatt/vim-scala'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'machakann/vim-sandwich'
Plug 'machakann/vim-highlightedyank'
Plug 'cohama/lexima.vim'
Plug 'jeffkreeftmeijer/vim-numbertoggle'

" Plug 'ndmitchell/ghcid', { 'rtp': 'plugins/nvim' }
" Plug 'vim-latex/vim-latex'

if lsp_client == 'nvim'
  Plug 'neovim/nvim-lsp'
  Plug 'scalameta/nvim-metals'
elseif lsp_client == 'coc'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
endif

call plug#end()

