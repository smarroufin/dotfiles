vim.pack.add({
  'https://github.com/kdheepak/lazygit.nvim',
  'https://github.com/nvim-lua/plenary.nvim',
})

require('util').keymap('<leader>lg', ':LazyGit<cr>', { desc = 'LazyGit' })
