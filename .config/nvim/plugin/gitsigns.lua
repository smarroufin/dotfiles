vim.pack.add({
  'https://github.com/lewis6991/gitsigns.nvim',
})

require('gitsigns').setup({
  current_line_blame = true,
})

local util = require('util')
util.keymap('<leader>gb', function() require('gitsigns.actions').blame_line() end, { desc = 'Git blame' })
util.keymap('<leader>gp', function() require('gitsigns.actions').preview_hunk() end, { desc = 'Preview hunk' })
util.keymap('<leader>gs', function() require('gitsigns.actions').stage_hunk() end, { desc = 'Toggle hunk' })
util.keymap('<leader>gR', function() require('gitsigns.actions').reset_hunk() end, { desc = 'Reset hunk' })
util.keymap('<leader>gk', function() require('gitsigns.actions').nav_hunk('prev') end, { desc = 'Previous hunk' })
util.keymap('<leader>gj', function() require('gitsigns.actions').nav_hunk('next') end, { desc = 'Next hunk' })
