function LoadInit(file)
  execute "source $HOME/.config/nvim/init/".a:file
endfunction

" Core neovim settings
call LoadInit("core.vim")
" Plugins
call LoadInit("plugins.vim")
" Appearance and styling
call LoadInit("visual.vim")
" Language server integration
call LoadInit("lsp.vim")
" Key bindings
call LoadInit("map.vim")
" Commands
call LoadInit("commands.vim")

