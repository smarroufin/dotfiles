---@type vim.lsp.Config
return {
  settings = {
    html = {
      format = {
        enable = false, -- Disabled to avoid conflicts with eslint stylistic rules
      },
    },
  },
}
