set tabstop=2
set shiftwidth=2
set expandtab
let g:netrw_liststyle = 3

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

Plug 'roxma/vim-tmux-clipboard'
Plug 'derekwyatt/vim-scala'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ndmitchell/ghcid', { 'rtp': 'plugins/nvim' }

" Plug 'vim-latex/vim-latex'
" Plug 'takac/vim-hardtime'

call plug#end()

" Highlight trailing whitespace in red while in normal mode
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Highlight lines longer than 100 chars in darkgrey
highlight LongLine ctermbg=darkgrey guibg=darkgrey
2mat LongLine '\%101v.'

" Configuration for vim-scala
au BufRead,BufNewFile *.sbt set filetype=scala
" Use proper scaladoc comment indentation
let g:scala_scaladoc_indent = 1

" Set relative line numbers
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" Hard Time by default
"let g:hardtime_default_on = 1

command DiffOrig vert new | set buftype=nofile | read ++edit # | 0d_
		\ | diffthis | wincmd p | diffthis

" Autocheck all scala files on write
autocmd BufWritePre *.scala silent call CocAction('format')

if filereadable(expand("~/.config/coc/extensions/node_modules/coc-metals/coc-mappings.vim"))
  source ~/.config/coc/extensions/node_modules/coc-metals/coc-mappings.vim"
endif
