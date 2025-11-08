return {
  {
    'lewis6991/gitsigns.nvim',
    event = 'VeryLazy',
    opts = {},
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
