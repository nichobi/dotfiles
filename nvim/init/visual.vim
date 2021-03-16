colorscheme dim

" Show at least one line above/below the cursor
set scrolloff=1

" Show live feedback for substitutions, with split preview of other occurences
set inccommand=split

" Wrap lines that don't fit on screen at word boundaries
set wrap
set linebreak
set breakindent

" Open new windows below or to the right
set splitbelow
set splitright

" Set hybrid line numbers
set number relativenumber

" Set the window title to 'filename - nvim'
set title
set titlestring=%f\ -\ nvim

" Show signcolumn in numberrow if using nvim 5.0 or greater
if has('nvim-5.0') | set signcolumn=number
else               | set signcolumn=auto
endif

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

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" Disable numbers for terminal buffers
autocmd BufWinEnter,WinEnter,TermOpen term://* setlocal norelativenumber
autocmd BufWinEnter,WinEnter,TermOpen term://* setlocal nonumber
autocmd BufWinEnter,WinEnter,TermOpen term://* setlocal signcolumn=no

