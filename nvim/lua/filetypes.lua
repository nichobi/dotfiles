local ft = vim.filetype

local function file_exists(name)
   local f = io.open(name, "r")
   return f ~= nil and io.close(f)
end

-- Match helm template files for treesitter highlighting
ft.add({
  pattern = {
    [".*.jrag"] = "java",
    [".*/templates/.*%.tpl"]   = "helm",
    ["(.*)/templates/.*%.ya?ml"] = function(path, bufnr, prefix)
      if file_exists(prefix .. "/Chart.yaml") then
        return "helm"
      end
      return "yaml"
    end,
  },
})
