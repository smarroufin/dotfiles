vim.pack.add({
  {
    src = 'https://github.com/saghen/blink.cmp',
    version = vim.version.range('^1'),
  },
})

require('blink.cmp').setup({
  keymap = {
    preset = 'enter',
    ['<Escape>'] = { 'hide', 'fallback' },
  },
  completion = {
    list = {
      selection = {
        auto_insert = false,
      },
    },
  },
  fuzzy = {
    sorts = {
      'exact',
      -- defaults
      'score',
      'sort_text',
    },
  },
  signature = { enabled = true },
})
