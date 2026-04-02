vim.pack.add({
  'https://github.com/stevearc/conform.nvim',
})

require('conform').setup({
  default_format_opts = {
    lsp_format = 'fallback',
    timeout_ms = 500,
  },
  formatters_by_ft = {
    lua = { 'stylua' },
  },
})

vim.keymap.set('n', '<leader>c', function()
  require('conform').format()
end, { desc = 'Format buffer with [C]onform' })
