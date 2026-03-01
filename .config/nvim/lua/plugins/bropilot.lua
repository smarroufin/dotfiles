return {
  {
    'meeehdi-dev/bropilot.nvim',
    event = 'VeryLazy',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'j-hui/fidget.nvim',
      'Leonardo-Luz/dotenv.nvim',
    },
    config = function(_, opts)
      require('dotenv').load()
      opts.api_key = vim.env.MISTRAL_CODESTRAL_API_KEY
      require('bropilot').setup(opts)
    end,
    opts = {
      -- model = 'qwen2.5-coder:7b-base',
      -- model = 'starcoder2:7b',
      -- model = 'devstral:latest',
      provider = 'codestral',
      auto_suggest = false,
      keymap = {
        accept_word = '<C-l>',
        accept_line = '<C-M-l>',
        accept_block = '<Tab>',
        suggest = '<C-j>',
        suggest_next = '<C-Down>',
      },
    },
  },
}
