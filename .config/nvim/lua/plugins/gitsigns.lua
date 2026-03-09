return {
  {
    'lewis6991/gitsigns.nvim',
    event = 'VeryLazy',
    opts = {
      current_line_blame = true,
    },
    keys = {
      {
        '<leader>gb',
        function()
          require('gitsigns.actions').blame_line()
        end,
        desc = 'Git blame',
      },
      {
        '<leader>gp',
        function()
          require('gitsigns.actions').preview_hunk()
        end,
        desc = 'Preview hunk',
      },
      {
        '<leader>gs',
        function()
          require('gitsigns.actions').stage_hunk()
        end,
        desc = 'Toggle hunk',
      },
      {
        '<leader>gR',
        function()
          require('gitsigns.actions').reset_hunk()
        end,
        desc = 'Reset hunk',
      },
      {
        '<leader>gk',
        function()
          require('gitsigns.actions').nav_hunk('prev')
        end,
        desc = 'Previous hunk',
      },
      {
        '<leader>gj',
        function()
          require('gitsigns.actions').nav_hunk('next')
        end,
        desc = 'Next hunk',
      },
    },
  },
}
