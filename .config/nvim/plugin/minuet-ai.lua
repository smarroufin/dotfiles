vim.pack.add({
  'https://github.com/milanglacier/minuet-ai.nvim',
  'https://github.com/nvim-lua/plenary.nvim',
})

require('minuet').setup({
  provider = 'openai_fim_compatible',
  n_completions = 1,
  -- TODO: lower if too much
  context_window = 4096,
  request_timeout = 3,
  throttle = 800,
  debounce = 400,
  provider_options = {
    openai_fim_compatible = {
      api_key = 'TERM',
      name = 'Ollama',
      end_point = 'http://localhost:11434/v1/completions',
      -- TODO: test 14b
      model = 'qwen2.5-coder:7b',
      optional = {
        max_tokens = 128,
        top_p = 0.9,
        temperature = 0.2,
        options = {
          -- TODO: lower if too much
          -- increase Ollama default to avoid truncate server-side
          num_ctx = 4096,
        }
      },
    },
  },
  virtualtext = {
    enabled = true,
    auto_trigger_ft = { '*' },
    keymap = {
      accept = '<C-j>',
      accept_line = '<C-l>',
      -- accept_n_lines = '<C-k>',
      -- prev/next for n_completions > 1
      -- prev = '<C-p>',
      -- next = '<C-n>',
      dismiss = '<C-z>',
    },
  },
})
