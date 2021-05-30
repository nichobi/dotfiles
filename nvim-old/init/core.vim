" Enable mouse support
set mouse=a

" Set tab to always use two spaces
set tabstop=2
set shiftwidth=0 " Automatically matches tabstop
set expandtab

" Use wide format for file tree (:Explore)
let g:netrw_liststyle = 3

" Which lsp_client to use, 'coc' or 'nvim'
let lsp_client = 'coc'

" Preserve undo history
set undofile

" Smart case sensitivity for searches
set ignorecase
set smartcase

" Use system clipboard
set clipboard=unnamedplus

" Include words from the current dictionary in completion when spell check
" is enabled
set complete+=kspell

" Spellcheck CamelCased words as if they were separate
set spelloptions+=camel

" g flag is on by default for substitutions
" Deprecated, may break plugins. We'll see how it goes
set gdefault

" Don't add a second space after .?! when joining lines
set nojoinspaces

" Allow cursor to extend beyond the end of a line in block selection
set virtualedit+=block

