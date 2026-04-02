vim.pack.add({
  'https://github.com/mbbill/undotree',
})

require('util').keymap('<leader>u', vim.cmd.UndotreeToggle, { desc = 'Open [U]ndoTree' })
