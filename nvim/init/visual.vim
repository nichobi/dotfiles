colorscheme dim
"
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

