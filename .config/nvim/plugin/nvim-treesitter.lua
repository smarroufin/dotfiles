vim.pack.add({
  'https://github.com/nvim-treesitter/nvim-treesitter', -- requires tree-sitter-cli
  'https://github.com/nvim-treesitter/nvim-treesitter-textobjects',
  'https://github.com/nvim-treesitter/nvim-treesitter-context',
})
vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == 'nvim-treesitter' and (kind == 'install' or kind == 'update') then
      vim.cmd('TSUpdate')
    end
  end,
})

local ts_parsers = {
  'c',
  'css',
  'dockerfile',
  'html',
  'javascript',
  'json',
  'lua',
  'markdown',
  'markdown_inline',
  'prisma',
  'query',
  'toml',
  'typescript',
  'vim',
  'vimdoc',
  'vue',
  'yaml',
}

require('nvim-treesitter').install(ts_parsers)
require('treesitter-context').setup({
  max_lines = 3,
  multiline_threshold = 1,
})
