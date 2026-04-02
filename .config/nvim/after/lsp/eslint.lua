---@type vim.lsp.Config
return {
  settings = {
    codeActionOnSave = {
      enable = true, -- If not enabled, eslint LSP won't respond to "source.fixAll" requests
    },
    format = {
      enable = true, -- If not enabled, eslint LSP won't respond to document formatting requests
    },
  },
}
