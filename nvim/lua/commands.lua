-- Remove trailing whitespace
vim.cmd([[command Clean %s/\s\+$//]])

-- Diff between current buffer and last saved version
vim.cmd('command DiffOrig vert new | set buftype=nofile | read ++edit # ' ..
        '| 0d_ | diffthis | wincmd p | diffthis')
