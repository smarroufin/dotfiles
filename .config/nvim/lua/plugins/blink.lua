return {
  {
    'saghen/blink.cmp',
    enabled = not vim.g.vscode,
    version = '1.*',
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = {
        preset = 'enter',
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
      sources = {
        providers = {
          snippets = {
            opts = {
              global_snippets = { 'package' },
            },
          },
        },
      },
      signature = { enabled = true },
    },
  },
}
