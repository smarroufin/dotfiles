vim.pack.add({
  'https://github.com/lewis6991/gitsigns.nvim',
})

require('gitsigns').setup({
  current_line_blame = true,
})

vim.keymap.set('n', '<leader>gb', function()
  require('gitsigns.actions').blame_line()
end, { desc = 'Git blame' })
vim.keymap.set('n', '<leader>gp', function()
  require('gitsigns.actions').preview_hunk()
end, { desc = 'Preview hunk' })
vim.keymap.set('n', '<leader>gs', function()
  require('gitsigns.actions').stage_hunk()
end, { desc = 'Toggle hunk' })
vim.keymap.set('n', '<leader>gR', function()
  require('gitsigns.actions').reset_hunk()
end, { desc = 'Reset hunk' })
vim.keymap.set('n', '<leader>gk', function()
  require('gitsigns.actions').nav_hunk('prev')
end, { desc = 'Previous hunk' })
vim.keymap.set('n', '<leader>gj', function()
  require('gitsigns.actions').nav_hunk('next')
end, { desc = 'Next hunk' })
