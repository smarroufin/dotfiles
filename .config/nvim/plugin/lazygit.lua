vim.pack.add({
  'https://github.com/kdheepak/lazygit.nvim',
  'https://github.com/nvim-lua/plenary.nvim',
})

require('util').keymap('<leader>lg', '<cmd>LazyGit<cr>', { desc = 'LazyGit' })
