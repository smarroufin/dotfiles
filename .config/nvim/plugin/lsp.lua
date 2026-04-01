vim.pack.add({
  'https://github.com/neovim/nvim-lspconfig'
})

vim.lsp.enable({
  'cssls',
  'eslint',
  'lua_ls',
  'gopls',
  'html',
  'ts_ls',
  'vue_ls',
})
