-- https://github.com/neovim/nvim-lspconfig/tree/master/lua/lspconfig/configs
vim.lsp.config('eslint', {
  settings = {
    codeActionOnSave = {
      enable = true, -- If not enabled, eslint LSP won't respond to "source.fixAll" requests
    },
    format = {
      enable = true, -- If not enabled, eslint LSP won't respond to document formatting requests
    },
    workingDirectories = {
      mode = 'auto',
    },
  },
})
vim.lsp.config('html', {
  settings = {
    html = {
      format = {
        wrapLineLength = 0,
      },
    },
  },
})
vim.lsp.config('ts_ls', {
  filetypes = {
    'javascript',
    'javascriptreact',
    'javascript.jsx',
    'typescript',
    'typescriptreact',
    'typescript.tsx',
    'vue',
  },
  init_options = {
    plugins = {
      {
        name = '@vue/typescript-plugin',
        location = vim.fn.stdpath('data') .. '/mason/packages/vue-language-server/node_modules/@vue/language-server',
        languages = { 'vue' },
      },
    },
  },
})
vim.lsp.config('vue_ls', {
  settings = {
    html = {
      format = {
        enable = false, -- Disabled to avoid conflicts with eslint stylistic rules
      },
    },
  },
})

return {
  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' },
    dependencies = {
      {
        'mason-org/mason.nvim',
        cmd = { 'Mason' },
        opts = {},
      },
      'mason-org/mason-lspconfig.nvim',
    },
    config = function()
      require('mason-lspconfig').setup()
    end,
  },
}
