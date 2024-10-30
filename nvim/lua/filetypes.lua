local ft = vim.filetype

-- Match helm template files for treesitter highlighting
ft.add({
  pattern = {
    [".*/templates/.*%.tpl"]   = "helm",
    [".*/templates/.*%.ya?ml"] = "helm",
  },
})
