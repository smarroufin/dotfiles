vim.pack.add({
  'https://github.com/linrongbin16/gitlinker.nvim',
})

local util = require('util')
util.keymap('<leader>go', '<cmd>GitLink!<cr>', { desc = 'Open git link' })
util.keymap('<leader>gy', '<cmd>GitLink<cr>', { desc = 'Open git link' })
