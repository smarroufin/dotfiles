vim.pack.add({
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/mason-org/mason.nvim',
  'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim',
})

require('mason').setup({})
require('mason-tool-installer').setup({
  ensure_installed = {
    -- plugins
    'tree-sitter-cli',
    -- lsp
    'css-lsp',
    'eslint-lsp',
    'html-lsp',
    'lua-language-server',
    'tailwindcss-language-server',
    'typescript-language-server',
    'vue-language-server',
    -- formatters
    'stylua',
  },
  auto_update = true,
})

vim.lsp.enable({
  'cssls',
  'eslint',
  'html',
  'lua_ls',
  'tailwindcss',
  'ts_ls',
  'vue_ls',
})
