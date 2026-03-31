vim.pack.add({
  'https://github.com/nvim-treesitter/nvim-treesitter',
  'https://github.com/nvim-treesitter/nvim-treesitter-textobjects',
  'https://github.com/nvim-treesitter/nvim-treesitter-context',
})
vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == 'nvim-treesitter' and kind == 'update' then
      if not ev.data.active then
        vim.cmd.packadd('nvim-treesitter')
      end
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

require('nvim-treesitter').setup({
  ensure_installed = ts_parsers,
  sync_install = false,
  auto_install = true,
  highlight = { enable = true },
  indent = { enable = true },
})
-- require("nvim-treesitter").install(ts_parsers)
require('treesitter-context').setup({
  mode = 'cursor',
  max_lines = 3,
  multiline_threshold = 1,
})
