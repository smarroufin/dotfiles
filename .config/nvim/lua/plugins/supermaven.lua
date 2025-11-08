return {
  {
    'supermaven-inc/supermaven-nvim',
    config = function()
      require('supermaven-nvim').setup({
        keymaps = {
          accept_word = '<C-l>',
          accept_suggestion = '<Tab>',
          clear_suggestion = '<C-k>',
        },
      })
    end,
  },
}
