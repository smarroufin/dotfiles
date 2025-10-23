return {
  {
    'lewis6991/gitsigns.nvim',
    enabled = not vim.g.vscode,
    keys = {
      {
        '<leader>ga',
        function()
          require('gitsigns.actions').blame_line()
        end,
        desc = 'Git blame',
      },
    },
  },
}
