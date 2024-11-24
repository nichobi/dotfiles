local ft = vim.filetype

-- Match jrag files as Java, for roughly correct highlighting
ft.add({
  pattern = {
    [".*.jrag"] = "java",
  },
})

-- Match helm template files for treesitter highlighting
ft.add({
  pattern = {
    [".*/templates/.*%.tpl"]   = "helm",
    [".*/templates/.*%.ya?ml"] = "helm",
  },
})
