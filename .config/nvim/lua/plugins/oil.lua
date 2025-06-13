return {
  {
    'stevearc/oil.nvim',
    enabled = not vim.g.vscode,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    keys = {
      {
        '<leader>e',
        function()
          require('oil').open()
        end,
        desc = 'Open Oil',
      },
    },
    opts = {
      view_options = {
        show_hidden = true,
      },
    },
  },
}
