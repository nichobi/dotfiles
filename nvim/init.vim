
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
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'machakann/vim-sandwich'

" Plug 'ndmitchell/ghcid', { 'rtp': 'plugins/nvim' }
" Plug 'vim-latex/vim-latex'

call plug#end()

" coc extensions
let g:coc_global_extensions = [
  \ 'coc-metals',
\]

" Enable mouse support
set mouse=a

" Set tab to always use two spaces
set tabstop=2
set shiftwidth=2
set expandtab

" Use wide format for file tree (:Explore)
let g:netrw_liststyle = 3

" Highlight trailing whitespace in red while in normal mode
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
" Remove trailing whitespace
command Clean %s/\s\+$//

" Highlight lines longer than 100 chars in darkgrey
highlight LongLine ctermbg=darkgrey guibg=darkgrey
2mat LongLine '\%101v.'

" Configuration for vim-scala
au BufRead,BufNewFile *.sbt set filetype=scala
" Use proper scaladoc comment indentation
let g:scala_scaladoc_indent = 1

" Autocheck all scala files on write
autocmd BufWritePre *.scala silent call CocAction('format')

" Set relative line numbers
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" Disable numbers for terminal buffers
autocmd BufWinEnter,WinEnter,TermOpen term://* setlocal norelativenumber
autocmd BufWinEnter,WinEnter,TermOpen term://* setlocal nonumber
autocmd BufWinEnter,WinEnter,TermOpen term://* setlocal signcolumn=no

" Only show signcolumn when in use
set signcolumn=auto

command DiffOrig vert new | set buftype=nofile | read ++edit # | 0d_
		\ | diffthis | wincmd p | diffthis

if filereadable(expand("~/.config/coc/extensions/node_modules/coc-metals/coc-mappings.vim"))
  source ~/.config/coc/extensions/node_modules/coc-metals/coc-mappings.vim"
endif

