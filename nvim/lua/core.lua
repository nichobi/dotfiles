local g = vim.g
local opt = vim.opt
local g_opt = vim.opt_global

-- Enable mouse support
opt.mouse = 'a'

-- Set tab to always use two spaces
opt.tabstop = 2
opt.shiftwidth = 0 -- Automatically matches tabstop
opt.expandtab = true

-- Use wide format for file tree (:Explore)
g.netrw_liststyle = 3

-- Which lsp_client to use, 'coc' or 'nvim'
g.lsp_client = 'nvim'

-- Preserve undo history
opt.undofile = true

-- Smart case sensitivity for searches
opt.ignorecase = true
opt.smartcase = true

-- Use system clipboard
opt.clipboard='unnamedplus'

-- Include words from the current dictionary in completion when spell check
-- is enabled
opt.complete:append('kspell')

-- Spellcheck CamelCased words as if they were separate
opt.spelloptions = 'camel'

-- g flag is on by default for substitutions
-- Deprecated, may break plugins. We'll see how it goes
opt.gdefault = true

-- Don't add a second space after .?! when joining lines
opt.joinspaces = false

-- Allow cursor to extend beyond the end of a line in block selection
opt.virtualedit = 'block'

-- Remove F, required for nvim-metals
vim.opt_global.shortmess:remove("F")

